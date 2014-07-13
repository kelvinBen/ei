<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>未处理的寻源单据列表</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<%
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<style type="text/css">
	.locker{
		width:100%;height:100%;display:none;z-index:999;position:absolute;background:#fff;filter:alpha(opacity=75);
	}
	.showUI{
		display:none;z-index:999;position:absolute;background:#fff;filter:alpha(opacity=100);
	}
</style>
<script type="text/javascript">
if ($.messager){
	$.messager.defaults.ok = '确定';
	$.messager.defaults.cancel = '取消';
}
	$(function(){
		initPage();
		$('#tab_cont').flexigrid();//表格中的TH必须加宽度

		var currentPrWay; //当前选定行集的采办方式
		
		//全选checkbox事件处理
		$("#selectAll").change(function(){
			$("input[name='ids']").attr("checked",$(this).attr("checked"));
		});

		//检查name相同的控制的值是否相同
		function checkUniqueVal(ctrlName)
		{
			var returnVal = true;
			var commonCompare = "";
			$("input[name='ids']:checked").each(function(i,obj){
				if(i==0){
					commonCompare = $(this).parents("tr").find("input[name='"+ctrlName+"']").val();
				}else
				{
					if(commonCompare !== $(this).parents("tr").find("input[name='"+ctrlName+"']").val()){
						returnVal = false;
					}
				}
			});
			return returnVal;
		}
		//采办方式校验函数
		function checkPrWays(){
			var resl = []; //当前选中的采办方式
			var prways=[['竞争性谈判','询价'],['邀请招标','询价']]; //采办方式组合
			var b1 = false; //返回结果
			$("input[name='ids']:checked").each(function(i,obj){
				var item = $(this).parents("tr").find("input[name='hdnRecProcurementWay']").val();
				if(!hasElement(resl,item)){
					resl.push(item);
				}
			});
			for(var i=0;i<prways.length;i++){
				var b0 = true;
				//resl的元素全在prways[i]中
				for(var j=0;j<resl.length;j++){
					b0 = b0 && hasElement(prways[i],resl[j]);
					if(!b0){
						break;
					}
				}
				b1 = b1 || b0;
				if(b1){ //当前选中的采办方式集合在某个组合中
					currentPrWay = prways[i][0];
					break;
				}
			}
			return b1;
			
			//数组中是否已经存在某元素
			function hasElement(arrObj,el){
				for(var i=0;i<arrObj.length;i++){
					if(arrObj[i] == el){
						return true;
					}
				}
				return false;
			}
		}
		
		//获取采中的行项目的相关属性
		function getCheckedVal(ctrlName){
			return $("input[name='ids']:checked").parents("tr").find("input[name='"+ctrlName+"']").val();
		}
		
		$("#btnSearch").click(function(){
			$("#list").attr("action",'<s:url namespace="/rfx" action="unhandled_search"/>');
			$("#list").submit();
		});
		$("#btnDelete").click(function(){
			if($("input[name='ids']:checked").length==0)
			{
				alert("请选择要删除的单据");
			}else{
				 $.messager.prompt('提示', '请确定删除该寻源单据并输入删除原因', function(r){
						if (r){	
							$("#reason").val(r);
							$("#list").attr("action",'<s:url namespace="/rfx" action="unhandled_delete"/>');
							$("#list").submit();
						}
				 }); 
			}
		});
		
		$("#btnRFxCreate").click(function(){
			//至少选一个 
			if ($("input[name='ids']:checked").length == 0){
				alert("请至少选择一个需要创建RFx的采办申请！");
				return false;
			}
			//集采标志是否相同
			if(!checkUniqueVal("hdnCentralFlag"))
			{
				alert("请分别提报不同集采方式的采办需求！");
				return false;
			}
			//申请类型是否相同
			if(!checkUniqueVal("hdnApplyType"))
			{
				alert("所选采办申请审批表的申请类型不同，不能打包，请重新选择！");
				return false;
			}
			//推荐供应商是否相同
			if(!checkUniqueVal("hdnRecSupplier"))
			{
				alert("所选采办申请审批表推荐供应商名单不同，不能打包，请重新选择！");
				return false;
			}
			
			//推荐采办方式是否相同
			currentPrWay = "";
			if(!checkUniqueVal("hdnRecProcurementWay")){
				if(!checkPrWays()){
					alert("只有推荐采办方式为“邀请招标”和“询价”或者“竞争性谈判”和“询价”才能合并创建RFx");
					return false;
				}
			}else{
				currentPrWay = getCheckedVal("hdnRecProcurementWay");
			}
			
	        //验证交货日期
	        var dateValid = true;
	        var deliveryDateStr;
	        $("input[name='ids']:checked").each(function(i,obj){
	        	//获得日期字符串“yyyy-MM-dd”格式
	        	deliveryDateStr = $(this).parents("tr").find("input[name='hdnDeliveryDate']").val();
		        dateValid = Date.parse(deliveryDateStr)>new Date(); 
				if(!dateValid)
				{
					return false;//终止循环
				}
			});

	        //申请单位是否相同
	        $("#orgNames").val("");
	        if(!checkUniqueVal("hdnApplyOrgan"))//多个单据中的申请单位不唯一
			{
	        	$("input[name='ids']:checked").each(function(i,obj){
	        		var _itmOrgan = $(this).parents("tr").find("input[name='hdnApplyOrgan']").val();
	        		$("#orgNames").val($("#orgNames").val()+_itmOrgan+",");
	    		});
			}else
			{
				$("#orgNames").val($("input[name='ids']:checked").parents("tr").find("input[name='hdnApplyOrgan']").val());
			}

			if($("#orgNames").val().match(/[, ，]/))
			{
				var _orgName = window.showModalDialog("pickup_org.do?flag=0",$("#orgNames").val(),'dialogWidth:420px; dialogHeight:400px;status:0;help:0');
				if(_orgName != null)
					$("#orgNames").val(_orgName);
			}

			if($("#orgNames").val().match(/[, ，]/) == null){
				//读取采办申请ID
		    	var prIds = "";//初始化为空字符串
		    	var cpFlag;
	    		$("input[name='ids']:checked").each(function(i,obj){
	    			prIds += $(this).val()+",";
	    			cpFlag = $(this).parents("tr").find("input[name='hdnCentralFlag']").val();
	    		});

		    	var forwardUrl = '<s:url namespace="/rfx" action="rfx_basic_create" />'+'?prIds='+prIds+'&rfxBasic.centralFlag='+cpFlag;
		    	forwardUrl += ('&orgNames='+encodeURI($("#orgNames").val())); //申请单位
		    	forwardUrl += ("&rfxBasic.procurementType="+currentPrWay); //采办方式
		        if(dateValid){
			        forwardUrl += '&setting='+0+'&deliveryDate='+deliveryDateStr.replace(new RegExp("/", "gm"),"-"); 
			    }else{
			    	forwardUrl += '&setting='+1; 
				}
			    popupWin(forwardUrl,420,400);

			    window.location.reload();
			}
		});

		$("#btnRFxUpdate").click(function(){
			var remoteValidSuccess = false;
			//至少选一个 
			if ($("input[name='ids']:checked").length == 0){
				alert("请至少选择一个需要更新RFx的采办申请！");
				return false;
			}
			//申请类型是否相同
			if(!checkUniqueVal("hdnApplyType"))
			{
				alert("所选采办申请审批表的申请类型不同，不能打包更新，请重新选择！");
				return false;
			}
			//推荐供应商是否相同
			if(!checkUniqueVal("hdnRecSupplier"))
			{
				alert("所选采办申请审批表推荐供应商名单不同，不能打包更新，请重新选择！");
				return false;
			}

			//推荐采办方式是否相同
			currentPrWay = "";
			if(!checkUniqueVal("hdnRecProcurementWay")){
				if(!checkPrWays()){
					alert("只有推荐采办方式为“邀请招标”和“询价”或者“竞争性谈判”和“询价”才能合并创建RFx");
					return false;
				}
			}else{
				currentPrWay = getCheckedVal("hdnRecProcurementWay");
			}
			
			//集采标志是否相同
			if(!checkUniqueVal("hdnCentralFlag"))
			{
				alert("请分别提报不同集采方式的采办需求！");
				return false;
			}else{
				if(getCheckedVal("hdnCentralFlag")!= "0"){ //都是集采项目
					jQuery.ajax({
			            url: '<s:url namespace="/rfx" action="cpcheck" />' ,   	//提交的页面
			            data: $("#list").serialize(), 		//从表单中获取数据
			            type: "POST",                   	//设置请求类型为"POST"，默认为"GET"
			            beforeSend: function(){          	//设置表单提交前方法
							$('.locker').css('display', 'block');
							showWaitingLayer();
			            },
			            error: function(request) {          //设置表单提交出错
			                alert('远程校验服务请求错误');
			                $('.locker').css('display', 'none');
			            	$("#waitingInfo").css('display', 'none');
			            },
			            success: function(data) {			//设置表单提交完成使用方法
			            	$('.locker').css('display', 'none');
			            	$("#waitingInfo").css('display', 'none');

							if(data == 1)
								remoteValidSuccess = true;

							if(!remoteValidSuccess){
						        alert("只能选择属于同一集采目录的需求进行提交！");
						        return false;
						    }
						    
							submitRequest();
			            }
			        });
				}else{//都是非集采目录
					submitRequest();
				}
			}

			function submitRequest(){
				var prIds = "";//初始化为空字符串
	    		$("input[name='ids']:checked").each(function(i,obj){
	    			prIds += $(this).val()+",";
	    		});
				var forwardUrl;
		        if(validDeliveryDate()){
		        	forwardUrl ='<s:url namespace="/rfx" action="rfx_edit" />';
			    }else{
			    	forwardUrl ='<s:url namespace="/rfx" action="deliveryDate" />';
				}
		        var deliveryDate = getCheckedVal("hdnDeliveryDate");
				forwardUrl += ("?rfxBasic.centralFlag="+getCheckedVal("hdnCentralFlag"));//集采标识
				forwardUrl += ("&a=u"); //action为更新
				forwardUrl += ("&prIds="+prIds);//选中的采办请号
				forwardUrl += ("&deliveryDate="+deliveryDate.replace(new RegExp("/", "gm"),"-")); //最晚交货日期
				forwardUrl += ("&rfxBasic.procurementType="+currentPrWay); //采办方式
				forwardUrl += ("&rfxBasic.procurementAttribute="+getCheckedVal("hdnApplyType")); //申请类型
		        popupWin(forwardUrl,420,400);
				window.location.reload();
			}
			
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

		/**
		 * 判断当前选中采办申请的行项目的交货日期是否都大于当前日期
		 * （对选中的跨页的采办申请不适用）
		 */
		function validDeliveryDate(){
			var dateValid = true;
	        var deliveryDateStr;
	        $("input[name='ids']:checked").each(function(i,obj){
				var curRow = $(this).parents("tr");
				do{
					//获得日期字符串“yyyy-MM-dd”格式
					deliveryDateStr = curRow.find("input[name='hdnDeliveryDate']").val();
	        		dateValid = Date.parse(deliveryDateStr)>new Date(); 
					if(!dateValid)
					{
						return false;//终止循环
					}
					curRow = curRow.next();
				}while(curRow.html()!=null && curRow.find(":checkbox").length==0);
				
			});
			return dateValid;
		}
	});
	//弹出窗口并居中
	function popupWin(url,width,height)
	{
		window.showModalDialog(url,'','dialogWidth:'+width+'px; dialogHeight:'+height+'px;status:0;help:0;resizable:1;');
		//var left = (screen.width - width)/2;
		//var top = (screen.height - height) / 2;
		//window.open(url,'','height='+height+',width='+width+',left='+left+',top='+top+',toolbar=no,menubar=no,resizable=yes,location=no,status=no,scrollbars=yes');
	}
	//显示采办申请细节
	function showApplyDetails(pk){
		var menu = "unhandled_list"; //当前菜单“未处理寻源单据”
		var returnUrl = "rfx/unhandled_list.do";
		var url = "<%=basePath %>prwprapply.cmd?method=forDetail&pk="+pk+"&menu="+menu;
		url += "&returnUrl="+returnUrl;
		document.forms[0].action =url;
        document.forms[0].submit();	
		//popupWin(url,800,600);
		//window.showModalDialog(url,"","dialogWidth:1000px; dialogHeight:500px; resizable:yes; status:yes;Maximize=yes;");
	}
	//显示采办需求细节
	function showPrDetails(obj){
		popupWin("<s:url namespace="/pr" action="form"></s:url>?id="+obj,800,600);
	}
</script>
</head>
<body>
<!-- mask layer -->
<DIV class="locker"></DIV>
<DIV id="waitingInfo" class="showUI">
	<img src="<s:url value="/images/loading.gif"/>"> &nbsp;正在验证请稍后……
</DIV>

<s:form id="list" namespace="/rfx" action="unhandled_list" theme="simple">
	<s:hidden name="orgNames" id="orgNames"/>
<div class="title">
	<table width="100%">
		<thead>
			<tr>
				<th align="left">
					<input type="button" id="btnRFxCreate" value="打包创建RFx" />
					<input type="button" id="btnRFxUpdate" value="添加至已有RFx"/>
					<input type="button" id="btnSearch" value="查询" />
					<input type="button" id="btnDelete" value="删除" /> 
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
			<th width="100">采办申请号</th>
			<th width="100">申请单位</th>
			<th width="80">申请部门</th>
			<th width="100">项目名称</th>
			<th width="100">采办内容</th>
			<th width="100">采办需求号码</th>
			<th width="100">行项目号码</th>
			<th width="100">物资/服务描述</th>
			<th width="80">数量</th>
			<th width="80">估计价格</th>
			<th width="80">交货日期</th>
			<th width="80">本次采办预算</th>
			<th width="100">推荐采办方式</th>
			<th width="80">申请类型</th>
			<th width="100">推荐供应商</th>
			<th width="100">集采标识</th>
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
					<a href="#" onclick="showApplyDetails('<s:property value="#item.FLD_CODE"/>')">
						<s:property value="#item.FLD_APPLYNO"/>
					</a>
				</s:else>
			</td>
			<td>
				<s:property value="#item.FLD_APPLY_ORGAN"/>
				<input type="hidden" name="hdnApplyOrgan" value="<s:property value="#item.FLD_APPLY_ORGAN"/>"/>
				&nbsp;
			</td>
			<td><s:property value="#item.FLD_APPLY_DEPTNAME"/>&nbsp;</td>
			<td><s:property value="#item.FLD_PROJ_NAME"/>&nbsp;</td>
			<td><s:property value="#item.FLD_PURC_CONTENT"/>&nbsp;</td>
			<td>
				<a href="#" onclick="showPrDetails(<s:property value="#item.PR_ID"/>)">
					<s:property value="#item.FLD_PR_NO"/>
				</a>
			&nbsp;</td>
			<td>
				<s:property value="#item.FLD_PRITEM_NO"/>
			&nbsp;</td>
			<td><s:property value="#item.FLD_MATERIALS_SERVICE"/>&nbsp;</td>
			<td><s:property value="#item.FLD_COUNT"/>&nbsp;</td>
			<td><s:property value="#item.FLD_TOTALPRICE"/>&nbsp;</td>
			<td>
				<s:date name="#item.FLD_DELIVERY_DATE" format="yyyy/MM/dd" />
				<input type="hidden" name="hdnDeliveryDate" value="<s:date name="#item.FLD_DELIVERY_DATE" format="yyyy/MM/dd" />"/>
			&nbsp;</td>
			<td><s:property value="#item.FLD_CURRENT_BUDGET"/>&nbsp;</td>
			<td>
				<s:property value="#item.FLD_RECOMMEND_MODE"/>
				<input type="hidden" name="hdnRecProcurementWay" value="<s:property value="#item.FLD_RECOMMEND_MODE"/>"/>
			&nbsp;</td>
			<td>
				<s:property value="#item.FLD_APPLY_TYPE"/>
				<input type="hidden" name="hdnApplyType" value="<s:property value="#item.FLD_APPLY_TYPE"/>"/>
			&nbsp;</td>
			<td>
				<s:property value="#item.FLD_BIDVENDOR_REAS0N"/>
				<input type="hidden" name="hdnRecSupplier" value="<s:property value="#item.FLD_BIDVENDOR_REAS0N"/>"/>
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
				<input type="hidden" name="hdnCentralFlag" value="<s:property value="#item.FLD_IS_CENTRAL"/>"/>
			</td>
		</tr>
		<s:set var="lastId" value="#item.FLD_CODE"></s:set>
	</s:iterator>
	</tbody>
	</table>
</div>

	<div id="pageContainer"></div>
	<%@include file="/WEB-INF/jsp/page.jsp"%>
	<input type="hidden" id="pageURL" value='<s:url namespace="/rfx" action="unhandled_list"/>'/>

	<s:hidden name="prSearch.operator"></s:hidden>
	<s:hidden name="prSearch.begin"></s:hidden>
	<s:hidden name="prSearch.end"></s:hidden>
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
	<s:hidden id="reason" name="reason"></s:hidden>
</s:form>
</body>
</html>