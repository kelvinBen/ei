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
  
	String actDefId = request.getParameter("curActDefId"); //��ǰ���ڶ���ID
	String actDisName = request.getParameter("curActivityName");  //��ǰ��������
	String nextActDefId = request.getParameter("nextActivityDefId"); //��һ�����ڶ���ID
	String nextActDefName = request.getParameter("nextActivityDisName"); //��һ�����ڶ�������
	String nextActivityUserId = request.getParameter("nextActivityUserId"); ////��һ��������ID
	String nextActivityUserName = request.getParameter("nextActivityUserName"); ////��һ������������
	List nextActivityUserIdlist=WorkflowActionUtil.convertStringToListBySplit(nextActivityUserId,",");
	List nextActivityUserNamelist=WorkflowActionUtil.convertStringToListBySplit(nextActivityUserName,",");
	String operateType = request.getParameter("operateType"); //��������

    
  Map m= WorkflowActionUtil.sendByselect(processId,activityId,userId,nextActDefId,nextActivityUserIdlist,nextActivityUserNamelist,sourceReferenceId,formId,new HashMap());
out.print("���ͳɹ���"+m);

%>
