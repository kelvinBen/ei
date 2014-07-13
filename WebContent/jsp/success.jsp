<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html>
<%	
String alertmessage=(String)request.getAttribute("ALERTMESSAGE");
if(alertmessage==null){
	alertmessage="处理成功！";
}

String fowardurl=(String)request.getAttribute("fowardurl");
if(fowardurl==null){
	fowardurl="";
}

%>
<script type="text/javascript">
alert("<%=alertmessage%>");
window.location="<%=request.getContextPath()+fowardurl%>";
</script>
<body>

</body>
</html>

