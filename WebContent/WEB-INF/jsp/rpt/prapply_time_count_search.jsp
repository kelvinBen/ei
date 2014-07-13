<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>采办申请时间统计报表</title>
	<base target="_self">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
	#tblSearch td{height: 25px;}
	.actionMessage li{color: red;height: 18px;}
</style>
<script type="text/javascript">
$(function(){
	$("#pr_begin").focus();
	$("#search").click(function(){
		$("#frm").submit();
	});
	$("#frm").validate({
		rules: {
			'maxResult':{
				required: false,
				digits:true
			},
			'applydate':{
				required: false,
				digits:false
			}
		}
	});
	$("#prapply_operator").change(function(){
		if(($("#prapply_operator").val()=='gt')||($("#prapply_operator").val()=='lt')){
			$("#prapply_end").attr("disabled","disabled");
		}
		return false;
	});

});

</script>
</head>
<body>
	<div class="editdiv">
<s:form id="frm" namespace="/rpt" action="prapply_time_count_list" theme="simple">
<input type="hidden" name="procurementOperator" value=""/>
	<s:actionmessage />
		<table class="tblContent" width="100%" cellpadding="0">
	<tr>
		<td colspan="2" style="text-align:right; width:100%; border-bottom:#8db1d1 1px solid;">
		  <button type="button" id="search"><s:text name="pr.search.now"/></button>
		</td>
	</tr>
	<tr>
		<th colspan="2" class="tdTitle" style="height:26px;">采办申请搜索</th>
	</tr>
	<tr>
		<th class="tdTitle">采办申请号码</th>
		<td class="TdRight">
			<s:select name="prappRange.operator" list="#{'between':'[,]','gt':'>','lt':'<'}" theme="simple" id="prapply_operator"></s:select>
			<s:textfield name="prappRange.begin" theme="simple" id="prapply_begin"></s:textfield>
			<s:textfield name="prappRange.end" theme="simple" id="prapply_end"></s:textfield>
		</td>
	</tr>
	<tr>
		<th class="tdTitle">申请日期(格式如：20110101)</th>
		<td class="TdRight">
			<s:textfield name="applydate" theme="simple"  id="applydate"></s:textfield>
		</td>
	</tr>
	<tr>
		<th class="tdTitle">最大命中数量</th>
		<td class="TdRight">
			<s:textfield name="maxResult" theme="simple"></s:textfield>
		</td>
	</tr>
</table>
</s:form>
    </div>      
</body>
</html>