<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="bu.bui.sap" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#bt_save").click(function(){
			var isValid = true;
			$.ajax({
				type:"POST",
				async:false,
				url:"<s:url namespace="/rfxtemp" action="checkValidName"/>",
				data:$("#input_form").serialize(),
				success:function(o){
					if(o=="false"){
						alert('RFx模板名称与已有纪录重复');
						isValid = false;
					}
				}
			});
			$.ajax({
				type:"POST",
				async:false,
				url:"<s:url namespace="/rfxtemp" action="checkValidId"/>",
				data:$("#input_form").serialize(),
				success:function(o){
					if(o=="false"){
						alert('RFx模板唯一标识符与已有纪录重复');
						isValid = false;
					}
				}
			});
			if(isValid)
				$("#input_form").submit();
		});
		$("#bt_exit").click(function(){
			history.back(-1);
			return false;
		});

		$('#input_form').validate({
			rules:{	
				'rfxTemp.rfxTempName':{
					required: true
				},
				'rfxTemp.rfxTempId':{
					required: true
				}
			}
		});	
	});
</script>
<style type="text/css">
</style>
</head>
<body>
	<table cellpadding="5" width="100%" border="0">
		<thead>
			<tr>
			<th><h3>维护RFX模板</h3></th>
			</tr>
		</thead>
	</table>
	
	<table class="tblContent" width="100%" cellpadding="0" >
<s:form id="input_form" namespace="/rfxtemp" action="save" theme="simple" method="post">
		<tbody>
			<s:hidden name="rfxTemp.id"/>
			<s:hidden name="rfxTemp.deleted"/>
			<tr>
				<th class="tdTitle" width="20%">RFx类型<font color="#ff0000">*</font>：</th>
				<td class="TdRight">
				<select name="rfxTemp.rfxType">
					<option value="RFQ" <c:if test="${rfxTemp.rfxType=='RFQ'}">selected</c:if>>RFQ</option>
					<option value="RFP" <c:if test="${rfxTemp.rfxType=='RFP'}">selected</c:if>>RFP</option>
				</select>
				</td>
			</tr>
			<tr>
				<th class="tdTitle">RFx模板名称<font color="#ff0000">*</font>：</th>
				<td class="TdRight"><s:textfield name="rfxTemp.rfxTempName"/></td>
			</tr>
			<tr>
				<th class="tdTitle">RFx模板唯一标识符<font color="#ff0000">*</font>：</th>
				<td class="TdRight"><s:textfield name="rfxTemp.rfxTempId"/></td>
			</tr>
			<tr>
				<td class="TdRight" colspan="2">
				<left><input id="bt_save" type="button" value='<s:text name="button.save"/>' />
				&nbsp;&nbsp;&nbsp;&nbsp;<input id="bt_exit" type="button" value='<s:text name="button.quit"/>' /></left>
				</td>
			</tr>
		</tbody>
</s:form>
	</table>

<div>
<table>
	
</table>
</div>
</body>
</html>