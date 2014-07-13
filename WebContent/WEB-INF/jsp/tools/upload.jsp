<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传工具</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/changeSpecialChars.js" />"></script>
<script type="text/javascript">
	$(function() {
		$("#dataExcel").focus();
		$("#file_form").validate({rules: {
			dataExcel:{
				required: true,
				accept:"xls|xlsx"
			}
		}});
	});

</script>
</head>
<body>
  <div class="editdiv">
	<div>
	<c:if test="${not empty actionMessages}"><script type="text/javascript">alert('${actionMessages}');</script></c:if>
	<table class="tblContent" width="100%" cellpadding="0" >
		<s:form id="file_form" namespace="/tool/excel" action="importExcel" theme="simple" method="post" enctype="multipart/form-data">
		<input type="hidden" name="dataType" value="PROJNAME"/>
		<tbody>
			<tr>
				<th class="tdTitle"><s:text name="excel.tips.choose" /></th>
				<td class="TdRight"><s:file name="dataExcel" id="dataExcel"/><span class="star"> *</span>&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td class="tdTitle" colspan="2" style="text-align:left;">
					<input value="<s:text name="button.upload" />" id="excel_upload" type="submit">
					<input value="<s:text name="button.cancel" />" id="cancel" type="button" onclick="history.go(-1)">
				</td>
			</tr>
		</tbody>
		</s:form>
	</table>
	</div>
  </div>
</body>
</html>