<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>�����û�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css_xp4.css'/>">
</HEAD>
<BODY topmargin="10px">
<bsp:container title="�����û�" >
	<%out.print(request.getAttribute("result"));%>
</bsp:container>
</body>
</html>
