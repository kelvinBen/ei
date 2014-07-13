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
<div>
<s:form id="list" theme="simple">
	<div class="listCon"> 
	<table id="tab_cont">
	<thead>
	<tr>
		<th width="80">分派日期</th>
		<th width="120"><s:text name="pr.header.company"/></th>
		<th width="60"><s:text name="pri.merge.number"/></th>
		<th width="60"><s:text name="pr.header.number"/></th>
		<th width="100"><s:text name="pr.header.content"/></th>
	   <th width="60"><s:text name="pri.centralizepurchase"/></th>
	   <th width="60"><s:text name="pri.number"/></th>
	   <th width="60"><s:text name="pri.type"/></th>
	   <th width="60"><s:text name="pri.product"/></th>
	   <th width="100"><s:text name="pri.description"/></th>
	 </tr>
	 </thead>
	 <s:if test="purchaseRequisitionItemList==null || purchaseRequisitionItemList.size()==0">
	 	<tr>
	 		<td><s:text name="pr.mange.no.rows"/></td>
	 		<td>&nbsp;</td>
	 		<td>&nbsp;</td>
	 		<td>&nbsp;</td>
	 		<td>&nbsp;</td>
	 		<td>&nbsp;</td>
	 		<td>&nbsp;</td>
	 		<td>&nbsp;</td>
	 		<td>&nbsp;</td>
	 	</tr>
	 </s:if>
	 <s:else>
	 	<s:set var="endPosition" value="purchaseRequisitionItemList.size>5 ? 5:purchaseRequisitionItemList.size"></s:set>
		 <s:iterator value="purchaseRequisitionItemList" status="position" var="purchaseRequisitonItem" begin="0" end="#endPosition-1">
			 <tr>
			 	<td>&nbsp;</td>
			 	<td><s:property value="#purchaseRequisitonItem.purchaseRequisition.orgName"/></td>
			    <td><s:property value="#purchaseRequisitonItem.mergeId"/></td>
			    <td style="cursor:pointer;text-decoration: underline" onclick='javascript:parent.location.href="<s:url namespace="/pr" action="form"><s:param name="id" value="#purchaseRequisitonItem.purchaseRequisition.id" /></s:url>"'><s:property value="#purchaseRequisitonItem.purchaseRequisition.number"/></td>
			    <td><s:property value="#purchaseRequisitonItem.number"/></td>
			    <td><s:property value="#purchaseRequisitonItem.purchaseRequisition.content"/></td>
			    <td>
			    	<s:if test="#purchaseRequisitonItem.isCentral==1">
			    		<s:property value="getText('pr.manage.yes')"/>
			    	</s:if>
			    	<s:else>
			    		<s:property value="getText('pr.manage.no')"/>
			    	</s:else>
			    </td>
			    <td>
				    <s:if test="#purchaseRequisitonItem.type == 'pri.type.product'">
				    	<s:text name="pri.type.product"/>
				    </s:if>
				    <s:else>
				    	<s:text name="pri.type.service"/>
				    </s:else>
			    </td>
			    <td><s:property value="#purchaseRequisitonItem.product"/></td>
			    <td><s:property value="#purchaseRequisitonItem.description"/></td>
			 </tr>
		 </s:iterator>
	 </s:else>
	</table>
	</div>
</s:form>       
</div>
</body>
</html>