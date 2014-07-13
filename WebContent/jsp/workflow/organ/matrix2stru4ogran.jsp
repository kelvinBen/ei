<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="com.lc.dcwork.util.MatrixHref"%>
<%@ page import="net.mast.bsp.permit.context.*"%>
<%@ page import="net.mast.bsp.organization.domain.support.Stru"%>
<%@ page import="net.mast.bsp.organization.domain.support.StruObjectFactory"%>

<html>
<%
String id = request.getParameter("organId");
if(id != null && !id.trim().equals("")) {
	List struList = StruObjectFactory.getListByOrganId(id);
	if(struList != null && struList.size() > 0 ) {
        Stru stru = (Stru) struList.get(0);
        id = stru.getStruId();
    }
}
%>
<head>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
function init()
{
	window.location.replace("../../../<%=MatrixHref.getUrl("Stru")%><%=id%>&matrix=true");
}
</script>
</head>

<body onload="init();">
</body>

</html>