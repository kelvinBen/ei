<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<div id="sidebar">
	<s:if test="%{id != null}">
		<ul>
			<li style="float:left;"><a id="a_pr_form" href="<s:url namespace="/pr/central" action="toapply"><s:param name="id" value="#request.id" /></s:url>"><s:text name="pr.header" /></a></li>
			<li style="float:left;"><a id="a_pri_list" href="<s:url namespace="/pr/central" action="itemlist"><s:param name="id" value="#request.id" /></s:url>"><s:text name="pr.item" /></a></li>
			<li style="float:left;"><a id="a_pr_atta" href="<s:url namespace="/pr/attachment" action="list4central"><s:param name="id" value="#request.id" /></s:url>"><s:text name="pr.attachment" /></a></li>
			<li style="float:left;"><a id="a_pr_overview" href="<s:url namespace="/pr/central" action="show"><s:param name="id" value="#request.id" /></s:url>"><s:text name="pr.overview" /></a></li>
			<li style="float:left;"><a id="a_pr_history" href="<s:url namespace="/pr/central" action="listhistory"><s:param name="id" value="#request.id" /></s:url>"><s:text name="pr.history" /></a></li>
		</ul>
	</s:if>
	<s:else>
		<ul>
			<li style="float:left;"><a id="a_pr_form" href="#"><s:text name="pr.header" /></a></li>
			<li style="float:left;"><a id="a_pri_list" href="#"><s:text name="pr.item" /></a></li>
			<li style="float:left;"><a id="a_pr_atta" href="#"><s:text name="pr.attachment" /></a></li>
			<li style="float:left;"><a id="a_pr_overview" href="#"><s:text name="pr.overview" /></a></li>
			<li style="float:left;"><a id="a_pr_history" href="#"><s:text name="pr.history" /></a></li>
		</ul>
	</s:else>
</div>

<script type="text/javascript">
var url = '<%= request.getServletPath()%>';
if(url=='/jsp/centralpurchase/central-title-input.jsp'){
	$("#a_pr_form").css("fontWeight","bold");
}else if(url=='/jsp/centralpurchase/central-item-list.jsp'){
	$("#a_pri_list").css("fontWeight","bold");
}else if(url=='/jsp/centralpurchase/central-attach-list.jsp'){
	$("#a_pr_atta").css("fontWeight","bold");
}else if(url=='/jsp/centralpurchase/central-summary.jsp'){
	$("#a_pr_overview").css("fontWeight","bold");
}else if(url=='/jsp/centralpurchase/central-history-list.jsp'){
	$("#a_pr_history").css("fontWeight","bold");
}
</script>

<s:if test="canEdit==false">
<script type="text/javascript">
$(document).ready(function(){
	$('input:text,input:button,input:submit,select,button.forhidden').each(function(){
		$(this).attr("disabled","true");
	});
});
</script>	
</s:if>