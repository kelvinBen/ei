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
<title>����ͨ�ð���</title>
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
     <flex:checkboxCol caption="ѡ��" width="50" property="ID"  name="primaryKey" sortName="adjunct.id"></flex:checkboxCol>
     <flex:flexCol caption='����' 	 width="150" property="TITLE" sortName="adjunct.title" canSort="false"></flex:flexCol>
     <flex:flexCol caption='�û�' 	 width="80" property="USERNAME" sortName="adjunct.userName" canSort="false"></flex:flexCol>
     <flex:flexCol caption='����ʱ��' width="150" property="SUBTIME" sortName="adjunct.subTime" canSort="false"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="adjuncthelpquery.cmd" >
</flex:pagePolit>

<div align=center>
<table width=170>
<tr>
	<td>
	<html:button name="btnClose"  value="ȷ��" onclick="doConfirm()"></html:button>&nbsp;&nbsp;
	<html:button name="btnClose"  value="�ر�" onclick="doClose()"></html:button>&nbsp;&nbsp;
	<html:button name="btnCancel" value="���" onclick="doCancel()"></html:button></td>
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
//����ֵ������Id,������,�û�,����ʱ��
function doConfirm(){
	if(!getSelect()) return;
	 var dataId = document.all('dataId').value;//�����
	 var returnV=new Array();
	 var allLines=grid.getCheckAll();//��ȡ���б�ѡ����
	 var result=new Array();
	 
	 var rows=allLines.split('|');
	 if(typeof(rows.length)=="undefined")
	 {
	 	var cells=rows.split(",");
	 	returnV["primary-value"]=cells[0];//�������
		returnV["display-str"]=cells[2];//����
		returnV["display-url"]='<%=MatrixHref.getUrl("Adjunct")%>'+ dataId + '&primaryKey=' +returnV["primary-value"]+"&matrix=true";//�����ӵ�ַ
		result[0]=returnV;
    	return result;
	 }
	 for(var i=0;i<rows.length;i++)
	 {
    	var cells=rows[i].split(",");
		var rv=new Array();
		rv["primary-value"]=cells[0];//�������
		rv["display-str"]=cells[1];//����
		rv["display-url"]='<%=MatrixHref.getUrl("Adjunct")%>'+ dataId + '&primaryKey=' +rv["primary-value"]+"&matrix=true";//�����ӵ�ַ
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
	alert("��ѡ��Ҫ��ӵĸ�����");
	return false;
	}return true;
}
</script>
