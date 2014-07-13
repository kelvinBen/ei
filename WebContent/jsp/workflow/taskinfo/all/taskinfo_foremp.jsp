<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<html>

<head>
<title></title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript">
	function myLoad(){
		
		
			setTitleInTreeBar("工作流程－任务管理－任务列表");
	}
	function dolistedocsOfType_daiban(){
		window.location.href="taskinfoquery.cmd?processType="+seltree_daiban.getValue("NodeId")+"&readMark=0&organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}
	function dolistedocsOfProcess_daiban(processType){
		window.location.href="taskinfoquery.cmd?procDefId="+seltree_daiban.getValue("NodeId")+"&processType="+processType+"&readMark=0&organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}
	function listalledocs_daiban(){
		window.location.href="taskinfoquery.cmd?readMark=0&organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}
	function dolistedocsOfType_zaiban(){
		window.location.href="taskinfoquery.cmd?processType="+seltree_zaiban.getValue("NodeId")+"&readMark=1&organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}
	function dolistedocsOfProcess_zaiban(processType){
		window.location.href="taskinfoquery.cmd?procDefId="+seltree_zaiban.getValue("NodeId")+"&processType="+processType+"&readMark=1&organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}
	function listalledocs_zaiban(){
		window.location.href="taskinfoquery.cmd?readMark=1&organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}


	function dolistedocsOfType_yiban(){
		window.location.href="oldtaskinfoquery.cmd?processType="+seltree_yiban.getValue("NodeId")+"&organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}
	function dolistedocsOfProcess_yiban(processType){
		window.location.href="oldtaskinfoquery.cmd?procDefId="+seltree_yiban.getValue("NodeId")+"&processType="+processType+"&organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}
	function listalledocs_yiban(){
		window.location.href="oldtaskinfoquery.cmd?organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}
	
	function dolistedocsOfType_finish(){
		window.location.href="finishtaskinfoquery.cmd?processType="+seltree_finish.getValue("NodeId")+"&organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}
	function dolistedocsOfProcess_finish(processType){
		window.location.href="finishtaskinfoquery.cmd?procDefId="+seltree_finish.getValue("NodeId")+"&processType="+processType+"&organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}
	function listalledocs_finish(){
		window.location.href="finishtaskinfoquery.cmd?organId="+document.all("organId").value+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value+"&isShowReturnBtn="+document.all("isShowReturnBtn").value;
	}	
	function listalledocs_search(){
		var startTime=document.all("startTime").value;
		var endTime=document.all("endTime").value;
		if(startTime!="" && endTime!=""){
			if(startTime>endTime){
				alert("结束日期不能小于开始日期！");
				return;
			}
		}
		var url="taskinfoforemp.cmd?method=getTaskInfoForEmp&organId="+document.all("organId").value;
		document.forms[0].action =url;
  		document.forms[0].submit();
	}
	function forReturn(){
		var isShowReturnBtn=document.all("isShowReturnBtn").value;
		if(isShowReturnBtn=="0")
			window.location.href="hrPerson.cmd?method=detail&frommenu=true";
		else
			window.location.href="hrqueryunderling.cmd";	
	}
</script>
</head>
<%
String organId=(String)request.getAttribute("ORGAN_ID");
String startTime=request.getParameter("startTime");
String endTime=request.getParameter("endTime");
if(startTime==null)startTime="";
if(endTime==null)endTime="";
String isShowReturnBtn=request.getParameter("isShowReturnBtn");
if(isShowReturnBtn==null || isShowReturnBtn.trim().equals(""))isShowReturnBtn="1";
%>
<BODY  topmargin="0" leftmargin="0" onLoad="myLoad()" style="padding:0px;" marginheight="0" marginwidth="0"  text="#000000" >
<html:form name="frmList" action="">

<div class="btnareaCss">
<html:button onclick="forReturn()" name="btnReturn_search" value="返回"></html:button>
</div>

<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table  id="tblSearch">
<tr><td nowrap>
<input type="hidden" name="organId" value="<%=organId%>">
<input type="hidden" name="isShowReturnBtn" value="<%=isShowReturnBtn%>">
开始日期：<date:date name="startTime" value="<%=startTime%>" zindex="20" divname="startTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
<td nowrap>结束日期：<date:date name="endTime" zindex="19" value="<%=endTime%>" divname="endTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden">
<html:button onclick="listalledocs_search()" name="btnListAll_search" value="重新搜索"></html:button>
</td>

</tr>
</table>
</fieldset>
 </div>
<table border=0 width=100%>

<tr>
<td valign="top">
	<div><fieldset class="FieldsetCss"><legend><a href="javascript:listalledocs_daiban()">共有<%=request.getAttribute("TOTAL_NUMBER_DAIBAN")%>个待办任务</a></legend>
	<table width="100%" height="100%">
	    <tr>
	      <td width="65%">
			<tree:selTree treeName="seltree_daiban" containId="SrcDiv_daiban" isShowElseBranch="true" hasRoot="false" type="radio" style="width:300;height:100%;overflow:no;white-space:nowrap;" isDataAsync="false">
		  		<tree:selNode title="title" nodeId="typeId" collection="tree_daiban" nodeValue="$'TYPE'" nodeXmlSrc=""/>
	        </tree:selTree>
	      </td>
	   </tr>
	</table>
	</fieldset>
	 </div>
</td>
<td valign="top">
	<div><fieldset class="FieldsetCss"><legend><a href="javascript:listalledocs_zaiban()">共有<%=request.getAttribute("TOTAL_NUMBER_ZAIBAN")%>个在办任务</a></legend>
	<table width="100%" height="100%">
	    <tr>
	      <td width="65%">
			<tree:selTree treeName="seltree_zaiban" containId="SrcDiv_zaiban" isShowElseBranch="true" hasRoot="false" type="radio" style="width:300;height:100%;overflow:no;white-space:nowrap;" isDataAsync="false">
		  		<tree:selNode title="title" nodeId="typeId" collection="tree_zaiban" nodeValue="$'TYPE'" nodeXmlSrc=""/>
	        </tree:selTree>
	      </td>
	   </tr>
	</table>
	</fieldset>
	 </div>
</td>

</tr>
<tr>
<td valign="top">
	<div><fieldset class="FieldsetCss"><legend><a href="javascript:listalledocs_yiban()">共有<%=request.getAttribute("TOTAL_NUMBER_YIBAN")%>个已办任务</a></legend>
	<table width="100%" height="100%">
	    <tr>
	      <td width="65%">
			<tree:selTree treeName="seltree_yiban" containId="SrcDiv_yiban" isShowElseBranch="true" hasRoot="false" type="radio" style="width:300;height:100%;overflow:no;white-space:nowrap;" isDataAsync="false">
		  		<tree:selNode title="title" nodeId="typeId" collection="tree_yiban" nodeValue="$'TYPE'" nodeXmlSrc=""/>
	        </tree:selTree>
	      </td>
	   </tr>
	</table>
	</fieldset>
	 </div>
</td>
<td valign="top">
	<div><fieldset class="FieldsetCss"><legend><a href="javascript:listalledocs_finish()">共有<%=request.getAttribute("TOTAL_NUMBER_FINISH")%>个结束任务</a></legend>
	<table width="100%" height="100%">
	    <tr>
	      <td width="65%">
			<tree:selTree treeName="seltree_finish" containId="SrcDiv_finish" isShowElseBranch="true" hasRoot="false" type="radio" style="width:300;height:100%;overflow:no;white-space:nowrap;" isDataAsync="false">
		  		<tree:selNode title="title" nodeId="typeId" collection="tree_finish" nodeValue="$'TYPE'" nodeXmlSrc=""/>
	        </tree:selTree>
	      </td>
	   </tr>
	</table>
	</fieldset>
	 </div>
</td>
</tr>
</table>
</html:form>
</body>

</html>

<script lanuage="javascript">

	//点击"+"/"-"
	seltree_daiban.clickImg=function(node){
		seltree_daiban.xmlsrc="taskinfoforemp.cmd?method=getProcessList_daiban&organId="+document.all("organId").value+"&TYPE_ID="+node.NodeId+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value;;
		
	}
	seltree_zaiban.clickImg=function(node){
		seltree_zaiban.xmlsrc="taskinfoforemp.cmd?method=getProcessList_zaiban&organId="+document.all("organId").value+"&TYPE_ID="+node.NodeId+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value;;
	}
	seltree_yiban.clickImg=function(node){
		seltree_yiban.xmlsrc="taskinfoforemp.cmd?method=getProcessList_yiban&organId="+document.all("organId").value+"&TYPE_ID="+node.NodeId+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value;;
		
	}
	seltree_finish.clickImg=function(node){
		seltree_finish.xmlsrc="taskinfoforemp.cmd?method=getProcessList_finish&organId="+document.all("organId").value+"&TYPE_ID="+node.NodeId+"&startTime="+document.all("startTime").value+"&endTime="+document.all("endTime").value;;
		
	}		
</script>
