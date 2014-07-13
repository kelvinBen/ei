<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>

<BODY topmargin="10px" onload="init();">
<%
String processtype_search=request.getParameter("processtype_search");
if(processtype_search==null)processtype_search="";
String type_name=request.getParameter("TYPE_NAME");
if(type_name==null)type_name="";
String name=request.getParameter("NAME");
if(name==null)name="";
String authpr=request.getParameter("AUTHPR");
if(authpr==null)authpr="";
String formname=request.getParameter("formname");
if(formname==null)formname="";
String formid_search=request.getParameter("formid_search");
if(formid_search==null)formid_search="";

String struid_search=request.getParameter("struid_search");
if(struid_search==null)struid_search="";
String organ_name=request.getParameter("ORGAN_NAME");
if(organ_name==null)organ_name="";
%>
<html:form name="frmList" action="processquery.cmd?clear=true">
<div class="btnareaCss">
<html:button name="同步监控人" value="同步监控人" onclick="sysreposible()"></html:button>
<html:button name="更新新建任务权限" value="更新新建任务权限" onclick="sysdata()"></html:button>
<html:button name="载入" value="载入" onclick="forLoad()"></html:button>
<html:button name="增加" value="增加" onclick="forInsert()"></html:button>
<!--<html:button name="明细" value="明细" onclick="forDetail()"></html:button>-->
<html:button name="修改" value="修改" onclick="forUpdate()"></html:button>
<html:button name="删除" value="删除" onclick="forDelete()"></html:button>
<html:button name="导出流程" value="导出流程" onclick="forexport()"></html:button>
<html:button name="导入流程" value="导入流程" onclick="forimport()"></html:button>
<html:button name="返回" value="返回" onclick="forReturn()"></html:button>
</div>	
<html:messages/>
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td nowrap>类型：
<flex:searchText name="TYPE_ID" style="display:none;" searchName="WF_PROCESS_FILES.TYPE_ID" dataType="java.lang.String" operSymbol="="  value="" size="12"/>
<flex:searchText name="TYPE_NAME" searchName="WF_PROCESS_FILES.TYPE_NAME" dataType="java.lang.String" operSymbol="=" value="<%=type_name%>" size="12"/>
<img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectProcessType()">
	</td>
    <td nowrap>流程名称：
    <flex:searchText name="NAME" searchName="WF_PROCESS_FILES.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>
    <td nowrap>表单名称：

    <flex:searchText name="FORMID" style="display:none;" searchName="WF_PROCESS_FILES.FORMID" dataType="java.lang.String" operSymbol="=" value="" size="12"/>
    <flex:searchText name="FORMNAME" searchName="WF_PROCESS_FILES.FORMNAME" dataType="java.lang.String" operSymbol="=" value="<%=formname%>" size="12"/>
    <img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectForm()">
    </td>
    <td nowrap>部门：
    <flex:searchText name="ORGAN_ID" style="display:none;" searchName="WF_PROCESS_FILES.ORGAN_ID" dataType="java.lang.String" operSymbol="=" value="" size="12"/>
    <flex:searchText name="ORGAN_NAME" searchName="WF_PROCESS_FILES.ORGAN_NAME" dataType="java.lang.String" operSymbol="=" value="<%=organ_name%>" size="12"/>

    <img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectNewDeptIdTree()">
    </td>
    <td nowrap>作者：
<flex:searchText name="AUTHPR" searchName="WF_PROCESS_FILES.AUTHPR" dataType="java.lang.String" operSymbol="=" value="<%=authpr%>" size="12"/>
</td>
	<td><flex:searchImg name="chaxun" action="processquery.cmd?clear=true" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
                          <flex:checkboxCol caption="选择" width="50" property="processId"  name="primaryKey" sortName="process.id" canSort="false"></flex:checkboxCol>
                          <flex:flexCol caption='流程类型编号' width="100" property="typeId" sortName="process.typeid" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='所属部门ID' width="100" property="organId" sortName="process.organize" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='流程名称' width="250" property="name" sortName="process.name" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='表单ID' width="150" property="formid" sortName="process.formid" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='表单名称' width="250" property="formname" sortName="process.formname" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='流程类型' width="100" property="typeName" sortName="process.typename" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='所属部门' width="150" property="organName" sortName="WF_PROCESS_FILES.ORGAN_NAME" ></flex:flexCol>
                          <flex:flexCol caption='创建时间' width="120" property="createTime" sortName="process.create" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='是否载入' width="100" property="isUpload" sortName="process.isUpload" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='作者' width="100" property="author" sortName="process.author" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='版本号' width="100" property="versionid" sortName="process.versionid" canSort="false"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="processquery.cmd?clear=true">
