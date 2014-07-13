<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
	String dataId = (String)request.getAttribute("dataId");
%>
<HTML>
<HEAD>
<TITLE>¸½¼ş¹ÜÀí</TITLE>
</HEAD>
<iframe style="width:100%;height:expression(document.body.clientHeight);"  FRAMEBORDER=0 SCROLLING=no  src="<%=ClientUtils.getRootUrl(request)%>adjunctquery.cmd?dataId=<%=dataId%>"></IFRAME>
</HTML>
