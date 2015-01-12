<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.mof.model.reference.MofReference"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>
<HTML>
<HEAD>
<TITLE>参考类型查询</TITLE>
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<% 
	String name = request.getParameter("name");
	if (name==null){
	name="";
	}
	String category = request.getParameter("category");
	if (category==null){
	    category="";
	}
	java.util.Map map = new java.util.HashMap();
	map.put("category",category);
	request.setAttribute("html.data",map);
	String validationtype = request.getParameter("validationtype");
	if (validationtype==null){
	validationtype="";
	}
%>
<%
String refreshId=category;
if (request.getParameter("isRefresh")==null||!"true".equals(request.getParameter("isRefresh"))||refreshId==null||refreshId.equals("")){
    refreshId="";
}
%>
<widgets:container title="参考类型查询" >
<widgets:containbutton onclick="forQuery()" text="参考明细维护"></widgets:containbutton>
<widgets:containbutton onclick="forInsert()" text="增加"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="修改"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="明细"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="删除"></widgets:containbutton>
<html:form name="frmList" action="mofreferencequery.cmd">
<table id="tblSearch">
	<tr>
    	<td><%=ResourcesFactory.getString("MOF_REFERENCE.NAME")%>：<html:text size="12" name="name" value="<%=name%>"/></td>
    	<td><%=ResourcesFactory.getString("MOF_REFERENCE.CATEGORY")%>：
		
		<help:helpsearch name="category" size="20" helpid="mofcategory_help" helpStyle="" property="category" imgsrc="skins/default/images/liulan.gif" onkeydown="pubCommonkeyHelp(window.event.altKey,'table_CATEGORY_ID_dialog()')"/></td>

	<td><%=ResourcesFactory.getString("MOF_REFERENCE.VALIDATIONTYPE")%>：
	<html:select name="validationtype" value="<%=validationtype%>">
		<html:option value=""></html:option>
		<html:options collection="VALIDATION_TYPE" property="key" labelProperty="value"/>
	</html:select>
	</td>
	<td><flex:searchImg name="chaxun" action="mofreferencequery.cmd" image="search.gif"/></td>
	</tr>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
				<flex:checkboxCol caption="选择" width="100" property="mofReferenceId" name="mofReferenceId" sortName="MOF_REFERENCE.MOF_REFERENCE_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFERENCE.MOF_REFERENCE_ID")%>' width="100" property="mofReferenceId" name="mofReferenceId" sortName="MOF_REFERENCE.MOF_REFERENCE_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFERENCE.NAME")%>' width="100" property="name" sortName="MOF_REFERENCE.NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFERENCE.DISCRIPTION")%>' width="100" property="discription" sortName="MOF_REFERENCE.DISCRIPTION"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFERENCE.VALIDATIONTYPE")%>' width="100" property="validationtype" style="display:none" sortName="MOF_REFERENCE.VALIDATIONTYPE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFERENCE.VALIDATIONTYPE")%>' width="100" property="validationtype" type="enum" enumCollection="VALIDATION_TYPE" enumValue="value" enumKey="key" sortName="MOF_REFERENCE.VALIDATIONTYPE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFERENCE.HELPNO")%>' width="100" property="helpno" sortName="MOF_REFERENCE.HELPNO"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFERENCE.CATEGORY")%>' width="100" property="category" style="display:none"  sortName="MOF_REFERENCE.CATEGORY"></flex:flexCol>
                <flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFERENCE.IMPL_CLASS")%>' width="100" property="implClass" style="display:none"  sortName="MOF_REFERENCE.IMPL_CLASS"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFERENCE.CATEGORY")%>' width="100" property="category" type="enum" enumCollection="MOFCATEGORY_COLLECTION" enumValue="NAME" enumKey="CATEGORY_ID" sortName="MOF_REFERENCE.CATEGORY"></flex:flexCol>
                
</flex:flexgrid>
<flex:pagePolit action="mofreferencequery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</widgets:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="mofreference.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mofreference.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mofreference.cmd?method=detail";    
  document.forms[0].submit();	
}
function forQuery(){
  if(!getSelect()) return;
  var obj=grid.getCheckAll().split(",");
  if (obj[4]!="<%=MofReference._Enum%>"){
  	alert("数据类型为枚举值时才对应参考明细！");
  	return;
  }  
  window.location.href ="mofreflistquery.cmd?mofReferenceId="+obj[0]+"&mofReferenceName="+obj[2];
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mofreference.cmd?method=delete&isRefresh=true";    
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
    alert("请选择要删除的记录！");
    return false;
  }
  if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}

function init(){
    var refreshId ="<%=refreshId%>";
    var validationtype =document.forms[0].validationtype.value;
    if (validationtype=="Enumeration"){
        refreshId=refreshId==""?"__EnumValue":refreshId+"@C_E";
    }else if (validationtype=="Table"){
        refreshId=refreshId==""?"__TableValue":refreshId+"@C_T"
    }else if (validationtype=="DataValue"){
        refreshId="__DataValue";
    }else if(validationtype=="SysButton"){
    	refreshId="__SysBtnValue";
    }
    if (refreshId!=null&&refreshId!=""&&refreshId!=undefined){
       if(getTreeFrame()&&getTreeFrame().seltree){
           getTreeFrame().seltree.refreshNodeById(refreshId); 
       }
    }
 }
 <%if(String.valueOf(request.getParameter("isRefresh")).equals("true")){%>
 	init();
 <%}%>
 
</script>