</flex:pagePolit>
<input type="hidden" name="extReturlUrl" value="">
</html:form>
</body>
</html>
<script language="javascript">
function init(){
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
setTitleInTreeBar("工作流程－流程管理－流程定义列表");
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var process_ids=grid.getCellValue(i, 1);
		var process_names=grid.getCellValue(i, 4);
		var procType=grid.getCellValue(i,2);
		var organize=grid.getCellValue(i,3);
		var formid=grid.getCellValue(i,5);
		var formname=grid.getCellValue(i,6);
		var author=grid.getCellValue(i,11);
		grid.getCell(i, 4).innerHTML =getHref(getProcessHref(procType,organize,formid,formname,author), transMatrix(process_ids,process_names));
		var form_ids=grid.getCellValue(i, 5);
		var form_names=grid.getCellValue(i, 6);
		grid.getCell(i, 6).innerHTML = getHref('<%=MatrixHref.getUrl("WorkFlowForm")%>', transMatrix(form_ids,form_names));
		var type_ids=grid.getCellValue(i, 2);
		var type_names=grid.getCellValue(i, 7);
		grid.getCell(i, 7).innerHTML = getHref('<%=MatrixHref.getUrl("ProcessType")%>', transMatrix(type_ids,type_names));
								
	}
}
function getProcessHref(procType,organize,formid,formname,author){
	var url="process.cmd?method=forupdate&processtype="+procType+"&organize="+organize+"&formid="+formid
	+"&formname="+formname+"&author="+author+"&processid=";
	return url;
}
function selectForm(){
  var url ="jsp/help.jsp?url=workformmanagerhelpquery.cmd";
  url=url+"&processtype_search="+document.all("TYPE_ID").value;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("FORMID").value=win[0];
  document.all("FORMNAME").value=win[1];
  }
}
function selectNewDeptIdTree(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>&showOrganType=1,2";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  } else{
	  document.all("ORGAN_ID").value=win[2];
	  document.all("ORGAN_NAME").value=win[1];
  }
}


function forInsert(){
  document.all("extReturlUrl").value=window.location.href;
  document.forms[0].action ="process.cmd?method=forinsertpro";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  var row=grid.getCheckAll().split(",");
  var processtype=row[1];
  var organize=row[2];
  document.forms[0].action ="process.cmd?method=forupdatepro&processid="+grid.getCheckLine()+"&processtype="+processtype+"&organize="+organize;    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  var row=grid.getCheckAll().split(",");
  var processtype=row[1];
  document.forms[0].action ="process.cmd?method=detail&processid="+grid.getCheckLine();    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  
  var lines=grid.getCheckLineNo();
  var lineArray=lines.split(",");
  var processDefName=grid.getCellValue(lineArray[0],4);
  
  for(var i=1;i<lineArray.length;i++){
  	processDefName+=","+grid.getCellValue(lineArray[i],4);
  }
  
  
  document.forms[0].action ="process.cmd?method=delete&processDefName="+processDefName;  
  document.forms[0].submit();	
}
function forLoad(){
	var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要载入的流程!");
    return ;
  }
   document.forms[0].action ="process.cmd?method=load";  
  document.forms[0].submit();	 
  window.event.srcElement.disabled=true;
}
function sysreposible(){
	var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要同步的流程!");
    return ;
  }
   document.forms[0].action ="process.cmd?method=synReposible";  
  document.forms[0].submit();	 
  window.event.srcElement.disabled=true;
}
function sysdata(){
	var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要同步的流程!");
    return ;
  }
   document.forms[0].action ="process.cmd?method=syndata";  
  document.forms[0].submit();	 
  window.event.srcElement.disabled=true;
}
function selectProcessType(){
var url="jsp/help.jsp?url=processtypehelpquery.cmd";
var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:450px;status:no;scroll:no');
if(obj==null)return;
document.all("TYPE_ID").value=obj[0];
document.all("TYPE_NAME").value=obj[1];
}
function forReturn(){
  window.location.href ="processtypequery.cmd?clear=true";
  
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
//流程导出
function forexport(){
	if(!getSelect()) return;
	var row=grid.getCheckAll().split(",");
	var url="processExchange.cmd?method=forexport&processDefId="+row[0]+"&processDefName="+row[3]+"&formId="+row[4]+"&formname="+row[5]+"&organ="+row[7]+"&proctype="+row[1];
	document.forms[0].action =url;    
	document.forms[0].submit();
}
//流程导入
function forimport(){
	var url="processExchange.cmd?method=forimport";
	document.forms[0].action =url;    
	document.forms[0].submit();
}
</script>