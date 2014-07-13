<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<html>
<head>
<title>登录系统　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　</title>
<SCRIPT LANGUAGE="JavaScript">
///if(self!=top){top.location=self.location;}
var bikky = document.cookie;
function getCookie(name) { 
    var index = bikky.indexOf(name + "=");
    if (index == -1) return null;
    index = bikky.indexOf("=", index) + 1;
    var endstr = bikky.indexOf(";", index);
    if (endstr == -1) endstr = bikky.length;
    return unescape(bikky.substring(index, endstr));
}

var today = new Date();
var expiry = new Date(today.getTime() + 28 * 24 * 60 * 60 * 1000);
function setCookie(name, value) { 
    if (value != null && value != "")
      document.cookie=name + "=" + escape(value) + "; expires=" + expiry.toGMTString();
    bikky = document.cookie; 
}
function setall()
{
	var j_username = document.forms[0].j_username.value;
	setCookie("j_username",j_username);
}
function init()
{
	var j_username = getCookie("j_username");
	if (j_username != null && j_username != "null") {
	}
}
function login(){

	if(!check()) return;
	var returnV = new Array(2);
	returnV[0]=document.forms[0].j_username.value;
	returnV[1]=document.forms[0].j_password.value;
	window.returnValue=returnV;
	parent.close();
}

function check(){
	var j_username = document.forms[0].j_username;
	if(trim(j_username.value)==""){
		alert("请输入用户名");
		j_username.focus();
		return false;
	}
	j_username.value = trim(j_username.value);
	var j_password = document.forms[0].j_password;
	if(j_password.value==""){
		alert("请输入密码");
		j_password.focus();
		return false;
	}
	return true;	
}

//当回车按下时,/=47,*=42,+=43
function keypress(form0)
{
	if(event.keyCode==13||event.keyCode==42)	//回车,*
	{
		login();
	}
}

//下面是加上的点击取消按钮的时候的操作
function cancle(){
window.close();
}

</SCRIPT>
<style>
td
{
font-size:10pt;

}
</style>
</head>
<body topmargin="0" onload="init()" onkeydown="keypress(this);" bgcolor="#ECE9D9">
<img src="ad.gif" align="top" >
<html:form name="frmLogin" method="post" action="">
<table width="200" align="center" style="border-collapse:collapse; solid #5b99c8;" cellpadding=2 cellspacing=0>
<tr>
	<td>用户名：</td><td><html:text name="j_username" property="j_username" value="" size="10"/></td>
</tr>

<tr>
	<td>密码：</td><td><html:password name="j_password" property="j_password" size="10" value=""/></td>
</tr>
</table>
<BR>
	<table align="center">
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td > <html:button name="btn.add" value="确定" onclick="login();" style="width:50"/></td><td>&nbsp;&nbsp;</td>
	<td > <html:button name="btn.del" value="取消" onclick="cancle();" style="width:50"/></td>
	</table>
</html:form>

</body>
</html>
