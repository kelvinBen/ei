<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>授权模板角色定义查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
    String roleId = request.getParameter("roleId");
    if (roleId==null ||"".equals(roleId)){
      roleId="";
    }  

    String roleName = request.getParameter("roleName");
    if (roleName==null ||"".equals(roleName)){
      roleName="";
    }

    String roleAlias = request.getParameter("roleAlias");
    if (roleAlias==null ||"".equals(roleAlias)){
      roleAlias="";
    }

    String templateId = (String)request.getAttribute("templateId");
	if (templateId==null){
	    templateId="";
	}
	String templateName = (String)request.getAttribute("templateName");
	if (templateName==null){
	    templateName="";
	}
	String actionUrl="trolesquerypage.cmd?method=query&templateId="+templateId;
    StringBuffer sb = new StringBuffer();
    sb.append("角色模板："); 
    sb.append(templateName);
    String title = sb.toString();
%>
<bsp:container title="<%=title%>" >
<bsp:containbutton onclick="forSelect()" text="选择" action="trolesquerypage.cmd"></bsp:containbutton>
<bsp:containbutton onclick="forInsert()" text="增加" action="trolesquerypage.cmd"></bsp:containbutton>
<bsp:containbutton onclick="forUpdate()" text="修改" action="trolesquerypage.cmd"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()" text="删除" action="troles.cmd?method=delete"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()" text="明细"></bsp:containbutton>

<html:messages></html:messages>
<html:form name="frmList" action="<%=actionUrl%>">
<table id="tblSearch">
<tr>

<td><html:hidden name="tempName"  write="false" value='<%=templateName%>'/></td>
<td><html:hidden name="tempId"  write="false" value='<%=templateId%>'/></td>
</tr>  

<flex:search>
	<tr>
		<td>角色名：<flex:searchText name="roleName" searchName="PUB_TROLES.ROLE_NAME" dataType="java.lang.String" operSymbol="=" value="<%=roleName%>" size="10">
		</flex:searchText></td> 
		<td>角色业务含义：<flex:searchText name="roleAlias" searchName="PUB_TROLES.ROLE_ALIAS" dataType="java.lang.String" operSymbol=" like" value="<%=roleAlias%>" size="26">
		</flex:searchText></td>
		<td><flex:searchImg name="chaxun" action="<%=actionUrl%>" imgClick="if(addSymbol()) return false;" image="search.gif"/></td>
		
	</tr>
</flex:search>
      
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
				<flex:checkboxCol caption="选择" name="primaryKey" width="40" property="roleId" sortName="PUB_TROLES.ROLE_ID"></flex:checkboxCol>  				
				<flex:flexCol caption="角色内码" width="100" property="roleId" sortName="PUB_TROLES.ROLE_ID" style="display:none"></flex:flexCol>
  				<flex:flexCol caption="角色名" width="40%" property="roleName" style="text-align:left" sortName="PUB_TROLES.ROLE_NAME" ></flex:flexCol>
  				<flex:flexCol caption="角色业务含义" width="40%" property="roleAlias" style="text-align:left" sortName="PUB_TROLES.ROLE_ALIAS"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="<%=actionUrl%>" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
  var tempName=document.all("tempName").value;
  var tempId=document.all("tempId").value;
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="troles.cmd?method=detail&nevervote=1&primaryKey="+id+"&templateId="+tempId+"&templateName="+tempName;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");

function addSymbol(){
if(!checkCondition()) return true;
}
function checkCondition(){
	 if ( __isQuoteIn(document.forms[0].roleName.value) )
		  {
		    alert("角色名不能含有特殊字符！");
		    document.forms[0].roleName.select();
		    document.forms[0].roleName.focus();
		    return false;
		  }
		  if ( __isQuoteIn(document.forms[0].roleAlias.value) )
		  {
		    alert("角色业务含义不能含有特殊字符！");
		    document.forms[0].roleAlias.select();
		    document.forms[0].roleAlias.focus();
		    return false;
		  }
	return true;
	}
function forInsert(){
    var tempName=document.all("tempName").value;
    var tempId=document.all("tempId").value;
	var cmdUrl="troles.cmd?method=forinsert&nevervote=1&templateId="+tempId+"&templateName="+tempName;

   
document.forms[0].action=cmdUrl;
    document.forms[0].submit();
}
//选择角色 -郑斌 20060324
function forSelect(){
	var tempName=document.all("tempName").value;
    var tempId=document.all("tempId").value;
	var cmdUrl = "troles.cmd&method=getSelRoleRoot&templateId="+tempId+"&templateName="+tempName;
	var url = "jsp/help.jsp?url="+cmdUrl; 
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	if (win == null) {  
		return;
	}else{
	document.forms[0].action="troles.cmd?method=insertFromSel&RolesId="+win+"&templateId="+tempId;		
	document.forms[0].submit();
	}
}

function forUpdate(){
    if(!getSelect()) return;
    var tempName=document.all("tempName").value;
    var tempId=document.all("tempId").value;
    var priKey=grid.getCheckLine();
    var cmdUrl="troles.cmd?method=forupdate&nevervote=1&primaryKey="+priKey+"&templateId="+tempId+"&templateName="+tempName;
  
    document.forms[0].action=cmdUrl;
    document.forms[0].submit();
}
function forDetail(){
  if(!getSelect()) return;
  var tempName=document.all("tempName").value;
  var tempId=document.all("tempId").value;
  var priKey=grid.getCheckLine();
  var cmdUrl="troles.cmd?method=detail&nevervote=1&primaryKey="+priKey+"&templateId="+tempId+"&templateName="+tempName;
  
   document.forms[0].action=cmdUrl;
   document.forms[0].submit();
  
}
function forDelete(){
  if(!getDelete()) return;
  var tempName=document.all("tempName").value;
  var tempId=document.all("tempId").value;
  document.forms[0].action ="troles.cmd?method=delete&nevervote=1&templateId="+tempId+"&templateName="+tempName;    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要删除的记录!");
    return false;
  }
  if (!confirm("您确认要删除吗？")) {
   	     return false;
   	     }  
  return true;
}
</script>