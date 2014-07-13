<%@ page contentType="text/html;charset=GBK" %>
<%
// 本页面在多个地方被使用，如果要对本页面修改，请注意！
//使用本页面的地方计有：角色列表-删除、用户列表-删除、功能模块列表-删除当前模块/删除功能、
//角色模板-删除、工作日历-删除。
String flag = (String)request.getAttribute("FLAG");
if(flag == null){
	flag = "OK";
}
out.println(flag);
%>