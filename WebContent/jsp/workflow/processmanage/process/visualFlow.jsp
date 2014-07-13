<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<HTML>
<HEAD>
<TITLE>Á÷×ª×´Ì¬</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>

<%
	String processId = request.getParameter("processId");
	String curFormId = request.getParameter("curFormId");
	String curFlowId=request.getParameter("curFlowId");
	String author = "huangdos";
	String url =Global.getString("skin.ca.rootUrl");
	if(url==null || url.trim().equals("")){
		url=ClientUtils.getRootUrl(request);
	}else{
		url+=request.getContextPath()+"/";
	}
%>

<BODY topmargin="10px">
			<%
			String cbpath=url+"jsp/workflow/processmanage/appletjar/mast/";
			%>

<OBJECT classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" name="myApplet" width="100%" height="100%" align="middle" codebase="http://java.sun.com/update/1.5.0/jinstall-1_5-windows-i586.cab#Version=5,0,0,5">
				<PARAM name="java_code" value="com.ntmast.tools.visualflow.FDView.class">
				<PARAM name="java_archive" value="workflow_show.jar">
				<PARAM NAME="cache_archive" VALUE="workflow_show.jar,workflow_engine.jar,workflow-util.jar,xsdbean.jar">
				<PARAM name="type" value="application/x-java-applet;">
				<PARAM name="java_codebase" value="<%=cbpath%>">
				<PARAM name="rColor" value="169">
				<PARAM name="gColor" value="205">
				<PARAM name="bColor" value="233">
				<PARAM name="fonttype" value="Alias">
				<PARAM name="fontsize" value="12">
				<PARAM name="initAuthor" value="<%=author%>">
				<PARAM name="processconfighandle" value="urlconfig.cmd?method=urlGetXPDL">
				<PARAM name="visualflowhandle" value="urlconfig.cmd?method=urlGetVisualFlow">
				<PARAM name="handle" value="Show">
				<PARAM name="transferurl" value="<%=url%>">
				<PARAM name="xpdlid" value="<%=processId%>">
				<PARAM name="curFormId" value="<%=curFormId%>">
				<PARAM name="curFlowId" value="<%=curFlowId%>">
				<COMMENT>
				<EMBED type="application/x-java-applet;" name="myApplet" width="100%" height="100%" align="middle" pluginspage="http://java.sun.com/products/plugin/" java_code="com.ntmast.tools.visualflow.FDView.class" java_archive="workflow_show.jar,workflow_engine.jar,workflow-util.jar,xsdbean.jar" java_codebase="<%=cbpath%>" rColor="169" gColor="205" bColor="233" fonttype="Alias" fontsize="12" initAuthor="<%=author%>" processconfighandle="urlconfig.cmd?method=urlGetXPDL" visualflowhandle="urlconfig.cmd?method=urlGetVisualFlow" handle="Show" transferurl="<%=url%>" xpdlid="<%=processId%>" curFormId="<%=curFormId%>"/>
				<NOEMBED>
											<p>Unable to load applet</p>
				</NOEMBED>
				</COMMENT>
			</OBJECT>	
			
<div align="center">
  <table width="100%" cellpadding="0">
		<tr>
			<td colspan="4">
			</td>
		</tr>
  </table>
</div>
</BODY>
</HTML>