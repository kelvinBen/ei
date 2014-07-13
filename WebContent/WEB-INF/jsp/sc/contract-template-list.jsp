<%@ page pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#btnAdd").click(function(){
			document.location = "tempadd.do";
		});
		$("#selectAll").change(function(){
			$("input[name='ids']").attr("checked",$(this).attr("checked"));
		});
		$("#btnEdit").click(function(){
			if($("input[name='ids']:checked").length == 1){
				$("input[name='template.id']").val($("input[name='ids']:checked").val());
				$("#frm").attr("action",$("#edit_action").val());
				$("#frm").submit();
			}else{
				alert("请选择一个合同模板进行修改");
			}
		});
		$("#btnDelete").click(function(){
			if($("input[name='ids']:checked").length > 0){
				if(confirm("您确定删除选中的合同模板吗？")){
					$("#frm").attr("action",$("#del_action").val());
					$("#frm").submit();
				}
			}else{
				alert("请选择合同模板");
			}
		});

		if($.query.get('cmd')=="select"){
			$("#divOperation").hide();
			$("[name='colBU']").hide();
			$("#divSelect").show();
			$("#btnOK").click(function(){
				var result = [];
				$("[name='ids']:checked").each(function(i){
					result[i] = {};
					result[i].id = this.value;
					result[i].uuid = $(this).attr("uuid"); //UUID
					result[i].name = $(this).attr("tname"); //合同模板名称
				});
				
				window.returnValue = result;
			    window.close();
			});
			$("#btnCancel").click(function(){
			    window.close();
			});
		}
	});
</script>
</head>
<body style="padding: 10px;">
	<s:form namespace="/sc/contract" action="templist" method="post" theme="simple" id="frm">
	<div style="margin-bottom: 5px;" id="divOperation">
		<span>
			<label>模板名称</label>
			<s:textfield name="template.name"></s:textfield>
		</span>
		<span>
			<label>模板类型</label>
			<s:textfield name="template.type"></s:textfield>
		</span>
		
		<input type="submit" value="查询" id="btnQuery"/>
		<input type="button" value="增加" id="btnAdd"/>
		<input type="button" value="修改" id="btnEdit"/>
		<input type="button" value="删除" id="btnDelete"/>
		<!-- param transfered to edit page -->
		<s:hidden name="template.id"/>
		<input type="hidden" id="edit_action" value="<s:url namespace="/sc/contract" action="tempedit"></s:url>"/>
		<input type="hidden" id="del_action" value="<s:url namespace="/sc/contract" action="tempdel"></s:url>"/>
	</div>
	
	<table class="tblContent4list" cellpadding="0" width="100%">
		<tr>
			<th width="22">
				<input type="checkbox" id="selectAll" />
			</th>
			<th>模板所属业务单元</th>
			<th>模板名称</th>
			<th>模板类型</th>
			<th>模板说明</th>
			<th name="colBU">选择适用的业务单元</th>
		</tr>
		<s:iterator value="#request.templist" var="tmpl">
			<tr>
				<td>
					<input type="checkbox" name="ids" value="<s:property value="#tmpl.id" />"
						 uuid="<s:property value="#tmpl.ecmUuid" />" tname="<s:property value="#tmpl.name" />"/>
				</td>
				<td><s:property value="#tmpl.hostOrg.organName" /></td>
				<td><s:property value="#tmpl.name" /></td>
				<td><s:property value="#tmpl.type" /></td>
				<td><s:property value="#tmpl.desc" /></td>
				<td style="word-break:break-all;" name="colBU"><s:property value="#tmpl.buNames" /></td>
			</tr>
		</s:iterator>
	</table>
	
	<div id="divSelect" style="text-align: right;display: none;">
		<input value="确定" type="button" id="btnOK"/>
		&nbsp;&nbsp;
		<input value="取消" type="button" id="btnCancel"/>
	</div>
	</s:form>
</body>
</html>