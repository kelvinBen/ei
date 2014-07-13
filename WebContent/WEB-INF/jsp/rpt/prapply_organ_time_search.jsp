<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>审批单位平均审批时间统计报表</title>
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
			'expendLevel':{
				required: false,
				digits:true,
				max:20
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
function U2A(val) {
	var code = val.match(/&#(\d+);/g);
	if (code == null) {
		alert('文本框中没有合法的Unicode代码！');
		return;
	}
	result = '';
	for (var i=0; i<code.length; i++)
		result += String.fromCharCode(code[i].replace(/[&#;]/g, ''));

	return result;
}

function A2U() {
	//ASCII -> Unicode
	if (parseFloat(ScriptEngineMajorVersion() + '.' + ScriptEngineMinorVersion()) < 5.5){
		alert('您的脚本引擎版本过低，请升级为5.5以上');
		return;
	}
	if (source.value == '') {
		alert('文本框中没有代码！');
		return;
	}
	result.value = '';
	for (var i=0; i<source.value.length; i++)
		result.value += '&#' + source.value.charCodeAt(i) + ';';
}
</script>
</head>
<body>
	<div class="editdiv">
<s:form id="frm" namespace="/rpt" action="prapply_organ_time_list" theme="simple">
<input type="hidden" name="procurementOperator" value=""/>
	<s:actionmessage />
		<table class="tblContent" width="100%" cellpadding="0">
	<tr>
		<td colspan="2" style="text-align:right; width:100%; border-bottom:#8db1d1 1px solid;">
		  <button type="button" id="search"><s:text name="pr.search.now"/></button>
		</td>
	</tr>
	<tr>
		<th colspan="2" class="tdTitle" style="height:26px;">时间统计条件</th>
	</tr>
	<tr>
		<th class="tdTitle">展开层数</th>
		<td class="TdRight">
			<s:textfield name="expandLevel" theme="simple" id="expandLevel"></s:textfield>
		</td>
	</tr>
</table>
</s:form>
    </div>      
</body>
</html>