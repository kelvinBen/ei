<%@ page import="net.mast.waf.ResourcesFactory"%>
<%
	String categoryId = "" + request.getAttribute( "categoryId" );
	if( categoryId == null )
		categoryId = "0";//Ĭ��Ϊ���ڵ�
%>
<%@ include file="/jsp/content.jsp"%>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
init();
function init()
{
//ˢ�¸��ڵ�,���ڵ�����ʱĬ��nodeId=0
top.contents.new_date.refreshTreeNodeById('<%=categoryId%>');
}

</script>