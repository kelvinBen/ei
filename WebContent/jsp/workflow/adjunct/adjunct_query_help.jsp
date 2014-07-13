<%@ page language="java" contentType="text/html;charset=GBK"%>
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
<%
	String dataId = request.getParameter("dataId");
	if(dataId==null){
		dataId = (String)request.getAttribute("dataId");
	}
	String isEdit = request.getParameter("isEdit");
	if(isEdit == null){
		isEdit = (String)request.getAttribute("isEdit");
	}
%>
<html>
<head>
<title>附件通用帮助</title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">

</head>
<body topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<html:form name="frmList" action="adjuncthelpquery.cmd">
<input type="hidden" name="dataId" value="<%=dataId%>"/>
<input type="hidden" name="isEdit" value="<%=isEdit%>">
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
     <flex:checkboxCol caption="选择" width="50" property="ID"  name="primaryKey" sortName="adjunct.id"></flex:checkboxCol>
     <flex:flexCol caption='标题' 	 width="150" property="TITLE" sortName="adjunct.title" canSort="false"></flex:flexCol>
     <flex:flexCol caption='用户' 	 width="80" property="USERNAME" sortName="adjunct.userName" canSort="false"></flex:flexCol>
     <flex:flexCol caption='加入时间' width="150" property="SUBTIME" sortName="adjunct.subTime" canSort="false"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="adjuncthelpquery.cmd" >
</flex:pagePolit>

<div align=center>
<table width=170>
<tr>
	<td>
	<html:button name="btnClose"  value="确定" onclick="doConfirm()"></html:button>&nbsp;&nbsp;
	<html:button name="btnClose"  value="关闭" onclick="doClose()"></html:button>&nbsp;&nbsp;
	<html:button name="btnCancel" value="清除" onclick="doCancel()"></html:button></td>
</tr>
</table>
</div>
</html:form>
</body>
</html>
<script language="javascript">
function init(){
	grid.show();
}
//返回值附件号Id,附件名,用户,保存时间
function doConfirm(){
	if(!getSelect()) return;
	 var dataId = document.all('dataId').value;//表单编号
	 var returnV=new Array();
	 var allLines=grid.getCheckAll();//获取所有被选中行
	 var result=new Array();
	 
	 var rows=allLines.split('|');
	 if(typeof(rows.length)=="undefined")
	 {
	 	var cells=rows.split(",");
	 	returnV["primary-value"]=cells[0];//附件编号
		returnV["display-str"]=cells[2];//标题
		returnV["display-url"]='<%=MatrixHref.getUrl("Adjunct")%>'+ dataId + '&primaryKey=' +returnV["primary-value"]+"&matrix=true";//超链接地址
		result[0]=returnV;
    	return result;
	 }
	 for(var i=0;i<rows.length;i++)
	 {
    	var cells=rows[i].split(",");
		var rv=new Array();
		rv["primary-value"]=cells[0];//附件编号
		rv["display-str"]=cells[1];//标题
		rv["display-url"]='<%=MatrixHref.getUrl("Adjunct")%>'+ dataId + '&primaryKey=' +rv["primary-value"]+"&matrix=true";//超链接地址
		result[i]=rv;
	}
	parent.returnValue = result;
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
function doClose(){
	parent.close();
}
function getSelect(){
	if(grid.getCheckAll()==null||grid.getCheckAll()==""){
	alert("请选择要添加的附件！");
	return false;
	}return true;
}
</script>
