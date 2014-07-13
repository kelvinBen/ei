<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<script type="text/javascript">
//生成分页框架
function initPage(){
	var recordCount = parseInt($('#pageBean_totalRows').attr("value"));
	var perPageCount = parseInt($('#pageBean_pageSize').attr("value"));
	var curPageNum = parseInt($('#pageBean_currentPage').attr("value"));	

	var pageBegin = parseInt($('#pageBean_pageBegin').attr("value"));
	var pageEnd = parseInt($('#pageBean_pageEnd').attr("value"));
    if($('#pageBean_totalPages').attr("value")!=0){
		if($('#pageBean_hasPreviousBatch').attr("value")=="true"){
			$('#pageContainer').append("<span onclick='javascript:previousBatch()'>&lt;&lt;&nbsp;</span>");
		}
          
		if($('#pageBean_hasPreviousPage').attr("value")=="true"){
			$('#pageContainer').append("<span onclick='javascript:previousPage()'>&lt;&nbsp;</span>");
		}
		
		for(var i=pageBegin;i<=pageEnd;i++){
			if(curPageNum==i){
				$('#pageContainer').append("<span style='color:red;' onclick=\"javascript:toPage("+i+")\">"+i+"</span>");	
			}else{
				$('#pageContainer').append("<span onclick=\"javascript:toPage("+i+")\">"+i+"</span>");
			}
		}
		
		if($('#pageBean_hasNextPage').attr("value")=="true"){
			$('#pageContainer').append("<span onclick='javascript:nextPage()'>&nbsp;&gt;</span>");
		}

		if($('#pageBean_hasNextBatch').attr("value")=="true"){
			$('#pageContainer').append("<span onclick='javascript:nextBatch()'>&nbsp;&gt;&gt;</span>");
		}
		
		//每页显示条数
    	$('#pageContainer').append("<span style='float:right;margin-top:-17px;'>每页&nbsp;<select id='id_changeCount' onChange='javascript:changeCount()')'><option value='10'>10</option><option value='20'>20</option><option value='50'>50</option><option value='100'>100</option></select>&nbsp;条</span>");		
		$("#id_changeCount").setSelectedValue4select("<s:property value='pageBean.pageSize'/>");
	}
}

function previousBatch(){
	var pageNum = $('#pageBean_previousPage4batch').attr("value");
	toPage(pageNum);	
}

function nextBatch(){
	var pageNum = $('#pageBean_nextPage4batch').attr("value");
	toPage(pageNum);	
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

//用到此分页功能的，请不要对select做统一的操作
function changeCount(){
	var obj = window.event.srcElement;
	var value = obj.value;
	$("#pageBean_pageSize").attr("value",value);
	$('#pageBean_currentPage').attr("value",1);
	$("#list").attr("action",$('#pageURL').attr("value"));
	$('#list').submit();	
}
</script>
<s:hidden name="pageBean.currentPage" id="pageBean_currentPage"/>
<s:hidden name="pageBean.totalRows" id="pageBean_totalRows"/>
<s:hidden name="pageBean.pageSize" id="pageBean_pageSize"/>
<s:hidden name="pageBean.totalPages" id="pageBean_totalPages"/>
<s:hidden name="pageBean.pageStartRow" id="pageBean_pageStartRow"/>
<s:hidden name="pageBean.pageEndRow" id="pageBean_pageEndRow"/>
<s:hidden name="pageBean.hasNextPage" id="pageBean_hasNextPage"/>
<s:hidden name="pageBean.hasPreviousPage" id="pageBean_hasPreviousPage"/>
<s:hidden name="pageBean.nextPage" id="pageBean_nextPage"/>
<s:hidden name="pageBean.perviousPage" id="pageBean_perviousPage"/>
<s:hidden name="pageBean.pageBegin" id="pageBean_pageBegin"/>
<s:hidden name="pageBean.pageEnd" id="pageBean_pageEnd"/>
<s:hidden name="pageBean.pageCount" id="pageBean_pageCount"/>
<s:hidden name="pageBean.hasNextBatch" id="pageBean_hasNextBatch"/>
<s:hidden name="pageBean.hasPreviousBatch" id="pageBean_hasPreviousBatch"/>
<s:hidden name="pageBean.nextPage4batch" id="pageBean_nextPage4batch"/>
<s:hidden name="pageBean.previousPage4batch" id="pageBean_previousPage4batch"/>
<s:hidden name="isDetailResult" id="isDetailResult"/>