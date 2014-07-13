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
		$("#button_input").click(function(){
			$("input[name='headIds']").attr("checked",$(this).attr("checked"));
			$("#aform").attr("action",'<s:url namespace="/procurementways" action="input"/>');
			$("#aform").submit();
			return false;
		});
		$("#button_update").click(function(){
			if($("input[id='headIds']:checked").length == 0){
				alert('<s:text name="message.edit.checked" />');
				return false;
			}
			if($("input[id='headIds']:checked").length > 1){
				alert('<s:text name="message.edit.onlyone" />');
				return false;
			}
			$("#aform").attr("action",'<s:url namespace="/procurementways" action="input"/>');
			$("#aform").submit();
			return false;
		});
		$("#button_delete").click(function(){
			if ($("input:checkbox:checked").length == 0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}
			if(confirm("确定删除选中的采办方式，是否继续？")){
				$("#aform").attr("action",'<s:url namespace="/procurementways" action="delete"/>');
				$("#aform").submit();
			}
			return false;
		});
		$("#button_histroy").click(function(){
			window.location.href="<s:url namespace="/history/common" action="list"><s:param name="targetClazz">ProcurementWays</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
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
			 $("#aform").attr("action",'<s:url namespace="/sc/currency" action="list"/>');
			 $("#aform").submit();
		 });
		jQuery.validator.addClassRules("t1", {
			  required: true,
			  maxlength: 80
		});
		$('#aform').validate();			 
		$("#selectall").click(function(){ 
			$("input[name='headIds']").attr("checked",$(this).attr("checked")); 
		}); 
	});
</script>
</head>
<body>
<div class="editdiv">
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead class="listheader">
			<tr>
				<th style="text-align:left;">
					采办方式清单(<s:property value="#request.currencyList.size()"/>)&nbsp;&nbsp;&nbsp;&nbsp;<font color="xff0000">*</font><s:text name="cc.header.required"/>
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent4list" cellpadding="0" width="100%">
		<s:form id="aform" namespace="/procurementways" action="list" theme="simple" method="post">
		<thead>
			<tr>
				<th><input type="checkbox" id="selectall"></input></th>
				<th>采办方式编号</th>
				<th>采办方式</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="headList" var="head">
			<tr>
				<td>
				<input type="checkbox" id="headIds" name="headIds" value="<s:property value="id"/>">
				</td>
				<td><s:property value="#head.no" /></td>
				<td><s:property value="#head.name" /></td>
			</tr>
			</s:iterator>

		</tbody>
		</s:form>
	</table>
	<table>
		<tr>
			<td colspan="4" style="text-align: left;">
				<button id="button_input" type="button"><s:text name="create"/></button>&nbsp;
				<button id="button_update" type="button"><s:text name="update"/></button>&nbsp;
				<button id="button_delete" type="button"><s:text name="delete"/></button>&nbsp;
				<button id="button_histroy" type="button"><s:text name="cc.button.histroy"/></button>&nbsp;
			</td>
		</tr>
	</table>
</div>
</body>
</html>