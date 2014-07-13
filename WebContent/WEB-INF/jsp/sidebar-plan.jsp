<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<div id="sidebar">
<s:if test="%{itemid == \"\"}">
	<s:if test="%{idsStr == \"\"}">
		<li style="float:left;"><a id="a_plan_form" onclick="returnFalse();"  href="#"><s:text name="基本信息" /></a></li>
	</s:if>
	<s:else>
	<ul>
		<li style="float:left;"><a id="a_plan_strategy" onclick="returnFalse();" href="#"><s:text name="审批策略" /></a></li>
	</ul>
	</s:else>
</s:if>
<s:else>
	<ul>
		<li style="float:left;"><a id="a_plan_form" href="<s:url namespace="/plan" action="form"><s:param name="itemid" value="#request.itemid" /></s:url>"><s:text name="基本信息" /></a></li>
		<li style="float:left;"><a id="a_plan_atta" href="<s:url namespace="/pr/attachment" action="attachlist"><s:param name="itemid" value="#request.itemid" /></s:url>"><s:text name="pr.attachment" /></a></li>
		<li style="float:left;"><a id="a_plan_strategy" href="<s:url namespace="/plan" action="strategy"><s:param name="itemid" value="#request.itemid" /></s:url>"><s:text name="审批策略" /></a></li>
		<li style="float:left;"><a id="a_pr_history" href="<%=request.getContextPath()%>/history/common/list.do?targetClazz=PurchasePlanItem&amp;page.orderBy=mhi.id&amp;page.order=desc"><s:text name="pr.history" /></a></li>
	</ul>
</s:else>
</div>

<script type="text/javascript">
var url = '<%= request.getServletPath()%>';
if(url=='/jsp/plan/plan-item-input.jsp'){
	$("#a_plan_form").css("fontWeight","bold");
}else if(url=='/jsp/plan/plan-item-strategy.jsp'){
	$("#a_plan_strategy").css("fontWeight","bold");
}else if(url=='/jsp/plan/plan-attachment-list.jsp'){
	$("#a_plan_atta").css("fontWeight","bold");
}else{
	$("#a_plan_form").css("fontWeight","bold");
}

function returnFalse(){
 window.event.returnValue = false;
 return false;	
}
</script>
