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
		

		$("#currency_input").click(function(){
			$("#currency_form").attr("action",'<s:url namespace="/sc/currency" action="input"/>');
			$("#currency_form").submit();
			return false;
		});
		$("#currency_histroy").click(function(){
			window.location.href="<s:url namespace="/history/common" action="list"><s:param name="targetClazz">Currency</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
			return false;
		});
		$("#currency_save").click(function(){
				$("#currency_form").attr("action",'<s:url namespace="/sc/currency" action="save"/>');
				$("#currency_form").submit();
			return false;
		});
		$("#currency_delete").click(function(){
				$("#currency_form").attr("action",'<s:url namespace="/sc/currency" action="delete"/>');
				$("#currency_form").submit();
			return false;
		});
		$("input.deleted").click(function(){
		    if(this.checked){
			    $(this).attr("value","true");
		    }else if(!this.checked){
			    $(this).attr("value","false");
		    }
		 });
		 $("select").change(function(){
			 $("#currency_form").attr("action",'<s:url namespace="/sc/currency" action="list"/>');
			 $("#currency_form").submit();
		 });
		jQuery.validator.addClassRules("t1", {
			  required: true,
			  maxlength: 80
		});
		$('#currency_form').validate();			 
	});
</script>
</head>
<body>
<div class="editdiv">
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead class="listheader">
			<tr>
				<th style="text-align:left;">
					<s:text name="cc.header.listitle"/>(<s:property value="#request.currencyList.size()"/>)&nbsp;&nbsp;&nbsp;&nbsp;<font color="xff0000">*</font><s:text name="cc.header.required"/>
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent4list" cellpadding="0" width="100%">
		<s:form id="currency_form" namespace="/sc/currency" action="save" theme="simple" method="post">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th><s:text name="cc.header.symble"/></th>
				<th><s:text name="cc.header.description.zh-cn"/></th>
				<th><s:text name="cc.header.description.en-us"/></th>
			</tr>
		</thead>
		<tbody>
			<s:set name="index" value="0"/>
			<s:iterator value="#request.currencyList" var="currencys">
			<input type="hidden" name="currencys[${index}].id" value="<s:property value="#currencys.id"/>"/>
			<input type="hidden" name="currencys[${index}].userId" value="<s:property value="#currencys.userId"/>"/>
			<input type="hidden" name="currencys[${index}].departmentId" value="<s:property value="#currencys.departmentId"/>"/>
			<input type="hidden" name="currencys[${index}].corporationId" value="<s:property value="#currencys.corporationId"/>"/>
			<tr>
				<td>
					<s:if test="#currencys.deleted">
						<INPUT type="checkbox" id="deleted${index}" class="deleted" name="currencys[${index}].deleted" value="true" checked/>
					</s:if>
					<s:else>
						<INPUT type="checkbox" id="deleted${index}" class="deleted" name="currencys[${index}].deleted" value="false"/>
					</s:else>
				</td>
				<td><s:property value="#currencys.symbol" /></td>
				<input type="hidden" id="text" name="currencys[${index}].symbol" value="<s:property value="#currencys.symbol"/>"/>
				<td><input type="text" id="text" name="currencys[${index}].description_zh_CN" value="<s:property value="#currencys.description_zh_CN"/>" /><font color="#ff0000">*</font></td>
				<td><input type="text" id="text" name="currencys[${index}].description_en_US" value="<s:property value="#currencys.description_en_US"/>" /><font color="#ff0000">*</font></td>
			</tr>
			<s:set name="index" value="#index + 1"></s:set>
			</s:iterator>

		</tbody>
		</s:form>
	</table>
	<table>
		<tr>
			<td colspan="4" style="text-align: left;">
				<button value="" id="currency_save" type="button"><s:text name="cc.button.save"/></button>&nbsp;
				<button value="" id="currency_input" type="button"><s:text name="cc.button.input"/></button>&nbsp;
				<button value="" id="currency_delete" type="button"><s:text name="delete"/></button>&nbsp;
				<button value="" id="currency_histroy" type="button"><s:text name="cc.button.histroy"/></button>&nbsp;
			</td>
		</tr>
	</table>
</div>
</body>
</html>