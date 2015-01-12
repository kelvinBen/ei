<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.bsp.util.DateUtil"%>
<HTML>
<HEAD>
<TITLE>用户在线历史记录查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
    String login_time =(String)request.getParameter("starttimeSearch");
    if (login_time==null){
	    String time1=DateUtil.getPreviousDay();
	    login_time=time1.substring(0,4)+time1.substring(4,6)+time1.substring(6,8)+" "+DateUtil.GetCurrentTime().substring(0,5);
    }
    
    String logoff_time =(String)request.getParameter("endtimeSearch");
    if (logoff_time==null){
        String time=DateUtil.getCurrentDateTime();
	    logoff_time=time.substring(0,4)+time.substring(4,6)+time.substring(6,14);
    }

    String userId = request.getParameter("user_idSearch");
	  if (userId==null){
	    userId="";
	  }
    String corporationId = request.getParameter("corporationId");
	  if (corporationId==null){
	    corporationId="";
	  }
    String corporationName = request.getParameter("corporationName");
	  if (corporationName==null){
	    corporationName="";
	  }
    String remoteaddrSearch = request.getParameter("remoteaddrSearch");
	  if (remoteaddrSearch==null){
	     remoteaddrSearch="";
	  }


%>
<bsp:container title="用户在线历史记录查询" >
<bsp:containbutton onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton onclick="forDeleteBetween()" text="批量删除" action="onlinehist.cmd?method=fordeletebetween"></bsp:containbutton>
<bsp:containbutton onclick="querySessionTerminal()" text="会话追踪" action="securityLog.cmd?method=querySessionTerminal"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="onlinehistquerying.cmd?clear=true">
<table id="tblSearch">
<flex:search>
	<tr>
	<td align="left" nowrap>开始时间：</td>
	<td><flex:searchDate name="starttimeSearch" searchName="PUB_ONLINE_HIST.LOGIN_TIME" dataType="java.lang.String" divname="dateDiv1" readonly="false" hastime="true" operSymbol="=" value="<%=login_time%>" sourceFormat="yyyyMMdd HH:mm" targetFormat="yyyyMMdd HH:mm">
	</flex:searchDate><FONT COLOR=#ff0000>*</FONT></td>
	<td align="left" nowrap>结束时间：</td>
    <td><flex:searchDate name="endtimeSearch" searchName="PUB_ONLINE_HIST.LOGIN_TIME" dataType="java.lang.String" divname="dateDiv2" readonly="false" hastime="true" operSymbol="=" value="<%=logoff_time%>" sourceFormat="yyyyMMdd HH:mm" targetFormat="yyyyMMdd HH:mm">
	</flex:searchDate><FONT COLOR=#ff0000>*</FONT></td>
	</tr>
	<tr>
	<td align="left">用户帐号：</td>
    <td><flex:searchText name="user_idSearch" searchName="PUB_ONLINE_HIST.USER_ID" dataType="java.lang.String" operSymbol="=" value="<%=userId%>" size="12">
	</flex:searchText></td>
	<td align="left">机构：</td>
	<td>
	<flex:searchHidden name="corporationId" searchName="PUB_ONLINE_HIST.CORPORATION_ID" dataType="java.lang.String" operSymbol="=" value="<%=corporationId%>" >
	</flex:searchHidden>
	<flex:searchText name="corporationName" searchName="PUB_ONLINE_HIST.CORPORATION_NAME" dataType="java.lang.String" readonly="true" operSymbol="=" value="<%=corporationName%>" size="12" ondblclick="clean()">
	</flex:searchText><img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewCompId()">
	</td>
	<td align="left">IP：</td>
    <td><flex:searchText name="remoteaddrSearch" searchName="PUB_ONLINE_HIST.REMOTEADDR" dataType="java.lang.String" operSymbol="=" value="<%=remoteaddrSearch%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="onlinehistquerying.cmd?clear=true" image="search.gif" imgClick="if(!check()) return false"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
                <flex:radioCol caption="选择" width="40" property="sessionId"  name="primaryKey" sortName="PUB_ONLINE_HIST.SESSION_ID"></flex:radioCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE_HIST.SESSION_ID")%>' width="100" property="sessionId" sortName="PUB_ONLINE_HIST.SESSION_ID" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE_HIST.USER_ID")%>' width="100" property="userId" style="text-align:left" sortName="PUB_ONLINE_HIST.USER_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE_HIST.USER_NAME")%>' width="100" property="userName" style="text-align:left" sortName="PUB_ONLINE_HIST.USER_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE_HIST.CORPORATION_ID")%>' width="100" property="corporationId" style="text-align:left" sortName="PUB_ONLINE_HIST.CORPORATION_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE_HIST.CORPORATION_NAME")%>' width="100" property="corporationName" style="text-align:left" sortName="PUB_ONLINE_HIST.CORPORATION_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE_HIST.REMOTEADDR")%>' width="100" property="remoteaddr" style="text-align:left" sortName="PUB_ONLINE_HIST.REMOTEADDR"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE_HIST.LOGIN_TIME")%>' width="100" property="loginTime" style="text-align:center" sortName="PUB_ONLINE_HIST.LOGIN_TIME"></flex:flexCol>

