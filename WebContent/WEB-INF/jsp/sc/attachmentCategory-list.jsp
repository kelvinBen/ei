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

		jQuery.validator.addClassRules("input_desc", {
			required: true,
			maxlength: 80
		});

		$("#selected").change(function() {
			$("#attachment_form").submit();
		});
	
		$("#select_all").click(function(){
			if ($(this).attr("innerHTML") == '<s:text name="button.deselectall"/>'){
				$(this).attr("innerHTML",'<s:text name="button.selectall"/>');
				$("input:checkbox").each(function(){   
					$(this).attr("checked",false); 
				});
			}
			else{
				$(this).attr("innerHTML",'<s:text name="button.deselectall"/>');
				$("input:checkbox").each(function(){   
					$(this).attr("checked",true); 
				});
			}
		});	
		
		$("#show_history").click(function(){
			window.location.href="<s:url namespace="/history/common" action="list"><s:param name="targetClazz">AttachmentCategory</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
			return false;
		});

		$("#modify_changed").click(function(){
			$("#attachment_form").attr("action",'<s:url namespace="/sc/attachment" action="save"></s:url>');
			$("input:checkbox").each(function(){
				var realId = '#real_' + $(this).attr("id");
				if($(this).attr("checked")==true){
					$(realId).attr("value",'true');
				}
				else{
					$(realId).attr("value",'false');
				}
			});
			if ($(".input_desc").valid()){
				$("#attachment_form").submit();
			}
			return false;
		});
	});
</script>
<%
	String selected = "all";//默认为list
	if (request.getParameter("selected") != null
			&& !request.getParameter("selected").toString().equals("")) {
		selected = request.getParameter("selected").toString();
	}
%>
<style type="text/css">
#content{
	float:none;
	width:940px;
}
</style>
</head>
<body>
<div class="editdiv">
<%@ include file="/WEB-INF/jsp/mainmenu.jsp"%>
			<s:form id="attachment_form" theme="simple" method="post"> 
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead class="listheader">
			<tr>
				<th style="text-align:left;">
				<span><s:text name="attachment.category.list"/> (<s:property value="#request.attachmentCategoryList.size()"/>)&nbsp;&nbsp;&nbsp;&nbsp;<font color="xff0000">*</font><s:text name="cc.header.required"/></span>
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent4list" cellpadding="0" width="100%">
		<thead>
			<tr>
				<th><s:text name="com.cnooc.domain.AttachmentCategory.desc.cn"/></th>
				<th><s:text name="com.cnooc.domain.AttachmentCategory.desc.us"/></th>
				<th><s:text name="com.cnooc.domain.AttachmentCategory.deleted"/>
				<select id="selected" name="selected">
					<option value="all" <%=selected.equals("all") ? "selected" : ""%> ><s:text name="select.all"/></option>
					<option value="undeleted" <%=selected.equals("undeleted") ? "selected" : ""%> ><s:text name="select.undeleted"/></option>
					<option value="deleted" <%=selected.equals("deleted") ? "selected" : ""%>><s:text name="select.deleted"/></option>
				</select>
				</th>
			</tr>
		</thead>
					
		<tbody>
<!--						<s:iterator value="#request.attachmentCategoryList" var="attachment" status="stat">
						<input type="hidden" id="idsall" name="idsall" value="<s:property value="#attachment.id"/>"/>
						<td align="center"><input type="hidden" name="deleted" value="<s:property value="#attachment.deleted"/>" id="real_deleted_<s:property value="#stat.index"/>"/>
						<tr>
							<td>    
								<input type="text" id="text" name="attachment[<s:property value="#stat.index" />].description_zh_CN" value="<s:property value="#attachment.description_zh_CN"/>"></input>
							</td>
							<td>
								<input type="text" id="text" name="attachment[<s:property value="#stat.index" />].description_en_US" value="<s:property value="#attachment.description_en_US"/>"></input>
							</td>
							<td>
								<input type="checkbox" id="deleted_<s:property value="#stat.index"/>"  value="<s:property value="#attachment.deleted"/>" <s:if test="#attachment.deleted">checked</s:if>/>
							</td>
						</tr>
						</s:iterator>-->
						<s:iterator value="#request.attachmentCategoryList" var="attachment" status="stat">
						<tr>
							<td>
								<input type="hidden" id="idsall" name="idsall" value="<s:property value="#attachment.id"/>"/>
								<input class="input_desc" style="width: 300px;" name="desc_cn"  type="text" value="<s:property value="#attachment.description_zh_CN"/>"/><font color="#ff0000">*</font>
							</td>
							<td><input class="input_desc" style="width: 300px;" name="desc_us" " type="text" value="<s:property value="#attachment.description_en_US"/>"/><font color="#ff0000">*</font></td>
							<td align="center"><input type="hidden" name="deleted" value="<s:property value="#attachment.deleted"/>" id="real_deleted_<s:property value="#stat.index"/>"/>
							<input type="checkbox" id="deleted_<s:property value="#stat.index"/>"  value="<s:property value="#attachment.deleted"/>" <s:if test="#attachment.deleted">checked</s:if>/></td>
						</tr>
						</s:iterator>
					</tbody>
					
				</table>
				</s:form>
				<table>
						<tr>
							<td colspan="3">
							<button type="button" id="modify_changed"><s:text name="cc.button.save"/></button>&nbsp;
							<button type="button" id="add_new" onClick='javascript:window.location.href="<s:url namespace="/sc/attachment" action="create"></s:url>"'><s:text name="cc.button.input"/></button>&nbsp;
							<button type="button" id="show_history"><s:text name="cc.button.histroy"/></button>&nbsp;
							
							</td>
						</tr>
				</table>
	</div>
</body>
</html>