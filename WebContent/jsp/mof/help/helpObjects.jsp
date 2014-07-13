<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="java.util.List"%>
<HTML>
<HEAD><TITLE>通用帮助返回对象</TITLE>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>
<body  topmargin="0" leftmargin="0" onload="returnHelpObjs()" >

</body>

<script language = "javascript">
	function returnHelpObjs(){
		var objects  = new Array();
<% List list = (List)request.getAttribute("help_objects");
 for( int i = 0 ; i < list.size(); i ++ ){
 	List record = (List)list.get(i);%>
		objects[<%=i%>] = new Array();
	<%for(int j = 0; j < record.size();j++){%>
		objects[<%=i%>][<%=j%>]=trim("<%=record.get(j)%>");
	<%}%>
<%}%>
		window.returnValue = objects;
		window.close();
	}
</script>
</HTML>