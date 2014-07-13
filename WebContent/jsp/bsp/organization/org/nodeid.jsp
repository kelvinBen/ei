<%@ page contentType="text/html;charset=GBK" %>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<%
	
	String nodeId = (String)request.getAttribute("nodeId");
	out.println("id = "+nodeId);
%>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

</BODY>
</HTML>
<script language="javascript">
 
 function forTreeNodeId(id){
	parent.getTreeFrame().openNode(id);
 }
 forTreeNodeId("<%=nodeId%>");
</script>