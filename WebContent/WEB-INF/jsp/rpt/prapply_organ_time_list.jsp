<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>单位平均审批时间统计报表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui-1.2.3/themes/default/easyui.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/jquery-easyui-1.2.3/themes/icon.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.2.3/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.2.3/jquery.easyui.min.js"></script>

</head>
<body>

	<table id="tt" title="平均审批时间统计表" class="easyui-treegrid" style="width:800px;height:600px"
			url="${pageContext.request.contextPath}/rpt/treeGridOrganData.do?expandLevel=<s:property value="expandLevel"/>" idField="id" treeField="ORGAN_ALIAS"
			pagination="false" fitColumns="true">
		<thead>
			<tr>
				<th field="ORGAN_ALIAS" rowspan="2" width="500" editor="text">审批单位</th>
				<th field="days" width="100" editor="text">总审批时间(天)</th>
				<th field="count" width="100" editor="text">审批单据数量</th>
				<th field="average" width="100" editor="text">平均审批时间(天)</th>
			</tr>
		</thead>
	</table>

</body>
</html>