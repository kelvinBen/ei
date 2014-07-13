<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>

<%
     String refreshId = (String)request.getAttribute("refreshId");
	 String flag = request.getParameter("method").equals("forupdate")?"1":"0";
%>
<HTML>
<HEAD>
<TITLE>授权模板角色定义修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>

<script language="javascript">
function checkPubTroles(){

	  var roleName = document.forms[0].roleName;
	if (trim(roleName.value)=="")
	{
	    alert("请输入角色名！");
	    tab1.doCardShow("card0");
	    roleName.select();
	    roleName.focus();
	    return false;
	}
	if ( __isQuoteIn(roleName.value))
	{
		    alert("角色名称不能含有特殊字符！");
		    roleName.select();
		    roleName.focus();
		    return false;
	}
    roleName.value = trim(roleName.value) ;
	  var roleAlias = document.forms[0].roleAlias;
	if (trim(roleAlias.value)=="")
	{
	   alert("请输入角色业务含义！"); 
	   tab1.doCardShow("card0");
	   roleAlias.select();
	   roleAlias.focus();
	   return false;
	}
    roleAlias.value = trim(roleAlias.value) ;
	  var isSys = document.forms[0].isSys;
	if (trim(isSys.value)=="")
	{
	   alert("请输入是否管理员！");   
	   tab1.doCardShow("card0");
	   isSys.select();
	   isSys.focus();   
	   return false;
	}
    isSys.value = trim(isSys.value) ;
	  var usersLimit = document.forms[0].usersLimit;
	if (trim(usersLimit.value)=="")
	{
	  alert("请输入同时拥有该角色的最大用户数！");    
	  tab1.doCardShow("card0");
	  usersLimit.select();
	  usersLimit.focus();
	  return false;
	}
    usersLimit.value = trim(usersLimit.value) ;
        var rs=/^\-?[0-9]+$/;
    if(!rs.test(usersLimit.value)){
       alert("同时拥有该角色的最大用户数必须是合法的整数!");
       tab1.doCardShow("card0");
       userslimit.value="";
       userslimit.select();
       usersLimit.focus();
       return false;
    }
    if(usersLimit.value.indexOf("0")==0&&usersLimit.value.length!=1){
       alert("同时拥有该角色的最大用户数必须是合法的整数!");
       tab1.doCardShow("card0");
       userslimit.value="";
       userslimit.select();
       usersLimit.focus();
       return false;
    }
    if(parseInt(usersLimit.value)<-1){
       alert("同时拥有该角色的最大用户数必须是大于或等于-1的整数！");
       tab1.doCardShow("card0");
       userslimit.value="";
       userslimit.select();
       usersLimit.focus();
       return false;
    }
  if(!stringLengthCheck(roleName,30,"角色名不能超过30个字符!")){
        tab1.doCardShow("card0");
        roleName.value="";
	    roleName.select();
	    roleName.focus();  
        return false;
  } 
  if(!stringLengthCheck(roleAlias,30,"角色业务含义不能超过30个字符!")){
     tab1.doCardShow("card0");
     roleAlias.value="";
	 roleAlias.select();
	 roleAlias.focus();
     return false;
  } 
  if(!stringLengthCheck(usersLimit,8,"同时拥有该角色的最大用户数不能超过30个字符!")){
     tab1.doCardShow("card0");
     usersLimit.value="";
	 usersLimit.select();
	 usersLimit.focus();
     return false;
  } 
	
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<% 

 String templateId = request.getParameter("tempId");
	if (templateId==null){
	    templateId="";
	}
	String templateName =  request.getParameter("tempName");
	if (templateName==null){
	    templateName="";
	}
	StringBuffer sb = new StringBuffer();
    sb.append("角色模板:"+templateName+"	 的角色修改"); 
    
    String title = sb.toString();
%>
<html:form  name="frmList"  action="">
<bsp:container  title="<%=title%>" >
<bsp:containbutton text="确定" onclick="forSave()" ></bsp:containbutton>
  <html:hidden name="tempName"  write="false" value='<%=templateName%>'/>
  <html:hidden name="tempId"  write="false" value='<%=templateId%>'/>
<html:messages></html:messages>


<tab:tab  id="tab1" type="table">
<tab:card id="card0" text="基本信息">
  <table width="100%" cellpadding="0" class="tblContent">  
			<tr style="display:none">
            <td class="tdTitle">角色内码：</td>
            <td class="tdRight"><html:text name="roleId" property="roleId" size="20" readonly="true" /></td>
            </tr>		      
			<tr>
            <td class="tdTitle">角色名称：</td>
            <td class="tdRight"><html:text name="roleName" property="roleName" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
            </tr>   
					<tr>
                    <td class="tdTitle">角色业务含义：</td>
                    <td class="tdRight"><html:text name="roleAlias" property="roleAlias" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>     
					<tr>
                    <td class="tdTitle">是否系统管理员：</td>
                    <td class="tdRight"><html:checkbox name="isSys" property="isSys" value="1"/></td>
	                </tr>
					<tr style="display:none">
                    <td class="tdTitle">同时拥有该角色的最大用户数：</td>
                    <td class="tdRight"><html:text name="usersLimit" property="usersLimit" size="8" maxlength="8" value="-1"/><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>
	               <tr>
                   <td class="tdTitle">所属角色模板：</td>
                   <td class="tdRight"><%=templateName%></td>
                   </tr>
				  	<tr>
				      <td><html:hidden name="templateId" property="templateId" write="false" value='<%=templateId%>'/></td>
				    </tr>
  </table>
</tab:card>  

<tab:card id="card1" text="操作">
				<table width="100%" cellpadding="0" class="tblContent">
					<input type="hidden" name="net.mast.web.taglib.util.GRIDLENGTH"
						id="net.mast.web.taglib.util.GRIDLENGTH" value="0">
					<tr>
						<td><iframe style="display:block" id="dataFrame0"
							width="100%" height="410px" frameborder="0"></iframe></td>
					</tr>
				</table>
			</tab:card>
	<tab:card id="card2" text="树形操作">
        <table width="100%" cellpadding="0" class="tblContent">
	 <tr><td align="right">
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
   	if (card.id=="card1"){
   		if(isFirst){
		  document.frames["dataFrame0"].function1.show();
		  document.frames["dataFrame0"].function1.setSumText("");
		  isFirst=false;
		}
	  } 
	if (card.id=="card2"){
	var f = document.getElementById("dataFrame1");
	f.src = "tRoleopts.cmd?method=getRoot&roleId="+document.all("roleId").value+"&update=true";
   	} 
}

var tempName=document.all("tempName").value;
var tempId=document.all("tempId").value;

function forSave(){
  if(!checkPubTroles()) return;	
  //tab1.doCardShow("card1");
  //document.frames["dataFrame0"].document.forms[0].action="tRoleopts.cmd?method=updateTRoleResource";
  //document.frames["dataFrame0"].document.forms[0].submit();
  document.forms[0].action ="troles.cmd?method=update&templateName="+tempName+"&templateId="+tempId+"&refreshId=<%=refreshId%>";    
  document.forms[0].submit();	
}

function init(){
	var f = document.getElementById("dataFrame0");
	f.src = "function.cmd?method=queryTRoles&roleId="+document.all("roleId").value+"&update=true";
	if ("<%=flag%>"=="0"){
		tab1.doCardShow("card1");
		var f = document.getElementById("dataFrame0");
	    f.src = "function.cmd?method=queryTRoles&roleId="+document.all("roleId").value+"&update=true";
	    tab1.doCardShow("card2");
		var refreshId = "<%=refreshId%>";
		getTreeFrame().seltree.refreshNodeById(refreshId);
	}
}
	init();
</script>