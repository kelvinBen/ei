<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<HTML>
<HEAD>
<TITLE>表单查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<BODY topmargin="10px"  onload="init();setTitleInTreeBar('工作流程－流程管理－表单定义列表');">


<%
String processtype_search=request.getParameter("processtype_search");
if(processtype_search==null)processtype_search="";
String processtypename_search=request.getParameter("processtypename_search");
if(processtypename_search==null)processtypename_search="";
String formname_search=request.getParameter("formname_search");
if(formname_search==null)formname_search="";
String struid_search=request.getParameter("struid_search");
if(struid_search==null)struid_search="";
String organName=request.getParameter("organName");
if(organName==null)organName="";
%>
<html:form name="frmList" action="workformmanagerquery.cmd?clear=true">
<div class="btnareaCss">
<html:button onclick="forCreateTables()" name="btn_createTables" value="建表"></html:button>
<html:button onclick="forInsert()" name="btn_insert" value="增加"></html:button>
<html:button onclick="forUpdate()" name="btn_update"  value="修改"></html:button>
<html:button onclick="forDelete()" name="btn_delete"  value="删除"></html:button>
<html:button onclick="printTemplet()" name="btn_templet"  value="打印模板"></html:button>

<!-- <html:button name="明细" value="明细" onclick="forDetail()"></html:button> --> 
<html:button name="返回" value="返回" onclick="forReturn()"></html:button>
</div>
<html:messages/>
<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td nowrap>类型：<input type="hidden" name="processtype_search" value="<%=processtype_search%>" size="10"><input type="text" name="processtypename_search" value="<%=processtypename_search%>" size="10" readonly="true"><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectProcessType()"></td>
    <td nowrap>表单名称：<input type="text" name="formname_search" value="<%=formname_search%>" size="10"></td>
    <td nowrap>部门：<input type="hidden" name="struid_search" value="<%=struid_search%>" size="10"><input type="text" name="organName" value="<%=organName%>" size="10" readonly="true"><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectNewDeptIdTree()"></td>
    <td><flex:searchImg name="chaxun" action="workformmanagerquery.cmd?clear=true" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
  
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
                          <flex:checkboxCol caption="选择" width="50" property="form-id"  name="primaryKey" sortName="formmanager.formId" canSort="false"></flex:checkboxCol>
                          <flex:flexCol caption='流程类型编号' width="100" property="typeid" sortName="formmanager.typeid" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='表单名称' width="250" property="name" sortName="formmanager.name"  canSort="false"></flex:flexCol>
                          <flex:flexCol caption='表单标题' width="250" property="title" sortName="formmanager.title" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='所属部门ID' width="100" property="organize-id" sortName="formmanager.organId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='所属部门' width="150" property="organize-name" sortName="formmanager.organName" canSort="false"></flex:flexCol>
                          
                          <flex:flexCol caption='类型名称' width="100" property="typename" sortName="formmanager.typename" canSort="false"></flex:flexCol>
</flex:flexgrid>

<flex:pagePolit action="workformmanagerquery.cmd?clear=true">
</flex:pagePolit>
</html:form>
</body>
</html>
<script language="javascript">
function init(){
//setGridHeight("grid",0.4)
grid.show();
grid.setSumText("");
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var form_ids=grid.getCellValue(i, 1);
		var form_names=grid.getCellValue(i, 3);
		grid.getCell(i, 3).innerHTML = getHrefWorkform('formmanager.cmd?method=forupdate&primaryKey=', transMatrix(form_ids,form_names));
		var type_ids=grid.getCellValue(i, 2);
		var type_names=grid.getCellValue(i, 7);
		grid.getCell(i, 7).innerHTML = getHref('<%=MatrixHref.getUrl("ProcessType")%>', transMatrix(type_ids,type_names));
		//var organ_ids=grid.getCellValue(i, 5);
		//var organ_names=grid.getCellValue(i, 6);
		//grid.getCell(i, 6).innerHTML = getHref('<%=MatrixHref.getUrl("Organ")%>', transMatrix(organ_ids,organ_names));
								
	}
}
function getHrefWorkform(url,idnames)
{	
	var processtype_search = document.all('processtype_search').value;
	if (url==null){
		return "";
	}
	if ((idnames==null)||(idnames=="")){
		return "";
	}
	var idnamearr=idnames.split(MatrixRow);
	var ret = "";
	for (var i=0;i<idnamearr.length;i++){
		var idname = idnamearr[i].split(MatrixCol);
		if (ret=="")
			ret="<a href=\""+url+idname[0]+"&matrix=true"+ "&processtype_search=" +processtype_search +"\">"+idname[1]+"</a>";
		else
			ret=ret+" "+"<a href=\""+url+idname[0]+"&matrix=true"+"&processtype_search=" +processtype_search +"\">"+idname[1]+"</a>";
	}
	return "<span>"+ret+"</span>";
}
function forCreateTables()
{	
	var sel=grid.getCheckLine();
    if(sel==""){
      alert("请选择要建表的表单!");
      return false;
    }
	document.forms[0].action ="formmanager.cmd?method=createTables";       
  	document.forms[0].submit();
}


//进入增加表单页面
function forInsert(){
var url="jsp/help.jsp?url=processtypehelpquery.cmd";
var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:450px;status:no;scroll:no');
if(obj==null)return;

	var processtype=obj[0];
	if(processtype==""){
		alert("请选择类型！");
		return;
	}
  var processtype_search = document.all("processtype_search").value; 
  
  var useNew = 'true' ;
  //if( !window.confirm('是否使用新的表单定制界面？')){
  	//useNew = 'false' ;
 // }
  
  window.location.href ="formmanager.cmd?method=forinsert&processtype="+processtype+"&processtype_search="+processtype_search + '&useNew='+useNew;	
}
function forUpdate(){
  if(!getSelect()) return;
    //var row=grid.getCurrentLine();
 
  document.forms[0].action ="formmanager.cmd?method=forupdate";       
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
    var row=grid.getCurrentLine();
 
  document.forms[0].action ="formmanager.cmd?method=detail";       
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="formmanager.cmd?method=delete";    
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="processtypequery.cmd?clear=true";
  document.forms[0].submit();	
}
function printTemplet(){
  if(!getSelect()) return;
   var row=grid.getCheckAll().split(",");
  var processtype=row[1];
  document.forms[0].action ="formprinttempletquery.cmd?formId="+grid.getCheckLine()+"&processType="+processtype;    
  document.forms[0].submit();	
}
function selectNewDeptIdTree(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>&showOrganType=1,2";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("struid_search").value="";
	  document.all("organName").value="";
  }else{
	  document.all("struid_search").value=win[2];
	  document.all("organName").value=win[1];
  }
}
function selectProcessType(){
var url="jsp/help.jsp?url=processtypehelpquery.cmd";
var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:450px;status:no;scroll:no');
if(obj==null)return;
document.all("processtype_search").value=obj[0];
document.all("processtypename_search").value=obj[1];
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