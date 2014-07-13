<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>未处理的寻源单据列表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
	<script type="text/javascript">
	$(function(){
		$('#tab_cont').flexigrid();
	});
	</script>
</head>
<body>
<s:form id="frm" theme="simple">
<div class="listCon"> 
<table id="tab_cont">
	<thead>
		<tr>
			<th width="100">审批通过日期</th>
			<th width="120">采办申请审批表号码</th>
			<th width="120">申请单位</th>
			<th width="100">申请部门</th>
			<th width="120">项目名称</th>
			<th width="80">本次采办预算</th>
			<th width="120">推荐采办方式</th>
			<th width="80">申请类型</th>
			<th width="120">推荐供应商</th>
			<th width="80">是否集中采购</th>
		</tr>
	</thead>
	<tbody>
	<s:if test="prapplist==null || prapplist.size()==0">
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</s:if>
		<s:set var="endPosition" value="prapplist.size>5 ? 5:prapplist.size"></s:set>
		<s:iterator value="prapplist" var="item" begin="0" end="#endPosition-1">
			<tr>
				<td><s:property value="#item.AUDITING_DATE"/></td>
				<td><s:property value="#item.FLD_APPLYNO"/></td>
				<td><s:property value="#item.FLD_APPLY_ORGAN"/></td>
				<td><s:property value="#item.FLD_APPLY_DEPTNAME"/></td>
				<td><s:property value="#item.FLD_PROJ_NAME"/></td>
				<td><s:property value="#item.FLD_CURRENT_BUDGET"/></td>
				<td>
					<s:property value="#item.FLD_RECOMMEND_MODE"/>
				</td>
				<td>
					<s:property value="#item.FLD_APPLY_TYPE"/>
				</td>
				<td>
					<s:property value="#item.FLD_BIDVENDOR_REAS0N"/>
				</td>
				<td>
					<s:property value="#item.FLD_IS_CENTRAL"/>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
</div>
</s:form>
</body>
</html>