<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建长期协议行项目</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	var language="zh";
	var measureCodes = [];
	$(function(){
		
		if($("#isDeleted").val()=="true"){
			$("input,select,textarea,:button").attr("disabled",true);
			return;
		}
		$("#pr_close").click(function(){								//注册关闭按钮事件
			window.close();
			return false;
		});
		$("#select_productgroup").click(function(){						//注册选择物料组（分类）按钮事件
			var result = window.showModalDialog('<s:url namespace="/pr/group" action="init"/>'," ","dialogWidth:650px; dialogHeight:1000px;status:0;help:0");
			if(result != null){
				$("#input_productgroup").attr("value",result.matGroupNum);
			}
		});
		
		$("#select_product").click(function(){							//注册选择物料/设备按钮事件
			var result = window.showModalDialog('<s:url namespace="/pr/product" action="init"/>'," ","dialogWidth:650px; dialogHeight:1000px;status:0;help:0");
			if ( result != null){
				language = result.language;			
				$("#input_productgroup").attr("value",result.groupNum);
				$("#input_product").attr("value",result.matNum);
				$("#shortDescZH").attr("value",result.shortDescZH);
				$("#shortDescEN").attr("value",result.shortDescEN);
				if(result.language=="zh"){
					$("#purchaseRequisitionItem_description").attr("value",result.shortDescZH);
				}else{
					$("#purchaseRequisitionItem_description").attr("value",result.shortDescEN);
				}
				//当用户检索物料组时，如果有计量单位，则自动带入计量单位
	      	    if(result.uom!=null){
		      	    for(var i=0;i<measureCodes.length;i++){
						if(measureCodes[i].code == result.uom){
							$("#pri_uom").setSelectedValue4select(measureCodes[i].id);
							break;
						}
			      	}
	      	    }
			}
		});
		
		$("#but_save").click(function(){
			var checkInfoHasChange = $("#pri_form").attr("checkInfoHasChange");
			if(checkInfoHasChange!=null&&checkInfoHasChange){
				if($("#pri_form").valid()){
				jQuery.ajax({													//异步提交表单（Ajax）
		            url: '<s:url namespace="/sc/contract/item" action="check" />',	//提交的页面
		            data: $('#pri_form').serialize(), 							//从表单中获取数据
		            type: "POST",                   							//设置请求类型为"POST"，默认为"GET"
		            beforeSend: function(){          							//设置表单提交前方法
		            },
		            error: function(request) {      							//设置表单提交出错
		                alert('<s:text name="message.save.error" />');
		            },
		            success: function(data) {									//设置表单提交完成使用方法
						if(data!="success"){
							alert(data);
							return false;
						}
						//回写描述值
						if(language=="zh"){
							$("#shortDescZH").attr("value",$("#purchaseRequisitionItem_description").val());
						}else{
							$("#shortDescEN").attr("value",$("#purchaseRequisitionItem_description").val());
						}
						$("#pri_form").submit();
		            }
		        });
			}}
			else{
				$("#pri_form").submit();
			}
			
			
		});

		$("#pri_form").validate({										//注册表单校验规则
			rules: {
				'item.itemNum': {
					required: true,
					maxlength: 18
				},
				'item.materialGroup': {
					required: true,
					maxlength: 18
				},
				'item.materialNum': {
					maxlength: 18
				},
				'item.materialDesc': {
					required: true,
					maxlength: 40
				},
				'item.price': {
					required: true,
					number:true
				},
				'item.currency.id': {
					required: true
				},
				'item.measure.id': {
					required: true
				},
				'item.measureUnit': {
					required: true
				},
				'item.goodsDesc': {
					maxlength: 256
				},
				'item.comment': {
					maxlength: 256
				}
			}
		});
		
		//设置textInput的宽度
	$("form input[type='text']").width(300);
		
	//设置对部分字段的值变动监听
	$("input[name='item.itemNum'],[name='item.serviceNum']").change(function(){
		$("#pri_form").attr("checkInfoHasChange",true);
	});
		
	});
