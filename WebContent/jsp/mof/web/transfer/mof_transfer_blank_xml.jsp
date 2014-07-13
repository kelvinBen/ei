<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script>
alert("窗口定制成功！"); 
function init(){    var refreshId ="<%out.print(request.getParameter("mofWindowId"));%>@W";    if (refreshId){        if(getTreeFrame().seltree)            getTreeFrame().seltree.refreshNodeById(refreshId);     } } init();
	 	
 	location.href='mofXml.cmd?method=design&mofWindowId=<%out.print(request.getParameter("mofWindowId"));%>';
</script>