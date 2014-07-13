<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RFX模板</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#bt_ok").click(function(){
			if($("input[id='rfxTempIds']:checked").length == 0){
				alert('请选择纪录');
				return false;
			}else{
				var strNum = $("input[name='rfxTempIds']:checked").val();
				var rfxTempName = $("#" + strNum + "_name").val();
				var rfxTempId = $("#" + strNum + "_tempId").val();
				var rfxType = $("#" + strNum + "_type").val();
				var result = {};
				result.rfxTempId = rfxTempId;
				result.rfxTempName = rfxTempName;
				result.rfxType = rfxType;
				window.returnValue = result;
				window.close();
			}
		});
		$("#bt_cancel").click(function(){
			window.close();
		});
	});
</script>
<style type="text/css">
</style>
</head>
<body>
<c:if test="${not empty actionMessages}"><script type="text/javascript">alert('${actionMessages}');</script></c:if>
<table cellpadding="5" width="100%" border="0">
		<thead>
			<tr>
			<th><h3>维护RFX模板</h3></th>
			</tr>
		</thead>
	</table>
	<table class="tblContent4list" cellpadding="0" width="100%">
	<s:form id="list_form" namespace="/rfxtemp" action="search" theme="simple" method="post">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th>RFx类型</th>
				<th>RFx模板名称</th>
				<th>RFx模板唯一标识符</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="rfxTempList" var="item">
			<tr>
				<td><input type="radio" id="rfxTempIds" name="rfxTempIds" value="<s:property value="id"/>"></td>
				<td style="text-align:left;"><s:property value="rfxType"/></td>
				<td style="text-align:left;"><s:property value="rfxTempName"/></td>
				<td style="text-align:left;"><s:property value="rfxTempId"/></td>
			</tr>
			<input type="hidden" id="<s:property value="id"/>_type" value="<s:property value="rfxType"/>"/>
			<input type="hidden" id="<s:property value="id"/>_name" value="<s:property value="rfxTempName"/>"/>
			<input type="hidden" id="<s:property value="id"/>_tempId" value="<s:property value="rfxTempId"/>"/>
			</s:iterator>
		<tr>
			<td colspan="4" style="text-align:left;">
				&nbsp;&nbsp;<input id="bt_ok" type="button" value='确定' />
				&nbsp;&nbsp;<input id="bt_cancel" type="button" value='取消' />
			</td>
		</tr>
		</tbody>

</s:form>
	</table>

</body>
</html>