</script>
</head>
<body>
	<div class="editdiv">
	<s:if test="#request.saved">
	<table class="tblprompt" width="100%" cellpadding="0" >
		<tbody>
		  <tr>
			<th><s:text name="message" /></th>
			<td><s:text name="message.save.success" /></td>
		  </tr>
		</tbody>
	</table>	
	</s:if>
	<s:hidden id="isDeleted" value="%{item.deleted}"/>
	<table class="tblContent" width="100%" cellpadding="0" >
		<s:form id="pri_form" namespace="/sc/contract/item" action="save" theme="simple" method="post">
		<s:hidden name="id"/>
		<s:hidden name="itemId" id="itemId"/>
		<s:hidden name="item.id"/>
		<s:hidden name="item.description_zh_CN" id="shortDescZH"/>
		<s:hidden name="item.description_en_US" id="shortDescEN"/>
		<s:hidden name="createNext" id="createNext"/>
		<s:if test="%{itemId != null}">
		  <s:hidden name="item.delStat"/>
		</s:if>
		<tbody>
			<s:i18n name="LongTermContract">
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractItem" /><span class="star"> *</span></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="item.itemNum" /></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractItem.materialGroup" /><span class="star"> *</span></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" readonly="true" name="item.materialGroup" maxlength="18" id="input_productgroup"/><input type="button" id="select_productgroup" value="<s:text name="button.select"/>"></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractItem.materialNum" /></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" readonly="true" name="item.materialNum" maxlength="18" id="input_product"/><input type="button" id="select_product" value="<s:text name="button.select"/>"></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractItem.materialDesc" /><span class="star"> *</span></th>
				<td class="TdRight"><input type="text" name="item.materialDesc" id="purchaseRequisitionItem_description" value='<s:property value="item.materialDesc"/>' maxlength="40"/></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractItem.serviceNum" /></th>
				<td class="TdRight"><input type="text" name="item.serviceNum" value='<s:property value="item.serviceNum"/>' maxlength="40"/></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractItem.serviceDesc" /></th>
				<td class="TdRight"><input type="text" name="item.serviceDesc" value='<s:property value="item.serviceDesc"/>' maxlength="40"/></td>
			</tr>	
			
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractItem.price" /><span class="star"> *</span></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal" name="item.price" maxlength="13" id="input_price"/></td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractItem.currency" /></th>
				<td class="TdRight">
					<s:select list="#request.userInterfaceService.userInterfaceBean.selectableCurrencies" name="currency.id" value="item.currency.id" />
				</td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractItem.measure" /></th>
				<td class="TdRight">
					<s:select id="pri_uom" list="#request.userInterfaceService.userInterfaceBean.selectableMeasures" name="measure.id" value="item.measure.id" />
				</td>
			</tr>
			<tr>
				<th class="tdTitle"><s:text name="com.cnooc.req.domain.sc.ContractItem.measureUnit" /><span class="star"> *</span></th>
				<td class="TdRight"><s:textfield cssClass="inputnormal"  name="item.measureUnit"/></td>
			</tr>
			<tr>
				<th class="tdTitle">
					<s:text name="com.cnooc.req.domain.sc.ContractItem.goodsDesc" />
				</th>
				<td class="TdRight">
				<s:textarea name="item.goodsDesc" rows="6" cssStyle="width:100%;"/>
				</td>
			</tr>
			<tr>
				<th class="tdTitle">
					<s:text name="com.cnooc.req.domain.sc.ContractItem.comment" />
				</th>
				<td class="TdRight">
				<s:textarea name="item.comment" rows="6" cssStyle="width:100%;"/>
				</td>
			</tr>
			</s:i18n>
			<tr>
				<td class="TdRight" colspan="2" style="text-align: center;">
					<button class="forhidden"  id="but_save" type="button"><s:text name="button.save" /></button>
					<button value="" id="pr_close" type="button"><s:text name="button.close" /></button>
				</td>
			</tr>
		</tbody>
		</s:form>
	</table>
	</div>
	<script type="text/javascript">
	//当用户检索物料组时，如果有计量单位，则自动带入计量单位
	var jsonMeasure = null;
	<s:iterator value="#request.userInterfaceService.userInterfaceBean.measures" var="measure">
		jsonMeasure = {"id":'<s:property value="#measure.id"/>',"code":'<s:property value="#measure.measureid"/>'};
		measureCodes.push(jsonMeasure);
	</s:iterator>
	</script>
</body>
</html>