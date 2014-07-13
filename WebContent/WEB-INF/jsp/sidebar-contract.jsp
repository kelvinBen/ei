<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<div id="sidebar">
<s:if test="%{id != null}">
	<ul>
		<li style="float:left;"><a id="a_pr_form" href="<s:url namespace="/sc/contract" action="toedit"><s:param name="id" value="#request.id" /></s:url>"><s:text name="pr.header" /></a></li>
		<li style="float:left;"><a id="a_pri_list" href="<s:url namespace="/sc/contract/item" action="list"><s:param name="id" value="#request.id" /></s:url>"><s:text name="pr.item" /></a></li>
	</ul>
</s:if>
<s:else>
	<ul>
		<li style="float:left;"><a id="a_pr_form" onclick="returnFalse();" href="#"><s:text name="pr.header" /></a></li>
		<li style="float:left;"><a id="a_pri_list" onclick="returnFalse();" href="#"><s:text name="pr.item" /></a></li>
	</ul>
</s:else>
</div>

<script type="text/javascript">
var url = '<%= request.getServletPath()%>';
if(url=='/WEB-INF/jsp/sc/contract-input.jsp'){
	$("#a_pr_form").css("fontWeight","bold");
}else if(url=='/WEB-INF/jsp/sc/contract-item-list.jsp'){
	$("#a_pri_list").css("fontWeight","bold");
}

function returnFalse(){
	window.event.returnValue = false;
	return false;	
}
</script>