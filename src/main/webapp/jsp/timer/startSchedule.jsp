<%@ page import="net.mast.jcrontab.timer.data.*,net.mast.jcrontab.timer.*,java.util.*"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%
String msg = null;
try{
	Crontab.getInstance().restart();
	CrontabEntryDAO.getInstance().loadAllCrontabEntry();
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
启动任务计划服务时出现错误：<%=msg%>
<%}%>