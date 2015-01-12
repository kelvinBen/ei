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
  
  Map m= WorkflowActionUtil.sendnext(processId,activityId,userId,sourceReferenceId,formId,null);
out.print("·¢ËÍ³É¹¦£º"+m);

%>
