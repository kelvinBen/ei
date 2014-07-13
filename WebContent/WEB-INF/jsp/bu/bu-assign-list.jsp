<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="bu.autotransfer" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#currency_exit").click(function(){
			window.location.href="${pageContext.request.contextPath}";
			return false;
		});
		$("#currency_histroy").click(function(){
			window.location.href="<s:url namespace="/history/bu" action="list"><s:param name="targetClazz">BUExtObject</s:param><s:param name="fieldName">autoAssign</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
		});
		$("#currency_save").click(function(){
			$("#tran_form").attr("action",'<s:url namespace="/bu/assign" action="save"/>');
			$("#tran_form").submit();
			return false;
		});
		$("#selectall").click(function(){ 
			$("input[id='assignIds']").attr("checked",$(this).attr("checked")); 
		}); 
		
	});
</script>
</head>
<body>
<c:if test="${not empty actionMessages}">
	<script type="text/javascript">alert('${actionMessages}');</script>
</c:if>
<%@ include file="/WEB-INF/jsp/mainmenu.jsp"%>
<table cellpadding="5" width="100%" border="0">
	<thead>
		<tr>
			<th>
			<h3><s:text name="menu.auto.assignmerge" /></h3>
			</th>
		</tr>
	</thead>
</table>
<table class="tblContent4list" cellpadding="0" width="100%">
	<s:form id="tran_form" namespace="/bu/assign" action="save" theme="simple" method="post">
		<s:hidden name="isLoginCentral"/>
		<tbody>
			<tr>
				<td><b>单据类型</b></td>
				<td><b><s:text name="bu.prmbu" /></b></td>
				<td><b>启用自动分派、合并功能</b><input id="selectall" type="checkbox" /></td>
			</tr>
			<c:if test="${isLoginCentral=='Y'}">
			<tr>
				<td align="left">一级集中采购申请</td>
				<td></td>
				<td><input type="checkbox" id="centralFlag" name="centralFlag" value="1" <c:if test="${centralFlag!=null}">checked</c:if>></td>
			</tr>
			</c:if>
			<s:iterator value="buExtList" id="buExt">
				<tr>
					<td align="left">采办需求</td>
					<td align="left"><s:hidden name="organId" />${buName}</td>
					<td>
						<input type="checkbox" id="assignIds" name="assignIds" value="${organId}" <c:if test="${autoAssign=='1'}">checked</c:if>>
					</td>
				</tr>
			</s:iterator>
			<tr>
				<td colspan="3" style="text-align: left;">
				<button value="" id="currency_save" type="button"><s:text
					name="cc.button.save" /></button>
				&nbsp;
				<button value="" id="currency_histroy" type="button"><s:text
					name="cc.button.histroy" /></button>
				&nbsp;</td>
			</tr>
		</tbody>
	</s:form>
</table>
<%@ include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>