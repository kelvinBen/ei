<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pr.history.list" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		initPage();
		$("#export_selected").click(function(){
			$("#list").attr("action",'<s:url namespace="/mh" action="export"/>');
			$("#list").submit();
		});	
	});
</script>
</head>
<body>
<div class="editdiv" style="margin: 0; padding: 0;"><s:form
	id="list" namespace="/history" action="export" theme="simple"
	method="post">
	<div>
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead>
			<tr>
				<th align="left"><span><s:text name="pr.history.all" />
				(<s:property value="page.result.size()" />)</span></th>
				<th align="right">
				<button type="button" id="export_selected"><s:text
					name="button.export" /></button>
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent4list" width="100%" cellpadding="0"
		style="table-layout: fixed; word-break: break-all;">
		<colgroup>
			<col style="width: 20%">
			<col style="width: 10%">
			<col style="width: 10%">
			<col style="width: 10%">
			<col style="width: 10%">
			<col style="width: 20%">
			<col style="width: 20%">
		</colgroup>
		<thead>
			<tr>
				<th><s:text name="history.modifyDate" /></th>
				<th><s:text name="history.modifyUser" /></th>
				<th><s:text name="history.target" /></th>
				<th><s:text name="history.operType" /></th>
				<th><s:text name="history.fieldName" /></th>
				<th><s:text name="history.oldValue" /></th>
				<th><s:text name="history.newValue" /></th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="page.result" id="mhi">
				<tr>
					<td><s:property value="modifyHistory.modifyDate" /></td>
					<td><s:property value="modifyHistory.modifyUser" /></td>
					<td><s:property value="modifyHistory.targetClazz" /> [<s:property
						value="modifyHistory.targetId" />]</td>
					<td><s:property value="getText(modifyHistory.operType)" /></td>
					<td><s:property value="fieldName" /></td>
					<td><s:property value="oldValue" /></td>
					<td><s:property value="newValue" /></td>
				</tr>
			</s:iterator>
			<tr>
			</tr>
		</tbody>
	</table>
	</div>
	<div id="pageContainer"></div>
	<script type="text/javascript">
//生成分页代码
function initPage(){
	var recordCount = $('#pageBean_totalRows').attr("value");
	var perPageCount = $('#pageBean_pageSize').attr("value");
	var curPageNum = $('#pageBean_currentPage').attr("value");	

	var pageBegin = $('#pageBean_pageBegin').attr("value");
	var pageEnd = $('#pageBean_pageEnd').attr("value");
    if($('#pageBean_totalPages').attr("value")!=0){    
		if($('#pageBean_hasPreviousPage').attr("value")=="true"){
			$('#pageContainer').append("<span onclick='javascript:previousPage()'><s:text name='pr.mange.page.prev'/></span>");
		}
		for(var i=pageBegin;i<=pageEnd;i++){
			if(curPageNum==i){
				$('#pageContainer').append("<span style='color:red;' onclick=\"javascript:toPage("+i+")\">"+i+"</span>");	
			}else{
				$('#pageContainer').append("<span onclick=\"javascript:toPage("+i+")\">"+i+"</span>");
			}
		}
		if($('#pageBean_hasNextPage').attr("value")=="true"){
			$('#pageContainer').append("<span onclick='javascript:nextPage()'><s:text name='pr.mange.page.next'/></span>");
		}		
    }
}

function previousPage(){
	var pageNum = $('#pageBean_perviousPage').attr("value");
	toPage(pageNum);
}

function nextPage(){
	var pageNum = $('#pageBean_nextPage').attr("value");
	toPage(pageNum);
}

function toPage(pageNum){
	if(pageNum==$('#pageBean_currentPage').attr("value"))
		return;
	else{
		$('#pageBean_currentPage').attr("value",pageNum);
	}
	$("#list").attr("action",$('#pageURL').attr("value"));
	$('#list').submit();
}
</script>
	<s:hidden name="page.currentPage" id="pageBean_currentPage" />
	<s:hidden name="page.totalRows" id="pageBean_totalRows" />
	<s:hidden name="page.pageSize" id="pageBean_pageSize" />
	<s:hidden name="page.totalPages" id="pageBean_totalPages" />
	<s:hidden name="page.pageStartRow" id="pageBean_pageStartRow" />
	<s:hidden name="page.pageEndRow" id="pageBean_pageEndRow" />
	<s:hidden name="page.hasNextPage" id="pageBean_hasNextPage" />
	<s:hidden name="page.hasPreviousPage" id="pageBean_hasPreviousPage" />
	<s:hidden name="page.nextPage" id="pageBean_nextPage" />
	<s:hidden name="page.perviousPage" id="pageBean_perviousPage" />
	<s:hidden name="page.pageBegin" id="pageBean_pageBegin" />
	<s:hidden name="page.pageEnd" id="pageBean_pageEnd" />
	<s:hidden name="page.pageCount" id="pageBean_pageCount" />
	<s:hidden name="isDetailResult" id="isDetailResult" />
	<input type="hidden" id="pageURL"
		value='<s:url namespace="/mh" action="list"/>' />
	<s:hidden name="parentId" />
	<s:hidden name="parentClazz" />
	<s:hidden name="targetId" />
	<s:hidden name="targetClazz" />
	<s:hidden name="fieldName" />
	<s:hidden name="orderBy" />
</s:form></div>
</body>
</html>