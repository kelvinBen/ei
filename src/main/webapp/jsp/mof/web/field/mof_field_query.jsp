<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<% 
    String mofTabId = request.getParameter("mofTabId");
	if (mofTabId==null){
	  mofTabId="";
	}
   String mofTabName = request.getParameter("mofTabName");
	if (mofTabName==null){
	  mofTabName="";
	}
   String name = request.getParameter("name");
	if (name==null){
	  name="";
	}
	
    String mofWindowId = request.getParameter("mofWindowId");
	if (mofWindowId==null){
	  mofWindowId="";
	}
   String mofWindowName = request.getParameter("mofWindowName");
	if (mofWindowName==null){
	  mofWindowName="";
	}
	String title = "域查询－(" + ResourcesFactory.getString("MOF_FIELD.MOF_TAB_ID") + ":" + mofTabName + ")";
%>
<HTML>
<HEAD>
<TITLE>域查询</TITLE>
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<widgets:container title="<%=title%>" >
<widgets:containbutton onclick="forGenerate()" text="根据对象属性生成Tab域"></widgets:containbutton>
<widgets:containbutton onclick="forInsert()" text="增加"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="修改"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="明细"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="删除"></widgets:containbutton>
<widgets:containbutton onclick="forReturn()" text="返回"></widgets:containbutton>
<html:form name="frmList" action="moffieldquery.cmd">

    	<html:hidden name="mofWindowId" value="<%=mofWindowId%>"/>
    	<html:hidden name="mofWindowName" value="<%=mofWindowName%>" write="false"/>
<table id="tblSearch">
	<tr>
    	<html:hidden name="mofTabId" value="<%=mofTabId%>"/>
    	<html:hidden name="mofTabName" value="<%=mofTabName%>" write="false"/>
    	
        <td><%=ResourcesFactory.getString("MOF_FIELD.NAME")%>：<html:text name="name" value=""/></td>
	<td><flex:searchImg name="chaxun" action="moffieldquery.cmd" image="search.gif"/></td>
	</tr>
</table>
<flex:flexgrid name="grid" height="340" isSubmit="true">
				<flex:checkboxCol caption="选择" width="50" property="mofFieldId" name="mofFieldId" sortName="MOF_FIELD.MOF_FIELD_ID"></flex:checkboxCol>				
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.NAME")%>' width="100" property="name" sortName="MOF_FIELD.NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.DESCRIPTION")%>' width="100" property="description" sortName="MOF_FIELD.DESCRIPTION"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.MOF_COLUMN_ID")%>' width="100" property="mofColumnId" type="enum" enumCollection="MOFCOLUMN_BYTABID_COLLECTION" enumKey ="MOF_COLUMN_ID" enumValue="NAME" sortName="MOF_FIELD.MOF_COLUMN_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.ISDISPLAY")%>' width="100" property="isdisplay" type="enum" enumCollection="MOFFIELD_ISDISPLAY_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_FIELD.ISDISPLAY"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.SEQNO")%>' width="100" property="seqno" sortName="MOF_FIELD.SEQNO"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.ISSAMELINE")%>' width="100" property="issameline" type="enum" enumCollection="MOFFIELD_ISSAMELINE_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_FIELD.ISSAMELINE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.DISPLAYLOGIC")%>' width="100" property="displaylogic" sortName="MOF_FIELD.DISPLAYLOGIC"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.ISREADONLY")%>' width="100" property="isreadonly" type="enum" enumCollection="MOFFIELD_ISREADONLY_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_FIELD.ISREADONLY"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.ISQUERY")%>' width="100" property="isquery" type="enum" enumCollection="MOFFIELD_ISQUERY_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_FIELD.ISQUERY"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.LENGTH")%>' width="100" property="length" sortName="MOF_FIELD.LENGTH"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_FIELD.ISCONDITION")%>' width="100" property="iscondition" type="enum" enumCollection="MOFFIELD_ISCONDITION_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_FIELD.ISCONDITION"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="moffieldquery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</widgets:container>
<script language="javascript">
grid.show();
function forReturn(){
  //返回到tab查询列表
  window.location.href ="moftabquery.cmd?mofWindowId="+document.forms[0].mofWindowId.value+"&mofWindowName=" + document.forms[0].mofWindowName.value;
}
function forInsert(){
  document.forms[0].action ="moffield.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="moffield.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="moffield.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="moffield.cmd?method=delete";    
  document.forms[0].submit();	
  if (top.contents.new_date.seltree)
  top.contents.new_date.seltree.refreshNodeById("root"); 
}
function forGenerate(){
  if (!confirm("确实要根据表列生成Tab域吗？")) {
       return;
  }
  document.forms[0].action ="moffield.cmd?method=generate";    
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
    document.forms[0].action ="moftabquery.cmd?clear=true";
    document.forms[0].submit();	
  }
</script>