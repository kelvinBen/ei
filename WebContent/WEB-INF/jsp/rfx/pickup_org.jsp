<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base target="_self"/>
<title>请选择申请单位</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
$(function(){
	if($.query.get("flag")=="0"){
		$("#orgNames").val(window.dialogArguments);
		$("#frm").submit();
	}
	$("#btnSelect").click(function(){
		if($(":radio[checked]").length==0){
			alert("请点选一个申请单位");
		}else
		{
		    window.returnValue = $(":radio[checked]").val();
		    window.close();
		}
	});
});
</script>
</head>
<body>
<s:form id="frm" action="pickup_org" namespace="/rfx">
	<s:hidden id="orgNames" name="orgNames"></s:hidden>
	<div align="right"><input type="button" id="btnSelect" value="选择"/></div>
	<table width="100%" border="1">
		<s:iterator value="orgNameSet" var="item">
		<tr>
			<td width="80%" align="center"><s:property value="item"/></td>
			<td>
				<input type="radio" name="rdoOrgName" value="<s:property value="item"/>"/>
			</td>
		</tr>
		</s:iterator>
	</table>
</s:form>
</body>
</html>