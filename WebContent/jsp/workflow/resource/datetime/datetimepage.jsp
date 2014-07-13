<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<script language="javascript" src="../js/calendarPage.js"></script>
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

function DoClick()
{
	tt.saveValue();
}
var topwin=window.dialogArguments;
var val=(topwin.document.all('<%=request.getParameter("val")%>'));
if(val!=null)
val=val.value;
else
val='';
tt.init("eee",val,'-',true);

</script>
