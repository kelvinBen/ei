<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>类别检索</title>
<base target="_self"/>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#matGroupSelectButton").click(function(event) {	
			if($("input[name='items']:checked").length==0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}else{
				var strNum = $("input[name='items']:checked").val();
				var matGroupDescZH = $("#" + strNum + "_zh").val();
				var matGroupDescEN = $("#" + strNum + "_en").val();
				var result = {};
				result.matGroupNum = strNum;
				result.matGroupDescZH = matGroupDescZH;
				result.matGroupDescEN = matGroupDescEN;	
				window.returnValue = result;
				window.close();
			}
		});
	});
	$(function() {
		$("#matGroupForm").validate({										//注册表单校验规则
			rules: {
				'numberLimit': {
					required: true				
				}
			}
		});
		$("#searchButton").click(function(){
			if ($("#matGroupForm").validate().form()){						//验证表单内容，如果校验通过则继续查询			
				}
			else{	
				return false;											//校验不通过，终止后继操作
			}
		});
	});
	
</script>
</head>
<body>
  <div class="editdiv">
	<table class="tblContent" width="100%" cellpadding="0" >
		<s:form id="matGroupForm" namespace="/pr/group" action="search" method="post" theme="simple">
		    <tr>
		      <th class="tdTitle">类别编码</th>
		      <td class="TdRight"><s:textfield name="matGroupNum"/></td>
		    </tr>
		    <tr>
		      <th class="tdTitle">类别描述</th>
		      <td class="TdRight"><s:textfield name="matGroupDesc"/></td>
		    </tr>
		    <tr>
		      <th class="tdTitle">最大命中数量*</th>
		      <td class="TdRight"><s:textfield name="numberLimit" value="10"/></td>
		    </tr>		
		    <tr>
		      <td><s:submit value="查询" id='searchButton'/></td>
		      <td align="right"><button id='matGroupSelectButton'>选择</button></td>
		    </tr>
		</s:form>
	</table>
	<div>
	<table class="tblContent4list" style="table-layout:fixed;" cellpadding="0">
		<colgroup>
			<col style="width:30%;"/>
			<col style="width:40%;"/>
			<col style="width:30%;"/>
		</colgroup>			
		<tr>
			<th>类别编码</th>
			<th>类别描述</th>
			<th>选择</th>
		</tr>
	</table>
	</div>
	<div style="width:100%;height:550px;overflow-y:auto;overflow-x:hidden;">
	<table class="tblContent4list" style="table-layout:fixed;word-break:break-all;" cellpadding="0">
		<colgroup>
			<col style="width:30%;"/>
			<col style="width:40%;"/>
			<col style="width:30%;"/>
		</colgroup>	
		<s:iterator value="#request.matGroupList" id="matGroupList">
		<tr id='item_<s:property value="#matGroupList.matGroupNum" />'>
			<td class = "item_matGroupNum"><s:property value="#matGroupList.matGroupNum" /></td>
			<td class = "item_matGroupDesc">
				<s:if test="language == zh">
					<s:property value="#matGroupList.matGroupDesc_zh_CN" />
				</s:if>
				<s:elseif test="language == en">
					<s:property value="#matGroupList.matGroupDesc_en_US" />
				</s:elseif>
				<input type="hidden" id="<s:property value="#matGroupList.matGroupNum" />_zh" value="<s:property value ="#matGroupList.matGroupDesc_zh_CN" />"/>
				<input type="hidden" id="<s:property value="#matGroupList.matGroupNum" />_en" value="<s:property value ="#matGroupList.matGroupDesc_zh_CN" />"/>
			</td>
			<td><input type="radio" name="items" value='<s:property value="#matGroupList.matGroupNum" />'></td>
		</tr>
		</s:iterator>
	</table>
	</div>
  </div>
</body>
</html>