<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>Tab查询</TITLE>
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<% 
    String mofWindowId = request.getParameter("mofWindowId");
	if (mofWindowId==null){
	  mofWindowId="";
	}
   String mofWindowName = request.getParameter("mofWindowName");
	if (mofWindowName==null){
	  mofWindowName="";
	}
	String title= "Tab查询－(" + ResourcesFactory.getString("MOF_TAB.MOF_WINDOW_ID") + ":" + mofWindowName + ")";
%>
<widgets:container title="<%=title%>" >
<widgets:containbutton onclick="forInsert()" text="增加"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="修改"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="明细"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="删除"></widgets:containbutton>
<widgets:containbutton onclick="forReturn()" text="返回"></widgets:containbutton>
<html:form name="frmList" action="moftabquery.cmd">
<table id="tblSearch">
	<tr>

    	<html:hidden name="mofWindowId" value="<%=mofWindowId%>"/>
    	<html:hidden name="mofWindowName" value="<%=mofWindowName%>" write="false"/>
    	
    	<td><flex:searchImg name="chaxun" action="moftabquery.cmd" image="search.gif"/></td>
	</tr>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
				<flex:checkboxCol caption="选择" width="100" property="mofTabId" name="mofTabId" sortName="MOF_TAB.MOF_TAB_ID"></flex:checkboxCol>				
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TAB.NAME")%>' width="100" property="name" sortName="MOF_TAB.NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TAB.DESCRIPTION")%>' width="100" property="description" sortName="MOF_TAB.DESCRIPTION"></flex:flexCol>				
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TAB.MOF_TABLE_ID")%>' width="100" property="mofTableId" type="enum" enumCollection="MOFTABLE_IDNAME_COLLECTION" enumKey ="MOF_TABLE_ID" enumValue="NAME" sortName="MOF_TAB.MOF_TABLE_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TAB.SEQNO")%>' width="100" property="seqno" sortName="MOF_TAB.SEQNO"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TAB.ISMAIN")%>' width="100" property="ismain" type="enum" enumCollection="MOFTAB_ISMAIN_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_TAB.ISMAIN"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TAB.ISSAMETAB")%>' width="100" property="issametab" type="enum" enumCollection="MOFTAB_ISSAMETAB_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_TAB.ISSAMETAB"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TAB.ISDETAIL")%>' width="100" property="isdetail" type="enum" enumCollection="MOFTAB_ISDETAIL_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_TAB.ISDETAIL"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TAB.HASTREE")%>' width="100" property="hasTree" type="enum" enumCollection="MOFTAB_ISDETAIL_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_TAB.HASTREE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_TAB.INTERCEPTOR")%>' width="100" property="interceptor" sortName="MOF_TAB.INTERCEPTOR"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="moftabquery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</widgets:container>
<script language="javascript">
grid.show();
function forReturn(){
  window.location.href = "mofwindowquery.cmd";
}
function forInsert(){
  document.forms[0].action ="moftab.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="moftab.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="moftab.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="moftab.cmd?method=delete";    
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
function forReturn(){
    document.forms[0].action ="mofwindowquery.cmd?clear=true";
    document.forms[0].submit();	
  }
</script>