<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>表查询</TITLE>
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<% 
    String categoryId = request.getParameter("categoryId");
	if (categoryId==null){
	    categoryId="";
	}
	String name = request.getParameter("name");
		if (name==null){
		  name="";
	}
    String tablename = request.getParameter("tablename");
	if (tablename==null){
	  tablename="";
	}
%>
<widgets:container title="表查询" >
<widgets:containbutton onclick="forInsert()" text="增加"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="修改"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="明细"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="删除"></widgets:containbutton>
<html:form name="frmList" action="moftablequery.cmd">
<table id="tblSearch">
	<tr>
	<html:hidden name="categoryId" value="<%=categoryId%>"></html:hidden>
	<td><%=ResourcesFactory.getString("MOF_TABLE.NAME")%>：<html:text name="name" value="<%=name%>">
	</html:text></td>
        <td><%=ResourcesFactory.getString("MOF_TABLE.TABLENAME")%>：<html:text name="tablename" value="<%=tablename%>">
	</html:text></td>
	<td><flex:searchImg name="chaxun" action="moftablequery.cmd" image="search.gif"/></td>
	</tr>
</table>
<flex:flexgrid name="grid" height="340" isSubmit="true">
				<flex:checkboxCol caption="选择" width="100" property="mofTableId" name="mofTableId" sortName="MOF_TABLE.MOF_TABLE_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TABLE.NAME")%>' width="100" property="name" sortName="MOF_TABLE.NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TABLE.DESCRIPTION")%>' width="100" property="description" sortName="MOF_TABLE.DESCRIPTION"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TABLE.TABLENAME")%>' width="100" property="tablename" sortName="MOF_TABLE.TABLENAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TABLE.ACCESSLEVEL")%>' width="100" property="accesslevel" sortName="MOF_TABLE.ACCESSLEVEL"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TABLE.ISUPDATEABLE")%>' width="100" property="isupdateable" type="enum" enumCollection="MOFTABLE_ISUPDATEABLE_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_TABLE.ISUPDATEABLE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TABLE.ISACTIVE")%>' width="100" property="isactive" type="enum" enumCollection="MOFTABLE_ISACTIVE_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_TABLE.ISACTIVE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TABLE.ISVIEW")%>' width="100" property="isview" type="enum" enumCollection="MOFTABLE_ISVIEW_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_TABLE.ISVIEW"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="moftablequery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</widgets:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="moftable.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="moftable.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="moftable.cmd?method=detail";    
  document.forms[0].submit();	
}

function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="moftable.cmd?method=delete";    
  document.forms[0].submit();	
  if(getTreeFrame().seltree)
  getTreeFrame().seltree.refreshNodeById("root"); 
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
</script>