<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.mof.util.MofConstants"%>
<HTML>
<HEAD>
<TITLE>类别管理查询</TITLE>
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<% 
    String type = request.getParameter("typeSearch");
	if (type==null){
	  type="";
	}
	 String refreshId = request.getParameter("refreshId");
		if (refreshId==null){
		    refreshId="";
		}
    String categoryName = request.getParameter("nameSearch");
	if (categoryName==null){
	    categoryName="";
	}
    String parent = request.getParameter("parentSearch");
	if (parent==null){
	  parent = request.getParameter("parentId");
	  if (parent==null){
	      parent="";
	  }
	}
	String  message=(String)request.getAttribute("succmessage");
	if(message==null){
		message="";
	}
 %>
<widgets:container title="类别管理查询" >
<widgets:containbutton onclick="forDetail()" text="明细"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="删除"></widgets:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mofcategoryquery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>名称：<flex:searchText name="nameSearch" searchName="MOF_CATEGORY.NAME" dataType="java.lang.String" operSymbol="=" value="<%=categoryName%>" size="12">
	</flex:searchText></td>
	<td>类型：<flex:searchText name="typeSearch" searchName="MOF_CATEGORY.TYPE" dataType="java.lang.String" operSymbol="=" value="<%=type%>" size="12">
	</flex:searchText></td>
    <td>上级内码：<flex:searchText name="parentSearch" searchName="MOF_CATEGORY.PARENT" dataType="java.lang.String" operSymbol="=" value="<%=parent%>" size="12">
	</flex:searchText></td>
    <td><flex:searchImg name="chaxun" action="mofcategoryquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="200" action="" isSubmit="true">
				<flex:checkboxCol caption="选择" width="100" property="categoryId" name="primaryKey" sortName="MOF_CATEGORY.CATEGORY_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_CATEGORY.TYPE")%>' width="100" property="type" sortName="MOF_CATEGORY.TYPE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_CATEGORY.NAME")%>' width="100" property="categoryName" sortName="MOF_CATEGORY.NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_CATEGORY.PARENT")%>' width="100" property="parent" sortName="MOF_CATEGORY.PARENT"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_CATEGORY.NOTE")%>' width="100" property="note" sortName="MOF_CATEGORY.NOTE"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mofcategoryquery.cmd" pageSize="5">
</flex:pagePolit>
</html:form>
</widgets:container>
<script language="javascript">
<%if(message!=""){%>
   parent.alert('<%=message%>');
<%}%>
grid.show();
function forInsert(){
  document.forms[0].action ="mofcategory.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mofcategory.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mofcategory.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mofcategory.cmd?method=delete";    
  document.forms[0].submit();	
  if(getTreeFrame().seltree)
  getTreeFrame().seltree.refreshNodeById("<%=MofConstants.ROOT_ID%>"); 
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
  if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
function init(){
    var refreshId ="<%=refreshId%>";
    if (refreshId!=null&&refreshId!=""&&refreshId!=undefined){
        if(getTreeFrame().seltree)
            getTreeFrame().seltree.refreshNodeById(refreshId); 
    }
 }
 init();
</script>