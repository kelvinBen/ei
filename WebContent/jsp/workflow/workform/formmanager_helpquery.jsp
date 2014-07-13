<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<HTML>
<HEAD>
<TITLE>表单帮助</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<BODY topmargin="10px"  onload="init();setTitleInTreeBar('表单帮助')">


<%
String processtype_search=request.getParameter("processtype_search");
if(processtype_search==null)processtype_search="";
String processtypename_search=request.getParameter("processtypename_search");
if(processtypename_search==null)processtypename_search="";
String tmpTypeName=(String)request.getAttribute("processtypename_search");
if(tmpTypeName!=null)processtypename_search=tmpTypeName;
%>
<html:form name="frmList" action="workformmanagerhelpquery.cmd">
<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>类型：
    <input type="hidden" name="processtype_search" value="<%=processtype_search%>" size="10"><input type="text" name="processtypename_search" value="<%=processtypename_search%>" size="10" readonly="true"><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectProcessType()">
	</td>
    
	<td><flex:searchImg name="chaxun" action="workformmanagerhelpquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
  
<flex:flexgrid name="grid" height="260" action="" isSubmit="true">
                          <flex:radioCol caption="选择" width="50" property="form-id"  name="primaryKey" sortName="formmanager.formId" canSort="false"></flex:radioCol>
                          <flex:flexCol caption='表单名称' width="150" property="name" sortName="formmanager.name"  canSort="false"></flex:flexCol>
                          <flex:flexCol caption='表单标题' width="150" property="title" sortName="formmanager.title" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='所属部门ID' width="100" property="organize-id" sortName="formmanager.organId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='所属部门' width="100" property="organize-name" sortName="formmanager.organName" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='类型ID' width="100" property="typeid" sortName="formmanager.typeid" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='类型名称' width="100" property="typename" sortName="formmanager.typename" canSort="false"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="workformmanagerhelpquery.cmd" >
</flex:pagePolit>
<div align=center>
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton">确 定</button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton">关 闭</button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton">清 除</button></td></tr></table></div>
</html:form>
</body>
</html>
<script language="javascript">
function init(){
grid.show();
grid.setSumText("");
}

function getSelect(){
if(grid.getCurrentLine()==null){
	alert("请选择一条记录！");
	return false;
}
  return true;
}
//返回值:表单id，表单名称，表单标题，所属部门ID，所属部门名称，类型ID,类型名称
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
	parent.returnValue = result;
	parent.close();
}
function selectProcessType(){
var url="jsp/help.jsp?url=processtypehelpquery.cmd";
var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:450px;status:no;scroll:no');
if(obj==null)return;
document.all("processtype_search").value=obj[0];
document.all("processtypename_search").value=obj[1];
}
function doClose(){
	parent.close();
}
</script>