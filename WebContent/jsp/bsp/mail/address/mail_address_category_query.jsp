<%@ page import="net.mast.waf.ResourcesFactory"%>

<%@ include file="/jsp/content.jsp"%>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
init();
function init()
{
//刷新根节点,根节点生成时默认nodeId=0
top.contents.new_date.refreshTreeNodeById("0");
}

</script>