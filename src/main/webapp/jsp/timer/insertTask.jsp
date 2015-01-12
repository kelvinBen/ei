<%@ page import="net.mast.jcrontab.timer.data.*,java.util.*"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%
String msg = null;
try{
	boolean[] bSeconds = new boolean[60];
	boolean[] bYears = new boolean[10];
  	String taskName=request.getParameter("taskName");
  	String serviceid=request.getParameter("serviceid");
  	String method=request.getParameter("method");
  	String month=request.getParameter("month");
  	String day=request.getParameter("day");
  	String week=request.getParameter("week");
  	String hour=request.getParameter("hour");
  	String minute=request.getParameter("minute");
  	String extra = request.getParameter("extra");
  	String second= request.getParameter("second");
  	String str_line =second+" "+ minute + " " + hour + " " + day + " " + month + " " + week + " " + serviceid.trim()+"@"+method.trim()+"(START)#" + taskName.trim()+"# " +extra;
  	CrontabParser cp = new CrontabParser();
  	CrontabEntryBean ceb = cp.marshall(str_line);
  	
  	cp.parseToken("*", bYears, false);
	ceb.setBYears(bYears);
	ceb.setYears("*");

//	cp.parseToken("0", bSeconds, false);
//	ceb.setBSeconds(bSeconds);
//	ceb.setSeconds("0");
	
	ceb.setBusinessDays(true);
	
	
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
启动任务时出现错误：<%=msg%>
<%}%>