<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<html>

<head>
<title>监控任务</title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">

<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<%
String pageTitle=(String)request.getAttribute("title");
String isEdoc=(String)request.getAttribute("isEdoc");
%>
<script language="javascript">
	function myLoad(){
		setTitleInTreeBar("<%=pageTitle%>");
	}
	function dolistedocsOfType(){
		window.location.href="mofrestaskinfoquery.cmd?processType="+seltree.getValue("NodeId")+"&isEdoc="+document.forms[0].isEdoc.value;
	}
	function dolistedocsOfProcess(processType){
		window.location.href="mofrestaskinfoquery.cmd?procDefId="+seltree.getValue("NodeId")+"&processType="+processType+"&isEdoc="+document.forms[0].isEdoc.value;;
	}
	function listalledocs(){
		window.location.href="mofrestaskinfoquery.cmd?isEdoc="+document.forms[0].isEdoc.value;
	}
</script>
</head>

<BODY  topmargin="0" leftmargin="0" onLoad="myLoad()" style="padding:0px;" marginheight="0" marginwidth="0"  text="#000000" >
 <form>
<div class="btnareaCss">
<html:button onclick="listalledocs()" name="btnListAll" value="所有监控任务"></html:button>
</div>
<input type="hidden" name="isEdoc" value="<%=isEdoc%>">
<div><fieldset class="FieldsetCss"><legend>共有<%=request.getAttribute("TOTAL_NUMBER")%>个监控任务</legend>
<table width="100%" height="100%">
    <tr>
      <td width="65%">
		<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" hasRoot="false" type="radio" style="width:300;height:100%;overflow:no;white-space:nowrap;" isDataAsync="false">
	  		<tree:selNode title="title" nodeId="typeId" collection="tree" nodeValue="$'TYPE'" nodeXmlSrc=""/>
        </tree:selTree>
      </td>
   </tr>
</table>
</fieldset>
 </div>

</form>
</body>

</html>

<script lanuage="javascript">

	//点击"+"/"-"
	seltree.clickImg=function(node){
		seltree.xmlsrc="moftaskinfomonitor.cmd?method=getProcessList&TYPE_ID="+node.NodeId;
	}
</script>
