<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>长期协议行项目搜索页</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
$(function(){
	
	$('select.multiple').each(function(){
		$(this).attr("multiple",true);
	});
	$('#startDate').datepicker();
	$('#endDate').datepicker();
	$('#reqStartDate').datepicker();
	$('#reqEndDate').datepicker();

	if($('#subDate').attr("value")!="1"){
		$('#endDate').attr("value","");
		$('#endDate').attr("disabled",true);
	}
	$('#subDate').change(function(){
		if($(this).attr("value")=="1"){
			$('#endDate').attr("disabled",false);
		}else{
			$('#endDate').attr("value","");
			$('#endDate').attr("disabled",true);
		}
	});

	if($('#reqDate').attr("value")!="1"){
		$('#reqEndDate').attr("value","");
		$('#reqEndDate').attr("disabled",true);
	}
	$('#reqDate').change(function(){
		if($(this).attr("value")=="1"){
			$('#reqEndDate').attr("disabled",false);
		}else{
			$('#reqEndDate').attr("value","");
			$('#reqEndDate').attr("disabled",true);
		}
	});

	$('#but_search').click(function(){
		if($('#list').validate().form()){
			window.opener.name="openWindow";
			$('#list').attr("target","openWindow");
			$('#list').submit();	
			window.close();
		}
	});
	
	$('#but_close').click(function(){
		window.close();
	});
	
	$('#list').validate({
		rules:{
			'conSum.hostOrg.buName':{
				maxlength:30
			},	
			'conSum.contNum':{
				maxlength:80
			},
			'conSum.supplierName':{
				maxlength: 80
			},
			'subDate.beginDate':{
				date: true
			},
			'subDate.endDate':{
				date: true
			},	
			'reqDate.beginDate':{
				date: true
			},	
			'reqDate.endDate':{
				date: true
			}									
		}
	});
});

</script>
</head>
<body>
	<div class="editdiv">
		<s:form id="list" namespace="/sc/contract/item" action="search" theme="simple" method="POST">
		
		<input type="hidden" name="id" value='<s:property value="#request.id"/>' />
		<table class="tblContent" width="100%" cellpadding="0">
		<tr>
		</tr>
		<tr><th colspan="2" class="tdTitle" style="height:26px;">详细搜索</th></tr>
		<s:i18n name="LongTermContract">
		<tr>
		   <th class="tdTitle">物料组</th>
		   <td class="TdRight"><s:textfield maxlength="80" name="flt_ci_and_optLikeS_materialGroup"/></td>
		</tr>
		<tr>   
		   <th class="tdTitle">物料号</th>
		   <td class="TdRight"><s:textfield maxlength="80" name="flt_ci_and_optLikeS_materialNum"/></td>
		</tr>
		<tr>
		   <th class="tdTitle">物料/服务描述</th>
		   <td class="TdRight"><s:textfield maxlength="80" name="flt_ci_and_optLikeS_materialDesc"/></td>
		</tr>
		<tr>
		  <th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.deleted"/></th>
		  <td class="TdRight"><s:select name="flt_ci_and_eqB_deleted" headerKey="" headerValue="全部" list="#{'0':'否','1':'是'}"/></td>
		</tr>
		</s:i18n>
		<tr>
		<td colspan="2" style="border:0;text-align:center;">
		  <button type="button" id="but_search"><s:text name="pr.search.now"/></button> 
		  <button type="button" id="but_close"><s:text name="button.close"/></button>
		</td>
		</tr>		
		</table>
		</s:form>       
    </div>      
</body>
</html>