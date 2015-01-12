<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
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
<BODY topmargin="10px"  onload="init();setTitleInTreeBar('工作流程－查询管理－表单查询')">


<%
String processtype_search=request.getParameter("processtype_search");
if(processtype_search==null)processtype_search="";
String processtypename_search=request.getParameter("processtypename_search");
if(processtypename_search==null)processtypename_search="";
String tmpTypeName=(String)request.getAttribute("processtypename_search");
if(tmpTypeName!=null)processtypename_search=tmpTypeName;
%>
<html:form name="frmList" action="workformmanagerquery.cmd">
<div class="btnareaCss">

<html:button onclick="forQuery()" name="btn_query"  value="查询"></html:button>
</div>
<html:messages/>
<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>类型：
   <input type="hidden" name="processtype_search" value="<%=processtype_search%>" size="10"><input type="text" name="processtypename_search" value="<%=processtypename_search%>" size="10" readonly="true"><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectProcessType()">
	</td>
    
	<td><flex:searchImg name="chaxun" action="workformforquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
  
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
                          <flex:radioCol caption="选择" width="50" property="form-id"  name="primaryKey" sortName="formmanager.formId" canSort="false"></flex:radioCol>
                          <flex:flexCol caption='流程类型编号' width="100" property="typeid" sortName="formmanager.typeid" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='表单名称' width="250" property="name" sortName="formmanager.name"  canSort="false"></flex:flexCol>
                          <flex:flexCol caption='表单标题' width="250" property="title" sortName="formmanager.title" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='所属部门ID' width="100" property="organize-id" sortName="formmanager.organId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='所属部门' width="150" property="organize-name" sortName="formmanager.organName" canSort="false"></flex:flexCol>
                          
                          <flex:flexCol caption='类型名称' width="100" property="typename" sortName="formmanager.typename" canSort="false"></flex:flexCol>
</flex:flexgrid>

<flex:pagePolit action="workformforquery.cmd">
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
		grid.getCell(i, 3).innerHTML = getHref('<%=MatrixHref.getUrl("WorkFlowForm")%>', transMatrix(form_ids,form_names));
		var type_ids=grid.getCellValue(i, 2);
		var type_names=grid.getCellValue(i, 7);
		grid.getCell(i, 7).innerHTML = getHref('<%=MatrixHref.getUrl("ProcessType")%>', transMatrix(type_ids,type_names));
		//var organ_ids=grid.getCellValue(i, 5);
		//var organ_names=grid.getCellValue(i, 6);
		//grid.getCell(i, 6).innerHTML = getHref('<%=MatrixHref.getUrl("Organ")%>', transMatrix(organ_ids,organ_names));
								
	}
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
function forQuery(){
  if(!getSelect()) return;
  var row=grid.getCheckAll().split(",");
  var processtype=row[1];
  document.forms[0].action ="formmanager.cmd?method=render&formId="+grid.getCheckLine()+"&processType="+processtype;    
  document.forms[0].submit();	
}
function selectProcessType(){
var url="jsp/help.jsp?url=processtypehelpquery.cmd";
var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:450px;status:no;scroll:no');
if(obj==null)return;
document.all("processtype_search").value=obj[0];
document.all("processtypename_search").value=obj[1];
}
</script>