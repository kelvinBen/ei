<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<ul>
	<li><h3><a href="#"><s:text name="menu.attachment.management" /></a></h3>
			<ul>
				<li><a id="a_attachment_list" href="<s:url namespace="/attachment" action="list"><s:param name="id" value="#request.id" /><s:param name="selected" value="all" /></s:url>"><s:text name="attachment.list" /></a></li>
				<li><a id="a_attachment_new" href="<s:url namespace="/attachment" action="form"></s:url>"><s:text name="attachment.add" /></a></li>
				<li><a id="a_attachment_history" href="<s:url namespace="/attachment/history" action="list"><s:param name="id" value="#request.id" /></s:url>"><s:text name="attachment.history.view" /></a></li>
			</ul>
	</li>
</ul>