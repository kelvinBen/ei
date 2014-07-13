<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>
<%
String app=request.getContextPath();
%>
<HTML>
<HEAD><TITLE>批量授权 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<BODY topmargin="10px">
<html:form method="POST"   action="">
<widgets:container title="角色批量授权" height="200">

<widgets:containbutton name="save1" onclick="doSave();" text="保存"></widgets:containbutton> 

<table>

 <tr >
      <td class="tdTitle">批量授权的角色ID</td>
      <td class="tdRight"><html:hidden name="roleId" property="roleId" write="true"/> </td>
      </tr>
     <tr>
      <td class="tdTitle">批量授权的角色名称:</td>
      <td class="tdRight"><html:hidden name="roleAlias" property="roleAlias" write="true"/></td>
    </tr>  
    <tr>
      <td class="tdTitle">拥有改角色的用户列表：</td>
      <td class="tdRight">
				<html:select name="userlist"  value="" size="10" multiple="true" >
	            	<html:options collection="userlist" labelProperty="$userName+'['+userId+']'" property="userId"/>
	        	</html:select>
</td>
    </tr> 
     <tr>
       <td class="tdTitle">操作:</td>
       <td class="tdRight">
	<html:button name="增加" value="增加" onclick="adduser();"></html:button>
<html:button name="删除" value="删除" onclick="deluser();"></html:button>
<div style="display:none">
<help:helpsearch name="select_user" style="display:none" size="40"  helpid="helpUserNoPub" ismulti="true" value="" changefield="userid#1,username#2"/>
<input type="text" name="userid" value="" size=50> <input type="text" name="username" value="" > 
</div>
	</td>
      </tr>  

 
</table>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function doSave(){
var selOpts=$("userlist");
 var userids="";
	var lens=selOpts.options.length;
	for(var i=lens-1;i>=0;i--)
	{
	 userids+=selOpts.options[i].value+",";
	}
	
 	userids=userids.substring(0,userids.length-1);
 	$("userid").value=userids;
 	alert(userids);
	document.forms[0].action="role.cmd?method=batchGrant";
	document.forms[0].save1.disabled="disabled";
	document.forms[0].submit();
}
function doreset(){
 
	document.forms[0].reset();
}

//增加用户
function adduser(){
select_user_dialog();
	var userids= $('userid').value.split(",");
	var usernames= $('username').value.split(",");
	if(userids=="")
		return ;
	var selOpts=$("userlist");
	var options=selOpts.options;
	for(var i=0;i<userids.length;i++){
	   var exits=false;
		 for(var j=options.length-1;j>=0;j--){
		 	var userid= options[j].value;
			var username= options[j].innerText;
		 	//alert("userid="+userid+"username"+username);
		 	if(userid==userids[i]){
		 		exits=true;
		 		break;
		 	}
		 }
		 if(!exits){
		var opn=document.createElement("<OPTION>");
 		selOpts.options.add(opn);
 		opn.innerText=usernames[i]+'['+userids[i]+']';
 		opn.value=userids[i];	 		
		}
	 }
}

function deluser(){
var selOpts=$("userlist");
	var lens=selOpts.options.length;
	for(var i=lens-1;i>=0;i--)
	{
	 if(selOpts.options[i].selected)
	 {
	 	selOpts.options.remove(i);
	 }
	}

}
</script>


