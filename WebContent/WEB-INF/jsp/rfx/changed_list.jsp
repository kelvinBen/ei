<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>变更的寻源单据列表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
	.locker{
		width:100%;height:100%;display:none;z-index:999;position:absolute;background:#fff;filter:alpha(opacity=75);
	}
	.showUI{
		display:none;z-index:999;position:absolute;background:#fff;filter:alpha(opacity=100);
	}
</style>
<script type="text/javascript">
	$(function(){
		initPage();
		$('#tab_cont').flexigrid();//表格中的TH必须加宽度

		$("#btnSearch").click(function(){
			$("#list").attr("action",'<s:url namespace="/rfx" action="changed_search"/>');
			$("#list").submit();
		});
		$("#btnRFxUpdate").click(function(){
			var checkedCount = $("input[name='ids']:checked").length;
			if(checkedCount == 0)
			{
				alert("请选择一个要变更的RFx单据");
				return false;
			}else if(checkedCount >1)
			{
				alert("每次仅可以变更一张RFx单据");
				return false;
			}

			jQuery.ajax({
	            url: '<s:url namespace="/rfx" action="rfx_created_check" />' ,   	//提交的页面
	            data: $("#list").serialize(), 		//从表单中获取数据
	            type: "POST",                   	//设置请求类型为"POST"，默认为"GET"
	            beforeSend: function(){          	//设置表单提交前方法
					$('.locker').css('display', 'block');
					showWaitingLayer();
	            },
	            error: function(request, textStatus, errorThrown) {          //设置表单提交出错
	                alert('远程校验服务请求错误');
	                $('.locker').css('display', 'none');
	            	$("#waitingInfo").css('display', 'none');
	            },
	            success: function(data) {			//设置表单提交完成使用方法
	            	$('.locker').css('display', 'none');
	            	$("#waitingInfo").css('display', 'none');

	            	if(data != 1){
				        alert("所选采办申请变更表对应的采办申请没有生成RFx单据，请先生成相应的寻源单据");
				        return false;
				    }
				    
	            	var forwardUrl = '<s:url namespace="/rfx" action="rfx_changed_update" />?prIds='+$("input[name='ids']:checked").val();
	    		    popupWin(forwardUrl,420,400);
	    		    window.location.reload();
	            }
	        });

			function showWaitingLayer(){
				var width=200,height=100; // 单位为px
				var left = (document.body.clientWidth - width)/2;
				var top = (document.body.clientHeight - height) / 2;
				$("#waitingInfo").css('left',left+'px');
				$("#waitingInfo").css('top',top+'px');
				$("#waitingInfo").css('width',width+'px');
				$("#waitingInfo").css('height',height+'px');
				$("#waitingInfo").css('display', 'block');
			}
		});

		//弹出窗口并居中
		function popupWin(url,width,height)
		{
			window.showModalDialog(url,'','dialogWidth:'+width+'px; dialogHeight:'+height+'px;status:0;help:0;resizable:1;');
			//var left = (screen.width - width)/2;
			//var top = (screen.height - height) / 2;
			//window.open(url,'','height='+height+',width='+width+',left='+left+',top='+top+',toolbar=no,menubar=no,location=no,status=no');
		}

	});
</script>
</head>
<body>
<DIV class="locker"></DIV>
<DIV id="waitingInfo" class="showUI">
	<img src="<s:url value="/images/loading.gif"/>"> &nbsp;正在验证请稍后……
</DIV>
<s:form id="list" namespace="/rfx" action="changed_list" theme="simple">
<div class="title">
	<table width="100%">
		<thead>
			<tr>
				<th align="left">
					<input type="button" id="btnRFxUpdate" value="更新RFx"/>
					<input type="button" id="btnSearch" value="查询" />
				</th>
			</tr>
		</thead>
	</table>
