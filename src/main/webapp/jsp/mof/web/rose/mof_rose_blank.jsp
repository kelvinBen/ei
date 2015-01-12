<%@ page contentType="text/html;charset=gb2312"%>
<script>
	alert("窗口定制成功！"); 
 	location.href='mofXml.cmd?method=design&mofWindowId=<%out.print(request.getParameter("mofWindowId"));%>';
</script>