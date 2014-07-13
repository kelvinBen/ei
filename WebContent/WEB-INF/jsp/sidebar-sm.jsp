<%@ page pageEncoding="UTF-8" isELIgnored="false"%>

<div id="sidebar">		
	<ul>
		<li style="float:left;width:40px;"><a id="a_sm_mulu" href="<s:url namespace="/br" action="muLu"><s:param name="testId" value="#request.testId" /></s:url>"><s:text name="com.cnooc.domain.catalog.info.mulu" /></a></li>
		<li style="float:left;width:90px;"><a id="a_sm_indicators" href="<s:url namespace="/br" action="indicatorList"><s:param name="testId" value="#request.testId" /></s:url>"><s:text name="com.cnooc.domain.catalog.info.indicator"/></a></li>
		<li style="float:left;"><a id="a_sm_history" href="<s:url namespace="/br/history" action="list"><s:param name="testId" value="#request.testId"/></s:url>"><s:text name="com.cnooc.domain.catalog.info.history" /></a></li>
		
	</ul>
<div>
