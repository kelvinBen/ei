<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.bsp.permit.pep.ui.AuthenticationProcessingFilter" %>
<%@ page import="net.mast.bsp.permit.pep.ui.SessionCreatingServlet" %>
<%@ page import="net.mast.bsp.permit.authentication.exception.AuthenticationException" %>
<%
String j_auth_action=request.getContextPath()+"/j_bsp_security_check/up";

String msg="";
Object obj=     (AuthenticationException) session.getAttribute(AuthenticationProcessingFilter.AUTHENTICATION_EXCEPTION);
if(obj==null){
	obj = (AuthenticationException) session.getAttribute(SessionCreatingServlet.SESSION_FAILED_EXCEPTION);
}
if(obj!=null){
	session.setAttribute(AuthenticationProcessingFilter.AUTHENTICATION_EXCEPTION,null);
	session.setAttribute(SessionCreatingServlet.SESSION_FAILED_EXCEPTION,null);
	AuthenticationException ex =(AuthenticationException)obj;
    msg=ex.getMessage();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="net.mast.util.StringUtils"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>NTMast平台</title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='ntmast/style.css'/>">
	<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>

<style type="text/css">
html{ overflow:hidden}
</style>

<script language="javascript">
if(self!=top){top.location=self.location;}
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
	var j_password = document.forms[0].j_password.value;
	setCookie("j_password",j_password);
}
function init()
{
	var j_username = getCookie("j_username");
	if (j_username != null && j_username != "null") {
		document.forms[0].j_username.value = j_username;
	}
	var j_password = getCookie("j_password");
	if (j_password != null && j_password != "null") {
	}
}
function doLogin(){
	if(!check()) return;
	setall();	
    document.forms[0].action ="<%=j_auth_action%>";
    document.forms[0].submit();
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
		doLogin();
	}
}
<%if(!StringUtils.isEmpty(msg)){%>
 alert("<%=msg%>");
<%}%>
</script>
</head>

<body onload="init()" onkeydown="keypress(this);" id="land" background="<mast:ui img='ntmast/bj.jpg'/>" >
<html:form name="frmLogin" method="post" action="<%=j_auth_action%>">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
  <tr>
    <td align="center">
	<div style="width:640px; padding-top:90px" id="gxz">
	<table style="background-image:url(login01.png);background-repeat: no;font-size: 28px;color: red" width="640" height="130" border="0" cellspacing="0" cellpadding="0">
	<tr><td width="120px"> </td><td align="left"><b>政&nbsp;协&nbsp;提&nbsp;案&nbsp;管&nbsp;理&nbsp;系&nbsp;统</b></td></tr>
	</table>
	
	<div>
	  <img src="<mast:ui img='ntmast/login02.png'/>" width="640" height="224" /></div>
	 <div class="box">	 
	 <input class="text" type="text" name="j_username" value="superadmin" />
     <input class="password" type="password" name="j_password"  value="123"/>
<input   type="hidden" name="MAIN_PAGE" value="zxta" />

<div style="padding-top:10px">
  <select name="MENU_TYPE" style="width:194px; height:24px; font-size:14px; ">
  
    <option value="S03">---提案管理系统---</option>
  </select></div>
	 <div style="padding:26px 0 0 4px">
     <a href="#" onclick="doLogin();" style="cursor:hand;" class="login">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	 <a href="#" onclick="document.forms[0].reset();" style="cursor:hand;" class="login1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	 </div>
	</div>
	<div><img src="<mast:ui img='ntmast/login03.png'/>" width="640" height="132" /></div>
	</div><div UNSELECTABLE="on" style="width:400;font-size:12px;color:#FF9900;font-weight:bold;margin-bottom:25;"><%=msg%></div>	</td>
  </tr>
</table>
</html:form>
</body>
</html>
