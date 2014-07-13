<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<script language="javascript" src="<%=SkinUtils.getJS(request,"flexgrid.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"calendar.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"mastfunction.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"bsp.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"css-xp4.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"date.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"flexgird.css")%>">
<BODY topmargin="10px">
<widgets:supportcontainer>
<widgets:container title="CMD日志查询" >

<%
String beanIdSearch = request.getParameter("beanIdSearch");
if (beanIdSearch==null){
    beanIdSearch="";
}
String methodSearch = request.getParameter("methodSearch");
if (methodSearch==null){
    methodSearch="";
}
String startTimeSearch = request.getParameter("startTimeSearch");
if (startTimeSearch==null){
    startTimeSearch="" ;
}
String endTimeSearch = request.getParameter("endTimeSearch");
if (endTimeSearch==null){
    endTimeSearch="";
}

String beanClassSearch = request.getParameter("beanClassSearch");
if (beanClassSearch==null){
    beanClassSearch="";
}

String connNumberSearch = request.getParameter("connNumberSearch");
if (connNumberSearch==null){
    connNumberSearch="";
}

//String actionUrl=SkinUtils.getRootUrl(request)+"cmdLogQuery.cmd?method=query";

%>

<html:form action="cmdLogQuery.cmd">
<widgets:containbutton onclick="forDetail()" text="明细"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="批量删除"></widgets:containbutton>

<table>
<flex:search>
	<tr>
	  <td width="80" nowrap>CMD 名称：
	  <td><flex:searchText name="beanIdSearch" searchName="PUB_CMD_LOG.BEAN_ID" dataType="java.lang.String" operSymbol="=" value="<%=beanIdSearch%>" >
		</flex:searchText></td>
	  <td width="110" align="right" nowrap>方法名称：
	  <td><flex:searchText name="methodSearch" searchName="PUB_CMD_LOG.METHOD" dataType="java.lang.String" operSymbol="=" value="<%=methodSearch%>">
		</flex:searchText></td>
	  <td width="60" align="right" nowrap>类名：
	  <td><flex:searchText name="beanClassSearch" searchName="PUB_CMD_LOG.BEAN_CLASS" dataType="java.lang.String" operSymbol="=" value="<%=beanClassSearch%>">
		</flex:searchText></td>
	<td width="180"><flex:searchImg name="chaxun" action="cmdLogQuery.cmd" image="search.gif" imgClick="if(!check()) return false"/></td>
	</tr>
	<tr>
	  <td width="80">开始时间：
	  <td nowrap><flex:searchDate name="startTimeSearch" searchName="PUB_CMD_LOG.STARTTIME" dataType="java.lang.String" sourceFormat="yyyy-MM-dd hh:mm:ss"  targetFormat="yyyy-MM-dd hh:mm:ss"  divname="dateDiv1" hastime="true" operSymbol="=" value="<%=startTimeSearch%>" >
	   </flex:searchDate></td>
      <td width="110" align="right">结束时间：
	  <td nowrap><flex:searchDate name="endTimeSearch" searchName="PUB_CMD_LOG.ENDTIME" dataType="java.lang.String"  sourceFormat="yyyy-MM-dd hh:mm:ss"  targetFormat="yyyy-MM-dd hh:mm:ss" divname="dateDiv2" hastime="true" operSymbol="=" value="<%=endTimeSearch%>">
	   </flex:searchDate></td>
<td width="60" align="right"> 大于</td>
<td ><flex:searchText name="connNumberSearch" searchName="PUB_CMD_LOG.Conn_Number" dataType="java.lang.String" operSymbol="=" value="<%=connNumberSearch%>">
		</flex:searchText></td>
		<td nowrap>数据库连接次数</td>


	</tr>
	
</flex:search>
</table>
<flex:flexgrid name="grid" height="350" isSubmit="true" export="false">
<flex:radioCol caption="选择" width="30" name="primaryKey" property="logId" sortName="PUB_CMD_LOG.BEAN_ID"></flex:radioCol>
<flex:flexCol caption="cmd名称" width="100" property="beanId" sortName="PUB_CMD_LOG.BEAN_ID" ></flex:flexCol>
<flex:flexCol caption="方法" width="80" property="method" sortName="PUB_CMD_LOG.METHOD"  ></flex:flexCol>
<flex:flexCol caption="操作业务含义" width="100" property="resourceAlias" sortName="PUB_CMD_LOG.BEAN_CLASS" ></flex:flexCol>
<flex:flexCol caption="类名" width="160" property="beanClass" sortName="PUB_CMD_LOG.BEAN_CLASS"></flex:flexCol>
<flex:flexCol caption="开始时间" width="125" property="startTime" sortName="PUB_CMD_LOG.STARTTIME"></flex:flexCol>
<flex:flexCol caption="结束时间" width="125" property="endTime" sortName="PUB_CMD_LOG.ENDTIME"></flex:flexCol>
<flex:flexCol caption="运行时间(毫秒)" width="60" property="runTime" sortName="PUB_CMD_LOG.STARTTIME-PUB_CMD_LOG.ENDTIME"></flex:flexCol>
<flex:flexCol caption="数据连接次数" width="60" property="connNumber" sortName="PUB_CMD_LOG.Conn_Number"></flex:flexCol>

<flex:flexCol caption="对应安全日志ID" width="100" property="securityLogId" sortName="PUB_CMD_LOG.SECURITY_LOG_ID" style="display:none" ></flex:flexCol>

</flex:flexgrid>
<flex:pagePolit action="cmdLogQuery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</widgets:container>
</widgets:supportcontainer>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="CmdLog.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");

function isNum(s){	
	var re=/^[0-9]+$/;	
	return re.test(s);
	};

function check(){	
  var connNumberSearch=document.forms[0].connNumberSearch;
  var beginTime = document.all("startTimeSearch").value;
  var endTime = document.all("endTimeSearch").value;
	connNumberSearch.value=trim(connNumberSearch.value);

  if(connNumberSearch.value!=""&&!isNum(connNumberSearch.value))
	{
	  alert("查询条件数据连接次数必须是0或者正整数！");
	  connNumberSearch.focus();
	  return false;
	}
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

function forDelete(){

	var startTime=document.all("startTimeSearch");
	var endTime=document.all("endTimeSearch");

	if(startTime.value==""){
	alert("开始时间不可以为空！");
	startTime.focus();
	return false;
	}
	if(endTime.value==""){
	alert("结束时间不可以为空！");
	endTime.focus();
	return false;
	}
    if (!confirm("您确认要删除从开始时间到结束时间之间的CMD日志记录吗?")) {
   	  return false;
   	 }  

  document.forms[0].action ="CmdLog.cmd?method=delete";    
  document.forms[0].submit();	

}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="CmdLog.cmd?method=detail";
  document.forms[0].submit();	
}

function getSelect(){
  var sel=grid.getCheckLine();
  key=sel;
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}

</script>
</BODY>
</HTML>