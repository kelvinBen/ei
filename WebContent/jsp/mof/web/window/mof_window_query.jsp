<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.waf.ComponentFactory"%>
<HTML>
<HEAD>
<TITLE>窗口查询</TITLE>
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<% 
    String name = request.getParameter("name");
	if (name==null){
	  name="";
	}
%>
<widgets:container title="窗口查询" >
<widgets:containbutton onclick="forCopy()" text="复制"></widgets:containbutton>
<widgets:containbutton onclick="generate()" text="同步"></widgets:containbutton>
<widgets:containbutton onclick="forInsert()" text="增加"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="修改"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="明细"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="删除"></widgets:containbutton>
<widgets:containbutton onclick="forImport()" text="导入"></widgets:containbutton>
<widgets:containbutton onclick="forExport()" text="导出"></widgets:containbutton>
<widgets:containbutton onclick="forExportAll()" text="全部导出"></widgets:containbutton>
<html:form name="frmList" action="mofwindowquery.cmd">
<html:hidden name="new_windowname" value="" />
<table id="tblSearch">
	<tr>
    	<td><%=ResourcesFactory.getString("MOF_WINDOW.NAME")%>：<html:text name="name" value="<%=name%>"/></td>
	<td><flex:searchImg name="chaxun" action="mofwindowquery.cmd" image="search.gif"/></td>
	</tr>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
				<flex:checkboxCol caption="选择" width="100" property="mofWindowId" name="mofWindowId" sortName="MOF_WINDOW.MOF_WINDOW_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_WINDOW.NAME")%>' width="100" property="name" sortName="MOF_WINDOW.NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_WINDOW.DESCRIPTION")%>' width="150" sortName="MOF_WINDOW.NAME" canSort="false" property="description" ></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_WINDOW.ISACTIVE")%>' width="100" property="isactive" type="enum" enumCollection="MOFWINDOW_ISACTIVE_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_WINDOW.ISACTIVE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_WINDOW.FILTER")%>' width="200" property="filter" sortName="MOF_WINDOW.NAME" canSort="false" ></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mofwindowquery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
<iframe  frameborder="0" style="display:none" id="exportframe">
</iframe>
</widgets:container>
<script language="javascript">
grid.show();
function forImport(){
  var cmdUrl ="mofTransferCmd.cmd&method=forImport";   
  var url ="jsp/help.jsp?url="+cmdUrl;
    var win = showModalDialog(url,window,"scroll:auto;status:no;dialogWidth:500px;dialogHeight:200px"); 
    var templateName;
    if (win == null) {  
  	      return;
    }else{
	 return;
    } 
}

function hiddensubmit(url){
    var f = document.getElementById("exportframe");
    f.src = url;
    }
function forExport(){
	 if(!getExport()) return;
  var tempKeys=document.all("mofWindowId");
  var primaryKeys="";
  for (var i=0;i<tempKeys.length;i++){
	if (tempKeys[i].checked==true){
	primaryKeys=primaryKeys+tempKeys[i].value+",";
	}
  }
 primaryKeys=primaryKeys.substring(0,primaryKeys.length-1);
  var url ="mofTransferCmd.cmd?method=windowExport&mofWindowId="+primaryKeys; 
  hiddensubmit(url);	
}
function forExportAll(){
	 if(!getExportAll()) return;
  var url ="mofTransferCmd.cmd?method=windowExport&exportAll=true";    
   hiddensubmit(url);	
}
function forCopy(){
  <%
  	String path = request.getServletPath();
  	int index = path.lastIndexOf("/");
  	path = request.getContextPath()+path.substring(0,index);
  %>
  if( !getSelect() ) return;
  var window_name = showModalDialog("<%=path%>/new_windowname.jsp",window,"scroll:auto;status:no;dialogWidth:500px;dialogHeight:120px");
  if( window_name == null ){
  	return;
  }
  document.forms[0].new_windowname.value=window_name;
  document.forms[0].action ="mofwindow.cmd?method=cloneWindow";    
  document.forms[0].submit();	
}

function forInsert(){
  document.forms[0].action ="mofwindow.cmd?method=forinsert";    
  document.forms[0].submit();	
}

function generate(){
  if(!checkSelect("n")) return;
  document.forms[0].action ="generator.cmd?method=generatorJsp";    
  document.forms[0].submit();	
}
function checkSelect(count){
  if( count == "0" ) 	
  	return true;
  var sel=grid.getCheckLine();
  if(sel==""){
	alert("请选择一条记录!");
	return false;
  }
  if( count=="n")
  	return true;
  	
  var obj=sel.split(",");  
  if(obj.length*1>parseInt(count) ){
	alert("请选择"+count+"记录!");
	return false;
  }  
  return true;
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mofwindow.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mofwindow.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mofwindow.cmd?method=delete";    
  document.forms[0].submit();	
  if(getTreeFrame().seltree)
  getTreeFrame().seltree.refreshNodeById("root"); 
}
function forGenerator(){
  var sel=grid.getCheckAll();
  if(sel==""){
    alert("请选择要生成的窗口!");
    return;
  }
  document.forms[0].action ="generator.cmd?method=generatorJsp";    
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
function getExport(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要导出的Window!");
    return false;
  }
  if (!confirm("确认导出所选的Window吗?")) {
   	     return false;
   	     }  
  return true;
}
function getExportAll(){
  if (!confirm("确认导出所有Window吗?")) {
   	     return false;
   	     }  
  return true;
}
</script>