<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>长期协议维护列表</title>
		<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
		<script type="text/javascript">
$(function() {
	initPage();
	$('#tab_cont').flexigrid();//必须放在前面，不然那会影响后面的js操作。
	$('SELECT.changeSelect').each(
			function(i, obj) {
				obj.onchange = function() {
					$("#list").attr("action",
							'<s:url namespace="/pr/manage" action="list"/>');
					$('#list').submit();
				};
			});

	//全部选择
	$('#selectAll').change(function() {
		if ($(this).attr("checked") == false) {
			$('input:checkbox').each(function(i, obj) {
				$(this).attr("checked", false);
			});
		} else if ($(this).attr("checked") == true) {
			$('input:checkbox').each(function(i, obj) {
				$(this).attr("checked", true);
			});
		}
	});

	$('#search_all').click(
			function() {
				$('SELECT.changeSelect').each(
						function() {
							$(this).attr("value",
									$(this).children().first().attr("value"));
						});
				$("#list").attr("action",
						'<s:url namespace="/pr/manage" action="list"/>');
				$('#list').submit();
			});

	$('input:checkbox').each(function(i, obj) {
		$(this).attr("checked", false);
	});

	$("#export_selected").click(
			function() {
				if ($("input:checkbox:checked").length == 0) {
					alert('<s:text name="message.select.one"/>');
					return false;
				}

				$("#list").attr("action",
						'<s:url namespace="/pr/manage" action="export"/>');
				$("#list").submit();
				return false;
			});

	$("#delete_selected").click(function() {
		if ($("input:checkbox:checked").length == 0) {
			alert('<s:text name="message.select.one"/>');
			return false;
		}

		//判断被删除项的状态,已经提交或者已经删除的项，不能再被删除
			for ( var i = 0; i < $("input:checkbox:checked").length; i++) {
				var obj = $("input:checkbox:checked").get(i);
				var id = obj.value;
				var prefx = id.substring(0, 4);
				id = id.substr(5);
				if (prefx == "item") {
					var delStat = $("#item_delstat_" + id).val();
					if (delStat == "1") {
						alert('<s:text name="pr.manage.deleted"/>');
						return false;
					}
					var subStat = $("#item_substat_" + id).val();
					if (subStat == "4" || subStat == "5" || subStat == "-1") {
						alert('<s:text name="pr.manage.submited"/>');
						return false;
					}
				} else if (prefx == "purc") {
					alert('<s:text name="pr.manage.notice.is.header"/>');
					return false;
				}
			}

			if (confirm('<s:text name="message.confirm.delete"/>')) {
				$("#list").attr("action",
						'<s:url namespace="/pr/manage" action="delete"/>');
				$("#list").submit();
			}
			return false;
		});

	$("#create_new")
			.click(
					function() {
						window
								.open(
										'<s:url namespace="/pr/manage" action="toDetail"></s:url>',
										'<s:text name="menu.pri.create" />',
										'height=750px, width=650px, top=0, left=250, toolbar=no, menubar=no, url=no, scrollbars=yes, resizable=no,location=no, status=no');
						return false;
					});

	$("#but_new").click(
			function() {
				$("#list").attr("action",
						'<s:url namespace="/sc/contract" action="toedit"/>');
				$("#list").submit();
			});

	$("#but_find")
			.click(
					function() {
						window
								.open(
										'<s:url namespace="/sc/contract" action="tosearch"></s:url>',
										'<s:text name="menu.pri.create" />',
										'height=750px, width=650px, top=0, left=250, toolbar=no, menubar=no, url=no, scrollbars=yes, resizable=no,location=no, status=no');
						return false;
					});

	$("#but_delete")
			.click(
					function() {
						if ($("input:checkbox:checked").length == 0) {
							alert('<s:text name="message.select.one"/>');
							return false;
						}
						if (confirm('<s:text name="message.confirm.delete"/>')) {
							$("#list")
									.attr("action",
											'<s:url namespace="/sc/contract" action="delete"/>');
							$("#list").submit();
						}
					});

	$("#but_export").click(
			function() {
				if ($("input:checkbox:checked").length == 0) {
					alert('<s:text name="message.select.one"/>');
					return false;
				}
				$("#list").attr("action",
						'<s:url namespace="/sc/contract" action="export"/>');
				$("#list").submit();
			});
	return false;
});
</script>
	</head>
	<body>
		<div>
			<s:form namespace="/sc/contract" action="list" theme="simple"
				method="post">
				<s:hidden value="%{conSum.hostOrg.organName}"
					name="conSum.hostOrg.organName" />
				<s:hidden value="%{conSum.contNum}" name="conSum.contNum" />
				<s:hidden value="%{conSum.supplierName}" name="conSum.supplierName" />
				<s:hidden value="%{subDate.beginDate}" name="subDate.beginDate" />
				<s:hidden value="%{subDate.endDate}" name="subDate.endDate" />
				<s:hidden value="%{subDate.operator}" name="subDate.operator" />
				
				<s:hidden value="%{reqDate.beginDate}" name="reqDate.beginDate" />
				<s:hidden value="%{reqDate.endDate}" name="reqDate.endDate" />
				<s:hidden value="%{reqDate.operator}" name="reqDate.operator" />
				

				<s:hidden value="%{conSum.contType}" name="conSum.contType" />
				<s:hidden value="%{deleted}" name="deleted" />
				<div class="title">
					<table>
						<thead>
							<tr>
								<th style="white-space: nowrap; text-align: right;">
									<button type="button" class="butCss" id="but_new">
										<s:text name="button.new" />
									</button>
									<button type="button" class="butCss" id="but_export">
										<s:text name="button.export" />
									</button>
									<button type="button" class="butCss" id="but_delete">
										<s:text name="button.delete" />
									</button>
									<button type="button" class="butCss" id="but_find">
										<s:text name="menu.pr.jquery" />
									</button>
								</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="listCon">
					<table id="tab_cont">
						<thead>
							<tr>
								<s:i18n name="LongTermContract">
									<th width="30">
										<s:checkbox name="selectAll" id="selectAll"></s:checkbox>
									</th>
									<th width="280">
										<s:text name="contractSummary.org" />
									</th>
									<th width="120">
										<s:text name="com.cnooc.req.domain.sc.ContractSummary.contNum"></s:text>
									</th>
									<th width="100">
										<s:text
											name="com.cnooc.req.domain.sc.ContractSummary.contNum2"></s:text>
									</th>
									<th width="100">
										<s:text
											name="com.cnooc.req.domain.sc.ContractSummary.contType"></s:text>
									</th>
									<th width="100">
										<s:text
											name="com.cnooc.req.domain.sc.ContractSummary.supplierNum"></s:text>
									</th>
									<th width="260">
										<s:text
											name="com.cnooc.req.domain.sc.ContractSummary.supplierName"></s:text>
									</th>
									<th width="100">
										<s:text
											name="com.cnooc.req.domain.sc.ContractSummary.effectDate"></s:text>
									</th>
									<th width="100">
										<s:text
											name="com.cnooc.req.domain.sc.ContractSummary.expireDate"></s:text>
									</th>
									<th width="50">
										<s:text name="com.cnooc.req.domain.sc.ContractSummary.deleted"></s:text>
									</th>
									<!-- 起 列对齐的作用 -->
									<th width="400">
										&nbsp;&nbsp;
									</th>
								</s:i18n>
							</tr>
						</thead>
						<s:if test="list.size==0">
							<tr>
								<td colspan="11">
									<s:text name="pr.mange.no.rows" />
								</td>
							</tr>
						</s:if>
						<s:else>
							<s:iterator value="list" var="contSum">
								<tr>
									<td>
										<input type="checkbox" name="ids"
											value="<s:property value='#contSum.id'/>">
									</td>
									<td>
										<s:property value="#contSum.hostOrg.organName" />
									</td>
									<td>
										<s:property value="#contSum.contNum" />
									</td>
									<td style="cursor: pointer; text-decoration: underline"
										onclick="javascript:window.location.href='<s:url namespace='/sc/contract' action='toedit'><s:param name='id' value='#contSum.id'/></s:url>'">
										<s:property value="#contSum.contNum2" />
									</td>
									<td>
										<s:property value="#contSum.contType" />
									</td>
									<td>
										<s:property value="#contSum.supplierNum" />
									</td>
									<td>
										<s:property value="#contSum.supplierName" />
									</td>
									<td>
										<s:property value="#contSum.effectDate" />
									</td>
									<td>
										<s:property value="#contSum.expireDate" />
									</td>
									<td>
										<s:if test="%{#contSum.deleted == false}">否</s:if>
										<s:else>是</s:else>
									</td>
									<td>
										&nbsp;&nbsp;
									</td>
							</s:iterator>
						</s:else>
					</table>
				</div>
				<div id="pageContainer"></div>
				<%@ include file="/WEB-INF/jsp/page.jsp"%>
				<input type="hidden" id="pageURL"
					value='<s:url namespace="/sc/contract" action="list"/>' />
			</s:form>
		</div>
	</body>
</html>