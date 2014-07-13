<%@ page import="net.mast.waf.ResourcesFactory"%>
<%
	String categoryId = "" + request.getAttribute( "categoryId" );
	if( categoryId == null )
		categoryId = "0";//默认为根节点
%>
<%@ include file="/jsp/content.jsp"%>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
init();
function init()
{
//刷新根节点,根节点生成时默认nodeId=0
top.contents.new_date.refreshTreeNodeById('<%=categoryId%>');
}

</script>