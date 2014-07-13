<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<% 
%>
<HTML>
<HEAD>
<TITLE>功能数据权限查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="功能数据权限查询" >
<bsp:containbutton text="查询" onclick="forQuery()"></bsp:containbutton>
    <div align="center">
    <font size="5pt">功能数据权限查询表</font>
    <table cellpadding="0" class="tblContent">      
                   <tr>
                       <td class="tdTitle">用户帐号：</td>
                       <td class="tdRight" align="center">
                       <html:hidden name="userId" value=""/>
                       <html:text name="userName" value="" size="20" readonly="true" ondblclick="clean()"/>
       				   <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectUser()">
		               </td>
                    </tr> 
                    
                    <tr>
                       <td class="tdTitle">功能资源范围：</td>
                       <td class="tdRight" align="center">
                       <html:hidden name="moduleId" value=""/>
                       <html:text name="moduleName" value="" size="20" readonly="true" ondblclick="clean()"/>
       				   <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectModule()">
		               </td>
                    </tr> 
                                                 
    </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function clean(){
	document.forms[0].userId.value="";
	document.forms[0].userName.value="";
}
function selectUser(){
  var cmdUrl="user.cmd&method=getchoiceroot";
  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	return;
  }else{
	document.all("userId").value=win[0];
	document.all("userName").value=win[1];
  }
}
function selectModule(){
  var cmdUrl="module.cmd&method=getModuleRoot";
  var url ="jsp/help.jsp?url="+cmdUrl; 
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {
	return;
  }else{
	document.all("moduleId").value=win[0];
	document.all("moduleName").value=win[1];
	
  }
}
function forQuery(){

  var userId = document.all("userId").value;
  if(userId == ""){
	  alert("所要查询的用户不能为空！");
      return false;
  }

  var moduleId = document.all("moduleId").value;
  if(moduleId == ""){
	  alert("功能资源范围不能为空！");
      return false;
  }
      
   document.forms[0].action ="funcAndDatarestype.cmd?method=query";     
   document.forms[0].submit();
}

</script>