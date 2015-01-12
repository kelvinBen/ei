<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>

<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@page import="org.ld.soa.util.RequestUtil"%>
<HTML>
<HEAD>
<TITLE>行政区划查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
    String chakan = (String)request.getParameter("chakan");
  
  
  List s=new ArrayList();
  request.setAttribute("flexgrid.data",s);
  for(int i=0;i<10;i++){
	  Map m=new HashMap();
	 m.put("cantCode",i+"c");
	 m.put("cantName",i+"名称");
	 m.put("shortName",i+"简称");
	 s.add(m);
  }
String 	sourceReferenceId=(String)request.getAttribute("sourceReferenceId"); //业务主键
	if(sourceReferenceId==null)
		sourceReferenceId="";	
String 	formId=(String)request.getAttribute("formId"); //业务模块标识
	if(sourceReferenceId==null)
		sourceReferenceId="";	
	
String procDefId = request.getParameter("procDefId");
		String actDefId=request.getParameter("actDefId");
		String actDefName=request.getParameter("actDefName");
		
if(actDefName==null)
	actDefName=(String)request.getAttribute("curActName"); //当前环节名称
if(actDefId==null)
		actDefId=(String)request.getAttribute("curActDefId"); //当前环节定义ID
	

String activityId=RequestUtil.getPara2String(request,"activityId"); //环节实例ID
String processId=RequestUtil.getPara2String(request,"processId"); //流程实例ID
String sysOrganId=RequestUtil.getPara2String(request,"sysOrganId"); //当前任务的处理人

String userId=GetBspInfo.getBspInfo().getEmployee().getOrganId();

    Map map = new HashMap();
request.setAttribute("html.data", map);
%>
<widgets:container title=" 列表" >

<html:form name="frmList" action="testprocess.jsp">

<html:button name="aa" onclick="createP()" value="启动流程" ></html:button>
<html:button name="aa" onclick="createAndsendP()" value="创建流程并发送" ></html:button>
<html:button name="aab" onclick="sendP()" value="发送下一个环节" ></html:button>
<html:button name="aab" onclick="showProcStatus()" value="查看流程图" ></html:button>
<br/>
<html:button name="aab" onclick="selectNextActive()" value="选择可以发送环节" ></html:button>
<html:button name="aab" onclick="sendBySelect()" value="发送到选定的环节" ></html:button>
<br/>
<html:button name="aab" onclick="selectJump()" value="选择的跳转环节" ></html:button>
<html:button name="aab" onclick="Jump()" value="跳转到选定的环节" ></html:button>

<hr/>

流程定义ID (procDefId )：
<input type="text" name="procDefId" id="procDefId" value="<%=procDefId%>" size=50> 
<br/>
创建人ID (userId机构organId )：
<input type="text" name="userId" id="userId" value="<%=userId%>" size=50> 
<br/>
业务主键：<input type="text" name="sourceReferenceId" id="sourceReferenceId" value="<%=sourceReferenceId%>" size=50> 
<br/>
操作名称：operateType <input type="text" name="operateType" id="operateType" value="启动流程" size=50> 
<br/>
当前环节定义ID：actDefId<input type="text" name="actDefId" id="actDefId" value="<%=actDefId%>" size=50> 
当前环节名称：actDefName<input type="text" name="actDefName" id="actDefName" value="<%=actDefName%>" size=50> 
<br/>
所属业务模块：formId <input type="text" name="formId" id="formId" value="<%=formId %>" size=50> 
<br/>
<hr>

流程实例ID：processId <input type="text" name="processId" id="processId" value="<%=processId %>" size=50> 
<br/>
当前环节实例ID：activityId <input type="text" name="activityId" id="activityId" value="<%=activityId %>" size=50> 
<br/>
当前任务的处理人：sysOrganId <input type="text" name="sysOrganId" id="sysOrganId" value="<%=sysOrganId %>" size=50> 
<br/>
<br/>
<hr>

选择的环节ID：nextActivityDefId <input type="text" name="nextActivityDefId" id="nextActivityDefId" value="" size=50> 
<br/>
选择的环节：nextActivityDisName <input type="text" name="nextActivityDisName" id="nextActivityDisName" value="" size=50> 
<br/>
选择的该环节的处理人ID：nextActivityUserId <input type="text" name="nextActivityUserId" id="nextActivityUserId" value="" size=50> 
<br/>
选择的该环节的处理人：nextActivityUserName <input type="text" name="nextActivityUserName" id="nextActivityUserName" value="" size=50> 
<br/>

是否查看：<%=chakan %>
</html:form>
</widgets:container>

<script language="javascript">

//自己设置选中项
function createP(){
	document.forms[0].submit();
	
}

function createAndsendP(){
	document.forms[0].action="createAndsendP.jsp";
	document.forms[0].submit();
	
}

function sendP(){
    document.forms[0].action="sendprocess.jsp";
	document.forms[0].submit();
	
}
//查看流程图
function showProcStatus(){
	var curFlowId=document.all("procDefId").value;
	var processId=document.all("processId").value;
	var curFormId=document.all("formId").value;
  	var url="taskinfo.cmd?method=displaystatus&processId="+ processId+ "&curFormId=" +curFormId+"&curFlowId="+curFlowId;
	window.open(url);
	
}
//选择可以发送环节
function selectNextActive()
{
   var activityId=$('activityId').value;
   var processId=$('processId').value;
   var curActDefId= $('actDefId').value; //当前环节定义ID
   
	var url="taskinfo.cmd?method=getnextactivities&activityId="+activityId+"&processId="+processId+"&curActDefId="+curActDefId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	document.all("nextActivityDefId").value=obj[0];
	document.all("nextActivityDisName").value=obj[1];
	document.all("nextActivityUserId").value=obj[2];
	document.all("nextActivityUserName").value=obj[3];
	
}
//发送到选中的环节
function sendBySelect(){
    document.forms[0].action="sendBySelect.jsp";
	document.forms[0].submit();
}

//跳转环节
function selectJump()
{
   var activityId=$('activityId').value;
   var processId=$('processId').value;
   var curActDefId= $('actDefId').value; //当前环节定义ID
   
	var url="taskinfo.cmd?method=getjumpactivities&processId="+processId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	document.all("nextActivityDefId").value=obj[0];
	document.all("nextActivityDisName").value=obj[1];
	document.all("nextActivityUserId").value=obj[2];
	document.all("nextActivityUserName").value=obj[3];
	
}

//发送到选中的环节
function Jump(){
    document.forms[0].action="jump.jsp";
	document.forms[0].submit();
}


</script>