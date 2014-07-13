<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pri.list" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$('#aform').validate({//注册表单校验规则
			rules: {
				'head.name': {
					required: true,
					maxlength: 80
				}
			}
		});	
		$("#button_cancel").click(function(){
			window.location.href="${pageContext.request.contextPath}/procurementways/list.do";
			return false;
		});
		$("#button_save").click(function(){
			$.post("${pageContext.request.contextPath}/procurementways/ishas.do",
				$("#aform").serialize(),
				function(ishas){
					if(ishas=="false"){
						$("#aform").attr("action",'<s:url namespace="/procurementways" action="save"/>');
						$("#aform").submit();
					}else{
						alert('发现采办方式名称有重复，采办方式名称必须唯一');
						return false;
					}
				},
				"text"
			);
			
			return false;
		});
		$("#selectall").click(function(){ 
			$("input[name='detailIds']").attr("checked",$(this).attr("checked")); 
		}); 
		$("#button_input_detail").click(function(){
			$("input[name='detailIds']").attr("checked",$(this).attr("checked"));
			$("#aform").attr("action",'<s:url namespace="/procurementways" action="inputDetail"/>');
			$("#aform").submit();
			return false;
		});
		$("#button_update_detail").click(function(){
			if($("input[id='detailIds']:checked").length == 0){
				alert('<s:text name="message.edit.checked" />');
				return false;
			}
			if($("input[id='detailIds']:checked").length > 1){
				alert('<s:text name="message.edit.onlyone" />');
				return false;
			}
			$("#aform").attr("action",'<s:url namespace="/procurementways" action="inputDetail"/>');
			$("#aform").submit();
			return false;
		});
		$("#button_delete_detail").click(function(){
			if(confirm("确定删除选中的采办理由，是否继续？")){
				$("#aform").attr("action",'<s:url namespace="/procurementways" action="deleteDetail"/>');
				$("#aform").submit();
			}
			return false;
		});
		$("#button_histroy").click(function(){
			window.location.href="<s:url namespace="/history/common" action="list"><s:param name="targetClazz">PurchaseMode</s:param><s:param name="parentClazz">ProcurementWays</s:param><s:param name="parentId">${head.id}</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
			return false;
		});
	});
</script>
<style type="text/css">
#content{
	float:none;
	width:940px;
}
#noborder{
	border-width:0px;
	width: 25%;
}
#text{
	width:90%;
}
</style>
</head>
<body>
<div class="editdiv">
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead class="listheader">
			<tr>
				<th align="left">
					<span style="text-align:left"><s:if test="head.id==null">新增</s:if><s:else>修改</s:else>采办方式&nbsp;&nbsp;<font color="#ff0000">*</font><s:text name="cc.header.required"/></span> 
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent" width="100%" cellpadding="0" border="1" >
		<s:form id="aform" namespace="/procurementways" action="detail" theme="simple" method="post">
		<input type="hidden" name="heaId" value="${head.id}"/>
		<s:hidden name="head.id"/>
		<tbody>
			<tr>
				<th class="tdTitle">采办方式编号</th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="head.no" id="hNo" readonly="true"/></td>
				<th class="tdTitle">采办方式</th>
				<td class="TdRight" colspan="2"><s:textfield cssClass="inputnormal" name="head.name" id="h_name"/></td>
			</tr>
			<c:if test="${head.id!=null}">
			<tr>
				<th class="tdTitle"><input type="checkbox" id="selectall"></input></th>
				<th class="tdTitle">采办理由编号</th>
				<th class="tdTitle">采办理由</th>
				<th class="tdTitle">允许具体采办理由</th>
				<th class="tdTitle">具体采办理由必填</th>
			</tr>
			<s:iterator value="detailList" var="detail" status="status">
			<tr>
				<td class="TdRight"><input type="checkbox" id="detailIds" name="detailIds" value="${id}"></td>
				<td class="TdRight">${no}</td>
				<td class="TdRight">${purchaseReason}</td>
				<td class="TdRight"><s:if test="approvalSign == 0">否</s:if><s:else>是</s:else></td>
				<td class="TdRight"><s:if test="requiredSign == 0">否</s:if><s:else>是</s:else></td>
			</tr>
			</s:iterator>
			<tr>
			</c:if>
			<td colspan="5" style="text-align: left;">
				<button id="button_save" type="button"><s:text name="cc.button.save"/></button>&nbsp;
				<button id="button_cancel" type="button"><s:text name="cc.button.cancel"/></button>&nbsp;
				<button id="button_histroy" type="button"><s:text name="cc.button.histroy"/></button>&nbsp;
			<c:if test="${head.id!=null}">
				<button id="button_input_detail" type="button">新增采办理由</button>&nbsp;
				<button id="button_update_detail" type="button">修改采办理由</button>&nbsp;
				<button id="button_delete_detail" type="button">删除采办理由</button>&nbsp;
			</c:if>
			</td>
			</tr>
		</tbody>
		</s:form>
	</table>
</div>
</body>
</html>