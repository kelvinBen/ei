<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>长期协议帮助</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<base target="_self" href="<%=basePath%>"/>
<SCRIPT type="text/javascript" src="js/sp/jqueryOverride.js"></SCRIPT>
<script type="text/javascript">
    $(document).ready(function(){
    	//设定日期选择器的相关属性
        var pickerOpts = {
         dateFormat: "yy-mm-dd"
        };
    	$('#startDate').datepicker(pickerOpts);
		$('#endDate').datepicker(pickerOpts);
		$('#reqStartDate').datepicker(pickerOpts);
		$('#reqEndDate').datepicker(pickerOpts);
 		$("#productSelectButton").click(function(event){
      		if ($("input:checkbox:checked").length == 0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}
      		var tds = $(":checkbox[checked]").parents("tr").children("td.transfer");
      		var tdsHtml = "";
      		tds.each(function(){
				 tdsHtml+=this.outerHTML;     			
      		}
      		);
      		var json1 = tds.parseTextToJson();
      		var json2 = $(":checkbox[checked][name='id']").parseInputsToJson();
      		$.extend(json1,json2);
      		//返回一行数据
      	     var result = {tdsHtml:tdsHtml,json:json1};
             window.returnValue = result;
        	 window.close();
 		});
		$('#searchForm').validate({
			/*rules:{	
				'numberLimit':{
					required: true,
					digits:true,
					max:500
				}
			}*/
		});	
    }); 
    
    function onSubmit(_btn){
    	var vas = $("form[id='searchForm'] :text").vals();
    	var str = "";
    	for(var i=0;i<vas.length;i++){
    		str += vas[i];
    	}
    	if(str.length<=0){
    		alert("请输入查询条件！");
    		return false;
    	}
    	else
    		return true;
    }
