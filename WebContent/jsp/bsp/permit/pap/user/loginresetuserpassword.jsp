<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.bsp.permit.authentication.exception.*" %>
<%@ page import="net.mast.bsp.permit.pep.intercept.web.SecurityEnforcementFilter" %>
<HTML>
<HEAD>
<%
  StringBuffer buffer=new StringBuffer();
  buffer.append((String)request.getScheme()).append("://" ).append((String) request.getServerName()).append(":").append(Integer.toString(request.getServerPort())).append((String)request.getContextPath()).append("/user.cmd?method=loginResetUserPassword");
  String targetUrl = buffer.toString();
  
  String msg="";
  Object obj=(LockedException) session.getAttribute(SecurityEnforcementFilter.ResetLoginPass_Exception);  
  if(obj==null){
  	obj = (ChangeFirstLoginPassException) session.getAttribute(SecurityEnforcementFilter.ChangeNewLoginPass_Exception);
  }
  if(obj!=null){
	  AuthenticationException ex =(AuthenticationException)obj;
      msg=ex.getMessage();
  }
  %>

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"editgrid.css")%>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<style>
.tdTitle{
	width:35%;
	background-color:#bbccdd;
	padding:2px;
	text-align:right;
	white-space:nowrap;
}
.tdRight input{
	border:1px solid #6699cc;
}
</style>
</HEAD>
<script language="javascript">
function check(){
	
	var oldPassword = document.forms[0].oldPassword;
	if (oldPassword.value=="")
	{
	  alert("请输入原密码！");    
	  document.forms[0].oldPassword.focus();
	  return false;
	}
    
    
	 var pswd1 = document.forms[0].pswd1;
	if (pswd1.value=="")
	{
	  alert("请输入新密码！");   
	  document.forms[0].pswd1.focus(); 
	  return false;
	}
   

    var pswd2 = document.forms[0].pswd2;
	if (pswd2.value=="")
	{
	  alert("请输入确认密码！");    
	  document.forms[0].pswd2.focus(); 
	  return false;
	}
    
	
    if(document.forms[0].pswd1.value!=document.forms[0].pswd2.value) {
      alert("新密码和确认密码不一样！请重新输入！");
      pswd1.value="";
      pswd2.value="";
      document.forms[0].pswd1.focus();
      return false;
    }

	return true
}
</script>

<BODY topmargin="10px">
<BR><BR><BR>
<html:form  name="frmList"  action="">
<bsp:container title="重置用户密码" >
<html:messages/>
<div align="center">
  <center>
  <table align="CENTER" valign="middle" width="80%">
  <tr>
      <td height="86" align="center" colspan=2><div UNSELECTABLE="on" style="width:400;font-size:12px;color:#FF9900;font-weight:bold;margin-bottom:25;"><%=msg%></div></td>
  </tr>
  </table>
  <table width="100%" cellpadding="0" class="tblContent">
                

                <tr>
                <td class="tdTitle">原密码：</td>
                <td class="tdRight"><input type="password" name="oldPassword" maxlength="128" size="20" value=""><FONT COLOR=#ff0000>*</FONT></td>
                </tr> 
                      
                <tr>
                <td class="tdTitle">新密码：</td>
                <td class="tdRight"><input type="password" name="pswd1" maxlength="128" size="20" value=""><FONT COLOR=#ff0000>*</FONT></td>
                </tr>  
                 
                <tr>
                <td class="tdTitle">确认密码：</td>
                <td class="tdRight"><input type="password" name="pswd2" maxlength="128" size="20" value=""><FONT COLOR=#ff0000>*</FONT></td>
                </tr>   
  </table>
  </center>
</div>   
<bsp:containbutton text="确定" onclick="forSave()" ></bsp:containbutton>

</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
  
  function forSave(){
    if(!check()) return; 	
       document.forms[0].action ="<%=targetUrl%>";    
       document.forms[0].submit();	
  }
</script>