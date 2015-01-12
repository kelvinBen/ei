<%@ page import="net.mast.jcrontab.timer.data.*,java.util.*"%>
<%@ page contentType="text/html;charset=GBK" %>
<%
request.setCharacterEncoding("GBK");
String msg = null;
try{
   String[] task_names = request.getParameterValues("task_name");
   if(task_names != null){
	 CrontabEntryBean[] beans = new CrontabEntryBean[task_names.length];
	 for(int i =0;i < task_names.length;i++){
		CrontabEntryBean entry = CrontabEntryDAO.getInstance().find( task_names[i] );
		CrontabEntryDAO.getInstance().remove( task_names[i] );
		entry.start();
		beans[i] = entry;
	 }
	CrontabEntryDAO.getInstance().store( beans );
  }
}catch(Exception e){
    e.printStackTrace();
	msg = e.getMessage() + e;
}

%>
<%if(msg == null ){%>
<script language="javascript">
document.location.href="listTask.jsp";
</script>
<%}else{%>
启动任务时出现错误：<%=msg%>
<%}%>