<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>长期协议检索</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base target="_self">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
	.tdCell td{border-color: black;}
	.tdCell {border-color: black;}
	.hrefButton{cursor: hand;color: blue;text-decoration: underline;font-weight: bold;}
	.tdContent{width:600px;}
	.tdTitle{width:150px;font-weight: bold;}
	.timeBox{width:60px;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$.validator.addMethod("stdtime", function(value,element) {
				return this.optional(element) || /^(?:0[0-9]|1[0-9]|2[0-3]):(?:[0-5]\d):(?:[0-5]\d)$/.test(value);
			}, '请按“hh:mm:ss”格式正确填写时间'
		);
		$("#frm").validate({
			rules:{
				"numberLimit":{required:true,digits:true,max:100,min:1},
				"startTime1": {stdtime:true},
				"startTime2": {stdtime:true},
				"endTime1":{stdtime:true},
				"endTime2":{stdtime:true}
			}
		});

	    $("#startDate1").datepicker();
	    $("#startDate2").datepicker();
	    $("#endDate1").datepicker();
	    $("#endDate2").datepicker();	
		$("#contractSelectButton").click(function(event) {	
			var item = $("input[name='items']:checked").val();
			var contractType = $("#item_" + item + " .item_contractType").html();
			var contractNum = $("#item_" + item + " .item_contractNum").html();
			var vendorName = $("#item_" + item + " .item_vendorName").html();
			var matNumber = $("#item_" + item + " .item_matNumber").html();
			var matShortDesc = $("#item_" + item + " .item_matShortDesc").html();
			var matGroupNum = $("#item_" + item + " .item_matGroupNum").html();
			var matGroupDesc = $("#item_" + item + " .item_matGroupDesc").html();
			var price = $("#item_" + item + " .item_price").html();
			var currency = $("#item_" + item + " .item_currency").html();
			var startDate = $("#item_" + item + " .item_startDate").html();
			var endDate = $("#item_" + item + " .item_endDate").html();
			var result = new Array(contractNum,contractType,vendorName,matNumber,matShortDesc,matGroupNum,matGroupDesc,price,currency,startDate,endDate);
			window.returnValue = result;
			window.close();
		});

	});
</script>

</head>
<body>
<s:form id="frm" action="search" namespace="/contract" theme="simple">
	<table border="1" class="tblContent" width="100%">
  	  <tr>
        <td class="tdTitle">长期协议类型</td>
        <td class="tdContent">
        	<s:radio name="contractClass" cssClass="inputradio"  list="#{'货物类':'货物','服务类':'服务'}"></s:radio>
        </td>
      </tr>
  	  <tr>
        <td class="tdTitle">长期协议号码</td>
        <td><s:textfield name="contractNum"></s:textfield></td>
      </tr>
      <tr>
        <td class="tdTitle">物资/设备编码</td>
        <td><s:textfield name="matNumber"></s:textfield></td>
      </tr>
      <tr>
        <td class="tdTitle">描述</td>
        <td><s:textfield name="matShortDesc"></s:textfield></td>
      </tr>
      <tr>
        <td class="tdTitle">类别编码</td>
        <td><s:textfield name="matGroupNum"></s:textfield></td>
      </tr>
      <tr>
        <td class="tdTitle">类别描述</td>
        <td><s:textfield name="matGroupDesc" ></s:textfield></td>
      </tr>
      <tr>
        <td class="tdTitle">有效开始时间1</td>
        <td>
        	<s:textfield name="startDate1" id="startDate1"></s:textfield>
        	<s:textfield name="startTime1" id="startTime1" cssClass="timeBox"></s:textfield>
        </td>
      </tr>
      <tr>
        <td class="tdTitle">有效开始时间2</td>
        <td>
        	<s:textfield name="startDate2" id="startDate2"></s:textfield>
        	<s:textfield name="startTime2" id="startTime2" cssClass="timeBox"></s:textfield>
        </td>
      </tr>
      <tr>
        <td class="tdTitle">有效截止时间1</td>
        <td>
        	<s:textfield name="endDate1" id="endDate1"></s:textfield>
			<s:textfield name="endTime1" id="endTime1" cssClass="timeBox"></s:textfield>
        </td>
      </tr>
      <tr>
        <td class="tdTitle">有效截止时间2</td>
        <td>
        	<s:textfield name="endDate2" id="endDate2"></s:textfield>
        	<s:textfield name="endTime2" id="endTime2" cssClass="timeBox"></s:textfield>
        </td>
      </tr>
      <tr>
        <td class="tdTitle">最大命中数量</td>
        <td>
        	<s:textfield name="numberLimit"></s:textfield>
        </td>
      </tr>
    </table>
    <s:submit value="查询"></s:submit>
</s:form>
<table border="1" class="tblContent tdCell">
	<tr class="tdTitle">
		<th>长期协议号码</th>
		<th> 长期协议名称</th>
		<th> 供应商名称</th>
		<th> 物料编码</th>
		<th> 物料描述</th>
		<th> 类别编码</th>
		<th> 类别描述</th>
		<th> 单价</th>
		<th> 价格单位</th>
		<th> 有效开始时间</th>
		<th> 有效截止日期</th>
		<th>选择</th>
	</tr>
	<s:iterator value="#request.contractList" id="contractList" status="status">
		<tr id='item_<s:property value="#status.index" />'>
			<td class = "item_contractNum">
				<s:property value="#contractList.contractNum" />
			</td>
			<td class = "item_contractType">
				<s:property value="#contractList.contractName" />
			</td>
			<td class = "item_vendorName">
				<s:property value="#contractList.vendorName" />
			</td>
			<td class = "item_matNumber">
				<s:property value="#contractList.matNumber" />
			</td>
			<td class = "item_matShortDesc">
				<s:property value="#contractList.matShortDesc" />
			</td>
			<td class = "item_matGroupNum">
				<s:property value="#contractList.matGroupNum" />
			</td>
			<td class = "item_matGroupDesc">
				<s:property value="#contractList.matGroupDesc" />
			</td>
			<td class = "item_price">
				<s:property value="#contractList.price" />
			</td>
			<td class = "item_currency">
				<s:property value="#contractList.currency" />
			</td>
			<td class = "item_startTime">
				<s:property value="#contractList.startDate" />
			</td>
			<td class = "item_endTime">
				<s:property value="#contractList.endDate" />
			</td>
			<td><input type="radio"  name="items"
				value='<s:property value="#status.index" />'>
			</td>
		</tr>
	</s:iterator>
</table>

<button id='contractSelectButton'>选择</button>
</body>
</html>