<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>维护RFX模板</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#bt_add").click(function(){
			$("input[name='rfxTempIds']").attr("checked",$(this).attr("checked"));
			$("#list_form").attr("action",'<s:url namespace="/rfxtemp" action="input"/>');
			$("#list_form").submit();
			return false;
		});
		$("#bt_edit").click(function(){
			if($("input[id='rfxTempIds']:checked").length == 0){
				alert('<s:text name="message.edit.checked" />');
				return false;
			}
			if($("input[id='rfxTempIds']:checked").length > 1){
				alert('<s:text name="message.edit.onlyone" />');
				return false;
			}
			$("#list_form").attr("action",'<s:url namespace="/rfxtemp" action="input"/>');
			$("#list_form").submit();
			return false;
		});
		$("#bt_delete").click(function(){
			if($("input[id='rfxTempIds']:checked").length == 0){
				alert('<s:text name="message.delete.checked" />');
				return false;
			}
			
			if (confirm('<s:text name="message.confirm.delete" />')){
				$("#list_form").attr("action",'<s:url namespace="/rfxtemp" action="delete"/>');
				$("#list_form").submit();
			}
			return false;
		});
		$("#bt_test").click(function(){
			var result = window.showModelessDialog('<s:url namespace="/rfxtemp" action="search"/>',"","dialogWidth:650px; dialogHeight:500px;status:0;help:0");
			if(result != null){
				alert(result.feeTypeId);
				alert(result.feeTypeName);
			}
		});
		$("#selectall").click(function(){ 
			$("input[name='rfxTempIds']").attr("checked",$(this).attr("checked")); 
		}); 
		$("#bt_history").click(function(){
			location.href = "<s:url namespace="/history/common" action="list"><s:param name="targetClazz">RfxTemp</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
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
	<s:form id="list_form" namespace="/rfxtemp" action="list" theme="simple" method="post">
		<thead>
			<tr>
				<th><input type="checkbox" id="selectall"></input></th>
				<th>RFx类型</th>
				<th>RFx模板名称</th>
				<th>RFx模板唯一标识符</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="rfxTempList" var="item">
			<tr>
				<td><input type="checkbox" id="rfxTempIds" name="rfxTempIds" value="<s:property value="id"/>"></td>
				<td style="text-indent:100px;text-align:left;"><s:property value="rfxType"/></td>
				<td style="text-indent:100px;text-align:left;"><s:property value="rfxTempName"/></td>
				<td style="text-indent:100px;text-align:left;"><s:property value="rfxTempId"/></td>
			</tr>
			</s:iterator>
		<tr>
			<td colspan="4" style="text-align:left;">
				&nbsp;&nbsp;<input id="bt_add" type="button" value='<s:text name="button.new" />' />
				&nbsp;&nbsp;<input id="bt_edit" type="button" value='<s:text name="button.edit" />' />
				&nbsp;&nbsp;<input id="bt_delete" type="button" value='<s:text name="button.delete" />' />
				&nbsp;&nbsp;<input id="bt_history" type="button" value='<s:text name="cc.button.histroy" />' />
			</td>
		</tr>
		</tbody>

</s:form>
	</table>

</body>
</html>