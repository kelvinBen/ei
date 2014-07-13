<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%
     String refreshId = (String)request.getAttribute("refreshId");
%>
 
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript">
function checkPubRoles(){
	
	var roleName = document.forms[0].roleName;
	if ( __isQuoteIn(roleName.value) )
	{
		alert("角色名称不能含有特殊字符！");
		tab1.doCardShow("card0");
		roleName.value="";
		roleName.select();
		roleName.focus();
		return false;
	}  
	if (trim(roleName.value)=="")
	{
		alert("请输入角色名称！"); 
		tab1.doCardShow("card0");	    
		roleName.select();
		roleName.focus();
		return false;
	}
	roleName.value = trim(roleName.value) ;
	var roleAlias = document.forms[0].roleAlias;
	if ( __isQuoteIn(roleAlias.value) )
	{
		alert("角色业务含义不能含有特殊字符");	    
		tab1.doCardShow("card0");
		roleAlias.value="";
		roleAlias.select();
		roleAlias.focus();
		return false;
	}  
	if (trim(roleAlias.value)=="")
	{
		alert("请输入角色业务含义！");   
		tab1.doCardShow("card0");
		roleAlias.select();
		roleAlias.focus();
		return false;
	}
	roleAlias.value = trim(roleAlias.value) ;
	
	if(!stringLengthCheck(roleName,200,"角色名称不能超过200个字符!")){
		tab1.doCardShow("card0");
		roleName.value="";
		roleName.select();
		roleName.focus();
		return false;
	}
	if(!stringLengthCheck(roleAlias,200,"角色业务含义不能超过200个字符!")){
		tab1.doCardShow("card0");
		roleAlias.value="";
		roleAlias.select();
		roleAlias.focus();
		return false;
	}  
	
	return true
}

</script>
</HEAD>

<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<input type="hidden" name="refreshId" value="<%=refreshId%>">
<input type="hidden" name="resourcesIdList" value=" ">
<input type="hidden" name="grantedRolesIdList" value=" ">
<bsp:container title="定义角色" >
<bsp:containbutton text="创建" onclick="forSave()" action="role.cmd?method=insert"></bsp:containbutton>
<html:messages/>
<tab:tab  id="tab1" type="table">
<tab:card id="card0" text="基本信息">
  <table width="100%" cellpadding="0" class="tblContent">
	
	<td class="tdTitle">角色名称：</td>
	<td class="tdRight"><html:text name="roleName"  property="roleName" size="20" maxlength="30" value=""/><FONT COLOR=#ff0000>*</FONT></td>
	</tr>  
	
	<tr>
	<td class="tdTitle">角色业务含义：</td>
	<td class="tdRight"><html:text name="roleAlias"  property="roleAlias" size="20" maxlength="30" value="" /><FONT COLOR=#ff0000>*</FONT></td>
	</tr>
	
	<tr>   
	<td class="tdTitle">是否系统管理员：</td>
	<td class="tdRight"><html:checkbox name="isSys" property="isSys" value="1"/></td>
	</tr> 
          
   </table>
</tab:card>

<tab:card id="card1" text="角色" >
  <table width="100%" cellpadding="0" class="tblContent" >  
	<tr>
	<td class="tdLeft">可用角色：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已授予的角色：</td>
	</tr>  
	<tr>
	<td> 
	<list:pageToPage style="width:800"  type="multiImg" name="multi_0">
	<list:left size="10" name="availableRolesId"  multiple="true" property="roleId" styleTd="align:center;width:50%" style="width:100%">
	<html:optionsCollection property="availableRoles" label="roleAlias" value="roleId"/>
	</list:left>
	<list:right size="10" name="grantedRolesId" multiple="true" styleTd="align:center;width:50%" value="" style="width:100%">
	
	</list:right>
	</list:pageToPage>
	</td>
	</tr>        
 </table>
</tab:card>
</tab:tab>
</bsp:container>
</html:form>

</BODY>
</HTML>
<script language="javascript">
  function forSave(){
	if(!checkPubRoles()) return;        
	var rightListValue_grantedRoles="";
	var select_grantedRoles=document.all("grantedRolesId");
	var lens=select_grantedRoles.options.length;
	for(var i=0;i<=lens-1;i++)
	{
		if (i==lens-1)
		rightListValue_grantedRoles=rightListValue_grantedRoles+select_grantedRoles.options[i].value;
		else 
		rightListValue_grantedRoles=rightListValue_grantedRoles+select_grantedRoles.options[i].value+",";
	}
	document.all.grantedRolesIdList.value=rightListValue_grantedRoles;
	
	document.forms[0].action ="role.cmd?method=insert";    
	document.forms[0].submit();	
	
  }
</script>