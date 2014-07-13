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
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<html>
<head>
<title>企业信息管理系统</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sso.css">
    <meta http-equiv="Cache-Control" content="no-store">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body {
	margin: 0 auto;
	text-align: center;
	background: #e1e1e1 url(<%=request.getContextPath()%>/images/cnooc_login_bak.jpg) no-repeat center top;
}
#MainContainer {
	margin-left: 25px;
	width: 100%;
	height: auto;
}
.textarea input {
	height: 20px;
	width: 200px;
	border: 2px inset;
}
.textarea {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #000000;
}
.textareapw {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #010dff;
}
a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #010dff;
	text-decoration: none;
}
a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #010dff;
	text-decoration: none;
}
a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #010dff;
	text-decoration: underline;
}
#loginArea {
	width: 620px;
	margin: 345px auto 0px auto;
}
#topBand {
	height: 42px;
	background: url(<%=request.getContextPath()%>/images/cnooc_login-pnl_top.png) no-repeat center top;
}
#mastHead {
	height: 30px;
	background: url(<%=request.getContextPath()%>/images/cnooc_login-pnl_mast.png) no-repeat center top;
}
#login {
	height: auto;
	background: url(<%=request.getContextPath()%>/images/cnooc_login-pnl_midtile.png) repeat-y center;
}
#botBand {
	height: 66px;
	text-align:left;
	white-space:nowrap
}
#newsBand {
	height: 53px;
	position:relative;
	top:-14px;
	background: url(<%=request.getContextPath()%>/images/cnooc_news-pnl_bak.png) no-repeat center top;
	text-align:left;
	padding-left: 40px;
	padding-top: 6px;
}
#newsBand a:link {
	font-weight: normal;
	color: #595757;
	font-size: 11px;
	line-height: 14px;
	text-decoration: underline;
}
#newsBand a:visited {
	font-weight: normal;
	color: #595757;
	font-size: 11px;
	line-height: 14px;
	text-decoration: underline;
}
#newsBand a:hover {
	font-weight: normal;
	color: #595757;
	font-size: 11px;
	line-height: 14px;
	text-decoration: underline;
}
#newsBand ul {
	margin: 0 auto;
}
#newsBand li {
	text-align: left;
	list-style: square;
}
#frame {
	height:40px;
	width:545px;
	overflow-x: hidden;
	overflow-y: scroll;
	scrollbar-3dlight-color: #ebebeb;
	scrollbar-arrow-color:#053B85;
	scrollbar-darkshadow-color: #ebebeb;
	scrollbar-face-color:#ebebeb;
	scrollbar-highlight-color:#ebebeb;
	scrollbar-shadow-color: #ebebeb;
	scrollbar-track-color: #ebebeb;	
}
HR {
 color: #f1f1f2;
 padding-top: 5px;
 padding-bottom: 5px;
 margin-top: 5px;
 margin-bottom: 5px;
}
.pipe {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: normal;
	color: #C01921;
	padding-right: 4px;
	padding-left: 4px;
}
a.languagelist:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #585657;
	text-decoration: none;
}
a.languagelist:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #585657;
	text-decoration: none;
}
a.languagelist:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #585657;
	text-decoration: underline;
}
a.footertext:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #4f1f91;
	text-decoration: none;
}
a.footertext:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #4f1f91;
	text-decoration: none;
}
a.footertext:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #4f1f91;
	text-decoration: underline;
}
#LanguagesContainer {
	text-align: center;
	height: 20px;
	width: 100%;
	z-index: auto;
	line-height: 8px;
	font-size: 0px;
	margin-top: 2px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	padding-top: 2px;
	padding-bottom: 2px;
}
#LogoContainer {
	background-color: #FFFFFF;
	height: 109px;
	width: 100%;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
}
#TopImageBar {
	background-color: #4f1f91;
	text-align: center;
	position: absolute;
	height: 29px;
	width: 100%;
	top: 14px;
	z-index: 3;
}
#Content {
	background-color: #FFFFFF;
	text-align: center;
	height: auto;
	width: 100%;
	padding: 0px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
}
.clearfloat {
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}
#FooterContainer {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #4f1f91;
	background-color: #FFFFFF;
	text-align: center;
	height: 20px;
	width: 100%;
	z-index: auto;
	margin-top: 2px;
	margin-bottom: 0px;
	margin-right: auto;
	margin-left: auto;
	padding-top: 2px;
	padding-bottom: 2px;
}
.loginbak {
	background-color: #F1F1F2;
	background-image: url(<%=request.getContextPath()%>/images/7_0_login_globe.jpg);
	background-repeat: no-repeat;
	background-position: 0px 0px;
	padding-left: 270px;
}
.logintext {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: bold;
}
.WARNINGMSG1 {	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
	color: #dc241f;
}
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
</script>
</head>
<body onload="init()" onkeydown="keypress(this);" topmargin="0" leftmargin="0" scroll="no" marginheight="0" marginwidth="0">
<div id="MainContainer">
<html:form name="frmLogin" method="post" action="<%=j_auth_action%>">
<div id="loginArea">
	<div id="topBand"></div>
    <div id="mastHead"></div>
    <div id="login">
      <table align="center" background="<%=request.getContextPath()%>/images/blank.gif" border="0" cellpadding="3" cellspacing="0" height="100" width="420">
        <tbody><tr>
          <td colspan="3" class="WARNINGMSG1" height="20"> <%=msg%>&nbsp; </td>
        </tr>
        <tr>
          <td class="textarea" align="right" nowrap="nowrap" height="20" width="35%">姓名 :<span style="color: red; font-size: 16px;">*</span></td>
          <td class="textarea" height="20"><html:text name="j_username" property="j_username" value="superadmin" styleClass="textfield" size="20"/></td>
          <td rowspan="2" align="left" height="40" valign="bottom" width="100%">&nbsp;&nbsp;
              <IMG style="cursor:hand;" src="<mast:ui img='cnooc_login_btn.gif'/>" border="0" onclick="doLogin();">
          </td> 
        </tr>
        <tr>
          <td class="textarea" align="right" nowrap="nowrap" height="20" width="35%">密码 :<span style="color: red; font-size: 16px;">*</span></td>
          <td class="textarea" height="20"><html:password name="j_password" property="j_password" value="" styleClass="textfield" size="20"/></td>
        </tr>
        <tr>
          <td class="textareapw" align="right" nowrap="nowrap">&nbsp;</td>
          <td colspan="2" class="textareapw" align="left" nowrap="nowrap">&nbsp;</td>
          </tr>
      </tbody></table>
    </div>
    <div id="botBand"><table border="0" cellpadding="0" cellspacing="0" width="620">
  <tbody><tr>
    <td valign="top" width="388"><img src="<%=request.getContextPath()%>/images/cnooc_login-pnl_botband.png" alt="" height="66" width="388"></td>
    <td valign="top" width="232">      
      <a><img src="<%=request.getContextPath()%>/images/cnooc_login-pnl_lrlink.png" border="0" height="66" width="232"></a>
      </td>
  </tr>
</tbody></table>
</div>
</div>
</html:form>
  </div>
</body>
</html>
 