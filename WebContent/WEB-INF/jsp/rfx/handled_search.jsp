<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>已处理寻源单据查询</title>
	<base target="_self">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
	#tblSearch td{height: 25px;}
	.txtDisabled {background-color: #d8d8d8;border-width: 1px;}
	.actionMessage li{color: red;height: 18px;}
</style>
<script type="text/javascript">
$(function(){
	$("#rfxName").focus();
	$("#search").click(function(){
		$("#frm").submit();
	});
	$("#frm").validate({
		rules: {'maxResult':{digits:true}}
	});

	$("#btnUserSearch").click(function(){
		var url = '<s:url namespace="/user/search" action="toSearchUser"><s:param name="searchType">typeRadio</s:param></s:url>';
		window.open(url,
				'toUserSearch',
				'height=500px, width=400px, top=100, left=250, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
		return false;	
	});
	
	$("#cancel").click(function(){
		location.href = '<s:url namespace="/rfx" action="handled_list"/>';
		return false;
	});

	function alterDisable(obj){
		obj.addClass("txtDisabled");
		obj.attr("disabled","disabled");
	}
	function alterEnable(obj){
		obj.removeClass("txtDisabled");
		obj.removeAttr("disabled");
	}

	$("#rfxCreateDate_begin").datepicker({dateFormat:'yy-mm-dd'});
	$("#rfxCreateDate_end").datepicker({dateFormat:'yy-mm-dd'});
	
	$("select[id$='_operator']").each(function(i,obj){
		$(this).change(function(){
			if($(this).val()=='gt' || $(this).val()=='lt'){
				alterDisable($("#"+$(this).attr("id").replace("_operator","_end")));
			}else
			{
				alterEnable($("#"+$(this).attr("id").replace("_operator","_end")));
			}
		});
		/*
		 * 初始化页面时设置_end的状态
		 */
		if($(this).val()=='gt' || $(this).val()=='lt'){
			alterDisable($("#"+$(this).attr("id").replace("_operator","_end")));
		}else
		{
			alterEnable($("#"+$(this).attr("id").replace("_operator","_end")));
		}
	});
});

function addStaff(result){
	if(result != null)
	{
		$("input[name='procurementOperator']").val(result[0].id.toLowerCase());
		$("input[name='procurementOperatorName']").val(U2A(result[0].name));
	}
}

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
<s:form id="frm" namespace="/rfx" action="handled_list" theme="simple">
	<input type="hidden" name="procurementOperator" value=""/>
	<s:actionmessage />
		<table class="tblContent" width="100%" cellpadding="0">
	<tr>
		<td colspan="2" style="text-align:right; width:100%; border-bottom:#8db1d1 1px solid;">
		  <button type="button" id="search"><s:text name="pr.search.now"/></button>
		  <button type="button" id="cancel"><s:text name="button.cancel"/></button>
		</td>
	</tr>
	<tr>
		<th colspan="2" class="tdTitle" style="height:26px;">搜索已处理寻源单据</th>
	</tr>
	<tr>
		   <th class="tdTitle">RFx名称</th>
		<td class="TdRight">
			<s:textfield name="rfxName" theme="simple" id="rfxName"></s:textfield>
		</td>
	</tr>
	<tr>
		<th class="tdTitle">RFx唯一标识符</th>
		<td class="TdRight">
			<s:textfield name="rfxUniqueId" theme="simple" id="rfxUniqueId"></s:textfield>
		</td>
	</tr>
	<tr>
		<th class="tdTitle">工厂</th>
		<td class="TdRight">
			<s:select name="factory.operator" list="#{'between':'[,]','gt':'>','lt':'<'}" theme="simple" id="factory_operator"></s:select>
			<s:textfield name="factory.begin" theme="simple" id="factory_begin"></s:textfield>
			<s:textfield name="factory.end" theme="simple" id="factory_end"></s:textfield>
		</td>
	</tr>
	<tr>
		<th class="tdTitle">采购组</th>
		<td class="TdRight">
			<s:select name="procurementGroup.operator" list="#{'between':'[,]','gt':'>','lt':'<'}" theme="simple" id="procurementGroup_operator"></s:select>
			<s:textfield name="procurementGroup.begin" theme="simple" id="procurementGroup_begin"></s:textfield>
			<s:textfield name="procurementGroup.end" theme="simple" id="procurementGroup_end"></s:textfield>
		</td>
	</tr>
	<tr>
		<th class="tdTitle">物料代码</th>
		<td class="TdRight">
			<s:select name="material.operator" list="#{'between':'[,]','gt':'>','lt':'<'}" theme="simple" id="material_operator"></s:select>
			<s:textfield name="material.begin" theme="simple" id="material_begin"></s:textfield>
			<s:textfield name="material.end" theme="simple" id="material_end"></s:textfield>
		</td>
	</tr>
	<tr>
		<th class="tdTitle">RFx创建日期</th>
		<td class="TdRight">
			<s:select name="rfxCreateDate.operator" list="#{'between':'[,]','gt':'>','lt':'<'}" theme="simple" id="rfxCreateDate_operator"></s:select>
			<s:textfield name="rfxCreateDate.begin" theme="simple" id="rfxCreateDate_begin"></s:textfield>
			<s:textfield name="rfxCreateDate.end" theme="simple" id="rfxCreateDate_end"></s:textfield>
		</td>
	</tr>
	<tr>
		<th class="tdTitle">采办经办人姓名</th>
		<td class="TdRight">
			<s:textfield name="procurementOperatorName" theme="simple"></s:textfield><input type="button" value="搜索" id="btnUserSearch">
			&nbsp;
		</td>
	</tr>
	<tr>
		<th class="tdTitle">最大命中数量</th>
		<td class="TdRight">
			<s:textfield name="maxResult" theme="simple"></s:textfield>
		</td>
	</tr>
</table>
	<s:hidden name="slcDeleted"></s:hidden>
</s:form>
    </div>      
</body>
</html>