<%@ page import="net.mast.jcrontab.timer.data.*,java.util.*"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%
String msg = null;
try{
	String state = "START";
  	String taskName=request.getParameter("taskName");   
	CrontabEntryBean entry = CrontabEntryDAO.getInstance().find( taskName );
	if( entry != null)
		state = entry.getState();
   
  	String serviceid=request.getParameter("serviceid");
  	String method=request.getParameter("method");
  	String month=request.getParameter("month");
  	String day=request.getParameter("day");
  	String week=request.getParameter("week");
  	String hour=request.getParameter("hour");
  	String minute=request.getParameter("minute");
  	String extra = request.getParameter("extra");
  	String second= request.getParameter("second");
  	String str_line =second+" "+ minute + " " + hour + " " + day + " " + month + " " + week + " " + serviceid.trim()+"@"+method.trim()+"(" +state + ")#" + taskName.trim()+"# " +extra;
  	CrontabParser cp = new CrontabParser();
  	CrontabEntryBean ceb = cp.marshall(str_line);
  	ceb.setYears("*");
	ceb.setSeconds(second);
	ceb.setBusinessDays(true);
	
	CrontabEntryDAO.getInstance().remove( taskName );
	CrontabEntryDAO.getInstance().store( ceb );
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
更新任务时出现错误：<%=msg%>
<%}%>