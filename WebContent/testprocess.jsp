<%@page import="net.mast.workflow.wfclient.utils.WorkflowActionUtil"%>
<%@page import="net.mast.workflow.api.client.WfClientInterface.WfTaskOperation.DocumentInfo"%>
<%@ page contentType="text/html;charset=GBK" %>

<%@page import="net.mast.workflow.api.client.WfClientInterface.WfTaskOperation"%>

<%@ page import="java.util.*"%>

<% 
    String procDefId = (String)request.getParameter("procDefId");
    String userId = (String)request.getParameter("userId");	
    String sourceReferenceId = (String)request.getParameter("sourceReferenceId");
    String formId=request.getParameter("formId");
     
  
    Map s= WorkflowActionUtil.startProcess(procDefId,"",userId,sourceReferenceId,formId,new HashMap());
out.print(s);

%>
