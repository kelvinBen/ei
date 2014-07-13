<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采购申请列表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
$(function(){
	$('#tab_cont').flexigrid();
});
</script>
</head>
<body>
<s:form id="list" theme="simple">
	<div class="listCon"> 
	<table id="tab_cont">
	<thead>
	<tr>
	  <th width="150"><input type="hidden" value="centralNumber"/><s:text name="central.title.apply.num"/></th>
	  <th width="120"><input type="hidden" value="businessUnit"/><s:text name="central.title.apply.unit"/></th>
	  <th width="60"><s:text name="central.title.apply.time"/></th>
	  <th width="60"><s:text name="pri.number"/></th>
	  <th width="80"><s:text name="pri.name"/></th>
	  <th width="60"><s:text name="pri.product"/></th>
	  <th width="60"><s:text name="pri.description"/></th>
	 </tr>
	 </thead>
	 <tbody>
	 <s:if test="centralPurs==null || centralPurs.size==0">
		<tr>
			<td><s:text name="pr.mange.no.rows"/></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	 </s:if>
	 <s:else>
	 	<s:set var="endPosition" value="centralPurs.size>5 ? 5:centralPurs.size"></s:set>
	 	<s:iterator value="centralPurs" var="centralPur" begin="0" end="#endPosition-1">
		     <tr>
		       <td style="cursor:pointer;text-decoration: underline" onclick='javascript:parent.location.href="<s:url namespace="/pr/central" action="toapply"><s:param name="id" value="#centralPur[0].id" /></s:url>"'><s:property value="#centralPur[0].number"/></td>
		       <td><s:property value="#centralPur[0].orgName"/></td>
		       <td><s:property value="#centralPur[0].submitDate"/></td>
		       <td><s:property value="#centralPur[1].prItem.number"/></td>
		       <td><s:property value="#centralPur[1].itemName"/></td>
		       <td><s:property value="#centralPur[1].prItem.product"/></td>
			   <td><s:property value="#centralPur[1].prItem.description"/></td>			
		     </tr>
		</s:iterator>
	 </s:else>
	 </tbody>
	</table>
	</div>
</s:form>       
</body>
</html>