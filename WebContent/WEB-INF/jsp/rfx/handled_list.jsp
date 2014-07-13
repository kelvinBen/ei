<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>已处理的寻源单据列表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function(){
		initPage();
		$('#tab_cont').flexigrid();//表格中的TH必须加宽度
		buttonControl(); //控制“取消删除”和“取消RFx”显示状态
		
		//全选checkbox事件处理
		$("#selectAll").change(function(){
			$("input[name='ids']").attr("checked",$(this).attr("checked"));
		});
		
		$("#btnSearch").click(function(){
			//location = '<s:url namespace="/rfx" action="unhandled_search"/>';
			$("#list").attr("action",'<s:url namespace="/rfx" action="handled_search"/>');
			$("#list").submit();
		});
		$("#slcDeleted").change(function(){
			$("#list").submit();
		});
		
		$("#btnCancelDelete").click(function(){
			var checkedCount = $("input[name='ids']:checked").length;
			if(checkedCount == 0)
			{
				alert("请选择一个要取消删除的单据");
				return false;
			}else 
			{
				$("#list").attr("action",'<s:url namespace="/rfx" action="handled_restore"/>');
				$("#list").submit();
			}
		});
		
		$("#btnRFxCancel").click(function(){
			var checkedCount = $("input[name='ids']:checked").length;
			if(checkedCount == 0)
			{
				alert("请选择一个要取消的RFx单据");
				return false;
			}else if(checkedCount >1)
			{
				alert("每次仅可以取消一张RFx单据");
				return false;
			}else{
				var prompt = "1) 已授标的RFx无法取消\n2) 所选项目对应的RFx将被取消，包括已进行的发标、投标等 \n\n是否继续？";
				if(confirm(prompt))
				{
					var forwardUrl = '<s:url namespace="/rfx" action="uid_confirm" />'+'?rfxUniqueId='+$("input[name='ids']:checked").val();
					popupWin(forwardUrl,420,400);
					location.reload();
				}
			}
		});

		//弹出窗口并居中
		function popupWin(url,width,height)
		{
			window.showModalDialog(url,'','dialogWidth:'+width+'px; dialogHeight:'+height+'px;status:0;help:0');
		}
		function buttonControl()
		{
			if($("#slcDeleted").val()=="1") //已删除
			{
				$("#btnRFxCancel").hide();
				$("#btnCancelDelete").show();
			}else{ //未删除
				$("#btnRFxCancel").show();
				$("#btnCancelDelete").hide();
			}
		}
	});
</script>
</head>
<body>
<s:form id="list" theme="simple">
<div class="title">
	<table>
		<thead>
			<tr>
				<th align="left">
					<input type="button" id="btnRFxCancel" value="取消RFx单据" />
					<input type="button" id="btnCancelDelete" value="取消删除" />
					<input type="button" id="btnSearch" value="查询" />
					
					<s:select id="slcDeleted" name="slcDeleted" list="#{'1':'已删除','0':'未删除'}" ></s:select>
				</th>
			</tr>
		</thead>
	</table>
</div>
<div class="listCon"> 
	<table id="tab_cont">
	<thead>
		<tr>
			<th width="20"><input type="checkbox" id="selectAll"/></th>
			<th width="100">RFx名称</th>
			<th width="100">生成寻源单据时间</th>
			<th width="100">RFx被分派人员ID</th>
			<th width="100">RFx唯一标识符</th>
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
	<s:set scope="page" var="lastRfxNo" value="null"></s:set>
	<s:set scope="page" var="lastPrNo" value="null"></s:set>
	<s:iterator value="prapplist" var="item">
		<tr>
			<td>
				<s:if test="#item.FLD_RFX_NO == #lastRfxNo">
					&nbsp;
				</s:if>
				<s:else>
					<input type="checkbox" name="ids" value="<s:property value="#item.FLD_RFX_NO"/>"/>
				</s:else>
			</td>
			<td>
				<s:if test="#item.FLD_RFX_NO == #lastRfxNo">
					&nbsp;
				</s:if>
				<s:else>
					<s:property value="#item.FLD_RFX_NAME"/>
				</s:else>
			</td>
			
			<td>
				<s:if test="#item.FLD_RFX_NO == #lastRfxNo">
					&nbsp;
				</s:if>
				<s:else>
					<s:property value="#item.FLD_CREATE_DATE"/>
				</s:else>
			</td>
			<td>
				<s:if test="#item.FLD_RFX_NO == #lastRfxNo">
					&nbsp;
				</s:if>
				<s:else>
					<s:property value="#item.FLD_HEADOFFICE_USERID"/>
				</s:else>
			</td>
			
			
			<td>
				<s:if test="#item.FLD_RFX_NO == #lastRfxNo">
					&nbsp;
				</s:if>
				<s:else>
					<s:property value="#item.FLD_RFX_NO"/>
				</s:else>
			</td>
			<td>
				<s:if test="#item.FLD_RFX_NO == #lastRfxNo && #item.FLD_APPLYNO == #lastPrNo">
					&nbsp;
				</s:if>
				<s:else>
					<s:property value="#item.FLD_APPLYNO"/>
					<input type="hidden" name="hdnPrNum" value="<s:property value="#item.FLD_APPLYNO"/>"/>
				</s:else>
			</td>
			<td><s:property value="#item.FLD_CHANGENO"/></td>
			<td><s:property value="#item.FLD_APPLY_ORGAN"/></td>
			<td><s:property value="#item.FLD_APPLY_DEPTNAME"/></td>
			<td><s:property value="#item.FLD_PROJ_NAME"/></td>
			<td><s:property value="#item.FLD_CURRENT_BUDGET"/></td>
			<td>
				<s:property value="#item.FLD_RECOMMEND_MODE"/>
				<input type="hidden" name="hdnRecProcurementWay" value="<s:property value="#item.FLD_RECOMMEND_MODE"/>"/>
			</td>
			<td>
				<s:property value="#item.FLD_APPLY_TYPE"/>
				<input type="hidden" name="hdnApplyType" value="<s:property value="#item.FLD_APPLY_TYPE"/>"/>
			</td>
			<td>
				<s:property value="#item.FLD_BIDVENDOR_REAS0N"/>
				<input type="hidden" name="hdnRecSupplier" value="<s:property value="#item.FLD_BIDVENDOR_REAS0N"/>"/>
			</td>
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
				<input type="hidden" name="hdnCentralFlag" value="<s:property value="#item.FLD_IS_CENTRAL"/>"/>
			</td>
			<td>
				<s:property value="#item.FLD_PR_NO"/>
			</td>
			<td>
				<s:property value="#item.FLD_PRITEM_NO"/>
			</td>
			<td><s:property value="#item.FLD_MATERIALS_SERVICE"/></td>
			<td><s:property value="#item.FLD_COUNT"/></td>
			<td><s:property value="#item.FLD_TOTALPRICE"/></td>
			<td><s:property value="#item.FLD_DELIVERY_DATE"/></td>
		</tr>
		<s:set var="lastRfxNo" value="#item.FLD_RFX_NO"></s:set>
		<s:set var="lastPrNo" value="#item.FLD_APPLYNO"></s:set>
	</s:iterator>
	</tbody>
	</table>
</div>

	<div id="pageContainer"></div>
	<%@include file="/WEB-INF/jsp/page.jsp"%>
	<input type="hidden" id="pageURL" value='<s:url namespace="/rfx" action="handled_list"/>'/>
</s:form>
</body>
</html>