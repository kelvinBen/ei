<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>表增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkMofTable(){
	var name = document.forms[0].name;
	if (trim(name.value)=="")
	{
	alert("请输入名称！");    
	return false;
	}
	name.value = trim(name.value) ;
	var tablename = document.forms[0].tablename;
	if (trim(tablename.value)=="")
	{
	alert("请输入表名！");    
	return false;
	}
	tablename.value = trim(tablename.value) ;
	var accesslevel = document.forms[0].accesslevel;
	if (trim(accesslevel.value)=="")
	{
	alert("请输入访问级别！");    
	return false;
	}
	accesslevel.value = trim(accesslevel.value) ;
	var description = document.forms[0].description;
	if (trim(description.value)=="")
	{
	alert("请输入描述！");    
	return false;
	}
	description.value = trim(description.value) ;
	var isupdateable = document.forms[0].isupdateable;
	if ((isupdateable[0].checked==false)&&(isupdateable[1].checked==false))
	{
	alert("请输入是否可更新！");    
	return false;
	}
	isupdateable.value = trim(isupdateable.value) ;
	var isactive = document.forms[0].isactive;
	if ((isactive[0].checked==false)&&(isactive[1].checked==false))
	{
	alert("请输入是否活动！");    
	return false;
	}
	isactive.value = trim(isactive.value) ;
	var isview = document.forms[0].isview;
	if ((isview[0].checked==false)&&(isview[1].checked==false))
	{
	alert("请输入是否视图！");    
	return false;
	}
	isview.value = trim(isview.value) ;
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
<widgets:container title="表增加" >
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="保存并继续" onclick="forSaveContinue()"></widgets:containbutton>
<widgets:containbutton text="恢复" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">               
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.NAME")%>：</td>
                    <td class="tdRight"><html:text name="name" property="name" size="40" maxlength="40" /></td>
                    </tr>                 
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.TABLENAME")%>：</td>
                    <td class="tdRight"><html:text name="tablename" property="tablename" size="40" maxlength="40" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.ACCESSLEVEL")%>：</td>
                    <td class="tdRight"><html:text name="accesslevel" property="accesslevel" size="40" maxlength="40" /></td>
                    </tr>         
                    			<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.DESCRIPTION")%>：</td>
                    <td class="tdRight"><html:textarea name="description" property="description" rows="2" cols="80" /></td>
                    </tr>           
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.ISUPDATEABLE")%>：</td>
                    <td class="tdRight">
                    	<html:radio name="isupdateable" property="isupdateable" value="0">否</html:radio>
                    	<html:radio name="isupdateable" property="isupdateable" value="1">是</html:radio>
                    </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.ISACTIVE")%>：</td>
                    <td class="tdRight">
                    	<html:radio name="isactive" property="isactive" value="0">否</html:radio>
                    	<html:radio name="isactive" property="isactive" value="1">是</html:radio>
                    </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.ISVIEW")%>：</td>
                    <td class="tdRight">
                    	<html:radio name="isview" property="isview" value="0">否</html:radio>
                    	<html:radio name="isview" property="isview" value="1">是</html:radio>
                    </td>
                    </tr>
					<tr>
                    	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.VALIDATION")%>：</td>
                    	<td class="tdRight"><html:textarea name="validation" property="validation" rows="6" cols="80" />
                    </td>
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
  if(!checkMofTable()) return;	
  document.forms[0].action ="moftable.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMofTable()) return;
  document.forms[0].action ="moftable.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="moftablequery.cmd";
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