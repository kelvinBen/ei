<%@ page pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
	.errorMessage{color: red;font-weight: bold;}
</style>
<script type="text/javascript">
	$(function() {
		$("#frm").validate({
			rules:{
				"template.name": {required:true,maxlength:100},
				"template.type": {required:true,maxlength:10},
				"template.desc": {maxlength:1000},
				"buSelectedIds": {required:true}
			}
		});
		$("#btnChoose").click(function(){
			var url ="../../jsp/help.jsp?url=struhelp.cmd&method=getSelectRoot&organType=1,2&isCheckBox=1&isIncludeSelf=1&isTree=1&rootId=&showOrganType=1,2";      
			var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
			if(win != null){
				var buId = win[0];
				var buText = win[1];
				buText = buText.replace(/σ/g,"\n");
				buId = buId.replace(/σ/g,",");
				$("#buSelectedIds").val(buId);
				$("#buSelectedTexts").val(buText);
			}
		});
		$("#btnCancel").click(function(){
			document.location = "templist.do";
		});
	});
</script>
</head>
<body style="padding-top: 20px;">
	<s:form id="frm" namespace="/sc/contract" action="tempsave" theme="simple" method="post">
	<div id="divAll" align="center">
	<s:actionerror />
	<div style="text-align: right;width: 80%;background-color: #d5eafd;">
		<input type="submit" value="保存" id="btnSave"/>
		<input type="button" value="取消" id="btnCancel"/>
	</div>
	<table border="1" cellpadding="0" width="80%" align="center" style="border-collapse: collapse;">
		<tr>
			<td>所属的业务单元<font color="red">*</font></td>
			<td align="left">
					<s:select id="orgList" list="orgs" name="hostOrg.organId"/>
			</td>
		</tr>
		
		<tr>
			<td>模板名称<font color="red">*</font></td>
			<td align="left">
				<s:textfield name="template.name"></s:textfield>
			</td>
		</tr>
		<tr>
			<td>合同类<font color="red">*</font></td>
			<td align="left">
				<s:textfield name="template.type"></s:textfield>
			</td>
		</tr>
		<tr>
			<td>备注说明</td>
			<td align="left">
				<s:textfield name="template.desc"></s:textfield>
			</td>
		</tr>
		<tr>
			<td>选择适用的业务单位<font color="red">*</font></td>
			<td align="left">
				<textarea rows="5" cols="30" id="buSelectedTexts" readonly="readonly"><s:property value="template.buNames"/></textarea>
				<input value="选择" type="button" id="btnChoose"/>
				<s:hidden name="template.buIdStr" id="buSelectedIds"></s:hidden>
			</td>
		</tr>
	</table>
	</div>
		<s:hidden name="template.id" id="template.id"></s:hidden>
	</s:form>
</body>
</html>