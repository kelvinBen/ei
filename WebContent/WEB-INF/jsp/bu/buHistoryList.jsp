<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pr.history.list" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#export_selected").click(function(){
			$("#mainForm").attr("action",'<s:url namespace="/history/bu" action="export"/>');
			$("#mainForm").submit();
		});	
	});
</script>
</head>
<body>
<div class="editdiv" style="margin: 0; padding: 0;">
<s:form id="mainForm" namespace="/history/bu" action="list" theme="simple" method="get">
	<div>
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead>
			<tr>
				<th align="left"><span>修改历史详细列表</span></th>
				<th align="right">
				<button type="button" id="export_selected"><s:text
					name="button.export" /></button>
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent4list" width="100%" cellpadding="0"
		style="table-layout: fixed; word-break: break-all;">
		<colgroup>
			<col style="width: 20%">
			<col style="width: 10%">
			<col style="width: 10%">
			<col style="width: 10%">
			<col style="width: 10%">
			<col style="width: 20%">
			<col style="width: 20%">
		</colgroup>
		<thead>
			<tr>
				<th><s:text name="history.modifyDate" /></th>
				<th><s:text name="history.modifyUser" /></th>
				<th><s:text name="history.target" /></th>
				<th><s:text name="history.operType" /></th>
				<th><s:text name="history.fieldName" /></th>
				<th><s:text name="history.oldValue" /></th>
				<th><s:text name="history.newValue" /></th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="page.result" id="mhi">
				<tr>
					<td><s:property value="modifyHistory.modifyDate" /></td>
					<td><s:property value="modifyHistory.modifyUser" /></td>
					<td><s:property value="modifyHistory.targetClazz" /> [
					<s:if test="modifyHistory.url!=null">
					<a href="<%=request.getContextPath()%><s:property value="modifyHistory.url" />"><s:property value="modifyHistory.targetId" /></a>
					</s:if>
					<s:else><s:property value="modifyHistory.desc" /></s:else>
					]</td>
					<td><s:property value="getText(modifyHistory.operType)" /></td>
					<td><s:property value="fieldName" /></td>
					<td><s:property value="oldValue" /></td>
					<td><s:property value="newValue" /></td>
				</tr>
			</s:iterator>
			<tr>
			</tr>
		</tbody>
	</table>
	</div>
	<div style="text-align:left">
	<a href="javascript:jumpPage(${page.prePage})"><img width="43" height="20" border="0" alt="上一页" align="absmiddle" src="<s:url value="/skins/default/images/moveleft.gif"/>"></a>
	<a href="javascript:jumpPage(${page.nextPage})"><img width="43" height="20" border="0" alt="下一页" align="absmiddle" src="<s:url value="/skins/default/images/moveright.gif"/>"></a>
	&nbsp;<b>${page.pageNo}</b>/${page.totalPages}页&nbsp;共 ${page.totalCount} 条,从 ${page.startNo} 条到 ${page.endNo} 条
	每页 <input type="text" name="page.pageSize" style='border:1px inset;background:white;font-family:arial;width:30px' value="${page.pageSize}" tabindex="1">条
	<a href="javascript:search()" tabindex="2"><img border="0" alt="转到" align="absmiddle" src="<s:url value="/skins/default/images/top/refresh.gif"/>"></a>
	</div>
	<input type="hidden" name="page.pageNo" id="pageNo" value="${page.pageNo}" />
	<input type="hidden" name="page.orderBy" id="orderBy" value="${page.orderBy}" />
	<input type="hidden" name="page.order" id="order" value="${page.order}" />
	<script type="text/javascript">
function jumpPage(pageNo) {
	$("#pageNo").val(pageNo);
	$("#mainForm").submit();
}
function search() {
	$("#pageNo").val("1");

	$("#mainForm").submit();
}
</script>
	<s:hidden name="parentId" />
	<s:hidden name="parentClazz" />
	<s:hidden name="targetId" />
	<s:hidden name="targetClazz" />
	<s:hidden name="fieldName" />
</s:form></div>
</body>
</html>