</flex:flexgrid>
<flex:pagePolit action="onlinehistquerying.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="onlinehist.cmd?method=detail&primaryKey="+id;
}
function clean(){
	document.forms[0].corporationId.value="";
	document.forms[0].corporationName.value="";
}
grid.show();
grid.setSumText("");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
grid.setTouAlign(6,"center");
grid.setTouAlign(7,"center");
function check(){
  var user_idSearch=document.all("user_idSearch");
  user_idSearch.value=trim(user_idSearch.value);
  var remoteaddrSearch=document.all("remoteaddrSearch");
  remoteaddrSearch.value=trim(remoteaddrSearch.value);

  var beginTime = document.all("starttimeSearch").value;
  var endTime = document.all("endtimeSearch").value;
  var ip = remoteaddrSearch.value;
  if(beginTime ==""){
    alert("开始时间不能为空！");
    return false;
  }

  if(!checkTimeFormat("yyyyMMdd hh:mm",beginTime)){
  	alert("开始时间格式应该是'yyyyMMdd hh:mm'的形式！");
  	document.all("starttimeSearch").select();
    document.all("starttimeSearch").focus();
    return false;
  }
  
  if(endTime ==""){
    alert("结束时间不能为空！");
    return false;
  }
  if(!checkTimeFormat("yyyyMMdd hh:mm",endTime)){
  	alert("结束时间格式应该是'yyyyMMdd hh:mm'的形式！");
  	document.all("endtimeSearch").select();
    document.all("endtimeSearch").focus();
    return false;
  }
  if(endTime<beginTime){
     alert("开始时间不能大于结束时间！");
     return false;
  }
  if(ip==""||ip=="127.0.0.1"){
    return true;
  }
  if(!__checkIp(ip)){
     alert("请输入正确的IP格式！");
     return false;
  }
  return true   
}
function selectNewCompId(){
  var cmdUrl="stru.cmd&method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=1"; 
  var url ="jsp/help.jsp?url="+cmdUrl; 
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
      document.all("corporationId").value=win[2];
      document.all("corporationName").value=win[1];
 
  }
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="onlinehist.cmd?method=detail";    
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

function forDeleteBetween(){
  document.forms[0].action ="onlinehist.cmd?method=fordeletebetween";    
  document.forms[0].submit();	
}
function forSearch(){
  document.forms[0].action ="onlinehist.cmd?method=forSearch";    
  document.forms[0].submit();	
}
function querySessionTerminal(){
  if(!getSelect()) return;
   var rowAll = grid.getCheckAll();
   var  row=rowAll.split(",");
   var sessionId = row[1];
  document.forms[0].action ="securityLog.cmd?method=querySessionTerminal&sessionId="+sessionId;    
  document.forms[0].submit();
}
</script>