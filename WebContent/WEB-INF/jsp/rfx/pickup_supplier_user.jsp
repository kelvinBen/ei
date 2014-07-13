<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>确认供应商联系人</title>
	<base target="_self">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
	.actionMessage li{color: red;height: 18px;}
	.tblContent th{font-weight: bold;text-align: center;height: 25px;}
	.tblContent td{text-align: center;height: 23px;}
</style>
<script type="text/javascript">
$(function(){
	$("#btnCancel").click(function(){
		self.close();
	});
	//提交
	$("#btnSubmit").click(function(){
		var allChecked = true;
		$("input[name='supplierName']").each(function(){
			allChecked = allChecked && userChecked($(this).val());
		});

		if(!allChecked){
			alert("还有供应商没有确认联系人！");
		}else
		{
			var supplierName; //供应商名称
			var userName = ""; //用户名称
			var supplierInfo = ""; //供应商信息字符串
			$("input[name='supplierName']").each(function(){
				supplierName = $(this).val();
				userName = "";
				$("input[name='userId']:checked").each(function(){
					if(supplierName == $(this).parent("td").find("[name='supplierId']").val()){
						userName += "#"+$(this).val();
					}
				});
				supplierInfo += supplierName+userName+";";
			});
			$("#supplierInfo").val(supplierInfo);

			if($("#requestSource").val() == "RFX_CREATE"){
				$("#frm").attr("action",'<s:url namespace="/rfx" action="rfx_basic_create"></s:url>');
			}else{
				$("#frm").attr("action",'<s:url namespace="/rfx" action="rfx_changed_update"></s:url>');
			}
			
			$("#frm").submit();
		}
		/**
		 * 供应商是否已点选用户
		 * @param obj 供应商用户名称
		 */
		function userChecked(obj){
			var hasIt = false;
			$("input[name='userId']:checked").each(function(){
				var supName = $(this).parent("td").find("[name='supplierId']").val();
				if(supName == obj){
					hasIt = true;
				}
			});
			return hasIt;
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
<table border="1" class="tblContent" width="100%" style="text-align: center;">
	<thead>
		<tr class="tdTitle">
			<th>供应商名称</th>
			<th>相应联系人</th>
			<th width="40">&nbsp;</th>
		</tr>
	</thead>
	<tbody>
	<s:iterator value="suppliers" var="item">
		<tr>
			<td>
				<s:property value="#item.companyName"/>&nbsp;
				<input type="hidden" name="supplierName" value="<s:property value="#item.companyName"/>"/>
			</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<s:iterator value="#item.users" var="user">
			<s:if test="#user.approved">
				<tr>
					<td>&nbsp;</td>
					<td><s:property value="#user.firstName"/> &nbsp;<s:property value="#user.lastName"/></td>
					<td>
						<input type="checkbox" name="userId" value="<s:property value="#user.loginName"/>"/>
						<input type="hidden" name="supplierId" value="<s:property value="#item.companyName"/>"/>
					</td>
				</tr>
			</s:if>
		</s:iterator>
	</s:iterator>
	</tbody>
</table>
<br/>
<table width="60%" align="center">
<tr>
	<td align="center" height="30">
		<input id="btnSubmit" type="button" value="确定"/>
	</td>
	<td align="center">
		<input id="btnCancel" type="button" value="取消"/>
	</td>
</tr>
</table>


	<s:hidden name="supplierInfo" id="supplierInfo"></s:hidden>
	<s:hidden name="prIds" id="prIds"></s:hidden>
	<s:hidden name="deliveryDate"></s:hidden>
	<s:hidden name="applyOrg"></s:hidden>
	
	<!-- the action flag domain -->
	<s:hidden name="setting" id="setting"></s:hidden>
	<s:hidden name="supplierSelected" value="true"></s:hidden>
	<s:hidden name="requestSource" id="requestSource"></s:hidden>
	
	<s:hidden name="rfxBasic.centralFlag" id="hdncentralFlag"></s:hidden>
	<s:hidden name="rfxBasic.procurementType"></s:hidden>
</s:form>
</body>
</html>