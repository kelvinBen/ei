<%@ page pageEncoding="UTF-8" isELIgnored="false"%> 
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pri.list" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#bt_ok").click(function(){
			if($("input[id='id']:checked").length == 0){
				alert('请选择纪录');
				return false;
			}else{
				var strNum = $("input[name='id']:checked").val();
				var projName = $("#" + strNum + "_name").val();
				var result = {};
				result.id = strNum;
				result.projName = projName;
				window.returnValue = result;
				window.close();
			}
		});
		$("#bt_cancel").click(function(){
			window.close();
		});
	});
</script>
</head>
<body>
<div class="editdiv">
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead class="listheader">
			<tr>
				<th style="text-align:left;">
					项目名称清单(<s:property value="#request.projNameList.size()"/>)&nbsp;&nbsp;&nbsp;&nbsp;<font color="xff0000">*</font><s:text name="cc.header.required"/>
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent4list" cellpadding="0" width="100%">
		<s:form id="mainForm" namespace="/sc/projname" action="list" theme="simple" method="post">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th>业务单位</th>
				<th>项目名称编号</th>
				<th>项目名称</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="projNameList" var="item">
			<tr>
				<td>
				<input type="radio" id="id" name="id" value="<s:property value="id"/>">
				</td>
				<td><s:property value="#item.organName" /></td>
				<td><s:property value="#item.code" /></td>
				<td><s:property value="#item.name" /></td>
				<input type="hidden" id="<s:property value="id"/>_name" value="<s:property value="name"/>"/>
			</tr>
			</s:iterator>

		</tbody>
		</s:form>
	</table>
	<table>
		<tr>
			<td colspan="4" style="text-align: left;">
				&nbsp;&nbsp;<input id="bt_ok" type="button" value='确定' />
				&nbsp;&nbsp;<input id="bt_cancel" type="button" value='取消' />
			</td>
		</tr>
	</table>
</div>
</body>
</html>