<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/mast-support" prefix="flexGrid"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>选择转移到的类别</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String type = request.getParameter("typeSearch");
	if (type==null){
	  type="";
	}
    String categoryName = request.getParameter("nameSearch");
	if (categoryName==null){
	    categoryName="";
	}
    String parent = request.getParameter("parentSearch");
	if (parent==null){
	  parent="";
	}
 %>
<widgets:container title="类别选择" >
<html:messages></html:messages>
<html:form name="frmList" action="mofcategorymovequery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>名称：<flex:searchText name="nameSearch" searchName="MOF_CATEGORY.NAME" dataType="java.lang.String" operSymbol="=" value="<%=categoryName%>" size="12">
	</flex:searchText></td>
    <td><flex:searchImg name="chaxun" action="mofcategorymovequery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flexGrid:flexgrid name="grid" height="200" action="" isSubmit="true">
				<flex:radioCol caption="选择" width="100" property="CATEGORY_ID" name="primaryKey" sortName="MOF_CATEGORY.CATEGORY_ID"></flex:radioCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_CATEGORY.NAME")%>' width="100" property="NAME" sortName="MOF_CATEGORY.NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_CATEGORY.PARENT")%>' width="100" property="PARENT" sortName="MOF_CATEGORY.PARENT"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_CATEGORY.TYPE")%>' width="100" property="TYPE" sortName="MOF_CATEGORY.TYPE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_CATEGORY.NOTE")%>' width="100" property="NOTE" sortName="MOF_CATEGORY.NOTE"></flex:flexCol>
</flexGrid:flexgrid>
<flex:pagePolit action="mofcategorymovequery.cmd" pageSize="5">
</flex:pagePolit>
</html:form>
<div align=center>
<table width=150>
 <tr>
	<td>
		<button name="btnClose" onclick="doConfirm()" class="advbutton">确 定</button>
	</td>
	<td>
		<button name="btnClose" onclick="doClose()"  class="advbutton">关 闭</button>
	</td>
 </tr>
</table>
</div>
</widgets:container>
<script language="javascript">
grid.show();
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

function doClose(){
    parent.close();
}


function doConfirm(){
   if(!getSelect()) return false;
      var row=grid.getCurrentLine();
      var categoryId=grid.getCellValue(row,1);
      var categoryName=grid.getCellValue(row,2);
      var result=new Array(2);
      result[0]=categoryId;
      result[1]=categoryName;
      parent.returnValue = result;
      parent.close();	  
   }
</script>

</BODY>
</HTML>
