<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>jsp表单访问请求列表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>

<html:form name="frmList" action="jspFormRequestsHelpQuery.cmd">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
</table>
</fieldset>
<flex:flexgrid name="grid" height="200" action="" isSubmit="true">
                <flex:radioCol caption="选择" width="100" property="id" name="primaryKey" sortName="jsp.id"></flex:radioCol>
				<flex:flexCol caption='请求ID' width="100" property="id" sortName="jsp.id"></flex:flexCol>
				<flex:flexCol caption='请求名称' width="100" property="name" sortName="jsp.name"></flex:flexCol>
</flex:flexgrid>
<div align=center>
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton">确 定</button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton">清 除</button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton">关 闭</button></td></tr></table></div>
</html:form>
<script language="javascript">
grid.show();
function getSelect(){
  var row=grid.getCheckAll();
if ((row==null) ||(row=="")){
	alert("请选择一条纪录！");
	return false;
}
  return true;
}

function doConfirm(){
	if(!getSelect()) return;
	var result = new Array();
    var allrow=grid.getCurrentLine();
    result[0]=grid.getCellValue(allrow,1);
    result[1]=grid.getCellValue(allrow,3);
    result[2]=grid.getCellValue(allrow,3);
  
    parent.returnValue = result;
    parent.close();

}
//取消返回空值函数
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
//关闭窗口函数
function doClose(){
	parent.close();
    return true;
}
</script>