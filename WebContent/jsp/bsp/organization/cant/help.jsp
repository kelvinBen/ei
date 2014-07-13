<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="java.util.Map"%>
<HTML>
<HEAD><TITLE></TITLE>
</HEAD>
<body>


</body>
</HTML>

<iframe style="width:100%;height:expression(document.body.clientHeight);"  FRAMEBORDER=0 SCROLLING=yes  id="dataFrame"></IFRAME>

<script language="javascript">
function attFraEvent()
{	
        document.all("dataFrame").src="canthelp.cmd";
}
attFraEvent();
</script>