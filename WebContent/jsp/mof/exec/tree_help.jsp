<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>

<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<%
	String window=(String)request.getAttribute("window_name");
	String selectNode=(String)request.getParameter("selectid");
	if(selectNode==null)
		selectNode="";
%>
<html>
<head>
<title>选择父节点</title>
</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>

<html:form name="form1" action="">
<table width="100%">
	<tr>
	<td class="tdTitle" width="100%"><b><center>请选择要调整到的父节点</center></b>
	</td>
	</tr>
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" hasRoot="false" type="radio" style="width:100%;height:340;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  		<tree:selNode title="text" nodeId="id" nodeValue="radioData" radioData="radioData" collection="tree" nodeXmlSrc="isLeaf" />
    </tree:selTree>
	</td>
    </tr>
</table>
    <div align=center><table width=150><tr><td><button name="btnClose" onclick="doConfirm()">确 定</button></td><td><button name="btnClose" onclick="doClose()">取 消</button></tr></table></div>
</html:form>
 <iframe style="display:none"  id="hidframe"></iframe>
</body>
</html>

<script lanuage="javascript">
	//点击"+"/"-"
	seltree.clickImg=function(node){
		//alert(node.NodeId);
		seltree.xmlsrc="moftree.cmd?method=getchild&isselect=true&window_name=<%=window%>&parentid="+node.NodeId+"&ishelp=true&selectid=<%=selectNode%>";
	}
	
	
function doConfirm(){
	var lines=seltree.GetAllCheckData();
	  if(lines==""){
	    alert("请选择记录!");
	    return false;
	  }
//	alert(lines);
	window.returnValue = lines;
	window.close();
}
function doClose(){
	window.close();
}
</script>