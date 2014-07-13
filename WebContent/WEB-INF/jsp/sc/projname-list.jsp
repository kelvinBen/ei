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
		$("#button_input").click(function(){
			$("input[name='ids']").attr("checked",$(this).attr("checked"));
			$("#mainForm").attr("action",'<s:url namespace="/sc/projname" action="input"/>');
			$("#mainForm").submit();
			return false;
		});
		$("#button_update").click(function(){
			if($("input[id='ids']:checked").length == 0){
				alert('<s:text name="message.edit.checked" />');
				return false;
			}
			if($("input[id='ids']:checked").length > 1){
				alert('<s:text name="message.edit.onlyone" />');
				return false;
			}
			$("#mainForm").attr("action",'<s:url namespace="/sc/projname" action="input"/>');
			$("#mainForm").submit();
			return false;
		});
		$("#button_delete").click(function(){
			if ($("input:checkbox:checked").length == 0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}
			if(confirm("确定删除选中的项目名称，是否继续？")){
				$("#mainForm").attr("action",'<s:url namespace="/sc/projname" action="delete"/>');
				$("#mainForm").submit();
			}
			return false;
		});
		$("#button_histroy").click(function(){
			window.location.href="<s:url namespace="/history/common" action="list"><s:param name="targetClazz">ProjName</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
			return false;
		});
		$("#button_import").click(function(){
			window.location.href="<s:url namespace="/excel" action="initProjName"><s:param name="dataType">projName</s:param></s:url>";
			return false;
		});
		$("input.deleted").click(function(){
		    if(this.checked){
			    $(this).attr("value","true");
		    }else if(!this.checked){
			    $(this).attr("value","false");
		    }
		 });
		jQuery.validator.addClassRules("t1", {
			  required: true,
			  maxlength: 80
		});
		$('#mainForm').validate();			 
		$("#selectall").click(function(){ 
			$("input[name='ids']").attr("checked",$(this).attr("checked")); 
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
		<tbody>
			<tr height="30">
				<td>&nbsp;</td>
				<td><s:select id="organId" list="orderIdNameMap" listKey="key" listValue="value" name="entity.organId" value="#request.entity.organId" /></td>
				<td><s:textfield cssClass="inputnormal" name="entity.code" id="entityCode"/></td>
				<td><s:textfield cssClass="inputnormal" name="entity.name" id="entityName"/></td>
				<td colspan="2">&nbsp;<button id="button_search" type="submit">搜索</button></td>
			</tr>
			<tr>
				<th><input type="checkbox" id="selectall"></input></th>
				<th>业务单位</th>
				<th>项目名称编号</th>
				<th>项目名称</th>
				<th>预算金额(CNY)</th>
				<th>预算金额(USD)</th>
			</tr>
			<s:iterator value="projNameList" var="item">
			<tr>
				<td>
				<input type="checkbox" id="ids" name="ids" value="<s:property value="id"/>">
				</td>
				<td><s:property value="#item.organName" /></td>
				<td><s:property value="#item.code" /></td>
				<td><s:property value="#item.name" /></td>
				<td><s:property value="#item.budgetCny" /></td>
				<td><s:property value="#item.budgetUsd" /></td>
			</tr>
			</s:iterator>

		</tbody>
		</s:form>
	</table>
	<table>
		<tr>
			<td colspan="4" style="text-align: left;">
				<button id="button_input" type="button"><s:text name="create"/></button>&nbsp;
				<button id="button_update" type="button"><s:text name="update"/></button>&nbsp;
				<button id="button_delete" type="button"><s:text name="delete"/></button>&nbsp;
				<!--button id="button_histroy" type="button"><s:text name="cc.button.histroy"/></button-->&nbsp;
				<button id="button_import" type="button">批量导入</button>&nbsp;
			</td>
		</tr>
	</table>
</div>
</body>
</html>