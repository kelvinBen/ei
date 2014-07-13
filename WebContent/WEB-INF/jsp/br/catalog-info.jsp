<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<title><s:text name="com.cnooc.domain.catalog.info.header"/></title>
</head>
<body>
<div class="editdiv">
		<%@ include file="/WEB-INF/jsp/sidebar-sm.jsp"%>

		<table class="tblContent4list" width="100%" cellpadding="0" border="1px">
		<tr>
			<td><s:text name="com.cnooc.domain.catalog.info.declear" />：<s:property value="centralCatalog.id"></s:property></td>
		</tr>
		<tr>
			<td><s:text name="com.cnooc.domain.catalog.info.condition"/>:<s:if test='centralCatalog.isDelete==true'><s:text name="com.cnooc.domain.catalog.info.deleted" /></s:if><s:else><s:text name="com.cnooc.domain.catalog.info.undeleted" /></s:else></td>
		</tr>
	 </table>
		<table class="tblContent4list" width="100%" cellpadding="0" border="1px">
		<tr >
			<th></th>
			<th><s:text name="com.cnooc.domain.catalog.info.title" /></th>
		</tr>
		<tbody>
			<tr>
				<td width="200px"></td>
				<td></td>
			</tr>
			<tr>
				<td width="200px"></td>
	
				<td><s:url id="url" action="muLu">
					<s:param name="testId">
						<s:property value="centralCatalog.id" />
					</s:param>
				</s:url> <s:a href="%{url}"><s:text name="com.cnooc.domain.catalog.info.mulu" /></s:a></td>
			</tr>
			<tr>
				<td width="200px"></td>
				<td>
					<s:url id="url" action="indicatorList">
					<s:param name="testId">
						<s:property value="centralCatalog.id" />
					</s:param>
				</s:url> <s:a href="%{url}"><s:text name="com.cnooc.domain.catalog.info.indicator" /></s:a></td>
			</tr>
			<tr>
				<td width="200px"></td>
				<td>
					<s:url id="url" namespace="/br/history" action="list">
						<s:param name="testId">
							<s:property value="centralCatalog.id" />
						</s:param>
					</s:url> 
					<s:a href="%{url}">
						<s:text name="com.cnooc.domain.catalog.info.history"/>
					</s:a>
				</td>
			</tr>
		</tbody>
	</table>
</div>

</body>
</html>