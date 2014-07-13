<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
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
<TITLE>流程模版查询</TITLE>
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

<BODY topmargin="10px" onload="setTitleInTreeBar('流程模版列表')">




<%
String processtype_search=request.getParameter("processtype_search");
if(processtype_search==null)processtype_search="";
%>
<html:form name="frmList" action="processtemplatequery.cmd">

<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>类型：
    <flex:searchSelect name="processtype_search" labeltitle="" size="1" searchName="process.processtype" dataType="java.lang.String" operSymbol="=" value="<%=processtype_search%>">
	<html:option value=""></html:option>
	<html:options collection="processtypelist" labelProperty="value" property="key"/>
	</flex:searchSelect>
	</td>
    
	<td><flex:searchImg name="chaxun" action="processtemplatequery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
<support:flexgrid name="grid" height="260" action="" isSubmit="true">
                          <flex:radioCol caption="选择" width="50" property="id"  name="primaryKey" sortName="process.id" canSort="false"></flex:radioCol>
                          <flex:flexCol caption='流程名称' width="150" property="name" sortName="process.name" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='表单ID' width="150" property="formid" sortName="process.formid" canSort="false" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='表单名称' width="150" property="formname" sortName="process.formname" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='流程类型ID' width="100" property="typeid" sortName="process.typeid" canSort="false" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='流程类型' width="100" property="typename" sortName="process.typename" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='组织ID' width="100" property="organize" sortName="process.organize" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='组织名称' width="100" property="organizeName" sortName="process.organizeName"  canSort="false"></flex:flexCol>
                          
                          
                          <flex:flexCol caption='创建时间' width="120" property="create" sortName="process.create" canSort="false"></flex:flexCol>
                          
                          <flex:flexCol caption='作者' width="100" property="author" sortName="process.author" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='版本号' width="100" property="versionid" sortName="process.versionid" canSort="false"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="processtemplatequery.cmd">
</flex:pagePolit>
<div align=center>
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton">确 定</button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton">关 闭</button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton">清 除</button></td></tr></table></div>
</html:form>

<script language="javascript">
grid.show();
grid.setSumText("");

function getSelect(){
if(grid.getCurrentLine()==null){
	alert("请选择一条记录！");
	return false;
}
  return true;
}
//返回值:流程id，流程名称,表单ID,表单名称,类型id,类型名称,组织id,组织名称
function doConfirm(){
	if(!getSelect()) return;
         var row=grid.getCurrentLine();
	 var result=new Array();
	 
	 result[0]=grid.getCellValue(row,1);
	 result[1]=grid.getCellValue(row,2);
	 result[2]=grid.getCellValue(row,3);
	 result[3]=grid.getCellValue(row,4);
	 result[4]=grid.getCellValue(row,5);
	 result[5]=grid.getCellValue(row,6);
	result[6]=grid.getCellValue(row,7);
	result[7]=grid.getCellValue(row,8);
	parent.returnValue = result;
	parent.close();
}
function doCancel(){
var result=new Array();
result[0]="";
result[1]="";
result[2]="";
result[3]="";
result[4]="";
result[5]="";	
result[6]="";
result[7]="";
	parent.returnValue=result;
	parent.close();
}
function doClose(){
	parent.close();
}
</script>