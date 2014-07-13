<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采购申请列表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
$(function(){
	//var winHeight = parent.document.getElementById("ifCPAuditing").clientHeight - 40;
	$('#tab_cont').flexigrid();
});
</script>
</head>
<body>
<div>
   <s:form theme="simple">
	<div class="listCon"> 
	<table border="0" id="tab_cont" style="width:100%;overflow:hidden;margin:0px;">
	<thead>
	<tr>
	  <th width="150"><s:text name="central.title.apply.num"/></th>
	  <th width="60"><s:text name="central.title.apply.unit"/></th>
	  <th width="60"><s:text name="central.title.apply.time"/></th>
	  <th width="60"><s:text name="pri.number"/></th>
	  <th width="60"><s:text name="pri.name"/></th>
	  <th width="60"><s:text name="pri.product"/></th>
	  <th width="100"><s:text name="pri.description"/></th>
	 </tr>
	 </thead>
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
	 	<s:set var="rowCount" value="0"></s:set>
		 <s:iterator value="centralPurs" var="centralPur">
		   <s:iterator value="#centralPur.items" var="pri" status="stat">
		   	 <s:if test="#rowCount<5">
			     <tr>
			       <td><s:property value="#centralPur.number"/></td>
			       <td><s:property value="#centralPur.orgName"/></td>
			       <td><s:property value="#centralPur.submitDate"/></td>
			       <td><s:property value="#pri.prItem.number"/></td>
			       <td><s:property value="#pri.itemName"/></td>
			       <td><s:property value="#pri.prItem.product"/></td>
				   <td><s:property value="#pri.prItem.description"/></td>
			     </tr>
		     	<s:set var="rowCount" value="#rowCount+1"></s:set>
		     </s:if>
		   </s:iterator>
		 </s:iterator>
	 </s:else>
	</table>
	</div>
  </s:form>       
</div>
</body>
</html>