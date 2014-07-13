<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
    String targetFormat = request.getParameter("targetformat");
	if(targetFormat == null) targetFormat = "";
%>

<script language="javascript" src="<mast:ui js='calendarPage.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<html>
<head>
<title>日期选择</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body>
<!--<button onclick="alert(tt.getDate('-'))">getDate</button>-->
<div id='eee'></div>
</body>
<script language="javascript">
var tt=new CalendarPage("tt");
var targetFormat="<%=targetFormat%>";

function DoClick()
{
window.returnValue=tt.getDate('-');
window.close();
}

tt.init("eee",'','-');
if(targetFormat!="")tt.setTargetFormat(targetFormat);

</script>
