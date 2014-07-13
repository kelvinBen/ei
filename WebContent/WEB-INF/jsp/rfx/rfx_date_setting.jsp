<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>交货日期变更</title>
	<base target="_self">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
	#tblRFxBasic td{height: 25px;}
	.actionMessage li{color: red;height: 18px;}
</style>
<script type="text/javascript">
$(function(){
	//$("#deliveryDate").attr("value",$.datepicker.formatDate("yy/mm/dd", new Date()));
	$("#frm").validate({
		onsubmit:false,
		rules:{
			"deliveryDate":{
				required:true,
				dateISO:true
			}
		},
		messages:{
			"deliveryDate":{
				required:"<br/>请填写交货日期",
				dateISO:"<br/>日期格式填写不正确，请以YYYY-MM-DD格式填写。"
			}
		}
	});
	$("#deliveryDate").datepicker({dateFormat:'yy-mm-dd'});
	$("#btnCancel").click(function(){
		self.close();
	});
	//提交
	$("#btnSubmit").click(function(){
		if($("#frm").valid())
		{
			if(new Date(Date.parse($("#deliveryDate").val().replace("-", "/")))>new Date())
			{
				if($.query.get("a")=="u"){ //Action为更新RFx
					$("#frm").attr("action",'<s:url namespace="/rfx" action="rfx_edit" />');
				}
				$("#frm").submit();
			}else
			{
				alert("交货日期必须大于当前日期");
			}
		}
	});

	if($("[name='applyOrg']").val().length==0){
		var applyOrg = decodeURI($.query.get("orgNames"));
		$("[name='applyOrg']").val(applyOrg);
	}
});
</script>
</head>
<body>
<br/>
<s:form id="frm" namespace="/rfx" action="rfx_basic_create" theme="simple">
<s:actionmessage />
<table width="98%" align="center" id="tblRFxBasic">
	<tr>
		<td colspan="2">有行项目的交货日期有小于等于当前日期情况，请选择一个未来日期</td>
	</tr>
	<tr>
		<td>交货日期：<span style="color: red;">*</span></td>
		<td>
			<s:textfield id="deliveryDate" name="deliveryDate" theme="simple"></s:textfield>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" height="30">
			<input id="btnSubmit" type="button" value="确定"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="btnCancel" type="button" value="取消"/>
		</td>
	</tr>
</table>
	<s:hidden name="prIds" id="prIds"></s:hidden>
	<s:hidden name="rfxBasic.centralFlag" id="hdncentralFlag"></s:hidden>
	<s:hidden name="setting" id="setting" value="0"></s:hidden>
	<s:hidden name="supplierSelected"></s:hidden>
	<s:hidden name="applyOrg"></s:hidden>
	
	<s:hidden name="rfxBasic.procurementType"></s:hidden>
	<s:hidden name="rfxBasic.procurementAttribute"></s:hidden>
	<s:hidden name="rfxBasic.recommendedSuppliers"></s:hidden>
</s:form>
</body>
</html>