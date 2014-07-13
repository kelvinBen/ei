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
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
 
<HTML> 
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"editgrid.css")%>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"bsp.js")%>"></script>
</HEAD>
<%
	String refreshId = (String) request.getAttribute("refreshId");
	String corporationId = (String) request.getAttribute("corporationId");
%>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">

<input type="hidden" name="grantedRolesIdList" >
<input type="hidden" name="agentUsersIdList" >
<input type="hidden" name="beAgentUsersIdList" >

<bsp:container title="用户明细" >
<bsp:containbutton text="修改" onclick="forUpdate()" action ="user.cmd?method=forupdate"></bsp:containbutton>
<html:messages/>
<tab:tab  id="tab1" type="table">
<tab:card id="card0" text=" 一般信息  ">
  <table width="100%" cellpadding="0" class="tblContent">
  
  		<tr>
                <td class="tdTitle">用户ID：</td>
                <td class="tdRight"><html:hidden name="userId"  property="userId" write="true"/></td>
                </tr>  
                    
                <tr>
                <td class="tdTitle">用户名称：</td>
                <td class="tdRight"><html:hidden name="userName"  property="userName" write="true" />
               <!-- &nbsp;(帐号是否绑定了内部员工: -->	<html:hidden name="externalUser" property="externalUser" value="01" /><!--是-->
	<html:hidden name="externalUser" property="externalUser" value="10"/><!--否)-->
                </td>
                </tr>    

                <html:hidden name="securityLevel"  property="securityLevel" write="false"/>
                <html:hidden name="isSys" value="1"/> 
                
				<html:hidden name="corporationName"  property="corporationName" write="false"/>
                
				<html:hidden name="departmentName"  property="departmentName" write="false" />

                <html:hidden name="employeeName"  property="employeeName" write="false"/>
              
                
                <html:hidden name="maxSessions"  property="maxSessions"  write="false"/>
                
                <tr>
                <td class="tdTitle">E_MAIL：</td>
                <td class="tdRight"><html:hidden name="email"  property="email" write="true"/></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">传 真：</td>
                <td class="tdRight"><html:hidden name="msn"  property="msn" write="true"/></td>
                </tr> 
<%
net.mast.bsp.permit.pap.view.UserView uv = (net.mast.bsp.permit.pap.view.UserView)request.getAttribute("html.data");
String qq = uv.getQq();
String char1 = uv.getChar1();
String char2 = uv.getChar2();
%>
                
                <tr>
                <td class="tdTitle">用户部门：</td>
                <td class="tdRight"> <html:hidden name="qq"  property="qq" write="true"/></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">用户岗位：</td>
                <td class="tdRight"> <html:hidden name="char1"  property="char1" write="true"/></td>                
                </tr> 
                
                <tr>
                <td class="tdTitle">用户职责：</td>
                <td class="tdRight"> <%="ALL".equals(char2)?"全部":char2%></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">手 机：</td>
                <td class="tdRight"><html:hidden name="mobile"  property="mobile" write="true"/></td>
                </tr> 
                
                <html:hidden name="accountStatus" property="accountStatus"/>
                
 <!--               <tr>
                <td class="tdTitle">状态：</td>
                <td class="tdRight">
                <html:hidden name="accountStatusName" property="accountStatusName" write="true"/>
                </td>
                </tr>-->
                
   </table>
</tab:card>

<tab:card id="card1" text=" 角色  " >
  <table width="100%" cellpadding="0" class="tblContent" >
          <tr>
          <td class="tdLeft">可用角色：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已授予的角色：</td>
          </tr>  
	  <tr>
    	  <td> 
	   <list:pageToPage style="width:800"  type="multiImg" name="multi_0" disabled="true">
            <list:left size="10" name="availableRolesId"  multiple="true" property="userId" styleTd="align:center;width:50%" style="width:100%">
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

<tab:card id="card2" text=" 代理用户  ">
<table  cellpadding="0" class="tblContent" ><tr>
<td >
	 <table   cellpadding="0">
	 <tr><td class="tdLeft">已经代理了当前帐户的用户：</td></tr>
	 <tr>
		<td>
		<html:select   name="agentUsersId" value="" size="10" style="width:170">
			<html:optionsCollection property="agentUsers" label="userName" value="userId"/>
		</html:select>
		</td>
	  </tr>
      </table>
</td>
<td class="tdLeft">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td>	  
	<table  cellpadding="0" >
	<tr><td  class="tdLeft">已经被当前帐户代理了的用户：</td></tr>
	<tr>
		<td>
		<html:select   name="beAgentUsersId" value="" size="10" style="width:170">
			<html:optionsCollection property="beAgentUsers" label="userName" value="userId"/>
		</html:select>
		</td>
	  </tr>
     </table>
</td>
<td width="100%" class="tdLeft">&nbsp;</td>
</tr></table>
</tab:card>

<tab:card id="card3" text=" 数据权限  ">
     <table width="100%" cellpadding="0" class="tblContent" >  
	<input type="hidden" name="net.mast.web.taglib.util.GRIDLENGTH" id="net.mast.web.taglib.util.GRIDLENGTH" value="0">
	<tr><td>
	<iframe style="display:block" id="dataFrame0" width="100%" height="350" frameborder="0"></iframe>
	</td></tr>
   </table>
</tab:card>
<tab:card id="card4" text=" 组织结构权限  ">
<table width="100%" cellpadding="0" class="tblContent" > 
   <tr>
   <td>
                <grid:grid name="struTypeRefList" property="struTypeRefList" type="edit" height="200" sumRow="false">
                     <grid:hideCol property="struType" name="struType" caption="结构类型代码" readonly="true" index="1" ></grid:hideCol>
                     <grid:textCol property="struTypeName" name="struTypeName" caption="结构类型" readonly="true" index="2" width="200"></grid:textCol>
                     <grid:hideCol property="struId" name="struId" caption="最高访问节点的结构内码" readonly="true" index="3" ></grid:hideCol>
                     <grid:textCol property="organName" name="organName" caption="访问权限" readonly="true" index="4" width="200"></grid:textCol>
	             <grid:primaryKeyCol property="struType" name="primaryKey" caption="主键列" readonly="true" index="5" ></grid:primaryKeyCol>
	             <grid:hideCol property="rootId" name="rootId" caption="每种结构类型根节点的结构内码" readonly="true" index="6" ></grid:hideCol>
	        </grid:grid>
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
	init();
	function init(){
		var userId = document.all("userId").value;
		var f = document.getElementById("dataFrame0");
		f.src = "userdatarefquery.cmd?userId="+userId+"&corporationId="+"<%=corporationId%>&update=false";
		var refreshId ="<%=refreshId%>";
		if(getTreeFrame().seltree!=null)
		getTreeFrame().seltree.refreshNodeById(refreshId);
	}

	tab1.doCardClick=function(card){
		if (card.id=="card3"){
			document.frames["dataFrame0"].dataResources.show();
			document.frames["dataFrame0"].dataResources.setSumText("");
		}
		if (card.id=="card4"){
			struTypeRefList.show();
		}
	}

		function forUpdate(){
		var userid=document.all("userId").value;
		document.forms[0].action ="user.cmd?method=forupdate&userId="+userid+"&refreshId="+"<%=refreshId%>";
		document.forms[0].submit();
	}
</script>
