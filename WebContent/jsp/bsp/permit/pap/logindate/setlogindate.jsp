<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>

<HTML>
<HEAD>
<TITLE>设置登录日期</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkLogIndate(){
 var loginDate = document.forms[0].loginDate;
  if (trim(loginDate.value)=="")
  {
    alert("请输入登录日期！");
    beginDate.focus();
    return false;
  }
  loginDate.value = trim(loginDate.value) ;
return true
}

</script>

</HEAD>
<%
      String loginDate=(String)request.getAttribute("loginDate");
      if(loginDate==null)
       loginDate="";
%>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="设置登录日期" >
<bsp:containbutton text="保存" onclick="forSave()"  action="setLoginDate.cmd?method=set"></bsp:containbutton>
<table width="100%" cellspacing="0" class="tblContent">
<tr>
<td  class="tdTitle">
登录日期：
</td>
<td class="tdRight">
<date:date name="loginDate" divname="loginDatedd" value="<%=loginDate%>"  zindex="12"  readonly="true" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"/>
<input style="visibility:hidden">
</td>
</tr>
</table>

</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkLogIndate()) return;	
  document.forms[0].action ="setLoginDate.cmd?method=set";
  document.forms[0].submit();	
}
function forReturn(){
  history.go(-1);
}

</script>