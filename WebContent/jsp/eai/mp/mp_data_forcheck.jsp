<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>

<HTML> 
<HEAD>
<TITLE>消息平台数据检查</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="消息平台数据检查" >

<div align="center">
  <table width="100%" cellpadding="0" class="tblContent"> 
    <tr>
    	<td>
    	&nbsp;
		</td>
	</tr>
   	<tr>
   		<td class="tdTitle">消息平台数据检查：</td>
    	<td class="tdTitle">&nbsp;</td>
   	</tr>
  	<tr> 
   		<td align="right">
  			<html:button name="button" onclick="checkOrgenaztion()" value="基础数据检查"></html:button>
  		</td>
  		<td align="Left">
  		<html:button name="button" onclick="checkUser()" value="配置文件检查    "></html:button>
		</td>
	</tr>
  </table>
</div>
	<table width="100%" cellpadding="0" class="tblContent"> 
    	<tr><td>
    	&nbsp;
		</td></tr>
	</table>

</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubResources()) return;	 
  document.forms[0].action ="checkDataCmd.cmd?method=userDefineCheck";
  document.forms[0].submit();

}

function checkOrgenaztion(){  
  	document.all("checkMethod").value="checkOrgenaztion";
	document.forms[0].action ="checkDataCmd.cmd?method=check";
  	document.forms[0].submit();
}

</script>