</script>
</head>
<body>
  <div class="editdiv">
	<table id="tab_cont" class="tblContent" width="100%" cellpadding="0" >
    <s:form id="searchForm" namespace="/sc/contract/item" action="listHelp" method="post" theme="simple">
  	  <s:hidden name="flt_ci_and_eqB_deleted" value="false" />
  	  <s:hidden name="flt_c_and_eqB_deleted" value="false" />
  	  <s:hidden name="sort_c_contNum2" value="asc"/>
  	   <s:hidden name="sort_ci_itemNum" value="asc"/>
  	  <s:hidden name="companyOrganId" value="%{companyOrganId}" />
  	  <tr>
        <th class="tdTitle">长期协议合同编号</th>
        <td class="TdRight"><input type="text" name="flt_c_and_optLikeS_contNum" value='<s:property value="#parameters.flt_c_and_optLikeS_contNum"/>'  /></td>
      </tr>
       <tr>
        <th class="tdTitle">长期协议行项目编号</th> 
        <td class="TdRight"><input type="text" name="flt_ci_and_optLikeS_itemNum" value='<s:property value="#parameters.flt_ci_and_optLikeS_itemNum"/>'  /></td>
      </tr>
  	  <tr>
        <th class="tdTitle">供应商名称</th>
        <td class="TdRight"><input type="text"  name="flt_c_and_optLikeS_supplierName" value='<s:property value="#parameters.flt_c_and_optLikeS_supplierName"/>' /></td>
      </tr>
  	  <tr>
        <th class="tdTitle">供应商编号</th>
        <td class="TdRight"><input type="text"  name="flt_c_and_optLikeS_supplierNum" value='<s:property value="#parameters.flt_c_and_optLikeS_supplierNum"/>' /></td>
      </tr>
  	  <tr>
		  <th class="tdTitle">生效日期</th>
		  <td class="TdRight">
		     <input type="text"  id="startDate" name="flt_c_and_geD_effectDate" readonly="true" value='<s:property value="#parameters.flt_c_and_geD_effectDate"/>' />
		     到
		     <input type="text"  id="endDate" name="flt_c_and_leD_effectDate" readonly="true" value='<s:property value="#parameters.flt_c_and_leD_effectDate"/>'/>
		  </td>
		</tr>
		<tr>
		  <th class="tdTitle">到期日期</th>
		  <td class="TdRight">
		     <input type="text"   id="reqStartDate" name="flt_c_and_geD_expireDate" readonly="true" value='<s:property value="#parameters.flt_c_and_geD_expireDate"/>'/>
		     到
		     <input type="text"  id="reqEndDate" name="flt_c_and_leD_expireDate" readonly="true" value='<s:property value="#parameters.flt_c_and_leD_expireDate"/>'/>
		  </td>
		</tr>
  	  <tr>
        <th class="tdTitle">物料描述</th>
        <td class="TdRight"><input type="text"  name="flt_ci_and_optLikeS_materialDesc" value='<s:property value="#parameters.flt_ci_and_optLikeS_materialDesc"/>'/></td>
      </tr>   
      <tr>
        <th class="tdTitle">其他说明</th>
        <td class="TdRight"><input type="text"  name="flt_ci_and_optLikeS_comment" value='<s:property value="#parameters.flt_ci_and_optLikeS_comment"/>'/></td>
      </tr>  
      <!--                    
  	  <tr>
        <th class="tdTitle">最大命中数量</th>
        <td class="TdRight"><input type="text"  name="numberLimit" value="10" value='<s:property value="#parameters.numberLimit"/>'/></td>
      </tr>
       -->           
      <tr>
        <td><s:submit value="查询" onclick="return onSubmit(this);"></s:submit><button id='productSelectButton'>选择</button></td>
        <td ></td>
      </tr>             
    </s:form>
	</table>
	<div>
	<table class="tblContent4list" style="table-layout:fixed;" cellpadding="0">
	<tr>
	<th>选择</th>
		<!-- head -->
		<th>长期协议合同编号</th>
		<th>供应商名称</th>
		<th>生效日期</th>
		<th>到期日期</th>
		<th>长期协议类型</th>
		<!-- item -->
		<th>物料/服务描述</th>
		<th>物料号</th>
		<!-- can't find -->
		<th>物料组描述</th>
		
		<th>物料组</th>
		<th>服务明细描述</th>
		<th>单价</th>
		<th>币种</th>
		<th>价格单位</th>
		<th>计量单位</th>
		<th>供应商货物备注说明</th>
		<th>其他说明</th>
		<!-- head -->
		<th>长期协议编号</th>
		
				<!-- item -->
		<th>长期协议行项目号</th>
		<th>服务明细行项目编号</th>
		<!-- head -->
		<th>供应商编码</th>
		
		
	</tr>
	</table>
	</div>
	<div>
	<table class="tblContent4list" style="table-layout:fixed;word-break:break-all;" cellpadding="0">
		 <s:if test="list.size==0">
		 <tr><td colspan="19"><s:text name="pr.mange.no.rows"/></td></tr>
		 </s:if>
		<s:else>
		<s:iterator value="list" var="entity">
		
		<s:if test="#entity.conSum.isDateValid">
			<td  sortNum=1 ><input class="transferValue" name="id" type="checkbox" value='<s:property value="#entity.id" />'></td>
		</s:if>
		<s:else>
			<td ></td>
		</s:else>
			<!-- head -->
		<td  name="conSum.contNum"><s:property value="#entity.conSum.contNum" /></td>
		<td class="transfer" sortNum=4 name="conSum.supplierName"><s:property value="#entity.conSum.supplierName" /></td>
		<td><s:property value="#entity.conSum.effectDate" /></td>
		<td><s:property value="#entity.conSum.expireDate" /></td>
		<td><s:property value="#entity.conSum.contType" /></td>
		<!-- item -->
		<td class="transfer" name="materialDesc"><s:property value="#entity.materialDesc"/></td>
		<td class="transfer" name="materialNum"><s:property value="#entity.materialNum" /></td>
		<!-- can't find -->
		<td>物料组描述</td>
		
		<td class="transfer" name="materialGroup" ><s:property value="#entity.materialGroup" /></td>
		<td class="transfer" name="serviceDesc" ><s:property value="#entity.serviceDesc" /></td>
		<td class="transfer" sortNum=6 name="price"><s:property value="#entity.price" /></td>
		<td class="transfer" sortNum=7 name="currency"><s:property value="#entity.currency" /></td>
		<td><s:property value="#entity.measureUnit" /></td>
		<td class="transfer" sortNum=5 name="measure.description"><s:property value="#entity.measure.description" /></td>
		<td class="transfer" sortNum=9 name="goodsDesc"><s:property value="#entity.goodsDesc" /></td>
		<td class="transfer" sortNum=8 name="comment"><s:property value="#entity.comment" /></td>
		<!-- head -->
		<td class="transfer" sortNum=2 name="conSum.contNum2"><s:property value="#entity.conSum.contNum2" /></td>
		
				<!-- item -->
		<!-- 长期协议行项目号 -->
		<td class="transfer" sortNum=3 name="itemNum"><s:property value="#entity.itemNum" /></td>
		<!-- 服务明细行项目编号 -->
		<td><s:property value="#entity.serviceNum" /></td>
		<!-- head -->
		<!-- 供应商编码 -->
		<td><s:property value="#entity.conSum.supplierNum" /></td>
		</tr>
		</s:iterator>
		</s:else>
	</table>
	</div>
  </div>   
</body>
</html>