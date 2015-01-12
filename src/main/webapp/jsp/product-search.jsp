<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物料检索</title>
<base target="_self"/>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
    $(document).ready(function(){
 		$("#productSelectButton").click(function(event){
      		if ($("input:radio:checked").length == 0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}
			 
      	     var item = $("input[name='items']:checked").val();
      	     var shortDesc_zh = $("#" + item + "_short_zh").val();
      	     var shortDesc_en = $("#" + item + "_short_en").val();
      	     var longDesc_zh = $("#" + item + "_long_zh").val();
      	     var longDesc_en = $("#" + item + "_long_en").val();
      	     var uoM = $("#item_" + item + " .item_uoM").html();
      	   	 var groupNum = $("#"+item+"_group_id").val();
      	   	 var groupDescZH = $("#"+item+"_group_zh").val();
          	 var groupDescEN = $("#"+item+"_group_en").val();
      	     var result = {};
      	   	 result.groupNum=groupNum;
      	   	 result.groupDescZH=groupDescZH;
      	   	 result.groupDescEN=groupDescEN;
      	     result.matNum=item;
      	     result.shortDescZH=shortDesc_zh;
      	     result.shortDescEN=shortDesc_en;
      	     result.longDescZH=longDesc_zh;
      	     result.longDescEN=longDesc_en;
      	     result.uom=uoM;
      	   	 result.language = '<s:property value="language"/>';
             window.returnValue = result;
        	 window.close();
 		});
		$('#searchForm').validate({
			rules:{	
				'numberLimit':{
					required: true,
					digits:true,
					max:500
				}
			}
		});	
    }); 
</script>
</head>
<body>
  <div class="editdiv">
	<table class="tblContent" width="100%" cellpadding="0" >
    <s:form id="searchForm" namespace="/pr/product" action="search" method="post" theme="simple">
  	  <tr>
        <th class="tdTitle">物料短描述</th>
        <td class="TdRight"><s:textfield name="matShortDesc"/></td>
      </tr>
  	  <tr>
        <th class="tdTitle">物料长描述</th>
        <td class="TdRight"><s:textfield name="matLongDesc"/></td>
      </tr>
  	  <tr>
        <th class="tdTitle">物料号码</th>
        <td class="TdRight"><s:textfield name="materialNumber"/></td>
      </tr>
  	  <tr>
        <th class="tdTitle">类别编码</th>
        <td class="TdRight"><s:textfield name="matGroupNumber"/></td>
      </tr> 
  	  <tr>
        <th class="tdTitle">类别描述</th>
        <td class="TdRight"><s:textfield name="matGroupDesc"/></td>
      </tr>
  	  <tr>
        <th class="tdTitle">语言</th>
        <td class="TdRight"><s:select list="{'zh','en'}" name="language" /></td>
      </tr>                                
  	  <tr>
        <th class="tdTitle">最大命中数量</th>
        <td class="TdRight"><s:textfield name="numberLimit"/></td>
      </tr>
      <tr>
        <td><s:submit value="查询"></s:submit></td>
        <td align="right"><button id='productSelectButton'>选择</button></td>
      </tr>             
    </s:form>
	</table>
	<div>
	<table class="tblContent4list" style="table-layout:fixed;" cellpadding="0">
	<colgroup>
		<col style="width:15%;"/>
		<col style="width:15%;"/>
		<col style="width:30%;"/>
		<col style="width:10%;"/>
		<col style="width:10%;"/>
		<col style="width:10%;"/>
	</colgroup>
	<tr>
		<th>物料号码</th>
		<th>物料短描述</th>
		<th>物料长描述</th>
		<th>计量单位</th>
		<th>类别编码</th>
		<th>选择</th>
	</tr>
	</table>
	</div>
	<div style="width:100%;height:450px;overflow-y:auto;overflow-x:hidden;">
	<table class="tblContent4list" style="table-layout:fixed;word-break:break-all;" cellpadding="0">
		<colgroup>
			<col style="width:15%;"/>
			<col style="width:15%;"/>
			<col style="width:30%;"/>
			<col style="width:10%;"/>
			<col style="width:10%;"/>
			<col style="width:10%;"/>
		</colgroup>
		<s:iterator value="#request.productList" id="product">
		<tr id='item_<s:property value="#product.materialNumber" />'>
			<td ><s:property value="#product.materialNumber" /></td>
			<td class = "item_shortDesc">
				<s:if test="#language == zh">
					<s:property value="#product.matShortDesc_zh_CN" />
				</s:if>
				<s:elseif test="#language == en">
					<s:property value="#product.matShortDesc_en_US" />
				</s:elseif>
				<input type="hidden" id="<s:property value="#product.materialNumber" />_group_id" value='<s:property value="#product.matGroupNumber" />'/>
				<input type="hidden" id="<s:property value="#product.materialNumber" />_group_zh" value='<s:property value="#product.matGroupDesc_zh_CN" />'/>
				<input type="hidden" id="<s:property value="#product.materialNumber" />_group_en" value='<s:property value="#product.matGroupDesc_en_US" />'/>
				<input type="hidden" id="<s:property value="#product.materialNumber" />_short_zh" value='<s:property value="#product.matShortDesc_zh_CN" />'>
				<input type="hidden" id="<s:property value="#product.materialNumber" />_short_en" value='<s:property value="#product.matShortDesc_en_US" />'>
			</td>
			<td class = "item_longDesc">
				<s:if test="#language == zh">
					<s:property value="#product.matLongDesc_zh_CN" />
				</s:if>
				<s:elseif test="#language == en">
					<s:property value="#product.matLongDesc_en_US" />
				</s:elseif>
				<input type="hidden" id="<s:property value="#product.materialNumber" />_long_zh" value='<s:property value="#product.matLongDesc_zh_CN" />'>
				<input type="hidden" id="<s:property value="#product.materialNumber" />_long_en" value='<s:property value="#product.matLongDesc_en_US" />'>				
			</td>
			<td class = "item_uoM"><s:property value="#product.uoM" /></td>
			<td class = "item_matGroupNum"><s:property value="#product.matGroupNumber" /></td>
			<td><input type="radio" name="items" value='<s:property value="#product.materialNumber" />'></td>
		</tr>
		</s:iterator>
	</table>
	</div>
  </div>   
</body>
</html>
