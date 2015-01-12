<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.bsp.util.DateUtil"%>
<HTML>
<HEAD>
<TITLE>历史消息查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<% 
    String msg_type_code = request.getParameter("msg_type_codeSearch");
	if (msg_type_code==null){
	  msg_type_code="";
	}
    String subject = request.getParameter("subjectSearch");
	if (subject==null){
	  subject="";
	}
    String status = request.getParameter("statusSearch");
	if (status==null){
	  status="";
	}
	    String beginTime = request.getParameter("beginTime");
	if (beginTime==null){
	  String currentTime = DateUtil.GetToday()+" 00:00";
	  beginTime=currentTime.substring(0,14);
	}
    String endTime = request.getParameter("endTime");
	if (endTime==null){
	String currentTime = DateUtil.getCurrentDateTime();
	  endTime=currentTime.substring(0,14);
	}
%>
<bsp:container title="历史消息查询" >
<bsp:containbutton action="mpmessagehistory.cmd?method=forinsert" onclick="forInsert()" text="增加" style="display:none"></bsp:containbutton>
<bsp:containbutton action="mpmessagehistory.cmd?method=forupdate" onclick="forUpdate()" text="修改" style="display:none"></bsp:containbutton>
<bsp:containbutton action="mpmessagehistory.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="mpmessagehistory.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpmessagehistoryquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
	<td>
	<table>
	<tr>
	<td align="left" nowrap>消息类型：</td>
    <td><flex:searchSelect name="msg_type_codeSearch" searchName="MP_MESSAGE.MSG_TYPE_CODE" dataType="java.lang.String" operSymbol="=" value="<%=msg_type_code%>">
    	<html:option value="-1">全部</html:option>
		<html:options collection="mpMessageType" labelProperty="MSG_TYPE_NAME" property="MSG_TYPE_CODE"/>
	</flex:searchSelect></td>
	<td align="left" nowrap>消息标题：</td>
    <td><flex:searchText name="subjectSearch" searchName="MP_MESSAGE_HISTORY.SUBJECT" dataType="java.lang.String" operSymbol="=" value="<%=subject%>" size="12">
	</flex:searchText></td>
	
	<!--
    <td>消息状态：<flex:searchText name="statusSearch" searchName="MP_MESSAGE_HISTORY.STATUS" dataType="java.lang.String" operSymbol="=" value="<%=status%>" size="12">
	</flex:searchText></td>
	-->
	</tr>
	<tr>
	<td align="left" nowrap>开始时间：</td>
        <td><flex:searchDate name="beginTime"  divname="date1" searchName="PUB_SECURITY_LOG.LOG_TIME" dataType="java.lang.String" operSymbol="=" value="<%=beginTime%>" hastime="true" sourceFormat="yyyyMMdd HH:mm" targetFormat="yyyyMMdd HH:mm" readonly="false">
	</flex:searchDate></td>
	<td align="left" nowrap>结束时间：</td>
	<td nowrap><flex:searchDate name="endTime" divname="date2" searchName="PUB_SECURITY_LOG.LOG_TIME" dataType="java.lang.String" operSymbol="=" value="<%=endTime%>" hastime="true" sourceFormat="yyyyMMdd HH:mm" targetFormat="yyyyMMdd HH:mm" readonly="false">
	</flex:searchDate></td>
	</tr>
	</table>
	</td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;<flex:searchImg name="chaxun" action="mpmessagehistoryquery_page_init.cmd" image="search.gif" imgClick="if(!check()) return false"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
  				<flex:checkboxCol caption='选择' width="60" property="msgId" name="primaryKey" sortName="MP_MESSAGE_HISTORY.MSG_ID"></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.MSG_TYPE_CODE")%>' width="100" property="msgTypeCode"  type="enum" enumCollection="mpMessageType" enumKey="MSG_TYPE_CODE" enumValue="MSG_TYPE_NAME" sortName="MP_MESSAGE_HISTORY.MSG_TYPE_CODE"  style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.OBJECTID")%>' width="100" property="objectid" sortName="MP_MESSAGE_HISTORY.OBJECTID" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.SUBJECT")%>' width="150" property="subject" sortName="MP_MESSAGE_HISTORY.SUBJECT" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.SCHEDULE")%>' width="100" property="schedule" sortName="MP_MESSAGE_HISTORY.SCHEDULE" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.USEFUL_TIME")%>' width="100" property="usefulTime" sortName="MP_MESSAGE_HISTORY.USEFUL_TIME" style="display:none" ></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.CREATE_TIME")%>' width="120" property="createTime" sortName="MP_MESSAGE_HISTORY.CREATE_TIME" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.SEND_TIME")%>' width="120" property="sendTime" sortName="MP_MESSAGE_HISTORY.SEND_TIME" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.CREATER")%>' width="100" property="createrName" sortName="MP_MESSAGE_HISTORY.CREATER" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.RECEIVE_ADDRESS")%>' width="100" property="receiveAddress" sortName="MP_MESSAGE_HISTORY.RECEIVE_ADDRESS" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.RECEIVE_MANNER_CODE")%>' width="100" property="receiveMannerCode"  type="enum" enumCollection="mpInceptManner" enumKey="RECEIVE_MANNER_CODE" enumValue="RECEIVE_MANNER_NAME" sortName="MP_MESSAGE_HISTORY.RECEIVE_MANNER_CODE" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.STATUS")%>' width="100" property="status" sortName="MP_MESSAGE_HISTORY.STATUS" style="text-align:left"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mpmessagehistoryquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	var id = grid.getCellValue(grid.getCurrentLine(),1);
	location.href="mpmessagehistory.cmd?method=detail&primaryKey="+id;
}
grid.show();
function check(){
  var beginTime = document.all("beginTime").value;
  var endTime = document.all("endTime").value;
  if(beginTime!=""&&!checkTimeFormat("yyyyMMdd hh:mm",beginTime)){
  	alert("开始时间格式应该是'yyyyMMdd hh:mm'的形式！");
  	document.all("beginTime").select();
    document.all("beginTime").focus();
    return false;
  }
  if(endTime!=""&&!checkTimeFormat("yyyyMMdd hh:mm",endTime)){
  	alert("结束时间格式应该是'yyyyMMdd hh:mm'的形式！");
  	document.all("endTime").select();
    document.all("endTime").focus();
    return false;
  }
  if(endTime!=""&&beginTime!=""&&endTime<beginTime){
     alert("开始时间不能大于结束时间！");
     return false;
  }
  return true;
}
function forInsert(){
  document.forms[0].action ="mpmessagehistory.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mpmessagehistory.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mpmessagehistory.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpmessagehistory.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
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
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要删除的记录!");
    return false;
  }
  if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
</script>