<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>全局参数定义修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubGlobal(){
	var systemId = document.forms[0].systemId;
    if ( __isQuoteIn(systemId.value) )
    {
      alert("系统全局序号不能含有特殊字符！");  
      systemId.value="";
      systemId.select();
      systemId.focus();   
      return false;
    }
	if (trim(systemId.value)=="")
	{
	  alert("请输入系统全局序号！"); 
	  systemId.select();
      systemId.focus();    
	  return false;
	}
    systemId.value = trim(systemId.value) ;
	var systemName = document.forms[0].systemName;
	if (trim(systemName.value)=="")
	{
	  alert("请输入系统名称！"); 
	  systemName.select();
      systemName.focus();    
	  return false;
	}
    systemName.value = trim(systemName.value) ;
	var gpublicUser = document.forms[0].gpublicUser;
	if (trim(gpublicUser.value)=="")
	{
	  alert("请输入集团级PUBLIC用户帐号！");   
	  gpublicUser.select();
      gpublicUser.focus();  
	  return false;
	}
    gpublicUser.value = trim(gpublicUser.value) ;
	var superadminUser = document.forms[0].superadminUser;
	if (trim(superadminUser.value)=="")
	{
	  alert("请输入系统超级管理员帐号！");  
	  superadminUser.select();
      superadminUser.focus();   
	  return false;
	}
    superadminUser.value = trim(superadminUser.value) ;
	var sysadminUser = document.forms[0].sysadminUser;
	if (trim(sysadminUser.value)=="")
	{
	  alert("请输入系统管理员帐号！"); 
	  sysadminUser.select();
      sysadminUser.focus();      
	  return false;
	}
    sysadminUser.value = trim(sysadminUser.value) ;
	var superadminRole = document.forms[0].superadminRole;
	if (trim(superadminRole.value)=="")
	{
	  alert("请输入系统超级管理员角色！"); 
	  superadminRole.select();
      superadminRole.focus();     
	  return false;
	}
    superadminRole.value = trim(superadminRole.value) ;
	var sysadminRole = document.forms[0].sysadminRole;
	if (trim(sysadminRole.value)=="")
	{
	  alert("请输入系统管理员角色！"); 
	  sysadminRole.select();
      sysadminRole.focus();    
	  return false;
	}
    sysadminRole.value = trim(sysadminRole.value) ;
	var defaultLevel = document.forms[0].defaultLevel;
	if (trim(defaultLevel.value)=="")
	{
	  alert("请输入缺省用户安全级别！");   
	  defaultLevel.select();
      defaultLevel.focus();   
	  return false;
	}
    defaultLevel.value = trim(defaultLevel.value) ;
	var pswdLifeTime = document.forms[0].pswdLifeTime;
	if (trim(pswdLifeTime.value)=="")
	{
	  alert("请输入密码生命周期！");  
	  pswdLifeTime.select();
      pswdLifeTime.focus();    
	  return false;
	}
    pswdLifeTime.value = trim(pswdLifeTime.value) ;
	var loginAttempts = document.forms[0].loginAttempts;
	if (trim(loginAttempts.value)=="")
	{
	  alert("请输入锁定帐户的登陆失败次数！"); 
	  loginAttempts.select();
      loginAttempts.focus();    
	  return false;
	}
    loginAttempts.value = trim(loginAttempts.value) ;
	var pswdLockTime = document.forms[0].pswdLockTime;
	if (trim(pswdLockTime.value)=="")
	{
	  alert("请输入帐户锁定时间！");  
	  pswdLockTime.select();
      pswdLockTime.focus();     
	  return false;
	}
    pswdLockTime.value = trim(pswdLockTime.value) ;
	var pswdLockTime = document.forms[0].pswdLockTime;
    if (!__checkStdTime(pswdLockTime) )   
    {
      alert("帐户锁定时间"+sError);
      pswdLockTime.focus();
      return false;
    }   
	var pswdGraceTime = document.forms[0].pswdGraceTime;
	if (trim(pswdGraceTime.value)=="")
	{
	  alert("请输入用户密码失效后必须更改密码的天数！"); 
	  pswdGraceTime.select();
      pswdGraceTime.focus();    
	  return false;
	}
    pswdGraceTime.value = trim(pswdGraceTime.value) ;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="全局参数定义明细" >
<bsp:containbutton text="修改" onclick="forSave()" action ="global.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<html:messages/>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.SYSTEM_ID")%>：</td>
                    <td class="tdRight"><html:label name="systemId" property="systemId" size="30" maxlength="128" readonly="true" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.SYSTEM_NAME")%>：</td>
                    <td class="tdRight"><html:text name="systemName" property="systemName" size="30" maxlength="128" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.GPUBLIC_USER")%>：</td>
                    <td class="tdRight"><html:label name="gpublicUser" property="gpublicUser" size="30" maxlength="30" readonly="true"/></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.SUPERADMIN_USER")%>：</td>
                    <td class="tdRight"><html:label name="superadminUser" property="superadminUser" size="30" maxlength="30" readonly="true"/></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.SYSADMIN_USER")%>：</td>
                    <td class="tdRight"><html:label name="sysadminUser" property="sysadminUser" size="30" maxlength="30" readonly="true"/></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.SUPERADMIN_ROLE")%>：</td>
                    <td class="tdRight"><html:label name="superadminRole" property="superadminRole" size="30" maxlength="30" readonly="true"/></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.SYSADMIN_ROLE")%>：</td>
                    <td class="tdRight"><html:label name="sysadminRole" property="sysadminRole" size="30" maxlength="30" readonly="true"/></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.DEFAULT_LEVEL")%>：</td>
                    <td class="tdRight">
                    <html:select name="defaultLevel" property="defaultLevel" >
	                        <html:options collection="PUB_SECURITY_LEVEL_COLLECTION" labelProperty="LEVEL_NAME" property="SECURITY_LEVEL"/>
	                    </html:select>
                    
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.PSWD_LIFE_TIME")%>：</td>
                    <td class="tdRight"><html:text name="pswdLifeTime" property="pswdLifeTime" size="8" maxlength="8" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.LOGIN_ATTEMPTS")%>：</td>
                    <td class="tdRight"><html:text name="loginAttempts" property="loginAttempts" size="8" maxlength="8" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.PSWD_LOCK_TIME")%>：</td>
                    <td class="tdRight"><html:text name="pswdLockTime" property="pswdLockTime" size="8" maxlength="8" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_GLOBAL.PSWD_GRACE_TIME")%>：</td>
                    <td class="tdRight"><html:text name="pswdGraceTime" property="pswdGraceTime" size="8" maxlength="8" /></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubGlobal()) return;	
  document.forms[0].action ="global.cmd?method=update";
  document.forms[0].submit();	
}

function forReset(){  
  document.forms[0].reset();	
}
</script>