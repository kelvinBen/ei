<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pr.create" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/changeSpecialChars.js" />"></script>
<script type="text/javascript" src="<s:url value='/js/jquery/jquery.form.js'/>">
</script>
<script type="text/javascript" src="<s:url value='/js/sp/StringOverride.js'/>">
</script>
<script type="text/javascript">
	//var mengban = $('<DIV class="body" id="card_all"  style="height:100%;width:100%;display:none;z-index:999;position:absolute;background:#E8E9EB;filter:alpha(opacity=75);"></DIV>');
	$(function() {
		if ($.messager){
			$.messager.defaults.ok = '确定';
			$.messager.defaults.cancel = '取消';
		}
		$("#dataExcel").focus();
		$("#file_form").validate({rules: {
			dataExcel:{
				required: true,
				accept:"xls|xlsx"
			}
		}});
		
		/**
		 * 解析回传的信息为html
		 */
		function parseMsgToHtml(data){
			var msg = "";
			msg +=data.msg;
			var msgItemText = "";
			if(data.msgItems!=null){
								msgItemText = data.msgItems.replaceAll("@@","</br>");
								msg+="</br>"+msgItemText;
			}
			return msg;
		}
		
		$("#excel_upload").click(function(){
			//蒙板效果
			//$("body").prepend(mengban);
			//mengban.css('display', 'block');
			if($("#file_form").valid()){
				$("#file_form").ajaxSubmit({
					url: '<s:url namespace="/excel" action="checkExcel" />',
					dataType: "json",
					success: function(data) {	
						//设置表单提交完成使用方法
						if(data.status=="error"){
							var msg = parseMsgToHtml(data);
							$("#msgDiv").css("color","red").html(msg);
						}else if(data.status=="sucess"){
							$("#file_form").submit();
						}
						else if(data.status=="warn"){
							var msg = "";
							msg +=data.msg;
							var msgItemText = "";
							if(data.msgItems!=null){
								msgItemText = data.msgItems.replaceAll("@@","</br>");
								msg+="</br>"+msgItemText;
							}
							$("#msgDiv").css("color","blue").html(msg);
							$.messager.confirm("系统警告！",data.msg, function(r){
								if (r){			
									$("#file_form").submit();
								}
		            		});
						}
		            }
					,error:function(){
						alert('<s:text name="message.save.error" />');
					}
				});
				
			}
		});
		
	});

</script>
</head>
<body>
<div id="msgDiv" style="color:red;" width="100%">&nbsp;</div>
  <div class="editdiv">
	<div>
	<c:if test="${not empty actionMessages}"><script type="text/javascript">alert('${actionMessages}');</script></c:if>
	<table class="tblContent" width="100%" cellpadding="0" >
		<s:form id="file_form" namespace="/excel" action="importExcel" theme="simple" method="post" enctype="multipart/form-data">
		<input type="hidden" name="dataType" value="${param.dataType}"/>
		<input type="hidden" name="importType" value="${param.importType}"/>
		<tbody>
			<tr>
				<th class="tdTitle"><s:text name="excel.tips.choose" /></th>
				<td class="TdRight"><s:file name="dataExcel" id="dataExcel"/><span class="star"> *</span>&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/excelTemp/<c:if test="${param.dataType=='pr'}">PurchaseRequisition_v1.0.xls</c:if><c:if test="${param.dataType=='apply'}">ProcurementApplication_v1.0.xls</c:if><c:if test="${param.dataType=='path'}">ApprovalPath_v1.0.xls</c:if><c:if test="${param.dataType=='plan'}">PurchasePlan_v1.0.xls</c:if><c:if test="${param.dataType=='projName'}">ProjName_v1.0.xls</c:if><c:if test="${param.dataType=='contract'}">LongTermContract_v1.0.xls</c:if>">点此下载模板文件</a></td>
			</tr>
			<tr>
				<td class="tdTitle" colspan="2" style="text-align:left;">
					<input value="<s:text name="button.upload" />" id="excel_upload" type="button">
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