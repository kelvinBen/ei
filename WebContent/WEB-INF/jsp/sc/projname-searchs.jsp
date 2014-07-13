<%@ page pageEncoding="UTF-8" isELIgnored="false"%> 
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pri.list" /></title>
<base target="_self"/>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#bt_ok").click(function(){
			if($("input[id='idChoose']:checked").length == 0){
				alert('请选择纪录');
				return false;
			}else{
				var len = $("input[name='idChoose']:checked").length;
			   var fldProjNames="";
			   var budgetCny=0;
			   var budgetUsd=0;
			  
			    for(var i=0; i<len ;i++){
					var strNum = $("input[name='idChoose']:checked")[i].value;
					var projName = $("#"+ strNum + "_name").val();
					fldProjNames = fldProjNames+projName;
				     if(i < (len-1)){
				         fldProjNames = fldProjNames+",";
				     }
				}
				
				for(var i=0; i<len ;i++){
					var strNum = $("input[name='idChoose']:checked")[i].value;
					var cny = $("#"+ strNum + "_budgetCny").val();
					if(isNaN(parseFloat(cny))){
					  cny=0;
					}
					budgetCny = budgetCny+parseFloat(cny);
				    
				}
				
				for(var i=0; i<len ;i++){
					var strNum = $("input[name='idChoose']:checked")[i].value;
					var usd = $("#"+ strNum + "_budgetUsd").val();
					if(isNaN(parseFloat(usd))){
					  usd=0;
					}
					budgetUsd = budgetUsd+parseFloat(usd);
				    
				}
				
				var result = new Array(fldProjNames,budgetCny,budgetUsd);
				window.returnValue = result;
				window.close();
			}
		});
		$("#bt_cancel").click(function(){
			window.close();
		});
		
		$("#bt_choose").click(function(){
			if($("input[id='id']:checked").length == 0){
					alert('请选择纪录');
					return false;
				}
			$("#searchForm").attr("action",'<s:url namespace="/sc/projname" action="choose"/>');
		    $("#searchForm").submit();
       });
       
	});
	
	    
   
	$(function() {
	   $("[id='bt_research']").click(function(){
	        $("#searchForm").submit();
	    });
	});
