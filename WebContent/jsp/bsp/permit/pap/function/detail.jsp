<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<HTML>
<HEAD>
<TITLE>������ϸ</TITLE>
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='editgrid.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript"
	src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript"
	src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<%
String refreshId = (String) request.getAttribute("refreshId");
%>


</HEAD>
<BODY topmargin="5px">
<bsp:container title="������ϸ">
	<html:form name="frmList" action="">
		<html:messages></html:messages>
				<table width="100%" cellpadding="0" class="tblContent">
					<html:hidden name="moduleId" property="moduleId" />

					<tr>
						<td class="tdTitle">����ϵͳ���룺</td>
						<td class="tdRight"><html:hidden name="functionId"
							property="functionId" write="true" /></td>
					</tr>

					<tr>
						<td class="tdRight">&nbsp</td>
					</tr>

					<tr>
						<td class="tdTitle">���ܱ�ţ�</td>
						<td class="tdRight"><html:hidden name="functionCode"
							property="functionCode" write="true" /></td>
					</tr>

					<tr>
						<td class="tdRight">&nbsp</td>
					</tr>

					<tr>
						<td class="tdTitle">�������ƣ�</td>
						<td class="tdRight"><html:hidden name="functionName"
							property="functionName" write="true" /></td>
					</tr>
					
					<tr>
						<td class="tdRight">&nbsp</td>
					</tr>


					<tr>
						<td class="tdRight">&nbsp</td>
					</tr>

					<tr>
						<td class="tdTitle">�Ƿ�ϵͳ���ܣ�</td>
						<td class="tdRight"><html:checkbox name="isSys"
							property="isSys" value="1" /></td>
					</tr>
				</table>
	</html:form>
</bsp:container>
</body>
</html>
<script language="javascript">

function init(){
  var refreshId = "<%=refreshId%>"; 
  getTreeFrame().seltree.refreshNodeById(refreshId);
}
init();

</script>
