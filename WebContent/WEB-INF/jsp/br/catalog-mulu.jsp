<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<title><s:text name="com.cnooc.domain.catalog.mulu.title"></s:text></title>
<style type="text/css">
	thead tr{height: 20px;}
	td{text-align: center;}
</style>
<script type="text/javascript">
$(function(){
	$("#a_sm_mulu").addClass("currentLink");
});
</script>
</head>
<body>
<div class="editdiv">
<%@ include file="/WEB-INF/jsp/sidebar-sm.jsp"%>

	<table class="tblContent4list" width="100%" cellpadding="0" border="1px">
	<thead>
		<tr>
			<td></td>
			<th><s:text name="com.cnooc.domain.catalog.mulu.number"></s:text></th>
			<th><s:text name="com.cnooc.domain.catalog.mulu.attribute"></s:text></th>
			<th><s:text name="com.cnooc.domain.catalog.mulu.description"></s:text></th>
		</tr>
	</thead>
	<tr>
		<td><s:text name="com.cnooc.domain.catalog.mulu.from"></s:text></td>
		<td><s:property value="centralCatalog.from"></s:property></td>
		<td><s:if test="centralCatalog.sortOrMaterial=='Sort'"><s:text name="com.cnooc.domain.catalog.mulu.sort"/></s:if><s:else><s:text name="com.cnooc.domain.catalog.mulu.material"/></s:else></td>
		<td><s:property value="centralCatalog.fromDescrption"></s:property></td>
	</tr>
	<tr>
		<td><s:text name="com.cnooc.domain.catalog.mulu.to"></s:text></td>
		<td><s:property value="centralCatalog.to"></s:property></td>
		<td><s:if test="centralCatalog.to!=null"><s:if test="centralCatalog.sortOrMaterial=='Sort'"><s:text name="com.cnooc.domain.catalog.mulu.sort"></s:text></s:if><s:else><s:text name="com.cnooc.domain.catalog.mulu.material"></s:text></s:else></s:if></td>
		<td><s:property value="centralCatalog.toDescrption"></s:property></td>
	</tr>
</table>
</div>

</body>
</html>