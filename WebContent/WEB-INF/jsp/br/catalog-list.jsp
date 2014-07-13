<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="menu.pri.list" /></title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#selectall").click(function(){ 
			$("input[name='catalogIds']").attr("checked",$(this).attr("checked")); 
		});
		 
		$("#button_input").click(function(){
			$("input[name='catalogIds']").attr("checked",$(this).attr("checked"));
			$("#mainForm").attr("action",'<s:url namespace="/br" action="toadd"/>');
			$("#mainForm").submit();
			return false;
		});
		
		$("#button_update").click(function(){
			if($("input[id='catalogIds']:checked").length == 0){
				alert('<s:text name="message.edit.checked" />');
				return false;
			}
			if($("input[id='catalogIds']:checked").length > 1){
				alert('<s:text name="message.edit.onlyone" />');
				return false;
			}
			$("#mainForm").attr("action",'<s:url namespace="/br" action="muLu"/>');
			$("#mainForm").submit();
			return false;
		});
		
		$("#button_delete").click(function(){
			if(confirm("<s:text name="com.cnooc.domain.catalog.list.deletePrompt"/>")){
				$("#mainForm").attr("action",'<s:url namespace="/br" action="catalog-delete"/>');
				$("#mainForm").submit();
			}
			return false;
		});
		
		$("#button_histroy").click(function(){
			window.location.href="<s:url namespace="/history/common" action="list"><s:param name="targetClazz">CentralCatalog</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
			return false;
		});
	});

	function showDetail(id){
		/*
		$("input[id='catalogIds']").each(function(){
			$(this).attr("checked",false);
		});
		$(window.event.srcElement).prev().children().first().attr("checked",true);
		*/
		$("#testId").attr("value",id);
		$("#mainForm").attr("action",'<s:url namespace="/br" action="muLu"/>');
		$("#mainForm").submit();
	}
</script>
</head>

<body>
<div class="editdiv">
<s:form name="mainForm" id="mainForm" theme="simple" action="catalog-list" namespace="/br">
	<s:hidden name="testId" id="testId"/>
	<s:hidden name="buLevel" id="buLevel"/>
	<s:hidden name="buId" id="buId"/>
	<table class="tblContent4list" width="100%" cellpadding="0">
		<s:if test="%{buLevel != 0}">
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: 15%;" />
				<col style="width: 20%;" />
				<col style="width: 20%;" />
				<col style="width: 20%;" />
				<col style="width: 20%;" />
			</colgroup>		
		</s:if>
		<s:else>
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: 12%;" />
				<col style="width: 26%;" />
				<col style="width: 26%;" />
				<col style="width: 31%;" />
			</colgroup>
		</s:else>
		<thead>
			<tr>
				<s:if test="%{buLevel != 0}">
					<th colspan="6" style="text-align: left; padding-left: 10px; height: 30px; font-weight: bold;">
						<s:text name="com.cnooc.domain.catalog.list.level2"></s:text>
					</th>				
				</s:if>
				<s:else>
					<th colspan="5" style="text-align: left; padding-left: 10px; height: 30px; font-weight: bold;">
						<s:text name="com.cnooc.domain.catalog.list"></s:text>
					</th>
				</s:else>
			</tr>
			<tr align="center">
				<th style="text-align: center;"><input type="checkbox" id="selectall"></th>
				<th><s:text name="com.cnooc.domain.catalog.list.number"></s:text></th>
				<th>性质</th>
				<th><s:text name="com.cnooc.domain.catalog.mulu.from"></s:text></th>
				<th><s:text name="com.cnooc.domain.catalog.mulu.to"></s:text></th>
				<s:if test="%{buLevel != 0}">
					<th>适用的业务单位</th>
				</s:if>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="centralCatalogList" var="centralCatalog" status="row">
				<tr align="center">
					<td style="text-align: center;"><input type="checkbox" id="catalogIds" name="catalogIds" value="<s:property value="#centralCatalog.id"/>" /></td>
					<td style="cursor:pointer;text-decoration: underline" onclick="javascript:showDetail('<s:property value="id"/>');"><s:property value="#centralCatalog.id"/></td>
					<td><s:if test='#centralCatalog.sortOrMaterial=="Sort"'>类别</s:if><s:else>物料</s:else></td>
					<td><s:property value="#centralCatalog.from" /></td>
					<td><s:property value="#centralCatalog.to" /></td>
					<s:if test="%{buLevel != 0}">
						<td><s:property value="#centralCatalog.buId" /></td>
					</s:if>
				</tr>
			</s:iterator>
			<tr>
				<s:if test="%{buLevel != 0}">
					<td colspan="6" style="text-align:center;">
				</s:if>
				<s:else>
					<td colspan="5" style="text-align:center;">
				</s:else>				
				<button id="button_input" type="button"><s:text name="create" /></button>
				&nbsp;
				<button id="button_delete" type="button"><s:text name="delete" /></button>
				&nbsp;
				<button id="button_histroy" type="button"><s:text name="cc.button.histroy" /></button>
				&nbsp;
				</td>
			</tr>
		</tbody>
	</table>
</s:form>
</div>
</body>
</html>
