<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>属性查询</TITLE>
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<% 
	String mofTableId = request.getParameter("mofTableId");
	if (mofTableId==null){
	mofTableId="";
	}
	String mofTableName = request.getParameter("mofTableName");
	if (mofTableName==null){
	mofTableName="";
	}
	String name = request.getParameter("name");
	if (name==null){
	name="";
	}
	String columnname = request.getParameter("columnname");
	if (columnname==null){
	columnname="";
	}
	String title = "属性查询－(" + ResourcesFactory.getString("MOF_COLUMN.MOF_TABLE_ID") + ":" + mofTableName + ")";
%>
<widgets:container title="<%=title%>" >
<widgets:containbutton onclick="forGenerate()" text="根据数据表生成属性"></widgets:containbutton>
<widgets:containbutton onclick="forInsert()" text="增加"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="修改"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="明细"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="删除"></widgets:containbutton>
<widgets:containbutton onclick="forReturn()" text="返回"></widgets:containbutton>
<html:form name="frmList" action="mofcolumnquery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
	<html:hidden name="mofTableId" value="<%=mofTableId%>"></html:hidden>
	<html:hidden name="mofTableName" value="<%=mofTableName%>" write="false"></html:hidden>
    	<td><%=ResourcesFactory.getString("MOF_COLUMN.NAME")%>：<html:text name="name" value=""/></td>
        <td><%=ResourcesFactory.getString("MOF_COLUMN.COLUMNNAME")%>：<html:text name="columnname" value=""/></td>
	<td><flex:searchImg name="chaxun" action="mofcolumnquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" isSubmit="true">
				<flex:checkboxCol caption="选择" width="50" property="mofColumnId" name="mofColumnId" sortName="MOF_COLUMN.MOF_COLUMN_ID"></flex:checkboxCol>				
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.NAME")%>' width="100" property="name" sortName="MOF_COLUMN.NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.DESCRIPTION")%>' width="100" property="description" sortName="MOF_COLUMN.DESCRIPTION"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.ISCOLUMN")%>' width="60" property="iscolumn" type="enum" enumCollection="MOFCOLUMN_ISCOLUMN_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_COLUMN.ISCOLUMN"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.COLUMNNAME")%>' width="100" property="columnname" sortName="MOF_COLUMN.COLUMNNAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.ISMANDATORY")%>' width="100" property="ismandatory" type="enum" enumCollection="MOFCOLUMN_ISMANDATORY_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_COLUMN.ISMANDATORY"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.DEFAULTVALUE")%>' width="100" property="defaultvalue" sortName="MOF_COLUMN.DEFAULTVALUE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.ISUPDATEABLE")%>' width="100" property="isupdateable" type="enum" enumCollection="MOFCOLUMN_ISUPDATEABLE_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_COLUMN.ISUPDATEABLE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.ISTREE")%>' width="100" property="tree" type="enum" enumCollection="MOFCOLUMN_ISTREE_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_COLUMN.ISTREE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.ISKEY")%>' width="60" property="iskey" type="enum" enumCollection="MOFCOLUMN_ISKEY_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_COLUMN.ISKEY"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.VFORMAT")%>' width="100" property="vformat" sortName="MOF_COLUMN.VFORMAT"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.VALUEMIN")%>' width="100" property="valuemin" sortName="MOF_COLUMN.VALUEMIN"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.VALUEMAX")%>' width="100" property="valuemax" sortName="MOF_COLUMN.VALUEMAX"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.MOF_REFERENCE_ID")%>' width="100" property="mofReferenceId" type="enum" enumCollection="MOFREFERENCE_IDNAME_COLLECTION1" enumKey="MOF_REFERENCE_ID" enumValue="NAME" sortName="MOF_COLUMN.NAME" canSort="false"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.ISSUM")%>' width="60" property="issum" type="enum" enumCollection="MOFCOLUMN_ISSUM_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_COLUMN.ISSUM"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.PROCESS")%>' width="150" property="process" sortName="MOF_COLUMN.NAME" canSort="false"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.MOF_REFERENCE_VALUE")%>' width="100" property="mofReferenceValue" type="enum" enumCollection="MOFREFERENCE_IDNAME_COLLECTION2" enumKey="MOF_REFERENCE_ID" enumValue="NAME" sortName="MOF_COLUMN.NAME" canSort="false"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_COLUMN.VALIDATIONCODE")%>' width="200"  property="validationCode" sortName="MOF_COLUMN.NAME" canSort="false" ></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mofcolumnquery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</widgets:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="mofcolumn.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mofcolumn.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mofcolumn.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mofcolumn.cmd?method=delete";    
  document.forms[0].submit();	
  if(getTreeFrame().seltree)
  getTreeFrame().seltree.refreshNodeById("root"); 
}
function forGenerate(){
  if (!confirm("确实要根据数据表生成列吗？")) {
       return;
  }
  document.forms[0].action ="mofcolumn.cmd?method=generate";    
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
  if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
function forReturn(){
    document.forms[0].action ="moftablequery.cmd?clear=true";
    document.forms[0].submit();	
  }
</script>