<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pri.list" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#a_attachment_new").addClass("currentLink");

		$("#add_form").validate({										//注册表单校验规则
			rules: {
				'attachmentCategory.description_zh_CN': {
					required: true,
					maxlength: 80
				},
				'attachmentCategory.description_en_US': {
					required: true,
					maxlength: 80
				}
			}
		});

		$("#add_new").click(function(){
			$("#add_form").submit();
		});
		$("#quit").click(function(){
			window.location.href="${pageContext.request.contextPath}/sc/attachment/list.do"
			return false;
		});
		
	});
</script>
<style type="text/css">
#content{
	float:none;
	width:940px;
}
</style>
</head>
<body>
<div class="editdiv">
				<table class="tblsummary" width="100%" cellpadding="0">
					<thead class="listheader">
						<tr>
							<th>
							<span><s:text name="attachment.new"/><font color="xff0000">*</font><s:text name="cc.header.required"/></span>
							</th>
						</tr>
					</thead>
				</table>
				<table class="tblContent" width="100%" cellpadding="0">
					<s:form id="add_form" namespace="/sc/attachment" action="add" theme="simple" method="post">
					
					<tbody>
						<tr>
							<td align="center">
								<s:text name="com.cnooc.domain.AttachmentCategory.desc.cn"></s:text>
							</td>
							<td>
								<s:textarea name="attachmentCategory.description_zh_CN" rows="6" cols="30" id="attachmentCategory.description_zh_CN" cssStyle="width:600"/><span class="star"> *</span>
							<br/><s:text name="attachment.description.max"></s:text></td>
						</tr>
						<tr>
							<td align="center">
								<s:text name="com.cnooc.domain.AttachmentCategory.desc.us"></s:text>
							</td>
							<td>
								<s:textarea name="attachmentCategory.description_en_US" rows="6" cols="30" id="attachmentCategory.description_en_US" cssStyle="width:600"/><span class="star"> *</span>
								<br/><s:text name="attachment.description.max"></s:text>
							</td>
						</tr>
					</tbody>
				</table>
				</s:form>
				<table>
					<tr>
						<td colspan="2">
						<button type="button" id="add_new"><s:text name="button.save"/></button>&nbsp;
						<button type="button" id="quit"><s:text name="button.quit"/></button>
						</td>
					</tr>
				</table>
	</div>
</body>
</html>