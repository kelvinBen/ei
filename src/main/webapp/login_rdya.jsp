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
<title>人大议案管理系统</title>
<!--link rel="stylesheet" type="text/css" href="ntmast/style.css"-->
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>


<style type="text/css">
<!--
html{ overflow:hidden}
.contanr{margin:0px auto;}
	
.right_contan{ width:315px; height:321px; text-align:center;}
.right{ margin-right:10px; margin-top:20px; float:right;}
.idOrClassName{ height:353px; width:703px; background:url(jsp/images/bj1.png) no-repeat left bottom; }
.idOrClassName1{ height:120px; width:398px; background:url(jsp/images/bj_zj.png) no-repeat left bottom; }

.blank5{height:5px; overflow:hidden; /* _margin:-5px 0;*/ visibility:hidden;}
.clear{ clear:both}


/* IE6 */

* html .idOrClassName{ background:none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='jsp/images/bj1.png', sizingMethod='crop'); }
* html .idOrClassName1{ background:none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='jsp/images/bj_zj.png', sizingMethod='crop'); }

/* IE7 */

*+html .idOrClassName{ background:url(jsp/images/bj1.png) no-repeat left bottom!important; }
*+html .idOrClassName1{ background:url(jsp/images/bj_zj.png) no-repeat left bottom!important; }

.box { position: relative; margin-top:-209px; *margin-top:-210px; width:311px; text-align:left; margin-left:69px; margin-left:388px\9; *margin-left:69px; _margin-left:69px; display:inline;}
  
.text { border:1px solid #fff; background-image:url(jsp/images/001.jpg); height:21px; width:191px; *width:189px; line-height:20px; font-size:14px;}
.password { border:1px solid #fff; background-image:url(jsp/images/001.jpg); height:21px; width:191px; *width:189px; line-height:20px; font-size:14px; margin-top:9px; *margin-top:7px;}
.font_dl{line-height:20px; font-size:14px;}

-->
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

<body onload="init()" onkeydown="keypress(this);" id="land" background="<mast:ui img='ntmast/bj.jpg'/>" topmargin="100">
<html:form name="frmLogin" method="post" action="<%=j_auth_action%>">
<!-- 指定系统登录的类型，对应的退出页面 -->
<input   type="hidden" name="MAIN_PAGE" value="rdya" />

<div class="idOrClassName contanr">
     
     <div class="right right_contan">
     	
       <div class="clear" style="height:20px;"></div>
        <img src="jsp/images/rdya_pic.gif" width="265" height="47" border="0">
       <div class="box">
       <table width="100%" cellpadding="0" cellspacing="0" align="center">
          <tr>
             <td colspan="2"><table width="100%" cellpadding="0" cellspacing="0" align="center">
                <tr>
                   <td width="17" height="40" w></td>
                   <td width="79" class="font_dl">用&nbsp;户&nbsp;名：</td>
                   <td width="211"><input class="text" type="text" name="j_username" value="superadmin" /></td>
                </tr>
                
                <tr>
                   <td height="40"></td>
                   <td class="font_dl">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                   <td><input class="password" type="password" name="j_password"  value="123"/></td>
                </tr>
                
                <tr>
                   <td height="40"></td>
                   <td class="font_dl">选择平台：</td>
                   <td><select name="MENU_TYPE" style="width:194px; height:24px; font-size:14px; ">
           <!--option value="">---登陆综合平台---</option-->
           <!--option value="S01">---后台管理系统---</option-->
           <option value="S02" selected="selected">---议案管理系统---</option>
         </select></td>
                </tr>
                
             </table></td>
          </tr>
          <tr>
             <td width="50%" align="right" height="40"><a href="#" onclick="doLogin();" style="cursor:hand;" class="login"><img src="jsp/images/denglu.gif" width="77" height="23" border="0"></a>&nbsp;&nbsp;</td>
             <td width="50%" align="left">&nbsp;&nbsp;<a href="#" onclick="document.forms[0].reset();" style="cursor:hand;" class="login1"><img src="jsp/images/quxiao.gif" width="77" height="23" border="0"></a></td>
          </tr>
          
       </table>
       </div>
       
       <div class="clear" style="height:30px;"></div>
       
       <div><span class="font_dl">Copyright &reg; 2009-2010 All Rights Reserved</span></div>
     </div>
      
     <div UNSELECTABLE="on" style="width:400;font-size:12px;color:#FF9900;font-weight:bold;margin-bottom:25;"><%=msg%></div>
     
     </div>
  
  </div>
  <table width="703" cellpadding="0" cellspacing="0" align="center">
     <tr>
       <td><div class="idOrClassName1" style="margin:0px auto;"></div></td>
    </tr>
</table>
  




</html:form>
</body>
</html>
