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
		$('#aform').validate({										//注册表单校验规则
			rules: {
				'h.name': {
				required: true,
				maxlength: 80
				}
			}
		});	
		
		$("#button_save").click(function(){
			
			$.post("${pageContext.request.contextPath}/procurementways/ishas.do",
				$("#aform").serialize(),
				function(ishas){
					if(ishas=="false"){
						$("#aform").attr("action",'<s:url namespace="/procurementways" action="save"/>');
						$("#aform").submit();
					}else{
						alert('采办方式必须唯一');
						return false;
					}
				},
				"text"
			);
			
			return false;
		});
		$("#button_cancel").click(function(){
			window.location.href="${pageContext.request.contextPath}/procurementways/list.do"
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
					<span><s:if test="id==null">新增</s:if><s:else>修改</s:else>采办方式&nbsp;<font color="#ff0000">*</font><s:text name="cc.header.required"/></span> 
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent" width="100%" cellpadding="0">
		<s:form id="aform" namespace="/procurementways" action="save" theme="simple" method="post">
		<s:hidden name="h.id"/>
		<tbody>
			<tr>
				<th class="tdTitle">采办方式编号</th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="h.no" id="hNo" readonly="true"/><span class="star"> *</span></td>
			</tr>
			<tr>
				<th class="tdTitle">采办方式</th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="h.name" id="h_name"/><span class="star"> *</span></td>
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