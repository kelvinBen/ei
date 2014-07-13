<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>采办申请时间统计报表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#tab_cont').flexigrid();//表格中的TH必须加宽度

		$("#create_new").click(function(){
			location.href = '<s:url namespace="/rpt" action="prapply_time_count_search"/>';
			return false;
		});
	});
</script>
</head>
<body>
<s:form id="frm" namespace="/rpt" action="prapply_time_count_list" theme="simple">
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
			<th width="150">采办申请编号</th>
			<th width="150">采办内容</th>
			<th width="150">申请单位</th>
			<th width="150">申请日期</th>
			<th width="150">审批流程时间（日）</th>			
			<th width="150">开始日期</th>
			<th width="150">结束日期</th>
			<th width="150">审批人ID</th>
		</tr>
	</thead>
	<tbody>
	<s:iterator value="list" var="item">
		<tr>
			<td><s:property value="#item.fld_applyno"/></td>
			<td><s:property value="#item.fld_purc_content"/></td>
			<td><s:property value="#item.fld_apply_organ"/></td>
			<td><s:property value="#item.fld_date"/></td>
			<td><s:property value="#item.days"/></td>			
			<td><s:property value="#item.started_date"/></td>
			<td><s:property value="#item.last_state_date"/></td>
			<td><s:property value="#item.users"/></td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
</div>
</s:form>
</body>
</html>