<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>窗口增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkMofWindow(){
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
	var isactive = document.forms[0].isactive;
	if ((isactive[0].checked==false)&&(isactive[1].checked==false))
	{
	alert("请输入是否活动！");    
	return false;
	}
	isactive.value = trim(isactive.value) ;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<%
String refreshId=(String)request.getAttribute("refreshId");
if (refreshId==null||refreshId.equals("")){
    refreshId="";
}
%>
<html:form  name="frmList"  action="">
<widgets:container title="窗口增加" >
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="保存并继续" onclick="forSaveContinue()"></widgets:containbutton>
<widgets:containbutton text="恢复" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">           
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.NAME")%>：</td>
	<td class="tdRight"><html:text name="name" property="name" size="40" maxlength="40" /><font color="#FF0000">*(请输入英文名称)</font></td>
	</tr>                    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.DESCRIPTION")%>：</td>
	<td class="tdRight"><html:textarea name="description" property="description" rows="4" cols="80" /><font color="#FF0000">*</font></td>
	</tr>                    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.ISACTIVE")%>：</td>
	<td class="tdRight">
	<html:radio name="isactive" property="isactive" value="0">否</html:radio>
	<html:radio name="isactive" property="isactive" value="1">是</html:radio>
	</td>
	</tr>   
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.FILTER")%>：</td>
	<td class="tdRight"><html:textarea name="filter" property="filter" cols="80" rows="6"/></td>
	</tr> 
  </table>
</div>
</widgets:container>
<html:hidden name="categoryId" property="categoryId"/>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMofWindow()) return;	
  document.forms[0].action ="mofwindow.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMofWindow()) return;
  document.forms[0].action ="mofwindow.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofwindowquery.cmd";
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