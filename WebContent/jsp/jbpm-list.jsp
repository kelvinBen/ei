<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>代办事项</title>
	</head>
	<body>
		<table border="1">
			<tr>
				<th width="20%">
					符号
				</th>
				<th>
					描述
				</th>
				<th width="20%">
					操作
				</th>
			</tr>
			<s:iterator value="#request.taskList" id="task">
				<tr>
					<td><s:property value="#task.id"/></td>
					<td><s:property value="#task.name"/></td>
					<td>
						<a href="<s:property value="#task.formResourceName"/>?id=<s:property value="#task.id"/>">view</a>
					</td>
				</tr>
			</s:iterator>
		</table>
	</body>
</html>