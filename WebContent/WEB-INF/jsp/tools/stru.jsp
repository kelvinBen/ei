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
		<s:form id="file_form" namespace="/tool/stru" action="createStru" theme="simple" method="post">
		<tbody>
			<tr>
				<td class="tdTitle" style="text-align:right;">WorkplaceId&nbsp;</td>
				<td class="TdRight"><input name="struView.workplaceId" type="text" id="workplaceId" value="1" size="1"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">GlobalOrder&nbsp;</td>
				<td class="TdRight"><input name="struView.globalOrder" type="text" id="globalOrder" value="1" size="1"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">BeginDate&nbsp;</td>
				<td class="TdRight"><input name="struView.beginDate" type="text" id="beginDate" value="20100101" size="8"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">EndDate&nbsp;</td>
				<td class="TdRight"><input name="struView.endDate" type="text" id="endDate" value="99991231" size="8"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">StruId&nbsp;</td>
				<td class="TdRight"><input name="struView.struId" type="text" id="struId" size="40"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">OrganId&nbsp;</td>
				<td class="TdRight"><input name="struView.organId" type="text" id="organId" size="40"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">OrganCode&nbsp;</td>
				<td class="TdRight"><input name="struView.organCode" type="text" id="organCode" size="40"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">OrganType&nbsp;</td>
				<td class="TdRight"><select name="struView.organType" id="organType">
				  <option value="1">单位</option>
				  <option value="8" selected>职工</option>
				  </select>
				</td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">OrganName&nbsp;</td>
				<td class="TdRight"><input name="struView.organName" type="text" id="organName"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">OrganAlias&nbsp;</td>
				<td class="TdRight"><input name="struView.organAlias" type="text" id="organAlias"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">ShortName&nbsp;</td>
				<td class="TdRight"><input name="struView.shortName" type="text" id="shortName"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">StruPath&nbsp;</td>
				<td class="TdRight"><input name="struView.struPath" type="text" id="struPath" size="140"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">StruLevel&nbsp;</td>
				<td class="TdRight"><input name="struView.struLevel" type="text" id="struLevel" size="4"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">StruOrder&nbsp;</td>
				<td class="TdRight"><input name="struView.struOrder" type="text" id="struOrder" size="4"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">IsLeaf&nbsp;</td>
				<td class="TdRight"><input name="struView.isLeaf" type="text" id="isLeaf" value="1" size="1"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">ParentId&nbsp;</td>
				<td class="TdRight"><input name="struView.parentId" type="text" id="parentId" size="40"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">ParentName&nbsp;</td>
				<td class="TdRight"><input name="struView.parentName" type="text" id="parentName" size="40"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">ParentStruId&nbsp;</td>
				<td class="TdRight"><input name="struView.parentStruId" type="text" id="parentStruId" size="40"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">CorporationId&nbsp;</td>
				<td class="TdRight"><input name="struView.corporationId" type="text" id="corporationId" size="40"></td>
			</tr>
			<tr>
				<td class="tdTitle" style="text-align:right;">DepartmentId&nbsp;</td>
				<td class="TdRight"><input name="struView.departmentId" type="text" id="departmentId" size="40">
			    &nbsp;</td>
			</tr>
			<tr>
				<td class="TdRight" style="text-align:center;height:50px" colspan="2"><input type="submit" name="Submit" value="提交"></td>
			</tr>
		</tbody>
		</s:form>
	</table>
	</div>
  </div>
</body>
</html>