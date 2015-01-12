<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
    String mofTabId = request.getParameter("mofTabId");
	if (mofTabId==null){
	  mofTabId="";
	}
   String mofTabName = request.getParameter("mofTabName");
	if (mofTabName==null){
	  mofTabName="";
	}
	String refreshId=(String)request.getAttribute("refreshId");
	if (refreshId==null||refreshId.equals("")){
	    refreshId="";
	}else{
	    refreshId=refreshId+"@T";
	}
%>
<HTML>
<HEAD>
<TITLE>域增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='MultiSelect.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkMofField(){		
	var name = document.forms[0].name;
	if (trim(name.value)=="")
	{
	alert("请输入名称！");    
	return false;
	}
	name.value = trim(name.value) ;
	var description = document.forms[0].description;
	if (trim(description.value)=="")
	{
	alert("请输入描述！");    
	return false;
	}
	description.value = trim(description.value) ;
	var mofColumnId = document.forms[0].mofColumnId;
	if (trim(mofColumnId.value)=="")
	{
	alert("请输入列内码！");    
	return false;
	}
	mofColumnId.value = trim(mofColumnId.value) ;
	var isdisplay = document.forms[0].isdisplay;
	if ((isdisplay[0].checked==false)&&(isdisplay[1].checked==false))
	{
	alert("请输入是否显示！");    
	return false;
	}
	isdisplay.value = trim(isdisplay.value) ;
	var displaylogic = document.forms[0].displaylogic;
	displaylogic.value = trim(displaylogic.value) ;
	var seqno = document.forms[0].seqno;
	if (trim(seqno.value)=="")
	{
	alert("请输入序号！");    
	return false;
	}
	seqno.value = trim(seqno.value) ;
	var isreadonly = document.forms[0].isreadonly;
	if ((isreadonly[0].checked==false)&&(isreadonly[1].checked==false))
	{
	alert("请输入是否只读！");    
	return false;
	}
	isreadonly.value = trim(isreadonly.value) ;
	var isquery = document.forms[0].isquery;
	if ((isquery[0].checked==false)&&(isquery[1].checked==false))
	{
	alert("请输入是否查询！");    
	return false;
	}
	isquery.value = trim(isquery.value) ;
	var issameline = document.forms[0].issameline;
	if ((issameline[0].checked==false)&&(issameline[1].checked==false))
	{
	alert("请输入是否相同行！");    
	return false;
	}
	issameline.value = trim(issameline.value) ;
	var length = document.forms[0].length;
	if (trim(length.value)=="")
	{
	alert("请输入长度！");    
	return false;
	}
	length.value = trim(length.value) ;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="域增加" >
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="保存并继续" onclick="forSaveContinue()"></widgets:containbutton>
<widgets:containbutton text="恢复" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
	<html:hidden name="mofTabId" value="<%=mofTabId%>"/>	
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.MOF_TAB_ID")%>：</td>
	<td class="tdRight"><html:hidden name="mofTabName" value="<%=mofTabName%>" write="true"/></td>
	</tr>  
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.NAME")%>：</td>
	<td class="tdRight"><html:text name="name" property="name" size="40" maxlength="40" /><font color="#FF0000">*(请输入英文名称)</font></td>
	</tr>                    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.DESCRIPTION")%>：</td>
	<td class="tdRight"><html:textarea name="description" property="description" rows="4" cols="80" /></td>
	</tr>       
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.MOF_COLUMN_ID")%>：</td>
	<td class="tdRight">
	<html:select name="mofColumnId" property="mofColumnId">
	<html:options collection="MOFCOLUMN_BYTABID_COLLECTION" property="MOF_COLUMN_ID" labelProperty="NAME"></html:options>
	</html:select>
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.ISDISPLAY")%>：</td>
	<td class="tdRight">
	<html:radio name="isdisplay" property="isdisplay" value="0">否</html:radio>
	<html:radio name="isdisplay" property="isdisplay" value="1">是</html:radio>
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.DISPLAYLOGIC")%>：</td>
	<td class="tdRight"><html:textarea name="displaylogic" property="displaylogic" rows="4" cols="80" /></td>
	</tr>                    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.SEQNO")%>：</td>
	<td class="tdRight"><html:text name="seqno" property="seqno" size="8" maxlength="8" /></td>
	</tr>                    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.ISREADONLY")%>：</td>
	<td class="tdRight">
	<html:radio name="isreadonly" property="isreadonly" value="0">否</html:radio>
	<html:radio name="isreadonly" property="isreadonly" value="1">是</html:radio>
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.ISQUERY")%>：</td>
	<td class="tdRight">
	<html:radio name="isquery" property="isquery" value="0">否</html:radio>
	<html:radio name="isquery" property="isquery" value="1">是</html:radio>
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.ISSAMELINE")%>：</td>
	<td class="tdRight">
	<html:radio name="issameline" property="issameline" value="0">否</html:radio>
	<html:radio name="issameline" property="issameline" value="1">是</html:radio>
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.LENGTH")%>：</td>
	<td class="tdRight"><html:text name="length" property="length" size="8" maxlength="8" /></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.ISCONDITION")%>：</td>
	<td class="tdRight">
	<html:radio name="iscondition" property="iscondition" value="0">否</html:radio>
	<html:radio name="iscondition" property="iscondition" value="1">是</html:radio>
	</td>
	</tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMofField()) return;
  document.forms[0].action ="moffield.cmd?method=insert";
  document.forms[0].submit();
}
function forSaveContinue(){
  if(!checkMofField()) return;
  document.forms[0].action ="moffield.cmd?method=insertContinue";
  document.forms[0].submit();
}
function forReturn(){
  document.forms[0].action ="moffieldquery.cmd";
  document.forms[0].submit();
}
function forReset(){
  document.forms[0].reset();
}
function init(){
    var refreshId ="<%=refreshId%>";
    if (refreshId!=null||refreshId!=""||refreshId!=undefined){
        if(getTreeFrame().seltree)
            getTreeFrame().seltree.refreshNodeById(refreshId); 
    }
 }
 init();
</script>