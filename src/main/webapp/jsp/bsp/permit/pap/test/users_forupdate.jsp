<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>用户修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkUsers(){
	var userId = document.forms[0].userId;
    if ( __isQuoteIn(userId.value) )
    {
      alert("用户登陆名不能含有特殊字符！");   
      userId.value="";
      userId.select();
      userId.focus();  
      return false;
    }
	if (trim(userId.value)=="")
	{
	  alert("请输入用户登陆名！");  
	  userId.select();
      userId.focus();   
	  return false;
	}
    userId.value = trim(userId.value) ;
	var userName = document.forms[0].userName;
	if (trim(userName.value)=="")
	{
	  alert("请输入用户名称！");
	  userName.select();
      userName.focus();       
	  return false;
	}
    userName.value = trim(userName.value) ;
	var password = document.forms[0].password;
	if (trim(password.value)=="")
	{
	  alert("请输入密码！");  
	  password.select();
      password.focus();   
	  return false;
	}
    password.value = trim(password.value) ;
	var email = document.forms[0].email;
	if (trim(email.value)=="")
	{
	  alert("请输入电子邮件！");   
	  email.select();
      email.focus();   
	  return false;
	}
    email.value = trim(email.value) ;
  if(!stringLengthCheck(userId,30,"帐号不能超过30个字符!")){
    userId.value="";
    userId.select();
    userId.focus();  
    return false;
  }
  if(!stringLengthCheck(userName,30,"中文名称不能超过30个字符!")){
    userName.value="";
  	userName.select();
    userName.focus();   
    return false;
  }
   if(!stringLengthCheck(password,128,"密码不能超过128个字符!")){
    password.value="";
  	password.select();
    password.focus();    
    return false;
  }
   if(!stringLengthCheck(eMail,80,"E_MAIL不能超过80个字符!")){
    eMail.value="";
  	eMail.select();
    eMail.focus();   
    return false;
  } 
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="用户修改" >
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="恢复" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("USERS.USER_ID")%>：</td>
                    <td class="tdRight"><html:text name="userId" property="userId" size="20" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("USERS.USER_NAME")%>：</td>
                    <td class="tdRight"><html:text name="userName" property="userName" size="20" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("USERS.PASSWORD")%>：</td>
                    <td class="tdRight"><html:password name="password" property="password" size="50" maxlength="128" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("USERS.E_MAIL")%>：</td>
                    <td class="tdRight"><html:text name="email" property="email" size="50" maxlength="80" /></td>
                    </tr>                    
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkUsers()) return;	
  document.forms[0].action ="users.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="usersquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>