<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<script language="javascript" src="<%=SkinUtils.getJS(request,"flexgrid.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"calendar.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"css-xp4.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<BODY topmargin="10px">
<html:form action="servicetaskinfoquery.cmd">
<table id="tblSearch">
<%
String description=request.getParameter("description");
if(description==null){
	description="";
}
String service=request.getParameter("service");
if(service==null){
	service="";
}
String method=request.getParameter("method");
if(method==null){
	method="";
}
String status=request.getParameter("status");
if(status==null){
	status="";
}
String registerTime0=request.getParameter("registerTime0");
if(registerTime0==null){
	registerTime0="";
}
String registerTime1=request.getParameter("registerTime1");
if(registerTime1==null){
	registerTime1="";
}

%>
<tr>
				<td class="TdLeft" style='width:10%'>描述：</td>
				<td class="tdRight" style='width:35%'><input type="text" name="description" value="<%=description%>" /></td>
				<td class="TdLeft" style='width:10%'>状态：</td>
				<td class="tdRight" style='width:35%'>     
						<html:select name="status"  value="<%=status%>" size="1">
							<html:option value="">请选择</html:option>
        					<html:option value="0">未开始</html:option>
        					<html:option value="1">进行中</html:option>
        					<html:option value="2">成 功</html:option>
        					<html:option value="3">失 败</html:option>
     					</html:select>
     </td>				
			
			</tr>
			
			
			<tr>
				<td class="TdLeft" style='width:10%'>服务：</td>
				<td class="tdRight" style='width:35%'><input type="text" name="service" value="<%=service%>"/></td>
				
				<td class="TdLeft" style='width:10%'>方法：</td>
				<td class="tdRight" style='width:35%'><input type="text" name="method" value="<%=method%>"/></td>
				
			</tr>
			<tr>
				<td class="TdLeft" style='width:10%'>注册时间：</td>
				<td class="tdRight" style='width:35%'>自:<date:date name="registerTime0" hastime="true" value="<%=registerTime0%>" divname="registerTime0Div"  readonly="true" sourceFormat="yyyyMMdd HH:mm" targetFormat="yyyyMMdd HH:mm" zindex="7" size="18"></date:date>    				
				到:<date:date name="registerTime1" hastime="true" value="<%=registerTime1%>" divname="registerTime1Div" readonly="true" sourceFormat="yyyyMMdd HH:mm"  targetFormat="yyyyMMdd HH:mm" zindex="6" size="18"></date:date></td>
				<td class="TdLeft" style='width:10%'><flex:searchImg name="chaxun" action="servicetaskinfoquery.cmd" image="search.gif" imgClick="if(!checkdate())  return false"/></td>
				<td class="tdRight" style='width:35%'></td>
			</tr>
</table>
<flex:flexgrid name="grid" height="250" isSubmit="true">
        <flex:checkboxCol caption="选择" width="50" name="primaryKey" property="id" sortName="service_task_info.id"></flex:checkboxCol>
        <flex:flexCol caption="描述" width="220" property="description" sortName="service_task_info.description"></flex:flexCol>
		<flex:flexCol caption="服务名称" width="100" property="service" sortName="service_task_info.service"></flex:flexCol>
		<flex:flexCol caption="方法" width="120" property="method" sortName="service_task_info.method"></flex:flexCol>
		<flex:flexCol caption="状态" width="100" property="statusDescription" sortName="service_task_info.status"></flex:flexCol>
		<flex:flexCol caption="注册时间" width="120" property="registerTime" sortName="service_task_info.register_time"></flex:flexCol>
	<%--
		<flex:flexCol caption="开始执行时间" width="120" property="startTime" sortName="service_task_info.start_time"></flex:flexCol>
		<flex:flexCol caption="结束执行时间" width="120" property="endTime" sortName="service_task_info.end_time"></flex:flexCol>
	--%>
</flex:flexgrid>
<flex:pagePolit action="servicetaskinfoquery.cmd" pageSize="10">
</flex:pagePolit>
</html:form>

<script language="javascript">
grid.show();
</script>
</BODY>
</HTML>