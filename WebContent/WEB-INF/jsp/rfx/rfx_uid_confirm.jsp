<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>确认要取消的RFx唯一标识符</title>
	<base target="_self">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
	#tblRFxBasic td{height: 25px;}
	.actionMessage li{color: red;height: 18px;}
</style>
<script type="text/javascript">
$(function(){
	$("#frm").validate({
		onsubmit:false,
		rules:{
			"rfxBasic.rfxUniqueId":{required:true}
		}
	});
	$("#btnCancel").click(function(){
		self.close();
	});
	//提交
	$("#btnSubmit").click(function(){
		if($("#frm").valid())
		{
			jQuery.ajax({
	            url: '<s:url namespace="/rfx" action="cancelRFx"></s:url>' ,   	//提交的页面
	            data: $("#frm").serialize(), 		//从表单中获取数据
	            type: "POST",                   	//设置请求类型为"POST"，默认为"GET"
	            beforeSend: function(){          	//设置表单提交前方法
					$("#trWaiting").show();
	            },
	            error: function(request) {          //设置表单提交出错
	                alert('<s:text name="message.save.error" />');
	            },
	            success: function(data) {			//设置表单提交完成使用方法
					$("#trWaiting").hide();
					var reg=new RegExp("^01");
					if(reg.test(data))
					{
						alert("取消RFx单据成功，请继续处理");
						self.close();
					}else
					{
						var errMessage = "取消RFx失败:\n";
						errMessage += data.replace(new RegExp("^02:"),"");
						alert(errMessage);
					}
	            }
	        });
		}
	});
});
</script>
</head>
<body>
<br/>
<s:form id="frm" theme="simple" namespace="/rfx" action="cancelRFx">
<s:actionmessage />
<table width="90%" align="center" id="tblRFxBasic">
	<tr>
		<td>RFx类型：<span style="color: red;">*</span></td>
		<td>
			<s:textfield id="rfxBasic.rfxType" name="rfxBasic.rfxType" theme="simple" readonly="true" cssStyle="color:gray;"></s:textfield>
		</td>
	</tr>
	<tr>
		<td>RFx唯一标识符：<span style="color: red;">*</span></td>
		<td>
			<s:textfield id="rfxBasic.rfxUniqueId" name="rfxBasic.rfxUniqueId" theme="simple"></s:textfield>
		</td>
	</tr>
	<tr id="trWaiting" style="display: none;">
		<td colspan="2" align="center">
				<img src="<s:url value="/images/loading.gif"/>"> &nbsp;正在取消寻源单据，请稍后……
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" height="30">
			<input id="btnSubmit" type="button" value="确定"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="btnCancel" type="button" value="取消"/>
		</td>
	</tr>
</table>
	<s:hidden id="rfxUniqueId" name="rfxUniqueId" theme="simple"></s:hidden>
</s:form>
</body>
</html>