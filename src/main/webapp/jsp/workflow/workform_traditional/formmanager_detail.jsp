<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<jsp:useBean id="FormDetail" type="java.util.Map" scope="request"/>
<%
	String matrix = request.getParameter("matrix");
%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="jsp/workflow/resource/js/formanager.js"></script>
</HEAD>
<script language="javascript">
function selectNewDeptIdTree(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("Ins_organize-id").value="";
	  document.all("Ins_organize-name").value="";
  }else{
	  document.all("Ins_organize-id").value=win[0];
	  document.all("Ins_organize-name").value=win[1];
  }
}
function initFormEditor() {
	document.formEditor.setUrl(document.getElementsByName("FormConfigUrls")[0].value);
	document.formEditor.setFormHtml(document.getElementsByName("Ins_html-code")[0].value);
	document.formEditor.setFormPrintTemplate(document.getElementsByName("print-template")[0].value);
	document.formEditor.setFormTextTemplate(document.getElementsByName("text-template")[0].value);
		
	
}
function forSave(){
	if (!document.formEditor.hasFormName()) {
		alert("表单名称不可为空，请在表单属性中填写表单名称！");
		return;
	}
	var organId=document.all("Ins_organize-id").value;
	if(organId==""){
		alert("请选择所属组织机构！");
		return;
	}
	document.getElementsByName("Ins_html-code")[0].value = document.formEditor.getFormHtml();
	document.getElementsByName("Ins_template")[0].value = document.formEditor.getFormTemplate();
	document.getElementsByName("Ins_formXml")[0].value = document.formEditor.getFormXml();	
	document.forms[0].action ="formmanager.cmd?method=update";
	document.forms[0].submit();	
}
function disableForm()
{
var vbody=formEditor.document;
var imgs=vbody.getElementsByTagName("IMG");
for(var i=0;i<imgs.length;i++)
{
imgs[i].disabled=true;
}
var butns=vbody.getElementsByTagName("BUTTON");
for(var i=0;i<butns.length;i++)
{
butns[i].disabled=true;
}
var sels=vbody.getElementsByTagName("SELECT");
for(var i=0;i<sels.length;i++)
{
sels[i].disabled=true;
}
}
</script>
<BODY topmargin="10px" onLoad="setTitleInTreeBar('工作流程－流程管理－表单明细');initFormEditor();disableForm();">
<div class="btnareaCss">
<html:button onclick="forReturn()" name="btn_return"  value="返回"></html:button>
</div>
<html:form  name="frmList"  action="">
<% 
   String processtype_search = request.getParameter("processtype_search");
   if(processtype_search==null)
	  {processtype_search ="";}
%>
<INPUT type="hidden" name="processtype" value="<%=FormDetail.get("process-type")%>">
<INPUT type="hidden" name="processtype_search" value="<%=processtype_search%>">
<INPUT type="hidden" name="form-id" value="<%=FormDetail.get("form-id")%>">
<TEXTAREA style="display: none" name="Ins_formXml"><%=FormDetail.get("formXml")%></TEXTAREA>
<TEXTAREA style="display: none" name="Ins_template"><%=FormDetail.get("template")%></TEXTAREA>
<TEXTAREA style="display: none" name="Ins_html-code"><%=FormDetail.get("html-code")%></TEXTAREA>								
<TEXTAREA style="display: none" name="print-template"><%=FormDetail.get("print-template")%></TEXTAREA>
<TEXTAREA style="display: none" name="text-template"><%=FormDetail.get("text-template")%></TEXTAREA>									
<textarea style="display: none" name="FormConfigUrls"><%=(String)request.getAttribute("WorkForm.FormConfigUrls")%></textarea>
			
<table width="100%" height="95%" cellpadding="0" class="tblContent" cellspacing="0">  
<tr>
	<td class="tdLeft">所属组织机构：</td>
	<td class="TdRight"><INPUT TYPE="hidden" name="Ins_organize-id" property="Ins_organize-id" value="<%=FormDetail.get("organize-id")%>"/><INPUT TYPE="text" name="Ins_organize-name" property="Ins_organize-name" size="30" maxlength="30" readonly="true" value="<%=FormDetail.get("organize-name")%>" onchange="checkinputNullInDcWork ('Ins_organize-id','organize_span')"/>
	</td>
</tr>
<tr>
	<td colspan="2">
	<iframe name="formEditor" frameborder="1" marginheight="0" marginwidth="0" scrolling="no"  width="100%" height="100%" src="<%=request.getContextPath()%>/jsp/workflow/resource/formeditor_traditional/Mbtool.html">
	</td>
</tr>
</table>
				
</html:form>
</BODY>
</HTML>
