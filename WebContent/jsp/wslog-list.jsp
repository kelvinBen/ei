<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="wslog.list.title"></s:text></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
td{text-align:left;overflow:hidden;}
#pageContainer span{margin:0 2px;cursor:pointer;}
.ids{cursor: pointer;text-decoration: underline;}
button{margin-right:5px;}
</style>
<script type="text/javascript">

$(function(){
	initPage();
	
	$('#selectAll').change(function(){
		if($(this).attr("checked")==false){
			$('input:checkbox').each(function(i,obj){
				$(this).attr("checked",false);
			});			
		}else if($(this).attr("checked")==true){
			$('input:checkbox').each(function(i,obj){
				$(this).attr("checked",true);
			});			
		}
	});
	
	$('input:checkbox').each(function(i,obj){
		$(this).attr("checked",false);
	});

	//搜索
	$('#but_search').click(function(){
		$("#list").attr("action",'<s:url namespace="/wslog" action="tosearch"/>');
		$('#list').submit();
	});

	//重发
	$("#but_reprocess").click(function(){
		if ($("input:checkbox:checked").length == 0){
			alert('<s:text name="message.select.one"/>');
			return false;
		}
		for(var i=0;i<$("input:checkbox:checked").length;i++){
			var id = $("input:checkbox:checked").get(i).value;
			if($('#'+id+"_stat").attr("value")!="<%= com.cnooc.req.util.IntegrationUtil.StatusFailed %>"){
				alert("只有失败项才能重新发送");
				return false;
			}
		}
		$("#list").attr("action",'<s:url namespace="/wslog" action="reprocess"/>');
		$("#list").submit();
	});

	//取消
	$("#but_cancel").click(function(){
		if ($("input:checkbox:checked").length == 0){
			alert('<s:text name="message.select.one"/>');
			return false;
		}
		for(var i=0;i<$("input:checkbox:checked").length;i++){
			var id = $("input:checkbox:checked").get(i).value;
			if($('#'+id+"_stat").attr("value")!='<%= com.cnooc.req.util.IntegrationUtil.StatusFailed %>'){
				alert("只有失败项才能取消");
				return false;
			}
		}
		$("#list").attr("action",'<s:url namespace="/wslog" action="cancel"/>');
		$("#list").submit();
	});
	
	$("#but_refresh").click(function(){
		$("#list").attr("action",'<s:url namespace="/wslog" action="topage"/>');
		$('#list').submit();
	});
		
	$("#but_export").click(function(){
		$("#list").attr("action",'<s:url namespace="/wslog" action="export"/>');
		$('#list').submit();		
	});
});

function showDetail(id){
	window.open('<s:url namespace="/wslog" action="todetail"/>?id='+id,
			'<s:text name="menu.pri.create" />',
			'height=750px, width=750px, top=0, left=250, toolbar=no, menubar=no, url=no, scrollbars=yes, resizable=no,location=no, status=no');
	return false;		
}

//生成分页框架
var pageCount=0; //global variable
function initPage(){
	var recordCount = parseInt($('#list_pageBean_totalRows').attr("value"));
	var perPageCount = parseInt($('#list_pageBean_pageSize').attr("value"));
	var curPageNum = parseInt($('#list_pageBean_currentPage').attr("value"));	

	var pageBegin = parseInt($('#list_pageBean_pageBegin').attr("value"));
	var pageEnd = parseInt($('#list_pageBean_pageEnd').attr("value"));
    if($('#list_pageBean_totalPages').attr("value")!=0){    
		if($('#list_pageBean_hasPreviousPage').attr("value")=="true"){
			$('#pageContainer').append("<span onclick='javascript:previousPage()'><s:text name='page.prev'/></span>");
		}
		for(var i=pageBegin;i<=pageEnd;i++){
			if(curPageNum==i){
				$('#pageContainer').append("<span style='color:#FF3300;' onclick=\"javascript:toPage("+i+")\">"+i+"</span>");	
			}else{
				$('#pageContainer').append("<span onclick=\"javascript:toPage("+i+")\">"+i+"</span>");
			}
		}
		if($('#list_pageBean_hasNextPage').attr("value")=="true"){
			$('#pageContainer').append("<span onclick='javascript:nextPage()'><s:text name='page.next'/></span>");
		}		
    }
}

function previousPage(){
	$('#list_pageBean_currentPage').attr("value",$('#list_pageBean_perviousPage').attr("value"));
	$("#list").attr("action",'<s:url namespace="/wslog" action="topage"/>');
	$('#list').submit();
}

function nextPage(){
	$('#list_pageBean_currentPage').attr("value",$('#list_pageBean_nextPage').attr("value"));
	$("#list").attr("action",'<s:url namespace="/wslog" action="topage"/>');
	$('#list').submit();
}

