<%@ page contentType="text/html;charset=GBK" %>
<%@page import="net.mast.util.RequestUtil"%>
<%@page import="com.cnooc.prw.prapply.data.ProcessDef"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<HTML>
<HEAD>
<TITLE>出差代理查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<% 
	String imgHelp = SkinUtils.getImage(request,"liulan.gif");
    String id = request.getParameter("idSearch");
	if (id==null){
	  id="";
	}
    String oldorganid = request.getParameter("oldorganidSearch");
	if (oldorganid==null){
	  oldorganid="";
	}
    String agentorganid = request.getParameter("agentorganidSearch");
	if (agentorganid==null){
	  agentorganid="";
	}
	String agentorganName=request.getParameter("agentorganName");
	if (agentorganName==null){
		agentorganName="";
		}
    String dataname = request.getParameter("datanameSearch");
	if (dataname==null){
	  dataname="";
	}
	String procDefId =  RequestUtil.getAttrOrPara2String(request,"procDefId");
%>

<div class="btnareaCss">
<bsp:button name="btn_insert" onclick="forProxyInsert()" action="wftaskaccreditProxy.cmd?method=forinsert" value="代理添加"></bsp:button> 


<bsp:button name="btn_insert" onclick="forInsert()" action="wftaskaccredit.cmd?method=forinsert" value="增加"></bsp:button> 
<html:button onclick="forDetail()" name="btn_detail"  value="明细"></html:button>

<html:button onclick="doStop()" name="btn_stop"  value="删除"></html:button>
<!-- // 
<html:button onclick="doStart()" name="btn_start"  value="启用"></html:button>


<html:button onclick="forDelete()" name="btn_delete"  value="删除"></html:button>
-->

</div>
<html:messages></html:messages>
<html:form name="frmList" action="wftaskaccreditquery.cmd">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<html:hidden name="procDefId" value="<%=procDefId %>"></html:hidden>
<html:hidden name="agentorganid" value=""></html:hidden>
<html:hidden name="note" value=""></html:hidden>

<flex:search>
	<tr>
    <td>代理用户：
    <flex:searchHidden name="agentorganidSearch" searchName="WF_TASKACCREDIT.AGENTORGANID" dataType="java.lang.String" operSymbol="=" value="<%=agentorganid%>" >
	</flex:searchHidden>
    <html:text name="agentorganName" value="<%=agentorganName%>" size="20" readonly="true" />
    <img src="<%=imgHelp%>" onclick="selectAgentOrgan()" style="cursor:hand;" border="0">
	</td>
	<!-- //
    <td>代理任务名称：<flex:searchText name="datanameSearch" searchName="WF_TASKACCREDIT.DATANAME" dataType="java.lang.String" operSymbol="=" value="<%=dataname%>" size="12">
	</flex:searchText></td> -->
	<%if(ProcessDef.LOCAL.equals(procDefId)){ %>
	<td><flex:searchImg name="chaxun" action="localTaskInfo.cmd?method=queryProxy"  image="search.gif"/></td>
	<%}else if(ProcessDef.HEAD.equals(procDefId)){ %>
	<td><flex:searchImg name="chaxun" action="headTaskInfo.cmd?method=queryProxy"  image="search.gif"/></td>
	<%} %>
	
	</tr>
</flex:search>
</table>
</fieldset>
<fieldset class="FieldsetCss"><legend>出差代理查询</legend>


<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- ID --><flex:checkboxCol caption="全选" width="35" property="id" name="primaryKey" sortName="WF_TASKACCREDIT.ID" ></flex:checkboxCol>
<!-- 原处理人 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_TASKACCREDIT.OLDORGANID")%>' width="100" property="oldorganid" sortName="WF_TASKACCREDIT.OLDORGANID" style="display:none;"/>

<!--// 原处理人名 -->
 <flex:flexCol caption='<%=ResourcesFactory.getString("WF_TASKACCREDIT.NOTE3")%>' width="150" property="note3" sortName="WF_TASKACCREDIT.NOTE3" />
<!-- 代理人 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_TASKACCREDIT.NOTE")%>' width="150" property="note" sortName="WF_TASKACCREDIT.note"/>
<!--  代理类型--> <flex:flexCol style="display:none;" caption='<%=ResourcesFactory.getString("WF_TASKACCREDIT.TYPE")%>' width="100" property="type" type="enum" enumCollection="WFTASKACCREDIT_TYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="WF_TASKACCREDIT.TYPE"/>

<!--  流程名称(类型名称)--><flex:flexCol style="display:none;"  caption='<%=ResourcesFactory.getString("WF_TASKACCREDIT.DATANAME")%>' width="200" property="dataname" sortName="WF_TASKACCREDIT.DATANAME"/>

<!-- 代理开始时间 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_TASKACCREDIT.TIME")%>' width="100" property="time" sortName="WF_TASKACCREDIT.TIME"/>


<!-- 代理结束时间 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_TASKACCREDIT.ENDTIME")%>' width="100" property="endtime" sortName="WF_TASKACCREDIT.ENDTIME"/>
<!-- 状态 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_TASKACCREDIT.FLAG")%>' width="100" property="flag" type="enum" enumCollection="WFTASKACCREDIT_FLAG_COLLECTION" enumKey ="key" enumValue="value" sortName="WF_TASKACCREDIT.FLAG"/>
<!-- 删除时间 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_TASKACCREDIT.NOTE2")%>' width="150" property="note2"  sortName="WF_TASKACCREDIT.NOTE2"/>

</flex:flexgrid>

<%if(ProcessDef.LOCAL.equals(procDefId)){ %>
<flex:pagePolit action="localTaskInfo.cmd?method=queryProxy" pageSize="15"></flex:pagePolit>
<%} else if(ProcessDef.HEAD.equals(procDefId)){ %>
<flex:pagePolit action="headTaskInfo.cmd?method=queryProxy" pageSize="15"></flex:pagePolit>
<%} %>


</fieldset>
</html:form>
<script language="javascript">
grid.show();
var procDefId =  document.all("procDefId").value;
var addUrl = "&procDefId="+procDefId;
function forInsert(){

  document.forms[0].action ="wftaskaccredit.cmd?method=forinsert"+addUrl;    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="wftaskaccredit.cmd?method=detail"+addUrl;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="wftaskaccredit.cmd?method=delete"+addUrl;    
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
/*
选择代理用户 
*/
function selectAgentOrgan(){
	//var url ="jsp/help.jsp?url=struhelp.cmd&method=getEmpRoot";
	// var url ="struhelp.cmd?method=getSelectRoot&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>";
	var url ="user.cmd?method=getchoiceroot&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>";
	
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	var ret;
	//debugger;
	if(win==null){
		return false;
	}else if(typeof(win)=="string" && win==""){
		ret=new Array();
		ret[0]="";
		ret[1]="";
	}else{
		ret = win;
	}
	if(ret[0] == document.forms[0].agentorganidSearch.value){
		return;
	}
		
	// document.forms[0].agentorganidSearch.value = ret[0];
	var agentorganName = ret[1].substring(ret[1].indexOf("[")+1,ret[1].indexOf("]"));
	document.forms[0].agentorganName.value = agentorganName;
}
</script>

<script type="text/javascript"
	src="jsp/workflow/accredit/wf_taskaccredit.js"></script>