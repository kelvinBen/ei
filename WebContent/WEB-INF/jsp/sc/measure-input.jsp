<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="measure.create.newpage" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function(){
		
		$("#measure_close").click(function(){								//注册关闭按钮事件
			window.location.href="${pageContext.request.contextPath}/sc/measure/list.do";
			return false;
		});
		
		//$("#measure_save").click(function(){
			//$("#measure_form").attr("action",'<s:url namespace="/measure" action="save"/>');
			//$("#measure_form").submit();
		//});
		
		$("#measure_form").validate({										//注册表单校验规则
			rules: {
			'measure.measureid': {
			required: true
		    },
		    'measure.description_zh_CN': {
			required: true,
			maxlength: 80
		    },
		    'measure.description_en_US': {
			 required: true,
			 maxlength: 80
		    }
			}
		});
		
		$("#measure_save").click(function(){
			$.post("${pageContext.request.contextPath}/sc/measure/ishas.do",
			 $("#measure_form").serialize(),
				function(ishas){
					if(ishas=="false"){
						$("#measure_form").attr("action",'<s:url namespace="/sc/measure" action="save"/>');
						$("#measure_form").submit();
					}else{
						alert('<s:text name="measure.message.uniqeu"/>');
						return false;
					}
				},
				"text"
			);
			
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
			<table class="tblContent" width="100%" cellpadding="0">
				<s:form id="measure_form" namespace="/sc/measure" action="save" theme="simple" method="post">
				<s:textfield cssStyle="display:none" name="measure.id" id="measure_id"/>
				<s:textfield cssStyle="display:none" name="measure.deleted" id="measure_deleted" value="false"/>
				<tbody>
					
					<tr>
						<th class="tdTitle" ><s:text name="measure.measureid" /></th>
						<td class="TdRight">
						<s:textfield  cssClass="inputnormal"  name="measure.measureid" maxlength="12" readonly="false"/><span class="star"> *</span>
						</td>
					</tr>
				
					<tr>					
						<th class="tdTitle"><s:text name="measure.description_zh_CN" /></th>
						<td class="TdRight"><s:textfield cssClass="inputnormal" name="measure.description_zh_CN" id="measure.description_zh_CN" /><span class="star"> *</span></td>
					</tr>
					
					<tr>
					<th class="tdTitle"><s:text name="measure.description_en_US" /></th>
						<td class="TdRight"><s:textfield cssClass="inputnormal" name="measure.description_en_US" id="measure.description_en_US" /><span class="star"> *</span></td>
					</tr>
					
					<tr>
						<td colspan="2" style="text-align: center;">
							<button value="" id="measure_save" type="button"><s:text name="button.save"/></button>	
							<button value="" id="measure_close" type="button"><s:text name="button.close" /></button>
							
						</td>
					</tr>
				</tbody>
				</s:form>
			</table>
	</div>
</body>
</html>