<%@ page pageEncoding="UTF-8" isELIgnored="false"%> 
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采购组维护列表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		

		$("#group_input").click(function(){
			$("#group_form").attr("action",'<s:url namespace="/sc/purchase/group" action="inputgroup"/>');
			$("#group_form").submit();
			return false;
		});
		$("#group_histroy").click(function(){
			window.location.href="<s:url namespace="/history/common" action="list"><s:param name="targetClazz">PurchaseGroup</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
			return false;
		});
		$("#group_save").click(function(){
				$("#group_form").attr("action",'<s:url namespace="/sc/purchase/group" action="save"/>');
				$("#group_form").submit();
			return false;
		});
		$("#group_delete").click(function(){
				$("#group_form").attr("action",'<s:url namespace="/sc/purchase/group" action="delete"/>');
				$("#group_form").submit();
			return false;
		});
		$("input.deleted").click(function(){
		    if(this.checked){
			    $(this).attr("value","true");
		    }else if(!this.checked){
			    $(this).attr("value","false");
		    }
		 });
		 $("select").change(function(){
			 $("#group_form").attr("action",'<s:url namespace="/sc/purchase/group" action="list"/>');
			 $("#group_form").submit();
		 });
		jQuery.validator.addClassRules("t1", {
			  required: true,
			  maxlength: 80
		});
		$('#group_form').validate();			 
	});
</script>
</head>
<body>
<div class="editdiv">
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead class="listheader">
			<tr>
				<th style="text-align:left;">
					<s:text name="pc.header.listitle"/>(<s:property value="purGroupList.size()"/>)&nbsp;&nbsp;&nbsp;&nbsp;<font color="xff0000">*</font><s:text name="cc.header.required"/>
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent4list" cellpadding="0" width="100%">
		<s:form id="group_form" namespace="/sc/purchase/group" action="save" theme="simple" method="post">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th><s:text name="pc.header.symble"/></th>
				<th><s:text name="cc.header.description.zh-cn"/></th>
			</tr>
		</thead>
		<tbody>
			<s:set name="index" value="0"/>
			<s:iterator value="#request.purGroupList" var="groups">
			<input type="hidden" name="groups[${index}].id" value="<s:property value="#groups.id"/>"/>
			<input type="hidden" name="groups[${index}].userId" value="<s:property value="#groups.userId"/>"/>
			<input type="hidden" name="groups[${index}].departmentId" value="<s:property value="#groups.departmentId"/>"/>
			<input type="hidden" name="groups[${index}].corporationId" value="<s:property value="#groups.corporationId"/>"/>
			<tr>
				<td>
					<s:if test="#groups.deleted">
						<INPUT type="checkbox" id="deleted${index}" class="deleted" name="groups[${index}].deleted" value="true" checked/>
					</s:if>
					<s:else>
						<INPUT type="checkbox" id="deleted${index}" class="deleted" name="groups[${index}].deleted" value="false"/>
					</s:else>
				</td>
				<td>
					<s:property value="#groups.symbol" />
					<input type="hidden" id="text" name="groups[${index}].symbol" value="<s:property value="#groups.symbol"/>"/>
				</td>
				<td>
					<input type="text" name="groups[${index}].description_zh_CN" value="<s:property value="#groups.description_zh_CN"/>" />
					<input type="hidden" name="groups[${index}].description_en_US" value="<s:property value="#groups.description_en_US"/>" />
					<font color="#ff0000">*</font>
				</td>
			</tr>
			<s:set name="index" value="#index + 1"></s:set>
			</s:iterator>
		</tbody>
		</s:form>
	</table>
	<table>
		<tr>
			<td colspan="4" style="text-align: left;">
				<button value="" id="group_save" type="button"><s:text name="cc.button.save"/></button>&nbsp;
				<button value="" id="group_input" type="button"><s:text name="cc.button.input"/></button>&nbsp;
				<button value="" id="group_delete" type="button"><s:text name="delete"/></button>&nbsp;
				<button value="" id="group_histroy" type="button"><s:text name="cc.button.histroy"/></button>&nbsp;
			</td>
		</tr>
	</table>
</div>
</body>
</html>