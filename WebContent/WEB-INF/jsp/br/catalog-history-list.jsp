<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pr.history.list" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#a_sm_history").addClass("currentLink");
		$("#pagebefore").click(function(){
			location.href='<s:url namespace="/br" action="indicatorList"><s:param name="testId" value="#request.testId"/></s:url>';
		});

		$("#export_selected").click(function(){
			location.href='<s:url namespace="/br/history" action="export"><s:param name="testId" value="#request.testId" /></s:url>';
			return false;
		});	
	});
</script>
</head>
<body>
<div class="editdiv">
<div>
	<%@ include file="/WEB-INF/jsp/sidebar-sm.jsp"%>
</div>	
	
		<div id="wrapper">
			<div id="content">
					<table class="tblContent4list" width="100%" cellpadding="0" border="1px">
					<thead class="listheader">
						<tr>
							<th>
								<span><s:text name="pr.history.all"/> (<s:property value="#request.modifyHistoryList.size()"/>)</span> 
								<button type="button" id="export_selected"><s:text name="button.export"/></button> 
							</th>
						</tr>
					</thead>
				</table>
					<table class="tblContent4list" width="100%" cellpadding="0" border="1px">
					<s:form id="prh_form" namespace="/br/history" action="export" theme="simple" method="post">
					<s:hidden name="testId"/>
					<thead>
						<tr>
							<th><s:text name="history.modifyDate"/></th>
							<th><s:text name="history.modifyUser"/></th>
							<th><s:text name="history.target"/></th>
							<th><s:text name="history.operType"/></th>
							<th><s:text name="history.fieldName"/></th>
							<th><s:text name="history.oldValue"/></th>
							<th><s:text name="history.newValue"/></th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#request.modifyHistoryList" var="prh">
						<s:iterator value="#prh.items" var="prhi">
						<tr>
							<td><s:property value="#prh.modifyDate"/></td>
							<td><s:property value="#prh.modifyUser"/></td>
							<td><s:property value="getText(#prh.targetClazz)"/> [<s:property value="#prh.targetId"/>]</td>
							<td><s:property value="getText(#prh.operType)"/></td>
							<td><s:property value="getText(#prhi.fieldName)"/></td>
							<td><s:property value="#prhi.oldValue"/></td>
							<td><s:property value="#prhi.newValue"/></td>
						</tr>
						</s:iterator>
						</s:iterator>
					</tbody>
					</s:form>
				</table>
			</div>
	
		</div>
		<%@ include file="/WEB-INF/jsp/footer.jsp"%>
	</div>
</body>
</html>