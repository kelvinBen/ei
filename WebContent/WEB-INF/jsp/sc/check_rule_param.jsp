<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>校验规则的关键指标设置</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
$(function(){
	$("#frm_checkrule").validate({
		errorLabelContainer: "#messageBox",
		wrapper: "li",
		rules:{
			"setting.days": {
				required: "input[name='setting.prompt'][value='true']:checked",
				digits:true,
				range: [1, 365]
			}
		},
		messages:{
			"setting.days": {
				required: "请在填写框中填入天数",
				digits:"请填写1-365之间的整数",
				range:"请填写1-365之间的整数"
			}
		}
	});
	
	$("input[name='setting.prompt']").click(function(){
		$("input[name='setting.days']").attr("disabled",$(this).val()=="false");
		$("input[name='setting.ignored']").attr("disabled",$(this).val()=="false");
	});
	
	if($("input[name='setting.prompt']:checked").val()=="false")
	{
		$("input[name='setting.days']").attr("disabled",true);
		$("input[name='setting.ignored']").attr("disabled",true);
	}
	$("#button_histroy").click(function(){
		window.location.href="<s:url namespace="/history/common" action="list"><s:param name="targetClazz">CheckRoleParam</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
		return false;
	});
});
</script>
</head>
<body>
<s:form id="frm_checkrule" namespace="/sc/checkrule" action="save" theme="simple">
<div class="editdiv">
	<br />
	<ul id="messageBox"></ul> 
	<table class="tblContent4list" cellpadding="0" width="100%">
		<col width="400"/>
		<col width="400"/>
		<thead>
		<tr>
			<th colspan="2">
				请设置是否需要在提交采办申请审批表时给予提示，如果选择“提示”，请填写相关信息
			</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>
				<s:radio name="setting.prompt" list="#{'true':'提示</td><td>','false':'不提示'}"/>
			</td>
		</tr>
		<tr>
			<td style="text-align:left;line-height: 30px;padding-top: 10px;padding-right: 25px;padding-bottom: 10px;padding-left: 25px;">
				在采办申请审批表中，如果交货/服务时间与提交审批日期之间的间隔小于：
				<s:textfield name="setting.days" size="3"/>天
				<br>
				则在提交审批的时候需要给予提示，同时，请设置是否必须对采办申请审批表作出修改：
				<br>
				<s:radio name="setting.ignored" list="#{'false':'必须修改','true':'可以跳过'}"/>
			</td>
			<td>
				&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:left">
				<s:submit value="保存"/> <input  type="button" value="退出"/> <button id="button_histroy" type="button"><s:text name="cc.button.histroy"/></button>
			</td>
		</tr>
		</tbody>
	</table>
</div>
</s:form>
</body>
</html>