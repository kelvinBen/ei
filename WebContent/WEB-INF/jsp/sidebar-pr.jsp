<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<div id="sidebar">
<s:if test="%{id != null}">
	<ul>
		<li style="float:left;"><a id="a_pr_form" href="<s:url namespace="/pr" action="form"><s:param name="id" value="#request.id" /><s:param name="isCopyBtnHide" value="#parameters.isCopyBtnHide" /></s:url>"><s:text name="pr.header" /></a></li>
		<li style="float:left;"><a id="a_pri_list" href="<s:url namespace="/pr/item" action="list"><s:param name="id" value="#request.id" /><s:param name="isCopyBtnHide" value="#parameters.isCopyBtnHide" /></s:url>"><s:text name="pr.item" /></a></li>
		<li style="float:left;"><a id="a_pr_atta" href="<s:url namespace="/pr/attachment" action="list"><s:param name="id" value="#request.id" /><s:param name="isCopyBtnHide" value="#parameters.isCopyBtnHide" /></s:url>"><s:text name="pr.attachment" /></a></li>
		<li style="float:left;"><a id="a_pr_overview" href="<s:url namespace="/pr/summary" action="show"><s:param name="id" value="#request.id" /><s:param name="isCopyBtnHide" value="#parameters.isCopyBtnHide" /></s:url>"><s:text name="pr.overview" /></a></li>
		<li style="float:left;"><a id="a_pr_history" href="<s:url namespace="/pr/history" action="list"><s:param name="id" value="#request.id" /></s:url>"><s:text name="pr.history" /><s:param name="isCopyBtnHide" value="#parameters.isCopyBtnHide" /></a></li>
	</ul>
</s:if>
<s:else>
	<ul>
		<li style="float:left;"><a id="a_pr_form" onclick="returnFalse();" href="#"><s:text name="pr.header" /></a></li>
		<li style="float:left;"><a id="a_pri_list" onclick="returnFalse();" href="#"><s:text name="pr.item" /></a></li>
		<li style="float:left;"><a id="a_pr_atta" onclick="returnFalse();" href="#"><s:text name="pr.attachment" /></a></li>
		<li style="float:left;"><a id="a_pr_overview" onclick="returnFalse();" href="#"><s:text name="pr.overview" /></a></li>
		<li style="float:left;"><a id="a_pr_history" onclick="returnFalse();" href="#"><s:text name="pr.history" /></a></li>
	</ul>
</s:else>
</div>

<script type="text/javascript">
var url = '<%= request.getServletPath()%>';
if(url=='/jsp/pr/pr-input.jsp'){
	$("#a_pr_form").css("fontWeight","bold");
}else if(url=='/jsp/pr/pr-item-list.jsp'){
	$("#a_pri_list").css("fontWeight","bold");
}else if(url=='/jsp/pr/pr-attachment-list.jsp'){
	$("#a_pr_atta").css("fontWeight","bold");
}else if(url=='/jsp/pr/pr-summary-show.jsp'){
	$("#a_pr_overview").css("fontWeight","bold");
}else if(url=='/jsp/pr/pr-history-list.jsp'){
	$("#a_pr_history").css("fontWeight","bold");
}

function returnFalse(){
 window.event.returnValue = false;
 return false;	
}
</script>

<s:if test="#request.canEdit==false">
<script type="text/javascript">
$(document).ready(function(){
	$('input:button,input:submit,input:radio,input:text,textarea,select').each(function(){
		$(this).attr("disabled","true");
	});
});
</script>	
</s:if>