<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="wslog.search.title"></s:text></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
.selectCon{float:left;margin-right:5px;margin-top:2px;}
.movCon{float:left;margin-right:5px;margin-top:22px;vertical-align:middle;}
</style>
<script type="text/javascript">
var oldStateContainer = new Array();
$(function(){

	$("#search").validate({
		rules:{
			'log.id':{
				digits:true
			},
			'reqDate.beginDate':{
				date: true
			},
			'reqDate.endDate':{
				date: true
			}
		}
	});
	//保存原有搜索条件
	$("INPUT,SELECT,TEXTAREA").each(function(i,obj){
		saveState(obj,oldStateContainer);
	});

	//搜索时间定义	
	$('#wslog_startDate_beginDate').datepicker();
	$('#wslog_startDate_endDate').datepicker();
	if($('#reqDate').attr("value")!="1"){
		$('#wslog_startDate_endDate').attr("value","");
		$('#wslog_startDate_endDate').attr("disabled",true);
	}
	$('#reqDate').change(function(){
		if($(this).attr("value")=="1"){
			$('#wslog_startDate_endDate').attr("disabled",false);
		}else{
			$('#wslog_startDate_endDate').attr("value","");
			$('#wslog_startDate_endDate').attr("disabled",true);
		}
	});

	//新搜索
	$('#but_select').click(function(){
		if($("#search").validate().form())
			$('#search').submit();
		else
			return false;
	});

	//返回
	$('#but_return').click(function(){
		$("INPUT,SELECT,TEXTAREA").each(function(i,obj){
			$(this).attr("value",oldStateContainer[i]);
		});
		$('#search').submit();
	});
});


</script>
</head>
<body>
<div id="container">
<%@ include file="/WEB-INF/jsp/mainmenu.jsp"%>
  <div id="wrapper">
	<div id="content" style="float:left;width:100%;padding-right:5px;padding-top:0px;">
		<s:form id="search" namespace="/wslog" action="list" theme="simple" method="post"> 
	<table class="tblContent" width="100%" cellpadding="0">
		<tr>
		<th class="tdTitle" style="text-align:left;"><s:text name="wslog.search.searchcondition"/></th>
		<th class="tdTitle" style="border:0;text-align:right;width:80%">
		  <button type="button" id="but_select"><s:text name="button.search.now"/></button> 
		  <button type="button" id="but_return"><s:text name="return"/></button>
		</th>
		</tr>
		<tr>
		   <th class="tdTitle"><s:text name="wslog.id"/></th>
		   <td class="TdRight"><s:textfield maxlength="160" id="wslog_id" name="log.id"/></td>
		</tr>
		<tr>
		   <th class="tdTitle"><s:text name="wslog.requestID"/></th>
		   <td class="TdRight"><s:textfield maxlength="160" id="wslog_requestID" name="log.requestID"/></td>
		</tr>
		<tr>
		   <th class="tdTitle"><s:text name="wslog.key"/></th>
		   <td class="TdRight"><s:textfield maxlength="160" id="wslog_requestID" name="log.key"/></td>
		</tr>
		<tr>
		   <th class="tdTitle"><s:text name="wslog.requestType"/></th>
		   <td class="TdRight"><s:select list="requestTypeList" id="wslog_requestType" name="log.requestType" value="log.requestType" headerKey="" headerValue=""></s:select></td>
		</tr>
		<tr>
		   <th class="tdTitle"><s:text name="wslog.requestXML"/></th>
		   <td class="TdRight"><s:textfield maxlength="160" id="wslog_requestXML" name="log.requestXML"/></td>
		</tr>	
		<tr>
		   <th class="tdTitle"><s:text name="wslog.status"/></th>
		   <td class="TdRight"><s:select list="statusList" id="wslog_status" name="log.status" value="log.status" headerKey="" headerValue=""></s:select></td>
		</tr>
		
		
		<tr>
		   <th class="tdTitle"><s:text name="wslog.esStatus"/></th>
		   <td class="TdRight"><s:select list="statusList" id="wslog_esStatus" name="log.esStatus" value="log.esStatus" headerKey="" headerValue=""></s:select></td>
		</tr>
		<tr>
		   <th class="tdTitle"><s:text name="wslog.ecmStatus"/></th>
		   <td class="TdRight"><s:select list="statusList" id="wslog_ecmStatus" name="log.ecmStatus" value="log.ecmStatus" headerKey="" headerValue=""></s:select></td>
		</tr>
		<tr>
		   <th class="tdTitle"><s:text name="wslog.sapStatus"/></th>
		   <td class="TdRight"><s:select list="statusList" id="wslog_sapStatus" name="log.sapStatus" value="log.sapStatus" headerKey="" headerValue=""></s:select></td>
		</tr>
		<tr>
		   <th class="tdTitle"><s:text name="wslog.reqStatus"/></th>
		   <td class="TdRight"><s:select list="statusList" id="wslog_reqStatus" name="log.reqStatus" value="log.reqStatus" headerKey="" headerValue=""></s:select></td>
		</tr>						
		
		<tr>
		  <th class="tdTitle"><s:text name="wslog.startDate"/></th>
		  <td class="TdRight">
		     <s:select id="reqDate" name="reqDate.operator" list="#{2:'>',1:'[,]',0:'<'}"/>
		     <s:textfield id="wslog_startDate_beginDate" name="reqDate.beginDate" readonly="false" />
		     <s:textfield id="wslog_startDate_endDate" name="reqDate.endDate" readonly="false" />
		  	 <s:checkbox name="reqDate.isContain"/><s:text name="contain"/>			  	 		    
		  </td>
		</tr>
		<tr>
		  <th class="tdTitle"><s:text name="pr.header.company" /></th>
		  <td class="TdRight"><s:select list="listUnit" listKey="id" listValue="name" name="log.unit.id" headerKey="" headerValue=""/></td>
		</tr>
		</table>
	  </s:form>       
    </div>      
  </div>
</div>
</body>
</html>