<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<html>

<head>
<title></title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">

<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<script language="javascript">
	function myLoad(){
		setTitleInTreeBar("�������̣����������������");
	}
	function dolistedocsOfType(){
		window.location.href="moffinishtaskinfoquery.cmd?processType="+seltree.getValue("NodeId");
	}
	function dolistedocsOfProcess(processType){
		window.location.href="moffinishtaskinfoquery.cmd?procDefId="+seltree.getValue("NodeId")+"&processType="+processType;
	}
	function listalledocs(){
		window.location.href="moffinishtaskinfoquery.cmd";
	}
</script>
</head>

<BODY  topmargin="0" leftmargin="0" onLoad="myLoad()" style="padding:0px;" marginheight="0" marginwidth="0"  text="#000000" >
 <form>
<div class="btnareaCss">
<html:button onclick="listalledocs()" name="btnListAll" value="���н�������"></html:button>
</div>
<div><fieldset class="FieldsetCss"><legend>����<%=request.getAttribute("TOTAL_NUMBER")%>���ѽ�������</legend>
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

	//���"+"/"-"
	seltree.clickImg=function(node){
		seltree.xmlsrc="moftaskinfofinish.cmd?method=getProcessList&TYPE_ID="+node.NodeId;
	}
</script>
