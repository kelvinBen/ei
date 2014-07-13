<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE>授权模板角色资源查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 

   String tRoleId = (String)request.getAttribute("tRoleId");
	if (tRoleId==null){
	    tRoleId="";
	}
   String templateId = (String)request.getAttribute("templateId");
	if (templateId==null){
            templateId="";
	}

   String actionUrl="troleoptsquery.cmd?primaryKey="+tRoleId+"&templateId="+templateId;
  
   String  message=(String)request.getAttribute("message");

	
%>
<bsp:container title="授权模板角色资源查询" >
<bsp:containbutton onclick="addRowOperations()" text="增加" action="tRoleopts.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()" text="删除" action ="tRoleopts.cmd?method=delete"></bsp:containbutton>
<bsp:containbutton onclick="forenter()" text="返回" action = "trolesquery.cmd"></bsp:containbutton>

<html:form name="frmList" action="<%=actionUrl%>">
<html:messages></html:messages>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
				<flex:checkboxCol caption='选择' width="40" property="$(roleId+':'+resourceId)" name="primaryKey" sortName="PUB_TROLE_OPTS.ROLE_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_TROLE_OPTS.ROLE_ID")%>' width="100" property="roleId" sortName="PUB_TROLE_OPTS.ROLE_ID" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_TROLE_OPTS.RESOURCE_ID")%>' width="100" property="resourceId" sortName="PUB_TROLE_OPTS.RESOURCE_ID" style="display:none"></flex:flexCol>
				<flex:flexCol caption='资源名称' width="40%" property="resourceName" style="text-align:left" sortName="PUB_RESOURCES.RESOURCE_NAME"></flex:flexCol>
				<flex:flexCol caption='资源中文名称' width="40%" property="resourceAlias" style="text-align:left" sortName="PUB_RESOURCES.RESOURCE_ALIAS"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="<%=actionUrl%>" pageSize="15">
</flex:pagePolit>
<html:hidden name="tRoleId"  write="false" value='<%=tRoleId%>'/>
</html:form>
<html:hidden name="tempId"  write="false" value='<%=templateId%>'/>
</bsp:container>
<iframe  frameborder="0"  style="display:none" id="templateframe">
</iframe>
<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");


function saveResouces(url){
    var f = document.getElementById("templateframe");
    f.src = url;
    }
function refeshwindow(){
    var tRoleId=document.all("tRoleId").value;
    var tempId=document.all("tempId").value;
    document.forms[0].action ="troleoptsquery.cmd?primaryKey="+tRoleId+"&templateId="+tempId;
    document.forms[0].submit();	
    }
function forInsert(){   
  var tRoleId=document.all("tRoleId").value;
  var tempId=document.all("tempId").value;
  document.forms[0].action ="tRoleopts.cmd?method=forinsert&tRoleId="+tRoleId+"&templateId="+tempId;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  var tRoleId=document.all("tRoleId").value;
  var tempId=document.all("tempId").value;
  document.forms[0].action ="tRoleopts.cmd?method=delete&tRoleId="+tRoleId+"&templateId="+tempId;   
  document.forms[0].submit();	
}
function addRowOperations(){
    var str1;
    var str2;
    var cmdUrl="roleResource.cmd&method=getHelpRoot&nevervote=1";
    var url ="jsp/help.jsp?url="+cmdUrl;
    var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:400px;dialogHeight:550px"); 
    if (win == null) {  
    	return;
    }else{
    str1 = win[0];
    str2 = win[1];

    } 
    var tRoleId=document.all("tRoleId").value;
    var url="tRoleopts.cmd?method=insert&tRoleId="+tRoleId+"&resourcesId="+str1;  
    saveResouces(url);
     
  }
function forenter(){
    var tempId=document.all("tempId").value;
    document.forms[0].action = "trolesquery.cmd?templateId="+tempId;  
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
  if (!confirm("真的要删除选中的记录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
</script>