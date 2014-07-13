<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>授权模板角色资源增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubTroleOpts(){
if (trim(roleId.value)=="")
	{
	  alert("请输入角色编码！");
	  roleId.select();
	  roleId.focus();  
	  return false;
	}
    roleId.value = trim(roleId.value) ;
	 
	  var resourceId = document.forms[0].resourceId;
	  if ( __isQuoteIn(resourceId.value) )
	  {
	    alert("资源内码不能含有特殊字符！");
	    resourceId.value="";
	    resourceId.select();
	    resourceId.focus();
	    return false;
	  }
	if (trim(resourceId.value)=="")
	{
	  alert("请输入资源内码！"); 
	  resourceId.select();
	  resourceId.focus();   
	  return false;
	}
    resourceId.value = trim(resourceId.value) ;
    
  if(!stringLengthCheck(roleId,30,"角色编码不能超过30个字符!")){
      roleId.value="";
  	  roleId.select();
	  roleId.focus(); 
      return false;
  }
  if(!stringLengthCheck(resourceId,30,"资源内码不能超过30个字符!")){
      resourceId.value="";
  	  resourceId.select();
	  resourceId.focus();   
      return false;
  } 
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<%
String tRoleId = (String)request.getAttribute("tRoleId");
if (tRoleId==null){
    tRoleId="";
}
%>
<html:form  name="frmList"  action="">
<bsp:container title="授权模板角色资源增加" >
<bsp:containbutton text="保存并继续" onclick="forSaveContinue()" action ="tRoleopts.cmd?method=insertContinue"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action ="troleoptsquery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
				  	<tr>
				      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_TROLE_OPTS.ROLE_ID")%>：</td>
				      <td class="tdRight"><html:text name="roleId" property="roleId" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>

				    </tr>
				  	<tr>
				      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_TROLE_OPTS.RESOURCE_ID")%>：</td>
				      <td class="tdRight">
				      
				      	<html:text name="resourceId" property="resourceId" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
			
				    </tr>
  </table>
</div>
</bsp:container>
<html:hidden name="tRoleId"  write="true" value='<%=tRoleId%>'/>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSaveContinue(){
  if(!checkPubTroleOpts()) return;
  var tRoleId=document.all("tRoleId").value;
  alert("tRoleId"+tRoleId);
  document.forms[0].action ="tRoleopts.cmd?method=insertContinue&tRoleId="+tRoleId;
  document.forms[0].submit();	
}
function forReturn(){
  var tRoleId=document.all("tRoleId").value;
  document.forms[0].action ="troleoptsquery.cmd?tRoleId="+tRoleId;
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>