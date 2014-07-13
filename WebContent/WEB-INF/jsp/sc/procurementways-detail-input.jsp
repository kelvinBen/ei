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
				'detail.purchaseReason': {
				required: true,
				maxlength: 200
				}
			}
		});	
		
		$("#button_save").click(function(){
			$.post("${pageContext.request.contextPath}/procurementways/isValidDetail.do",
				$("#aform").serialize(),
				function(isValid){
					if(isValid=="true"){
						$("#aform").attr("action",'<s:url namespace="/procurementways" action="saveDetail"/>');
						$("#aform").submit();
					}else{
						alert('发现采办理由名称有重复，采办理由名称必须唯一');
						return false;
					}
				},
				"text"
			);
			
			return false;
		});
		$("#button_cancel").click(function(){
			window.location.href="${pageContext.request.contextPath}/procurementways/list.do";
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
					<span style="text-align:left"><s:if test="detail.id==null">新增</s:if><s:else>修改</s:else>采办理由&nbsp;&nbsp;<font color="#ff0000">*</font><s:text name="cc.header.required"/></span> 
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent" width="100%" cellpadding="1" border="1" >
		<s:form id="aform" namespace="/procurementways" action="saveDetail" theme="simple" method="post">
		<s:hidden name="detail.id"/>
		<input type="hidden" name="detailId" value="${detail.id}"/>
		<input type="hidden" name="head.id" value="${head.id}"/>
		<tbody>
			<tr>
				<th class="tdTitle">采办理由编号</th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="detail.no" id="detailNo" readonly="true"/><span class="star"> *</span></td>
			</tr>
			<tr>
				<th class="tdTitle">采办理由</th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="detail.purchaseReason" id="detailPurchaseReason"/><span class="star"> *</span></td>
			</tr>
			<tr>
				<th class="tdTitle">允许具体采办理由</th>
				<td class="TdRight">
				<input type="checkbox" class="inputnormal" name="detail.approvalSign" id="detailApprovalSign" value="1" <c:if test="${detail.approvalSign==1}">checked</c:if>/>
				</td>
			</tr>
			<tr>
				<th class="tdTitle">具体采办理由必填</th>
				<td class="TdRight">
				<input type="checkbox" class="inputnormal" name="detail.requiredSign" id="detailRequiredSign" value="1" <c:if test="${detail.requiredSign==1}">checked</c:if>/>
				</td>
			</tr>
			<tr>
			<td colspan="2" style="text-align: left;">
				<button id="button_save" type="button"><s:text name="cc.button.save"/></button>&nbsp;
				<button id="button_cancel" type="button"><s:text name="cc.button.cancel"/></button>
			</td>
			</tr>
		</tbody>
		</s:form>
	</table>
</div>
</body>
</html>