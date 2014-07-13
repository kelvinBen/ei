<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>

<%
     String refreshId = (String)request.getAttribute("refreshId");
%>

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
</HEAD>

<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="明细角色" >
<bsp:containbutton text="修改" onclick="forUpdate()" action ="role.cmd?method=forupdate"></bsp:containbutton>
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
	<td class="tdRight"><html:hidden name="roleAlias"  property="roleAlias"  write="true"/></td>
	</tr> 
	
	<html:hidden name="isSys" property="isSys"/>
	
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
	<list:pageToPage style="width:400"  type="multiImg" name="multi_0" disabled="true" >
	<list:left size="10" name="availableRolesId"  multiple="true" property="roleId" styleTd="align:center;width:40%"  style="width:100%">
	<html:optionsCollection property="availableRoles" label="roleAlias" value="roleId"/>
	</list:left>
	<list:right size="10" name="grantedRolesId" multiple="true" styleTd="align:center;width:40%" value="" style="width:100%">
	<html:optionsCollection property="grantedRoles" label="roleAlias" value="roleId"/>
	</list:right>
	</list:pageToPage>
	</td>
	</tr>        
 </table>
</tab:card>
<tab:card id="card2" text="操作">
     <table width="100%" cellpadding="0" class="tblContent" >  
	<input type="hidden" name="net.mast.web.taglib.util.GRIDLENGTH" id="net.mast.web.taglib.util.GRIDLENGTH" value="0">
	<tr><td>
	<iframe style="display:block" id="dataFrame0" width="100%" height="350" frameborder="0"></iframe>
	</td></tr>
   </table>
</tab:card>
<tab:card id="card3" text="树形操作">
      <table width="100%" cellpadding="0" class="tblContent"> 
      <tr><td>
      <iframe style="display:block" id="dataFrame1" width="100%" height="410px" frameborder="0"></iframe>
      </td></tr>
      </table>
</tab:card>
</tab:tab>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
var isFirst=true;
tab1.doCardClick=function(card){
	
	if (card.id=="card2"){
		if(isFirst){
			var f = document.getElementById("dataFrame0");
			f.src = "function.cmd?method=query&roleId="+document.all("roleId").value+"&update=false";
			isFirst=false;
			}
	  } 
	if (card.id=="card3"){
	var f = document.getElementById("dataFrame1");
	f.src = "roleResource.cmd?method=getRoot&roleId="+document.all("roleId").value+"&update=false";
	}  
}
function forReset(){  
	document.forms[0].reset();	
}
function forUpdate(){
	var roleid=document.all("roleId").value;
	document.forms[0].action ="role.cmd?method=forupdate&roleId="+roleid+"&refreshId=<%=refreshId%>";
	document.forms[0].submit();	
}
function init(){
		var refreshId = "<%=refreshId%>";
		if(getTreeFrame().seltree!=null){
			if(refreshId!="null"){
				getTreeFrame().seltree.refreshNodeById(refreshId);
			}else {
				getTreeFrame().seltree.refreshNodeById("00"); 
			} 
		} 
		
}
init();
</script>
