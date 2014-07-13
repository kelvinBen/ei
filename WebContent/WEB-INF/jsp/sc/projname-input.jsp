<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pri.list" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		jQuery.validator.addClassRules("input_desc", {
			required: true,
			maxlength: 80
		});
		$('#mainForm').validate({										//注册表单校验规则
			rules: {
				'entity.code': {
				required: true,
				maxlength: 20
				},
				'entity.name': {
				required: true,
				maxlength: 80
				},
				'entity.budgetCny': {
				number:true
				},
				'entity.budgetUsd': {
				number:true
				}
			}
		});	
		
		$("#button_save").click(function(){
			
			$.post("${pageContext.request.contextPath}/sc/projname/checkValidName.do",
				$("#mainForm").serialize(),
				function(ishas){
					if(ishas=="true"){
						$("#mainForm").attr("action",'<s:url namespace="/sc/projname" action="save"/>');
						$("#mainForm").submit();
					}else{
						alert('业务单位+项目名称编号+项目名称必须唯一');
						return false;
					}
				},
				"text"
			);
			
			return false;
		});
		$("#button_cancel").click(function(){
			window.location.href="${pageContext.request.contextPath}/sc/projname/list.do"
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
				<th>
					<span><s:if test="id==null">新增</s:if><s:else>修改</s:else>项目名称&nbsp;<font color="#ff0000">*</font><s:text name="cc.header.required"/></span> 
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent" width="100%" cellpadding="0">
		<s:form id="mainForm" namespace="/sc/projname" action="save" theme="simple" method="post">
		<s:hidden name="entity.id"/>
		<s:hidden name="entity.deleted" value="false"/>
		<tbody>
			<tr>
				<th class="tdTitle">业务单位<span class="star"> *</span></th>
				<td class="TdRight"><s:select id="organId" list="orderIdNameMap" listKey="key" listValue="value" name="entity.organId" value="#request.entity.organId" /></td>
			</tr>
			<tr>
				<th class="tdTitle">项目名称编号<span class="star"> *</span></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="entity.code" id="entityCode"/></td>
			</tr>
			<tr>
				<th class="tdTitle">项目名称<span class="star"> *</span></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="entity.name" id="entityName"/></td>
			</tr>
			<tr>
				<th class="tdTitle">预算金额(CNY)</th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="entity.budgetCny" id="budgetCny"/></td>
			</tr>
			<tr>
				<th class="tdTitle">预算金额(USD)</th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="entity.budgetUsd" id="budgetUsd"/></td>
			</tr>
			<tr>
			<td colspan="3" style="text-align: left;">
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