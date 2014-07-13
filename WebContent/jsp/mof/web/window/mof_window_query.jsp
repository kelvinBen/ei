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
<TITLE>���ڲ�ѯ</TITLE>
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
<widgets:container title="���ڲ�ѯ" >
<widgets:containbutton onclick="forCopy()" text="����"></widgets:containbutton>
<widgets:containbutton onclick="generate()" text="ͬ��"></widgets:containbutton>
<widgets:containbutton onclick="forInsert()" text="����"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="�޸�"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="��ϸ"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="ɾ��"></widgets:containbutton>
<widgets:containbutton onclick="forImport()" text="����"></widgets:containbutton>
<widgets:containbutton onclick="forExport()" text="����"></widgets:containbutton>
<widgets:containbutton onclick="forExportAll()" text="ȫ������"></widgets:containbutton>
<html:form name="frmList" action="mofwindowquery.cmd">
<html:hidden name="new_windowname" value="" />
<table id="tblSearch">
	<tr>
    	<td><%=ResourcesFactory.getString("MOF_WINDOW.NAME")%>��<html:text name="name" value="<%=name%>"/></td>
	<td><flex:searchImg name="chaxun" action="mofwindowquery.cmd" image="search.gif"/></td>
	</tr>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
				<flex:checkboxCol caption="ѡ��" width="100" property="mofWindowId" name="mofWindowId" sortName="MOF_WINDOW.MOF_WINDOW_ID"></flex:checkboxCol>
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
	alert("��ѡ��һ����¼!");
	return false;
  }
  if( count=="n")
  	return true;
  	
  var obj=sel.split(",");  
  if(obj.length*1>parseInt(count) ){
	alert("��ѡ��"+count+"��¼!");
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
    alert("��ѡ��Ҫ���ɵĴ���!");
    return;
  }
  document.forms[0].action ="generator.cmd?method=generatorJsp";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("��ѡ��һ����¼!");
    return false;
  }  
  return true;
}
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��Ҫɾ���ļ�¼!");
    return false;
  }
  if (!confirm("���Ҫɾ��ѡ�еļ�¼�𣿴˲������ָܻ���")) {
   	     return false;
   	     }  
  return true;
}
function getExport(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��Ҫ������Window!");
    return false;
  }
  if (!confirm("ȷ�ϵ�����ѡ��Window��?")) {
   	     return false;
   	     }  
  return true;
}
function getExportAll(){
  if (!confirm("ȷ�ϵ�������Window��?")) {
   	     return false;
   	     }  
  return true;
}
</script>