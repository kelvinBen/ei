<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pri.list" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
td{text-align:center;overflow:hidden;}
</style>
<script type="text/javascript">
	$(function() {
		$("#a_pri_list").addClass("currentLink");
		
		$("#select_all").click(function(){
			if($(this).attr("checked")==false){
				$('input:checkbox').each(function(i,obj){
					$(this).attr("checked",false);
				});			
			}else if($(this).attr("checked")==true){
				$('input:checkbox').each(function(i,obj){
					$(this).attr("checked",true);
				});			
			}
		});	

		$("#but_delete").click(function(){
			if ($("input:checkbox:checked").length == 0){
				alert('<s:text name="message.select.one"/>');
				return false;
			}
			if (confirm('<s:text name="message.confirm.delete"/>')){
				$("#pri_form").attr("action",'<s:url namespace="/br/divisionrule" action="delete"/>');
				$("#pri_form").submit();
			}

			return false;
		});	

		$("#pr_prev").click(function(){
			location.href=$("#a_pr_form")[0].href;
			return false;
		});
		$("#pr_next").click(function(){
			location.href=$("#a_pr_atta")[0].href;
			return false;
		});

		$("#but_new").click(function(){
			window.location.href='<s:url namespace="/br/divisionrule" action="toadd"/>';
		});
	});
</script>
</head>
<body>
  <div class="editdiv">
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead class="listheader">
		  <tr><th style="text-align:left;padding-left:10px;height:100%"><s:text name=""/><s:text name="pri.merge.rule.list"/></th></tr>
		</thead>
	</table>
	<table class="tblContent4list" width="100%" cellpadding="0">
		<s:form id="pri_form" namespace="/br/divisionrule" action="delete" theme="simple" method="post">
		<thead>
			<tr>
				<th width="40px"><input type="checkbox" id="select_all"/></th>
				<th><s:text name="division.title.unit"/></th>
				<th><s:text name="division.title.name"/></th>
				<th><s:text name="division.title.is.centrial"/></th>
				<th><s:text name="division.title.principle"/></th>
				<th><s:text name="division.title.divisoner"/></th>
				<th><s:text name="division.title.creater"/></th>
				<th><s:text name="division.title.createtime"/></th>
				<th><s:text name="division.title.updater"/></th>
				<th><s:text name="division.title.updatetime"/></th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="list" var="division">
			<tr>
				<td style="text-align: center;"><input type="checkbox" name="ids" value="<s:property value="#division.id"/>"/></td>
				<td><s:property value="#division.organName"/></td>
				<td>
					<s:url id="url" action="toadd">		
						<s:param name="id">
								<s:property value="#division.id" />
						</s:param>
					</s:url> 
					<s:a href="%{url}">
						<s:property value="#division.name"></s:property>
					</s:a>
				</td>
				<s:if test="%{#division.isCentrial==false}">
			         <td>采办需求</td>
			    </s:if>
			    <s:else>
                      <td>一级集中采购申请</td>
			   </s:else>
				<td><s:property value="#division.divisionRule"/></td>
				<td><s:property value="#division.staffNames"/></td>
				<td><s:property value="#division.createUserName"/></td>
				<td><s:property value="#division.createTime"/></td>
				<td><s:property value="#division.updateUserName"/></td>
				<td><s:property value="#division.updateTime"/></td>
			</tr>
			</s:iterator>
			<tr>
			<td colspan="10" class="buttonCon">
			  <button value="" id="but_new" type="button"><s:text name="button.new" /></button>
			  <button value="" id="but_delete" type="button"><s:text name="button.delete" /></button>
			</td>
		</tr>
		</tbody>
		</s:form>
	</table>
  </div>
</body>
</html>