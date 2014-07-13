<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<title><s:text name="com.cnooc.domain.catalog.indicator.header" /></title>
<style type="text/css">
	thead td{padding: 1px;}
	#listbody td{text-align: center;}
	#list_header_table{padding: 0px;margin: 0px;border: 0px;}
	#list_header_table td{border: 0px;}
</style>

<script type="text/javascript">
$(function() {
	$("#a_sm_indicators").addClass("currentLink");
	
	$("#btnAdd").click(function(){
		location.href='<s:url namespace="/br" action="indicatorAdd"><s:param name="testId" value="#request.testId"/></s:url>';
	});
	$("#export_selected").click(function(){
		var selected = false;
		$("input:checkbox").each(function(){   
			if($(this).attr("checked")){   
				selected = true;
			}    
		});

		if (!selected){
			alert('<s:text name="message.select.one" />');
			return false;
		}

		$("#indicator_form").attr("action",'<s:url namespace="/br" action="export"/>');
		$("#indicator_form").submit();

		return false;
	});	
	$("#btnDelete").click(function(){
		var selected = false;
		$("input:checkbox").each(function(){   
			if($(this).attr("checked")){   
				selected = true;
			}
		});

		if (!selected){
			alert('<s:text name="message.select.one" />');
			return false;
		}else
		{
			if(confirm('<s:text name="com.cnooc.domain.catalog.indicator.deletePrompt" />'))
			{
				$("#indicator_form").attr("action",'<s:url namespace="/br" action="indicatorDelete"></s:url>');
				$("#indicator_form").submit();
			}
		}
	});	
});

//全选的功能
function selectall() {
	var arryObj = document.getElementsByName("ids");
	var select_all = document.getElementById("select_all");
	//alert(select_all[0].checked);
	if (select_all.checked == true) {
		//alert(arryObj.length);
		for ( var i = 0; i < arryObj.length; i++) {
			if (typeof arryObj[i].type != "undefined"
					&& arryObj[i].type == 'checkbox') {
				arryObj[i].checked = true;
			}
		}
	} else {
		for ( var i = 0; i < arryObj.length; i++) {
			if (typeof arryObj[i].type != "undefined"
					&& arryObj[i].type == 'checkbox') {
				arryObj[i].checked = false;
			}
		}
	}
}
</script>
</head>

<body>
<div class="editdiv">
<%@ include file="/WEB-INF/jsp/sidebar-sm.jsp"%>
       <s:form id="indicator_form" theme="simple" method="post">
	   <input type="hidden" name="testId" value="<s:property value="#request.testId" />">
			<table class="tblContent4list" width="100%" cellpadding="0" border="1px">
			<thead>
				<tr>
					<td colspan="4">
						<table id="list_header_table">
							<colgroup>
						      	<col style="width:10%;"/>
						      	 <col style="width:60%;"/>
						     	 <col style="width:20%;"/>
						    </colgroup>
							<tr>
								<td style="text-align:left;padding-left:10px;height:100%">主要技术指标清单</td>
								<td></td>
								<td align="right">
									<button id="export_selected"><s:text name="button.export"/></button>
									&nbsp;
									<button id="btnAdd"><s:text name="button.new" /></button>
									&nbsp;
									<button id="btnDelete"><s:text name="button.delete" /></button>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</thead>
			<tbody id="listbody">
				<tr>
					<td style="text-align:center;">
						<input type="checkbox" name="select_all" id="select_all" onclick="selectall()"></input>
					</td>
					<td width="20%"><s:text name="com.cnooc.domain.catalog.indreview.decription"/></td>
					<td width="60%"><s:text name="com.cnooc.domain.catalog.indreview.moreInfo"/></td>
					<td width="10%"><s:text name="com.cnooc.domain.catalog.indreview.type" /></td>
				</tr>
				<s:iterator value="#request.measurements" id="keyMeasurement">
					<tr align="center">
						<td style="text-align:center;">
							<input type="checkbox" name="ids" value="<s:property value="#keyMeasurement.id"/>"/>
						</td>
						<td style="text-align:left;padding-left:10px;">
							<s:url id="url" action="indicatorUpdate">
								<s:param name="keyId">
									<s:property value="#keyMeasurement.id" />
								</s:param>
								<s:param name="keyType">
									<s:property value="#keyMeasurement.type" />
								</s:param>
								<s:param name="testId">
									<s:property value="#request.testId" />
								</s:param>
							</s:url> 
							<s:a href="%{url}">
								<s:property value="#keyMeasurement.description"></s:property>
							</s:a>
						</td>
						<td style="text-align:left;padding-left:10px;"><s:property value="#keyMeasurement.moreInfo"></s:property></td>
						<td>
				<s:if test="#keyMeasurement.type=='date'">日期</s:if>
				<s:elseif test="#keyMeasurement.type=='int'">整数</s:elseif>
				<s:elseif test="#keyMeasurement.type=='float'">小数</s:elseif>
				<s:elseif test="#keyMeasurement.type=='boolean'">是/否</s:elseif>
				<s:else>文本</s:else>

						</td>									
					</tr>
				</s:iterator>
			</tbody>
		</table>
		
		</s:form>
		</div>

</body>
</html>