</script>
</head>
<body>
<div class="editdiv">
   <s:form id="searchForm" namespace="/sc/projname" action="searchs" theme="simple" method="post">
   <input type="hidden" name= "applyOrgan" value="<s:property value="applyOrgan"/>" />
   <input type="hidden" name= "applyNo" value="<s:property value="applyNo"/>" />
	    <table class="tblsummary" width="100%" cellpadding="0" >
	      	<tr class="tdTitle" style="font-weight: bold;">
      	      <td colspan="2" class="tdContent">通配符*可以在文本字段中代替一个或多个字符</td>
           </tr>
	      <tr >
	        <td class="tdTitle" style="font-weight: bold;">业务单位</td>
	        <td class="tdContent"><s:textfield name="entity.organName"/></td>
	      </tr>
	  	  <tr>
	        <td class="tdTitle" style="font-weight: bold;">项目名称编号</td>
	        <td><s:textfield name="entity.code"/></td>
	      </tr>
	  	  <tr>
	        <td class="tdTitle" style="font-weight: bold;">项目名称 </td>
	        <td><s:textfield name="entity.name"/></td>
	      </tr> 
	       <tr>
	            <td colspan="2"><input id="bt_research" type="button" value='查询'/></td>
	       </tr>
	    </table>
    
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead class="listheader">
			<tr>
				<th style="text-align:left;">
					项目名称清单(<s:property value="#request.projNameList.size()"/>)&nbsp;&nbsp;&nbsp;&nbsp;<font color="xff0000">*</font><s:text name="cc.header.required"/>
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent4list" cellpadding="0" width="100%">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th>业务单位</th>
				<th>项目名称编号</th>
				<th>项目名称</th>
				
			</tr>
		</thead>
		<tbody>
		     <s:hidden name="fldProjNames"/>
			<s:iterator value="projNameList" var="item" status='st'>
			<tr>
				<td>
				 <input type="checkbox" id="id"  name="strNames" value="<s:property value='#st.index'/>" />
				</td>
				<td><s:property value="#item.organName" /></td>
				<td><s:property value="#item.code" /></td>
				<td><s:property value="#item.name" /></td>
			
				<input type="hidden" name= "chooseItem[<s:property value='#st.index'/>].id" value="<s:property value="#item.id"/>" />
				<input type="hidden" name= "chooseItem[<s:property value='#st.index'/>].organName" value="<s:property value="#item.organName"/>" />
				<input type="hidden" name= "chooseItem[<s:property value='#st.index'/>].code" value="<s:property value="#item.code"/>" />
				<input type="hidden" name= "chooseItem[<s:property value='#st.index'/>].name" value="<s:property value="#item.name"/>" />
				<input type="hidden" name= "chooseItem[<s:property value='#st.index'/>].budgetCny" value="<s:property value="#item.budgetCny"/>" />
				<input type="hidden" name= "chooseItem[<s:property value='#st.index'/>].budgetUsd" value="<s:property value="#item.budgetUsd"/>" />

			</tr>
			</s:iterator>

		</tbody>
	</table>
	<table>
		<tr>
			<td colspan="4" style="text-align: left;">
				&nbsp;&nbsp;<input id="bt_choose" type="button" value='选择' />
			</td>
		</tr>
	</table>
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead class="listheader">
			<tr>
				<th style="text-align:left;">
					已选择项目名称清单
				</th>
			</tr>
		</thead>
	</table>
	<table class="tblContent4list" id="tb" cellpadding="0" width="100%">
		<thead>
			<tr>
				<th>&nbsp;</th>
				<th>业务单位</th>
				<th>项目名称编号</th>
				<th>项目名称</th>
		
			</tr>
		</thead>
		<tbody>
                <s:iterator value="chooseList" var="itemChoose" status='st'>
			<tr>
				<td>
				 <input type="checkbox" id="idChoose" name="idChoose" checked="ture" value="<s:property value="#itemChoose.id"/>">
				</td>
				<td><s:property value="#itemChoose.organName" /></td>
				<td><s:property value="#itemChoose.code" /></td>
				<td><s:property value="#itemChoose.name" /></td>
			
				<input type="hidden" name= "chooseList[<s:property value='#st.index'/>].id" value="<s:property value="#itemChoose.id"/>" />
				<input type="hidden" name= "chooseList[<s:property value='#st.index'/>].organName" value="<s:property value="#itemChoose.organName"/>" />
				<input type="hidden" name= "chooseList[<s:property value='#st.index'/>].code" value="<s:property value="#itemChoose.code"/>" />
				<input type="hidden" name= "chooseList[<s:property value='#st.index'/>].name" value="<s:property value="#itemChoose.name"/>" />
				<input type="hidden" name= "chooseList[<s:property value='#st.index'/>].budgetCny" value="<s:property value="#itemChoose.budgetCny"/>" />
				<input type="hidden" name= "chooseList[<s:property value='#st.index'/>].budgetUsd" value="<s:property value="#itemChoose.budgetUsd"/>" />
				
				<input type="hidden" id="<s:property value="#itemChoose.id"/>_name" value="<s:property value="#itemChoose.name"/>"/>
				<input type="hidden" id="<s:property value="#itemChoose.id"/>_budgetCny" value="<s:property value="#itemChoose.budgetCny"/>" />
				<input type="hidden" id="<s:property value="#itemChoose.id"/>_budgetUsd" value="<s:property value="#itemChoose.budgetUsd"/>" />
			</tr>
			</s:iterator>
		</tbody>
	</table>
	<table>
		<tr>
			<td colspan="4" style="text-align: left;">
				&nbsp;&nbsp;<input id="bt_ok" type="button" value='确定' />
				&nbsp;&nbsp;<input id="bt_cancel" type="button" value='取消' />
			</td>
		</tr>
	</table>
	</s:form>
</div>
</body>
</html>