</div>
<div class="listCon"> 
	<table id="tab_cont">
	<thead>
		<tr>
			<th width="20">&nbsp;</th>
			<th width="100">采办申请号</th>
			<th width="100">采办申请变更号</th>
			<th width="100">申请单位</th>
			<th width="80">申请部门</th>
			<th width="100">项目名称</th>
			<th width="80">本次采办预算</th>
			<th width="100">推荐采办方式</th>
			<th width="80">申请类型</th>
			<th width="100">推荐供应商</th>
			<th width="100">是否集中采购</th>
			<th width="100">采办需求号码</th>
			<th width="100">行项目号码</th>
			<th width="100">物资/服务描述</th>
			<th width="80">数量</th>
			<th width="80">估计价格</th>
			<th width="80">交货日期</th>
		</tr>
	</thead>
	<tbody>
	<s:set scope="page" var="lastId" value="null"></s:set>
	<s:iterator value="prapplist" var="item">
		<tr>
			<td>
				<s:if test="#item.FLD_CODE == #lastId">
					&nbsp;
				</s:if>
				<s:else>
					<input type="checkbox" name="ids" value="<s:property value="#item.FLD_CODE"/>"/>
				</s:else>
			</td>
			<td>
				<s:if test="#item.FLD_CODE == #lastId">
					&nbsp;
				</s:if>
				<s:else>
					<s:property value="#item.FLD_APPLYNO"/>
				</s:else>
			</td>
			
			<td><s:property value="#item.FLD_CHANGENO"/>&nbsp;</td>
			<td><s:property value="#item.FLD_APPLY_ORGAN"/>&nbsp;</td>
			<td><s:property value="#item.FLD_APPLY_DEPTNAME"/>&nbsp;</td>
			<td><s:property value="#item.FLD_PROJ_NAME"/>&nbsp;</td>
			<td><s:property value="#item.FLD_CURRENT_BUDGET"/>&nbsp;</td>
			<td>
				<s:property value="#item.FLD_RECOMMEND_MODE"/>
			&nbsp;</td>
			<td>
				<s:property value="#item.FLD_APPLY_TYPE"/>
			&nbsp;</td>
			<td>
				<s:property value="#item.FLD_BIDVENDOR_REAS0N"/>
			&nbsp;</td>
			<td>
				<s:if test="#item.FLD_IS_CENTRAL==0">
					非集采
				</s:if>
				<s:elseif test="#item.FLD_IS_CENTRAL==1">
					一级集采
				</s:elseif>
				<s:elseif test="#item.FLD_IS_CENTRAL==2">
					二级集采
				</s:elseif>
			</td>
			<td>
				<s:property value="#item.FLD_PR_NO"/>
			&nbsp;</td>
			<td>
				<s:property value="#item.FLD_PRITEM_NO"/>
			&nbsp;</td>
			<td><s:property value="#item.FLD_MATERIALS_SERVICE"/>&nbsp;</td>
			<td><s:property value="#item.FLD_COUNT"/>&nbsp;</td>
			<td><s:property value="#item.FLD_TOTALPRICE"/>&nbsp;</td>
			<td>
				<s:property value="#item.FLD_DELIVERY_DATE"/>
			&nbsp;</td>
		</tr>
		<s:set var="lastId" value="#item.FLD_CODE"></s:set>
	</s:iterator>
	</tbody>
	</table>
</div>

	<div id="pageContainer"></div>
	<%@include file="/WEB-INF/jsp/page.jsp"%>
	<input type="hidden" id="pageURL" value='<s:url namespace="/rfx" action="changed_list"/>'/>

	<s:hidden name="pr.operator"></s:hidden>
	<s:hidden name="pr.begin"></s:hidden>
	<s:hidden name="pr.end"></s:hidden>
	<s:hidden name="prapplySearch.operator"></s:hidden>
	<s:hidden name="prapplySearch.begin"></s:hidden>
	<s:hidden name="prapplySearch.end"></s:hidden>
	<s:hidden name="factory.operator"></s:hidden>
	<s:hidden name="factory.begin"></s:hidden>
	<s:hidden name="factory.end"></s:hidden>
	<s:hidden name="procurementGroup.operator"></s:hidden>
	<s:hidden name="procurementGroup.begin"></s:hidden>
	<s:hidden name="procurementGroup.end"></s:hidden>
	<s:hidden name="material.operator"></s:hidden>
	<s:hidden name="material.begin"></s:hidden>
	<s:hidden name="material.end"></s:hidden>
	<s:hidden name="prapplyCreateDate.operator"></s:hidden>
	<s:hidden name="prapplyCreateDate.begin"></s:hidden>
	<s:hidden name="prapplyCreateDate.end"></s:hidden>
	<s:hidden name="procurementOperatorName"></s:hidden>
	<s:hidden name="procurementOperator"></s:hidden>
	<s:hidden name="maxResult"></s:hidden>
</s:form>
</body>
</html>