<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>状态跟踪报表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#tab_cont').flexigrid();//表格中的TH必须加宽度

		$("#create_new").click(function(){
			location.href = '<s:url namespace="/rpt" action="status_trace_search"/>';
			return false;
		});
	});
</script>
</head>
<body>
<s:form id="frm" namespace="/rpt" action="status_trace_list" theme="simple">
<div class="title">
<table>
  <thead>
  <tr>
	<th style="white-space:nowrap;text-align:left">
	  <button type="button" class="butCss" id="create_new"><s:text name="menu.pr.jquery"/></button>		      
	</th>		    		    		    		  
  </tr>
  </thead>
</table>
</div>
<div class="listCon"> 
	<table id="tab_cont">
	<thead>
		<tr>
			<th width="100">公司代码</th>
			<th width="100">公司名称</th>
			<th width="100">采办需求编号</th>
			<th width="80">采办需求内容</th>
			<th width="100">采办需求行项目</th>
			<th width="80">采办需求申请人</th>
			<th width="100">采办需求申请部门（采购组描述）</th>
			<th width="80">物料编码</th>
			<th width="100">描述</th>
			<th width="100">类别</th>
			<th width="100">类别描述</th>
			<th width="100">采办需求数量</th>
			<th width="100">计量单位</th>
			<th width="100">预估金额（单价）</th>
			<th width="100">预估金额币种</th>
			<th width="100">预估金额总价</th>
			<th width="100">采办需求创建日期</th>
			<th width="100">合并状态</th>
			<th width="100">合并序号</th>
			<th width="100">分派状态</th>
			<th width="100">采办经办人</th>
			<th width="100">采办申请审批表号码</th>
			<th width="100">采办方式</th>
			<th width="100">审批状态</th>
			<th width="100">审批日期</th>
			<th width="100">RFP名称</th>
			<th width="100">RFP唯一标示符</th>
			<th width="100">采办分类</th>
			<th width="100">采办属性</th>
			<th width="100">RFP状态</th>
			<th width="100">合同名称</th>
			<th width="100">合同号码</th>
			<th width="100">SAP采购订单/长期协议号码</th>
			<th width="100">合同类型</th>
			<th width="100">供应商号码</th>
			<th width="100">供应商名称</th>
			<th width="100">合同金额</th>
			<th width="100">签订日期</th>
			<th width="100">合同归档编号</th>
			<th width="100">合同状态</th>
		</tr>
	</thead>
	<tbody>
	<s:iterator value="list" var="item">
		<tr>
			<td><s:property value="#item.COMPANY_CODE"/></td>
			<td><s:property value="#item.COMPANY_NAME"/></td>
			<td><s:property value="#item.prId"/></td>
			<td><s:property value="#item.PR_CONTENT"/></td>
			<td><s:property value="#item.priId"/></td>
			<td><s:property value="#item.PR_APPLIER"/></td>
			<td><s:property value="#item.PR_DEPART"/></td>
			<td><s:property value="#item.MATERAIL_NO"/></td>
			<td><s:property value="#item.MATERAIL_DESC"/></td>
			<td><s:property value="#item.MATERIAL_GROUP_NO"/></td>
			<td><s:property value="#item.MATERIAL_GROUP_DESC"/></td>
			<td><s:property value="#item.PR_LINE_QUANTITY"/></td>
			<td><s:property value="#item.PR_LINE_UNIT"/></td>
			<td><s:property value="#item.PR_LINE_PRICE"/></td>
			<td><s:property value="#item.PR_LINE_CURRENCY"/></td>
			<td><s:property value="#item.PR_LINE_AMOUNT"/></td>
			<td><s:property value="#item.PR_LINE_CREATE_DATE"/></td>
			<td>
				<s:if test="#item.mergeStat==\"1\"">合并</s:if>
				<s:else>未合并</s:else>
			</td>
			<td><s:property value="#item.mergeNum"/></td>
			<td>
			<s:if test="#item.divStat==\"1\"">已确认分派</s:if>
			<s:else>未确认分派</s:else>
			</td><!-- 分派状态 -->
			<td><s:property value="#item.purchaser"/></td>
			<td><s:property value="#item.reqId"/></td>
			<td><s:property value="#item.reqMode"/></td>
			<td>
				<s:if test="#item.appStat==\"1\"">审批中</s:if>
				<s:elseif test="#item.appStat==\"1\"">审批中</s:elseif>
				<s:elseif test="#item.appStat==\"2\"">审批通过</s:elseif>
				<s:elseif test="#item.appStat==\"3\"">审批退回</s:elseif>
				<s:elseif test="#item.appStat==\"4\"">已变更</s:elseif>
				<s:elseif test="#item.appStat==\"-1\"">删除</s:elseif>
				<s:else>新建</s:else>
			</td><!-- 采办申请状态 -->
			<td><s:property value="#item.appDate"/></td>
			<td><s:property value="#item.rfxName"/></td>
			<td><s:property value="#item.RfxUniqueId"/></td>
			<td><s:property value="#item.rfxClass"/></td>
			<td><s:property value="#item.rfxProperty"/></td>
			<td><s:property value="#item.rfxStatus"/></td>
			<td><s:property value="#item.contractName"/></td>
			<td><s:property value="#item.contractNumber"/></td>
			<td><s:property value="#item.ecmSapContractNo"/></td>
			<td><s:property value="#item.contractClass"/></td>
			<td><s:property value="#item.contractSupplierId"/></td>
			<td><s:property value="#item.contractSupplierName"/></td>
			<td><s:property value="#item.contractTotal"/></td>
			<td><s:property value="#item.signatureDate"/></td>
			<td><s:property value="#item.sapContractNo"/></td>
			<td><s:property value="#item.contractStatus"/></td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
</div>
</s:form>
</body>
</html>