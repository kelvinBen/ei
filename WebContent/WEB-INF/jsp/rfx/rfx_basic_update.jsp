<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更新RFx单据基本信息</title>
	<base target="_self">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
	#tblRFxBasic td{height: 25px;}
	.actionMessage li{color: red;height: 18px;}
</style>
<script type="text/javascript">
$(function(){
	$("#frm").validate({
		onsubmit:false,
		rules:{
			"rfxBasic.headOfficeUserId":{required:true},
			"rfxBasic.rfxType": {required:true},
			"rfxBasic.rfxName": {required:true,maxlength:40},
			"rfxBasic.rfxUniqueId": {required:true,maxlength:50},
			"rfxBasic.procurementClass": {required:true}
		}
	});
	$("#btnCancel").click(function(){
		self.close();
	});
	$("#btnUserSearch").click(function(){
		var url = '<s:url namespace="/user/search" action="toSearchUser"><s:param name="searchType">typeRadio</s:param></s:url>';
		window.open(url,'','dialogWidth=600px;dialogHeight=500px');
		return false;
		
	});
	$("#btnSubmit").click(function(){
		if($("#frm").valid()) //参数验证通过
		{
			jQuery.ajax({
	            url: $("#frm").attr("action") ,   	//提交的页面
	            data: $("#frm").serialize(), 		//从表单中获取数据
	            type: "POST",                   	//设置请求类型为"POST"，默认为"GET"
	            beforeSend: function(){          	//设置表单提交前方法
					$("#trWaiting").show();
					$("#btnSubmit").attr("disabled",true);
					$("#btnCancel").attr("disabled",true);
	            },
	            error: function(request) {          //设置表单提交出错
	                alert('<s:text name="message.save.error" />');
	            },
	            success: function(data) {			//设置表单提交完成使用方法
					$("#trWaiting").hide();
					$("#btnSubmit").attr("disabled",false);
					$("#btnCancel").attr("disabled",false);
					
					var reg=new RegExp("^01"); //成功
					if(reg.test(data))
					{
						alert("所选采办申请更新RFx单据成功，请继续处理");
						self.close();
						return;
					}
					reg=new RegExp("^02"); //失败
					if(reg.test(data)){
						var errMessage = "更新RFx失败:\n";
						errMessage += data.replace(new RegExp("^02:"),"");
						alert(errMessage);
						return;
					}
					reg=new RegExp("^03"); //校验
					if(reg.test(data)){
						alert(data.replace(new RegExp("^03:"),""));
						return;
					}
	            }
	        });
		}
	});

	if($("[name='applyOrg']").val().length==0){
		var applyOrg = decodeURI($.query.get("orgNames"));
		$("[name='applyOrg']").val(applyOrg);
	}

	//若POST参数中的集采标识为空，则从GET参数中获取
	if($.trim($("[name='rfxBasic.centralFlag']").val()).length == 0){
		$("[name='rfxBasic.centralFlag']").attr("value",$.query.get("rfxBasic.centralFlag"));
	}
});
function addStaff(result){
	if(result != null)
	{
		$("input[name='rfxBasic.headOfficeUserId']").val(result[0].id.toLowerCase());
	}
}
</script>
</head>
<body>
<br/>
<s:form id="frm" namespace="/rfx" action="rfx_update" theme="simple">
<s:actionmessage />
<table width="98%" align="center" id="tblRFxBasic">
	<s:if test="centralLogin">
		<tr>
			<td>集团采办部采购中心人员的系统ID：<span style="color: red;">*</span></td>
			<td>
				<s:textfield name="rfxBasic.headOfficeUserId" theme="simple"></s:textfield><input id="btnUserSearch" type="button" value="查找"/>
			</td>
		</tr>
	</s:if>
	<tr>
		<td>RFx单据类型：<span style="color: red;">*</span></td>
		<td>
			<s:if test="rfxBasic.procurementType == '询价' && !exceedLimit">
				<s:select name="rfxBasic.rfxType" list="#{'RFQ':'RFQ','RFP':'RFP'}" theme="simple"></s:select>
			</s:if>
			<s:elseif test="rfxBasic.procurementType == '议标' && !exceedLimit">
				<s:select name="rfxBasic.rfxType" list="#{'RFP':'RFP','RFQ':'RFQ'}" theme="simple"></s:select>
			</s:elseif>
			<s:elseif test="rfxBasic.procurementType == '询价'">
				<s:select name="rfxBasic.rfxType" value="RFQ" list="#{'RFQ':'RFQ','RFP':'RFP'}" theme="simple" disabled="true"></s:select>
				<s:hidden name="rfxBasic.rfxType" value="RFQ"></s:hidden>
			</s:elseif>
			<s:elseif test="rfxBasic.procurementType.startsWith('定单')">
				<s:select name="rfxBasic.rfxType" list="#{'RFP':'RFP','RFQ':'RFQ'}" theme="simple"></s:select>
			</s:elseif>
			<s:else>
				<s:select name="rfxBasic.rfxType" value="RFP" list="#{'RFP':'RFP','RFQ':'RFQ'}" theme="simple" disabled="true"></s:select>
				<s:hidden name="rfxBasic.rfxType" value="RFP"></s:hidden>
			</s:else>
		</td>
	</tr>
	<tr>
		<td>待更新RFx名称：<span style="color: red;">*</span></td>
		<td>
			<s:textfield name="rfxBasic.rfxName" theme="simple"></s:textfield>
		</td>
	</tr>
	<tr>
		<td colspan="2">命名规则：公司简称-(项目或部门)-采办内容-创建RFx日期</td>
	</tr>
	<tr>
		<td>待更新RFx唯一标识符：<span style="color: red;">*</span></td>
		<td>
			<s:textfield name="rfxBasic.rfxUniqueId" theme="simple"></s:textfield>
		</td>
	</tr>
	<tr>
		<td colspan="2">命名规则：SAP公司代码-Emptoris登录ID-日期-3位流水号</td>
	</tr>
	<tr>
		<td>采办分类：<span style="color: red;">*</span></td>
		<td>
			<s:select name="rfxBasic.procurementClass" list="#{'货物':'货物','服务':'服务','工程':'工程'}" theme="simple"></s:select>
		</td>
	</tr>
	<tr>
		<td colspan="2"><span style="color: red;">*</span>为必填项</td>
	</tr>
	<tr id="trWaiting" style="display: none;">
		<td colspan="2" align="center">
				<img src="<s:url value="/images/loading.gif"/>"> &nbsp;正在更新寻源单据，请稍后……
		</td>
	</tr>
	<tr>
		<td colspan="2" height="10">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input id="btnSubmit" type="button" value="确定"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="btnCancel" type="button" value="取消"/>
		</td>
	</tr>
</table>
	<s:hidden name="prIds" id="prIds"></s:hidden>
	<s:hidden name="rfxBasic.centralFlag" id="hdncentralFlag"></s:hidden>
	<s:hidden name="rfxBasic.procurementType"></s:hidden>
	<s:hidden name="rfxBasic.procurementAttribute"></s:hidden>
	<s:hidden name="rfxBasic.recommendedSuppliers"></s:hidden>
	
	<s:hidden name="deliveryDate"></s:hidden>
	<s:hidden name="exceedLimit"></s:hidden>
	<s:hidden name="applyOrg"></s:hidden>
	<s:hidden name="supplierInfo" id="supplierInfo"></s:hidden>
</s:form>
</body>
</html>