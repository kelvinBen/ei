<%@ page pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>远程系统接口用户验证维护</title>
	<%@include file="/WEB-INF/jsp/metadata.jsp" %>
	<style type="text/css">
		.fieldtitle{text-indent: 12em;}
		th{height: 23px;font-size: 13px;text-indent:0px;}
	</style>
	
</head>
<body>
<div id="container">
	<%@ include file="/WEB-INF/jsp/mainmenu.jsp"%>
	<s:form id="frmAuth" action="remote_user_auth" namespace="/config" theme="simple">
	<s:actionmessage cssStyle="font-size: 13px;font-weight: bold;color: red;"/>
	<table class="tblContent" width="100%" cellpadding="0">
		<colgroup>
			<col class="fieldtitle" width="30%"/>
			<col width="70%"/>
		</colgroup>
		<tr>
			<th class="tdTitle" colspan="2">寻源系统帐户一</th>
		</tr>
		<tr>
			<th class="tdTitle">用户名</th>
			<td class="TdRight">
				<s:textfield name="esUsername1" value="if_cm" disabled="true"></s:textfield>
			</td>
		</tr>
		<tr>
			<th class="tdTitle">密码</th>
			<td class="TdRight"><input type="password" name="esPassword1"/></td>
		</tr>
		<tr>
			<th class="tdTitle">是否修改</th>
			<td class="TdRight">
				<s:checkbox name="esIsUpdate1"></s:checkbox>
			</td>
		</tr>
	</table>
	<table class="tblContent" width="100%" cellpadding="0">
		<colgroup>
			<col class="fieldtitle" width="30%"/>
			<col width="70%"/>
		</colgroup>
		<tr>
			<th class="tdTitle" colspan="2">寻源系统帐户二</th>
		</tr>
		<tr>
			<th class="tdTitle">用户名</th>
			<td class="TdRight">
				<s:textfield name="esUsername2" value="if_bam" disabled="true"></s:textfield>
			</td>
		</tr>
		<tr>
			<th class="tdTitle">密码</th>
			<td class="TdRight"><input type="password" name="esPassword2"/></td>
		</tr>
		<tr>
			<th class="tdTitle">是否修改</th>
			<td class="TdRight">
				<s:checkbox name="esIsUpdate2"></s:checkbox>
			</td>
		</tr>
	</table>
	<table class="tblContent" width="100%" cellpadding="0">
		<colgroup>
			<col class="fieldtitle" width="30%"/>
			<col width="70%"/>
		</colgroup>
		<tr>
			<th class="tdTitle" colspan="2">合同系统</th>
		</tr>
		<tr>
			<th class="tdTitle">用户名</th>
			<td class="TdRight">
				<s:textfield name="ecmUsername" value="interfaceuser" disabled="true"></s:textfield>
			</td>
		</tr>
		<tr>
			<th class="tdTitle">密码</th>
			<td class="TdRight"><input type="password" name="ecmPassword"/></td>
		</tr>
		<tr>
			<th class="tdTitle">是否修改</th>
			<td class="TdRight">
				<s:checkbox name="ecmIsUpdate"></s:checkbox>
			</td>
		</tr>
	</table>
	<div align="center">
		<input type="submit" value="提交">
		&nbsp;&nbsp;&nbsp;
		<input type="reset" value="重置"/>
	</div>
	</s:form>
</div>
</body>
</html>