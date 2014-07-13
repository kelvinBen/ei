<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>长期协议行项目列表页</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#a_pri_list").addClass("currentLink");
		$("#select_all").change(function(){
			if ($(this).attr("checked") == false){
				$("input:checkbox").each(function(){   
					$(this).attr("checked",false); 
				});
			}
			else{
				$("input:checkbox").each(function(){   
					$(this).attr("checked",true); 
				});
			}
		});	

		$("#delete_selected").click(function(){
			if ($("input:checkbox:checked").length == 0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}
			if (confirm('<s:text name="message.confirm.delete"/>')){
				$("#pri_form").attr("action",'<s:url namespace="/sc/contract/item" action="delete"/>');
				$("#pri_form").submit();
			}
		});	

		$("#pr_prev").click(function(){
			location.href=$("#a_pr_form")[0].href;
			return false;
		});
		
		$("#pr_next").click(function(){
			location.href="<s:url namespace='/sc/contract' action='list'/>";
			return false;
		});
		
		$("#export_selected").click(function(){
			if ($("input:checkbox:checked").length == 0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}

			$("#pri_form").attr("action",'<s:url namespace="/sc/contract" action="itemexport"/>');
			$("#pri_form").submit();
			return false;
		});	

		$("#create_new").click(function(){
			window.open('<s:url namespace="/sc/contract/item" action="form"><s:param name="id" value="#request.id"/></s:url>',
					'创建长期协议行项目',
					'height=750px, width=650px, top=0, left=250, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
			return false;
		});
		
		
		
		$("#but_find").click(function(){
		window.open('<s:url namespace="/sc/contract/item" action="tosearch"><s:param name="id" value="#request.id"/></s:url>',
				'<s:text name="menu.pri.create" />',
				'height=750px, width=650px, top=0, left=250, toolbar=no, menubar=no, url=no, scrollbars=yes, resizable=no,location=no, status=no');
		return false;
	});
		
	});

	function showDetail(id,eventObj){
		window.open('<s:url namespace="/sc/contract/item" action="form"/>?itemId='+id+'&id=<s:property value="id"/>',			
				'<s:text name="menu.pri.create" />',
				'height=750px, width=650px, top=0, left=250, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
		return false;
	}
</script>
</head>
<body>
  <div class="editdiv">
	<%@ include file="/WEB-INF/jsp/sidebar-contract.jsp"%>
	<div>
		<table class="tblsummary" cellpadding="0">
			<thead>
				<tr>
					<th align="left">
						<span><s:text name="pri.all"/> (<s:property value="#request.list.size()"/>)</span>
					</th>
					<th align="right"> 
						<button type="button" id="export_selected"><s:text name="button.export"/></button> 
						<input type="button" id="delete_selected" value="<s:text name="button.delete"/>"> 
						<s:if test="!isSumDeleted">
						<input type="button" id="create_new" value="<s:text name="pri.create"/>">
						</s:if>
						<button type="button" class="butCss" id="but_find"><s:text name="menu.pr.jquery"/></button>		      
					</th>
				</tr>
			</thead>
		</table>
		<table class="tblContent4list" cellpadding="0">
			<s:form id="pri_form" namespace="/sc/contract/item" action="delete" theme="simple" method="post">
			<s:hidden name="id"/>
			<thead>
				<tr>
					<s:i18n name="LongTermContract">
					<th><input type="checkbox" id="select_all"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.materialDesc"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.materialNum"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.materialGroup"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.serviceNum"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.serviceDesc"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.price"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.currency"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.measureUnit"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.measure"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.goodsDesc"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.comment"/></th>
					<th><s:text name="com.cnooc.req.domain.sc.ContractItem.deleted"/></th>
					</s:i18n>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.list" var="item">
				<tr>
					<td><input type="checkbox" name="ids" value="<s:property value="#item.id"/>"/></td>
					<td style="cursor:pointer;text-decoration:underline" onclick="showDetail('<s:property value="#item.id"/>',this);"><s:property value="#item.itemNum"/></td>
					<td><s:property value="#item.materialDesc"/></td>
					<td><s:property value="#item.materialNum"/></td>
					<td><s:property value="#item.materialGroup"/></td>
					<td><s:property value="#item.serviceNum"/></td>
					<td><s:property value="#item.serviceDesc"/></td>
					<td><s:property value="#item.price"/></td>
					<td><s:property value="#item.currency.description"/></td>
					<td><s:property value="#item.measureUnit"/></td>
					<td><s:property value="#item.measure.description"/></td>
					<td><s:property value="#item.goodsDesc"/></td>
					<td><s:property value="#item.comment"/></td>
				 	<td>
				 		<s:if test="%{#item.deleted == false}">否</s:if>
				 		<s:else>是</s:else>
				 	</td>
				</tr>
				</s:iterator>
				<tr>
				<td colspan="15" style="text-align: center;">
					<button value="" id="pr_prev" type="button"><s:text name="button.prev" /></button>
					<button value="" id="pr_next" type="button"><s:text name="返回列表页" /></button>
				</td>
			</tr>
			</tbody>
			</s:form>
		</table>
	</div>
  </div>
</body>
</html>