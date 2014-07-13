<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>

<%
     String refreshId = (String)request.getAttribute("refreshId");
     //判断是由新增页面进入修改页面还是直接进入修改页面
     String flag = request.getParameter("method").equals("forupdate")?"1":"0";
%>

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript">
function checkPubRoles(){
	var roleAlias = document.forms[0].roleAlias;
	if ( __isQuoteIn(roleAlias.value) )
	{
		alert("角色业务含义不能含有特殊字符！");
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
<input type="hidden" name="grantedRolesIdList" value="">

<bsp:container title="修改角色" >
<bsp:containbutton text="确定" onclick="forSave()" action ="role.cmd?method=update"></bsp:containbutton>
<html:messages/>
<tab:tab  id="tab1" type="table">
<tab:card id="card0" text="基本信息">
  <table width="100%" cellpadding="0" class="tblContent"> 
	<html:hidden name="roleId"  property="roleId" write="false"/>
	
	<tr>
	<td class="tdTitle">角色名称：</td>
	<td class="tdRight"><html:hidden name="roleName"  property="roleName" write="true"/></td>
	</tr>  
	
	<tr>
	<td class="tdTitle">角色业务含义：</td>
	<td class="tdRight"><html:text name="roleAlias"  property="roleAlias" size="30" maxlength="30"  /><FONT COLOR=#ff0000>*</FONT></td>
	</tr> 
	
	<html:hidden name="isSys" property="isSys" write="false" />
	
	<tr>   
	<td class="tdTitle">是否系统管理员：</td>
	<td class="tdRight"><html:hidden name="isSysName" property="isSysName" write="true"/></td>
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
	<html:optionsCollection property="grantedRoles" label="roleAlias" value="roleId"/>
	</list:right>
	</list:pageToPage>
	</td>
	</tr>        
 </table>
</tab:card>
<tab:card id="card2" text="操作">
      <table width="100%" cellpadding="0" class="tblContent"> 
      <tr><td>
      <iframe style="display:block" id="dataFrame0" width="100%" height="410px" frameborder="0"></iframe>
      </td></tr>
      </table>
</tab:card>

</tab:tab>
</bsp:container>
</html:form>

</BODY>
</HTML>
<script language="javascript">
	tab1.doCardClick=function(card){
	  if (card.id=="card2"){
		var f = document.getElementById("dataFrame0");
		f.src = "roleResource.cmd?method=getRoot&roleId="+document.all("roleId").value+"&update=true";
	  } 
	}       
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
		document.forms[0].action ="role.cmd?method=update&refreshId=<%=refreshId%>";    
		document.forms[0].submit();	
	}
   	
	function init(){
		if ("<%=flag%>"=="0"){
			tab1.doCardShow("card2");
			var refreshId = "<%=refreshId%>";
			getTreeFrame().seltree.refreshNodeById(refreshId);
		}
	}
	init();
</script>

