<%@ page import="java.io.*,net.mast.jcrontab.timer.data.*,net.mast.jcrontab.timer.*,java.util.*"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%
String msg = "";
String test = null;
try {
	System.out.println("重新载入定时任务...");
	Crontab crontab = Crontab.getInstance();
	test = PropertyMgr.getTaskRunner();
	if( test != null ){
		msg = "定时器配置已经载入!";
	}else{
		String props = "schedule.properties";
		Properties propObj = new Properties();
		InputStream input = FileLoaderUtils.getResourceAsStream(props);
		if( input == null ){
			throw new IOException("File '" + props + "' not found");
		}
		propObj.load(input);
		crontab.init(propObj);
		System.out.println("OK");
		test = PropertyMgr.getTaskRunner();
		msg = "定时器配置载入成功!";
	}
} catch (Exception e) {
	e.printStackTrace();
	msg = e.getMessage() + "<p>" + e;
	System.out.println("载入文件出错："+e);
}
%>
<h1><%=msg%></h1>
<p>
<h1>定时器执行类：<%=test%></h1>

<script language="javascript">
document.location.href="listTask.jsp";
</script>