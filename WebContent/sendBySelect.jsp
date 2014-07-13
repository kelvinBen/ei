<%@page import="org.apache.commons.collections.ListUtils"%>
<%@page import="net.mast.workflow.wfclient.utils.WorkflowActionUtil"%>
<%@page import="net.mast.workflow.api.client.WfClientInterface.WfTaskOperation.DocumentInfo"%>
<%@ page contentType="text/html;charset=GBK" %>

<%@page import="net.mast.workflow.api.client.WfClientInterface.WfTaskOperation"%>

<%@ page import="java.util.*"%>

<% 
    String processId = (String)request.getParameter("processId");
    String userId = (String)request.getParameter("userId");	
    String sourceReferenceId = (String)request.getParameter("sourceReferenceId");
    String formId=request.getParameter("formId");
    String activityId=request.getParameter("activityId");
  
	String actDefId = request.getParameter("curActDefId"); //当前环节定义ID
	String actDisName = request.getParameter("curActivityName");  //当前环节名称
	String nextActDefId = request.getParameter("nextActivityDefId"); //下一个环节定义ID
	String nextActDefName = request.getParameter("nextActivityDisName"); //下一个环节定义名称
	String nextActivityUserId = request.getParameter("nextActivityUserId"); ////下一个参与者ID
	String nextActivityUserName = request.getParameter("nextActivityUserName"); ////下一个参与者名称
	List nextActivityUserIdlist=WorkflowActionUtil.convertStringToListBySplit(nextActivityUserId,",");
	List nextActivityUserNamelist=WorkflowActionUtil.convertStringToListBySplit(nextActivityUserName,",");
	String operateType = request.getParameter("operateType"); //操作名称

    
  Map m= WorkflowActionUtil.sendByselect(processId,activityId,userId,nextActDefId,nextActivityUserIdlist,nextActivityUserNamelist,sourceReferenceId,formId,new HashMap());
out.print("发送成功："+m);

%>
