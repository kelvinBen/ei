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
		$('#currency_form').validate({										//注册表单校验规则
			rules: {
			'currency.symbol': {
			required: true
		    },
		    'currency.description_zh_CN': {
			required: true,
			maxlength: 80
		    },
		    'currency.description_en_US': {
			 required: true,
			 maxlength: 80
		    }
			}
		});	
		
		$("#currency_save").click(function(){
			
			$.post("${pageContext.request.contextPath}/sc/currency/ishas.do",
				$("#currency_form").serialize(),
				function(ishas){
					if(ishas=="false\r\n"){
						$("#currency_form").attr("action",'<s:url namespace="/sc/currency" action="save"/>');
						$("#currency_form").submit();
					}else{
						alert('<s:text name="cc.message.uniqeu"/>');
						return false;
					}
				},
				"text"
			);
			
			return false;
		});
		$("#currency_cancel").click(function(){
			window.location.href="${pageContext.request.contextPath}/sc/currency/list.do"
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
					<span><s:text name="cc.header.inputitle"/><font color="#ff0000">*</font><s:text name="cc.header.required"/></span> 
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent" width="100%" cellpadding="0">
		<s:form id="currency_form" namespace="/sc/currency" action="save" theme="simple" method="post">
		<tbody>
			<tr>
				<th class="tdTitle"><s:text name="cc.header.symble"/></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="currency.symbol" id="currency.symbol"/><span class="star"> *</span></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="cc.header.description.zh-cn"/></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="currency.description_zh_CN" id="measure.description_zh_CN"/><span class="star"> *</span></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="cc.header.description.en-us"/></th>	
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="currency.description_en_US" id="measure.description_en_US"/><span class="star"> *</span></td>
			</tr>
			<tr>
			<td colspan="3" style="text-align: left;">
				<button value="" id="currency_save" type="button"><s:text name="cc.button.save"/></button>&nbsp;
				<button value="" id="currency_cancel" type="button"><s:text name="cc.button.cancel"/></button>
			</td>
			</tr>
		</tbody>
		</s:form>
	</table>
</div>
</body>
</html>