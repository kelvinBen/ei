<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>长期协议详细搜索页</title>
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
		if($('#list').validate().form() && check()){
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

function check(){
	//需求日期是否在合理范围之内
	if($('#subDate').val()=="1"){
		var strBeginDate = $('#startDate').attr("value");
		var strEndDate = $('#endDate').attr("value");
		if(strBeginDate!=null && strBeginDate!="" && strEndDate!=null && strEndDate!="")
		var dt1 = new Date(Date.parse(strBeginDate));
		var dt2 = new Date(Date.parse(strEndDate));
		if(dt1>=dt2){
			alert('<s:text name="pr.manage.date.limite"/>');
			return false;
		}
	}
	
	//提报日期是否在合理范围之内
	if($('#reqDate').val()=="1"){
		var strBeginDate = $('#reqStartDate').attr("value");
		var strEndDate = $('#reqEndDate').attr("value");
		if(strBeginDate!=null && strBeginDate!="" && strEndDate!=null && strEndDate!="")
		var dt1 = new Date(Date.parse(strBeginDate));
		var dt2 = new Date(Date.parse(strEndDate));
		if(dt1>=dt2){
			alert('<s:text name="pr.manage.date.limite"/>');
			return false;
		}
	}
	return true;				
}
</script>
</head>
<body>
	<div class="editdiv">
		<s:form id="list" namespace="/sc/contract" action="list" theme="simple" method="POST"> 
		<table class="tblContent" width="100%" cellpadding="0">
		<tr>
		</tr>
		<tr><th colspan="2" class="tdTitle" style="height:26px;">详细搜索</th></tr>
		<s:i18n name="LongTermContract">
		<tr>
		   <th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.hostOrg"/></th>
		   <td class="TdRight"><s:textfield maxlength="80" id="purNumber" name="conSum.hostOrg.organName"/></td>
		</tr>
		<tr>   
		   <th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.contNum"/></th>
		   <td class="TdRight"><s:textfield maxlength="80" name="conSum.contNum"/></td>
		</tr>
		<tr>
		   <th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.supplierName"/></th>
		   <td class="TdRight"><s:textfield maxlength="80" name="conSum.supplierName"/></td>
		</tr>
		<tr>
		  <th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.effectDate"/></th>
		  <td class="TdRight">
		     <s:select id="subDate" name="subDate.operator" list="#{2:'>',1:'[,]',0:'<'}"/>
		     <s:textfield id="startDate" name="subDate.beginDate" readonly="true" />
		     <s:textfield id="endDate" name="subDate.endDate" readonly="true" />
		  	 <s:checkbox name="subDate.isContain"/>
		  </td>
		</tr>
		<tr>
		  <th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.expireDate"/></th>
		  <td class="TdRight">
		     <s:select id="reqDate" name="reqDate.operator" list="#{2:'>',1:'[,]',0:'<'}"/>
		     <s:textfield id="reqStartDate" name="reqDate.beginDate" readonly="true" />
		     <s:textfield id="reqEndDate" name="reqDate.endDate" readonly="true" />
		  	 <s:checkbox name="reqDate.isContain"/>			  	 		    
		  </td>
		</tr>
		<tr>
		  <th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.contType"/></th>
		  <td class="TdRight"><s:select name="conSum.contType" headerKey="-1" headerValue="全部" list="#{'WK-价值协议':'WK-价值协议','MK-数量协议':'MK-数量协议'}"/></td>
		</tr>
		<tr>
		  <th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractSummary.deleted"/></th>
		  <td class="TdRight"><s:select name="deleted" headerKey="-1" headerValue="全部" list="#{'0':'否','1':'是'}"/></td>
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