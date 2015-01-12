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
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>

<% 
    String refreshId = (String)request.getAttribute("refreshId");
    if(refreshId==null)
        refreshId="";
    String templateId = request.getParameter("templateId");
	if (templateId==null){
	    templateId="";
	}
	String templateName = request.getParameter("templateName");
	if (templateName==null){
	    templateName="";
	}
	StringBuffer sb = new StringBuffer();
    sb.append("角色模板:"+templateName+"  的角色明细"); 
    
    String title = sb.toString();
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
</HEAD>

<BODY topmargin="10px">
<html:form  name="frmList"  action="">

 <html:hidden name="tempName"  write="false" value='<%=templateName%>'/>
 <html:hidden name="tempId"  write="false" value='<%=templateId%>'/>

<bsp:container title="<%=title%>" >
<bsp:containbutton text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()"></bsp:containbutton>
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
                 <tr style="display:none">
                    <td class="tdTitle">同时拥有该角色的最大用户数：</td>
                    <td class="tdRight"><html:hidden name="usersLimit" property="usersLimit"/>
					</td>
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
     <table width="100%" cellpadding="0" class="tblContent" >  
	<input type="hidden" name="net.mast.web.taglib.util.GRIDLENGTH" id="net.mast.web.taglib.util.GRIDLENGTH" value="0">
	<tr><td>
	<iframe style="display:block" id="dataFrame0" width="100%" height="350" frameborder="0"></iframe>
	</td></tr>
   </table>
</tab:card>
<tab:card id="card2" text="树形操作">
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
  	if (card.id=="card1"){
  	if(isFirst){
		var f = document.getElementById("dataFrame0");
		f.src = "function.cmd?method=queryTRoles&roleId="+document.all("roleId").value+"&update=false";
		isFirst=false;
		}
   	} 
   	if (card.id=="card2"){
		var f = document.getElementById("dataFrame1");
		f.src = "tRoleopts.cmd?method=getRoot&roleId="+document.all("roleId").value+"&update=false";
   	} 
}
function forUpdate(){
    var tempName=document.all("tempName").value;
    var tempId=document.all("tempId").value;
    var roleId=document.all("roleId").value;
    var cmdUrl="troles.cmd?method=forupdate&nevervote=1&primaryKey="+roleId+"&templateId="+tempId+"&templateName="+tempName;
	document.forms[0].action=cmdUrl;
    document.forms[0].submit();
}	
	
function forReturn(){
    document.forms[0].action ="trolesquerypage.cmd?method=query&roleName=&roleAlias=";
    document.forms[0].submit();
 }

</script>