<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>�û��޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkUsers(){
	var userId = document.forms[0].userId;
    if ( __isQuoteIn(userId.value) )
    {
      alert("�û���½�����ܺ��������ַ���");   
      userId.value="";
      userId.select();
      userId.focus();  
      return false;
    }
	if (trim(userId.value)=="")
	{
	  alert("�������û���½����");  
	  userId.select();
      userId.focus();   
	  return false;
	}
    userId.value = trim(userId.value) ;
	var userName = document.forms[0].userName;
	if (trim(userName.value)=="")
	{
	  alert("�������û����ƣ�");
	  userName.select();
      userName.focus();       
	  return false;
	}
    userName.value = trim(userName.value) ;
	var password = document.forms[0].password;
	if (trim(password.value)=="")
	{
	  alert("���������룡");  
	  password.select();
      password.focus();   
	  return false;
	}
    password.value = trim(password.value) ;
	var email = document.forms[0].email;
	if (trim(email.value)=="")
	{
	  alert("����������ʼ���");   
	  email.select();
      email.focus();   
	  return false;
	}
    email.value = trim(email.value) ;
  if(!stringLengthCheck(userId,30,"�ʺŲ��ܳ���30���ַ�!")){
    userId.value="";
    userId.select();
    userId.focus();  
    return false;
  }
  if(!stringLengthCheck(userName,30,"�������Ʋ��ܳ���30���ַ�!")){
    userName.value="";
  	userName.select();
    userName.focus();   
    return false;
  }
   if(!stringLengthCheck(password,128,"���벻�ܳ���128���ַ�!")){
    password.value="";
  	password.select();
    password.focus();    
    return false;
  }
   if(!stringLengthCheck(eMail,80,"E_MAIL���ܳ���80���ַ�!")){
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
<widgets:container title="�û��޸�" >
<widgets:containbutton text="����" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="�ָ�" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="����" onclick="forReturn()"></widgets:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("USERS.USER_ID")%>��</td>
                    <td class="tdRight"><html:text name="userId" property="userId" size="20" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("USERS.USER_NAME")%>��</td>
                    <td class="tdRight"><html:text name="userName" property="userName" size="20" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("USERS.PASSWORD")%>��</td>
                    <td class="tdRight"><html:password name="password" property="password" size="50" maxlength="128" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("USERS.E_MAIL")%>��</td>
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