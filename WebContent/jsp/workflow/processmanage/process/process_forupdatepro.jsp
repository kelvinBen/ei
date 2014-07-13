<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
function selectNewDeptIdTree(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>&showOrganType=1,2";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("organize").value="";
	  document.all("organizeName").value="";
  }else{
	  document.all("organize").value=win[0];
	  document.all("organizeName").value=win[1];
  }
  checkinputNullInDcWork('organize','organize_span');
}

function checkProcess()
{
	var formid = document.forms[0].formid;
	
	formid.value = trim(formid.value) ;
	var organizeName = document.forms[0].organizeName;
	if (trim(organizeName.value)=="")
	{
		alert('"������֯����"����Ϊ�գ�');
	    organizeName.focus();
		return false;
	}
	organizeName.value = trim(organizeName.value) ;
	return true;
}
function selectForm(){
  var url ="jsp/help.jsp?url=workformmanagerhelpquery.cmd"; 
  url=url+"&processtype_search="+document.all("processtype").value;       
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("formid").value=win[0];
  document.all("formname").value=win[1];
  }
  checkinputNullInDcWork('formid','formname_span');
}
</script>
</HEAD>
<%
	String reservetype  =(String)request.getAttribute("reservetype");
%>
<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="ȷ��" value="ȷ��" onclick="forSave()"></html:button>
<html:button name="����" value="����" onclick="forReturn()"></html:button>
</div>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
	
<html:hidden name="processtype" property="processtype"/>
<html:hidden name="processid" property="processid"/>

		<tr>
			<td class="tdLeft">ѡ�����</td>
			<td class="TdRight">
			   
	          <html:hidden name="formid" property="formid"/><html:text name="formname" property="formname" size="30" maxlength="30" readonly="true" onchange="checkinputNullInDcWork ('formid','formname_span')"/><img src="skins/default/images/liulan.gif"  style="cursor:hand" border="0" onclick="selectForm()"><span id="formname_span" class="xinghaoCss">*</span> 
	          </td>
		</tr> 				                  
		<tr>
			<td class="tdLeft">������֯������</td>
			<td class="TdRight"><html:hidden name="organize" property="organize"/><html:text name="organizeName" property="organizeName" size="30" maxlength="30" readonly="true"/><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selectNewDeptIdTree()"><span id="organize_span" class="xinghaoCss">*</span></td>
		</tr> 	
		
		<html:hidden name="reservetype" property="<%=reservetype%>"/>
		<!--			                  
		<tr>
			<td class="tdLeft">���̱������ͣ�</td>
			<td class="TdRight">
			<html:select name="reservetype" property="reservetype" >
	          <html:options collection="WORKFLOW_PROCESS_RESERVETYPE_COLLECTION" labelProperty="value" property="key"/>
	          </html:select></td>
		</tr> 
		-->
	</table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("�������̣����̹����޸�����");
function forSave(){
  if( !checkProcess() ) return;
  document.forms[0].action ="process.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="processquery.cmd?clear=true";
  document.forms[0].submit();	
}
transMatrix(document.forms[0].organize.value,document.forms[0].organizeName.value);
</script>