function toPage(pageNum){
	if(pageNum==$('#list_pageBean_currentPage').attr("value"))
		return;
	else{
		$('#list_pageBean_currentPage').attr("value",pageNum);
	}
	$("#list").attr("action",'<s:url namespace="/wslog" action="topage"/>');
	$('#list').submit();
}
</script>
</head>
<body>
<div id="container">
  <%@ include file="/WEB-INF/jsp/mainmenu.jsp"%>
  <div id="wrapper">
    <div id="content" style="width:100%;">
		<s:form id="list" namespace="/wslog" action="tosearch" theme="simple" method="post">
		<div style="width:100%;">
	<table class="tblContent4list" cellpadding="0" width="100%">
		  <thead>
		    <tr>
		      <th style="text-align:right;">
		        <input id="but_search" type="button" value="<s:text name='search'/>">
		        <input id="but_refresh" type="button" value="<s:text name='refresh'/>"/>
		        <input id="but_export" type="button" value="<s:text name='button.export'/>"/>
		      </th>
		    </tr>
		  </thead>
		</table>
		</div>
		<div style="width:100%;"> 
	<table class="tblContent4list" cellpadding="0" width="100%">
		<colgroup>
			<col style="width:3%"></col>
			<col style="width:6%"></col>
			<col style="width:7%"></col>
			<col style="width:8%"></col>
			<col style="width:14%"></col>
			<col style="width:5%"></col>
			<col style="width:10%"></col>
			<col style="width:6%"></col>
			<col style="width:6%"></col>
			<col style="width:6%"></col>
			<col style="width:6%"></col>
			<col style="width:7%"></col>
			<col style="width:7%"></col>
		</colgroup>
		<thead>
		<tr>
		   <th><s:checkbox name="selectAll" id="selectAll"></s:checkbox></th>
		   <th><s:text name="wslog.id"/></th>
		   <th><s:text name="wslog.requestType"/></th>
		   <th><s:text name="wslog.requestID"/></th>
		   <th><s:text name="wslog.key"/></th>
		   <th><s:text name="wslog.status"/></th>
		   <th><s:text name="wslog.result"/></th>
		   <th><s:text name="wslog.esStatus"/></th>
		   <th><s:text name="wslog.ecmStatus"/></th>
		   <th><s:text name="wslog.sapStatus"/></th>
		   <th><s:text name="wslog.reqStatus"/></th>
		   <th><s:text name="wslog.startDate"/></th>
		   <th><s:text name="wslog.lastDate"/></th>
		 </tr>
		 </thead>
		 <s:if test="logList.size==0">
		 <tr><td colspan="13" style="text-align:center;"><s:text name="page.norows"/></td></tr>
		 </s:if>
		 <s:iterator value="logList" var="array">
		 <tr>
		 	<td><input type="checkbox" name="ids" value="<s:property value='#array.id'/>"></td>
		    <td class="ids" onclick="showDetail(<s:property value='#array.id'/>)"><s:property value="#array.id"/></td>
		    <td><s:property value="#array.requestType"/></td>
		    <td><s:property value="#array.requestID"/></td>
		    <td><s:property value="#array.key"/></td>
		    <td>
		      <s:property value="#array.status"/>
		      <input type="hidden" id="<s:property value="#array.id"/>_stat" value="<s:property value="#array.status"/>"/>
		    </td>
		    <td><s:property value="#array.result"/></td>
		    <td><s:property value="#array.esStatus"/></td>
		    <td><s:property value="#array.ecmStatus"/></td>
		    <td><s:property value="#array.sapStatus"/></td>
		    <td><s:property value="#array.reqStatus"/></td>
		    <td><s:property value="#array.startDate"/></td>
		    <td><s:property value="#array.lastDate"/></td>
		 </tr>
		</s:iterator>
		 <tr>
		    <td colspan="13" style="text-align:left;">
			  <button type="button" id="but_reprocess"><s:text name="button.reprocess"/></button> 
			  <button type="button" id="but_cancel"><s:text name="button.cancel"/></button> 
		    </td>		    		    		    		  
		 </tr>
		</table>
		</div>
		<div id="pageContainer" style="text-align:center;width:100%;margin-top:5px;font-size:13px;"></div>
		<s:hidden name="pageBean.currentPage"/>
		<s:hidden name="pageBean.totalRows"/>
		<s:hidden name="pageBean.pageSize"/>
		<s:hidden name="pageBean.totalPages"/>
		<s:hidden name="pageBean.pageStartRow"/>
		<s:hidden name="pageBean.pageEndRow"/>
		<s:hidden name="pageBean.hasNextPage"/>
		<s:hidden name="pageBean.hasPreviousPage"/>
		<s:hidden name="pageBean.nextPage"/>
		<s:hidden name="pageBean.perviousPage"/>
		<s:hidden name="pageBean.pageBegin"/>
		<s:hidden name="pageBean.pageEnd"/>
		<s:hidden name="pageBean.pageCount"/>
		
		<s:hidden name="log.id"/>
		<s:hidden name="log.requestID"/>
		<s:hidden name="log.requestType"/>
		<s:hidden name="log.requestXML"/>
		<s:hidden name="log.status"/>
		<s:hidden name="log.esStatus"/>
		<s:hidden name="log.ecmStatus"/>
		<s:hidden name="log.sapStatus"/>
		<s:hidden name="log.reqStatus"/>
		
		<s:hidden name="reqDate.operator"/>
		<s:hidden name="reqDate.beginDate"/>
		<s:hidden name="reqDate.endDate"/>
		<s:hidden name="reqDate.isContain"/>	
		</s:form>       
    </div> 
  </div>
</div>
</body>
</html>