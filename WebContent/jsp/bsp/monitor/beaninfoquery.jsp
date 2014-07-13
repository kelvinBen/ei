<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<script language="javascript" src="<%=SkinUtils.getJS(request,"flexgrid.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"calendar.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"mastfunction.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"css-xp4.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"date.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"flexgird.css")%>">
<BODY topmargin="10px">
<widgets:supportcontainer>
<widgets:container title="CMD日志分析" >

<%
String beanIdSearch = request.getParameter("beanIdSearch");
if (beanIdSearch==null){
    beanIdSearch="";
}
String methodSearch = request.getParameter("methodSearch");
if (methodSearch==null){
    methodSearch="";
}
String beanClassSearch = request.getParameter("beanClassSearch");
if (beanClassSearch==null){
    beanClassSearch="";
}

String startTimeSearch = request.getParameter("startTimeSearch");
if (startTimeSearch==null){
    startTimeSearch="" ;
}
String endTimeSearch = request.getParameter("endTimeSearch");
if (endTimeSearch==null){
    endTimeSearch="";
}

//String actionUrl=SkinUtils.getRootUrl(request)+"cmdLogquery.cmd?method=queryCmdBeanInfo";
%>
<html:form action="cmdBeanQueryCmd.cmd">
<table>
<flex:search>
	<tr>
	  <td nowrap> CMD 名称：<flex:searchText name="beanIdSearch" searchName="PUB_CMD_LOG.BEAN_ID" dataType="java.lang.String" operSymbol="=" value="<%=beanIdSearch%>" >
		</flex:searchText></td>
	  <td nowrap>&nbsp;&nbsp;&nbsp;&nbsp;方法名称：<flex:searchText name="methodSearch" searchName="PUB_CMD_LOG.METHOD" dataType="java.lang.String" operSymbol="=" value="<%=methodSearch%>">
		</flex:searchText></td>
		<td nowrap>&nbsp;&nbsp;&nbsp;&nbsp;类名：<flex:searchText name="beanClassSearch" searchName="PUB_CMD_LOG.METHOD" dataType="java.lang.String" operSymbol="=" value="<%=beanClassSearch%>">
		</flex:searchText></td>
	</tr>
	<tr>
	  <td nowrap>开始时间：<flex:searchDate name="startTimeSearch" searchName="PUB_CMD_LOG.STARTTIME" dataType="java.lang.String"  sourceFormat="yyyy-MM-dd hh:mm:ss"  targetFormat="yyyy-MM-dd hh:mm:ss"  divname="dateDiv1" hastime="true" operSymbol="=" value="<%=startTimeSearch%>" >
	   </flex:searchDate></td>
      <td nowrap>&nbsp;&nbsp;&nbsp;&nbsp;结束时间：<flex:searchDate name="endTimeSearch" searchName="PUB_CMD_LOG.ENDTIME" dataType="java.lang.String" sourceFormat="yyyy-MM-dd hh:mm:ss"  targetFormat="yyyy-MM-dd hh:mm:ss"  divname="dateDiv2" hastime="true" operSymbol="=" value="<%=endTimeSearch%>">
	   </flex:searchDate></td>
	  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<flex:searchImg name="chaxun" action="cmdBeanQueryCmd.cmd" image="search.gif" imgClick="if(!check()) return false"/></td>
	</tr>
	
</flex:search>
</table>

<flex:flexgrid name="grid" height="340" isSubmit="true" export="false">

<flex:flexCol caption="cmd名称" width="100" property="beanId" sortName="PUB_CMD_LOG.BEAN_ID"></flex:flexCol>
<flex:flexCol caption="方法" width="80" property="method" sortName="PUB_CMD_LOG.METHOD"  ></flex:flexCol>
<flex:flexCol caption="类名" width="100" property="beanClass" sortName="PUB_CMD_LOG.BEAN_CLASS"  ></flex:flexCol>
<flex:flexCol caption="总运行时间" width="100" property="totalTime" sortName="PUB_CMD_LOG.STARTTIME"></flex:flexCol>
<flex:flexCol caption="平均运行时间" width="100" property="avgTime" sortName="PUB_CMD_LOG.STARTTIME"></flex:flexCol>
<flex:flexCol caption="最短运行时间" width="100" property="minTime" sortName="PUB_CMD_LOG.STARTTIME"></flex:flexCol>
<flex:flexCol caption="最长运行时间" width="100" property="maxTime" sortName="PUB_CMD_LOG.STARTTIME"></flex:flexCol>
<flex:flexCol caption="总共运行次数" width="80" property="excuteTimes" sortName="PUB_CMD_LOG.BEAN_ID"></flex:flexCol>
<flex:flexCol caption="平均数据库连接次数" width="100" property="avgConnNumber" sortName="PUB_CMD_LOG.BEAN_ID"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="cmdBeanQueryCmd.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</widgets:container>
</widgets:supportcontainer>
<script language="javascript">
function check(){
  var beginTime = document.all("startTimeSearch").value;
  var endTime = document.all("endTimeSearch").value;
  if(trim(beginTime)==""&&trim(endTime)!=""){
     alert("开始时间和结束时间不能只有一个为空！");
     return false;
  }
  if(trim(endTime)==""&&trim(beginTime)!=""){
     alert("开始时间和结束时间不能只有一个为空！");
     return false;
  }
  if (beginTime!=""){
  if(!checkTimeFormat("yyyy-MM-dd hh:mm:ss",beginTime)){
  	alert("开始时间格式应该是'yyyy-MM-dd hh:mm:ss'的形式！");
  	document.all("starttimeSearch").select();
    document.all("starttimeSearch").focus();
    return false;
  }
 }
 if(endTime!=""){
  if(!checkTimeFormat("yyyy-MM-dd hh:mm:ss",endTime)){
  	alert("结束时间格式应该是'yyyyMMdd hh:mm'的形式！");
  	document.all("endtimeSearch").select();
    document.all("endtimeSearch").focus();
    return false;
  }
 }
 if(endTime<beginTime){
     alert("开始时间不能大于结束时间！");
     return false;
  }
 return true;
}
grid.show();
grid.setSumText("");

</script>
</BODY>
</HTML>