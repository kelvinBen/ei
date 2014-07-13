<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提报采办申请列表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
$(function(){
	$('#tab_cont').flexigrid();
});
</script>
</head>
<body>
<div>
   <s:form theme="simple">
	<div class="listCon"> 
	<table border="0" id="tab_cont">
	<thead>
	<tr>
	  <th width="80">分派日期</th>
	  <th width="120">公司名称</th>
	  <th width="80">合并序号</th>
	  <th width="80">采办需求号码</th>
	  <th width="80">采办需求内容</th>
	  <th width="80">项目编号</th>
	  <th width="60">项目类型</th>
	  <th width="80">物料编码</th>
	  <th width="80">描述</th>
	 </tr>
	 </thead>
	 <s:if test="list==null || list.size()==0">
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
	 	<s:set var="endPosition" value="list.size>5 ? 5:list.size"></s:set>
		 <s:iterator value="list" var="item" begin="0" end="#endPosition-1">
		     <tr>
		       <td>~~</td>
		       <td><s:property value="#item.fldOrganizationName"/></td>
		       <td><s:property value="#item.fldMergeid"/></td>
		       <td><s:property value="#item.fldPrNo"/></td>
		       <td><s:property value="#item.fldContent"/></td>
		       <td><s:property value="#item.fldItemNo"/></td>
			   <td><s:property value="#item.fldType"/></td>
			   <td><s:property value="#item.fldProduct"/></td>
			   <td><s:property value="#item.fldDesc"/></td>
		     </tr>
		 </s:iterator>
	 </s:else>
	</table>
	</div>
  </s:form>       
</div>
</body>
</html>