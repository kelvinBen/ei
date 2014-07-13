<%@ page contentType="text/html;charset=gb2312" %>
<textarea id="windowPre" rows=30 cols=40><%out.print(request.getAttribute("windowPreXml"));%></textarea>
<script> 
	parent.setWindowPreXml(document.getElementById("windowPre").value);
</script>