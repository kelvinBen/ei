<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采购组修改页面</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		jQuery.validator.addClassRules("input_desc", {
			required: true,
			maxlength: 80
		});
		$('#purchase_form').validate({										//注册表单校验规则
			rules: {
			'purchaseGroup.symbol': {
			required: true,
			maxlength: 3
		    },
		    'purchaseGroup.description_zh_CN': {
			required: true,
			maxlength: 40
		    }
			}
		});	
		
		$("#purchase_save").click(function(){
			
			$.post("${pageContext.request.contextPath}/sc/purchase/group/ishas.do",
				$("#purchase_form").serialize(),
				function(ishas){
					if(ishas=="false\r\n"){
						$("#purchaseGroup.description_en_US").attr("value",$("#purchaseGroup.description_zh_CN").val());
						$("#purchase_form").attr("action",'<s:url namespace="/sc/purchase/group" action="save"/>');
						$("#purchase_form").submit();
					}else{
						alert('<s:text name="cc.message.uniqeu"/>');
						return false;
					}
				},
				"text"
			);
			
			return false;
		});
		$("#purchase_cancel").click(function(){
			window.location.href="${pageContext.request.contextPath}/sc/purchase/group/list.do"
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
					<span><s:text name="pc.header.inputitle"/><font color="#ff0000">*</font><s:text name="cc.header.required"/></span> 
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent" width="100%" cellpadding="0">
		<s:form id="purchase_form" namespace="/sc/purchase/group" action="save" theme="simple" method="post">
		<tbody>
			<tr>
				<th class="tdTitle"><s:text name="pc.header.symble"/></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="purchaseGroup.symbol" id="purchaseGrou.symbol"/><span class="star"> *</span></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="cc.header.description.zh-cn"/></th>
				<td class="TdRight">
					<s:textfield cssClass="inputnormal" name="purchaseGroup.description_zh_CN" id="purchaseGroup.description_zh_CN"/>
					<s:hidden name="purchaseGroup.description_en_US" id="purchaseGroup.description_en_US"/>
					<span class="star"> *</span>
				</td>
			</tr>
			<tr>
			<td colspan="3" style="text-align: left;">
				<button value="" id="purchase_save" type="button"><s:text name="cc.button.save"/></button>&nbsp;
				<button value="" id="purchase_cancel" type="button"><s:text name="cc.button.cancel"/></button>
			</td>
			</tr>
		</tbody>
		</s:form>
	</table>
</div>
</body>
</html>