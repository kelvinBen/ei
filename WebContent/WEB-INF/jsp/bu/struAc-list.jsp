<%@ page pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ request.getContextPath() + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>组织操作列表</TITLE>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript" src="<%=basePath %>js/sp/jqueryOverride.js"></script>
<script language="javascript">
	$(function() {
		$('#struActionList').flexigrid({height:400});
		initPage();
		
		$('#cStartDate').datepicker({ dateFormat: 'yy-mm-dd' });
	    $('#cEndDate').datepicker({ dateFormat: 'yy-mm-dd' });
		
		$("#broadcastBtn").click(function (){
			if ($("input:checkbox:checked").length == 0) {
						alert('<s:text name="message.select.one"/>');
						return false;
			}
			var keysUrl = $("input:checkbox:checked").serialize();
			var options = {
				async : false,
				type : "post",
				data : null,
				 url:"<%=basePath %>bu/struAc/broadcast.do?"+keysUrl,
				success :onBroadcastSucess,
				error : onBroadcastError
			};
			$.ajax(options);
			
			return false;
		});
	});
	
	function onBroadcastSucess(ret, result, req) {
		$.messager.alert("系统提示","广播成功");
	}
	
	function onBroadcastError(_p1, _p2, _p3) {
		//document.write(_p1.responseText);
		//$.messager.alert("系统提示",_p1.responseText);
		$("body").html(_p1.responseText);
	}
	
	
</script>
</head>
<body>
<form id="list" action="list.do" method="post">
	<DIV class="title">
	<TABLE>
		<THEAD>
		
			<TR>
				<td class="tdTitle">
				创建时间 :
				</td>
				<td>
					<input type="text" id="cStartDate" name="flt_s_and_geD_createTime" value="<s:property value='#parameters.flt_s_and_geD_createTime'/>"/>
					到<input type="text" id="cEndDate" name="flt_s_and_leD_createTime" value="<s:property value='#parameters.flt_s_and_leD_createTime'/>"/>
				</td>
				<td>
					<BUTTON type="submit">查找</BUTTON>
				</td>
			
				<TD align="right">
				
				<BUTTON id="broadcastBtn" type="button">广播</BUTTON>
				</TD>
			</TR>
		</THEAD>
	</TABLE>
	</DIV>
	<DIV class="hDivBox">
	<TABLE id="struActionList">
		<thead>
			<TR>
				<Th width="10">
				<INPUT id="selectAll" type="checkbox"
					name="selectAll" value="true" />
				</Th>
				<Th width="200">
				操作类型
				</Th>
				<Th width="300">
				描述
				</Th>
				<Th width="300">
				创建时间
				</Th>
			</TR>
		</thead>
		<tbody>
			<s:iterator value="pageBean.result" var="item">
			<TR>
				<TD>
				<INPUT type="checkbox" name="ids"
					value="<s:property value='#item.id'/>" />
				</TD>
				<TD>
					<s:property value='#item.actionType.description'/>
				</TD>
				<TD>
					<s:property value="#item.description"/>
				</TD>
				<TD>
					<s:property value="#item.createTime"/>
				</TD>
			</TR>
			</s:iterator>
		</tbody>
	</TABLE>
	</DIV>
	<br/>
	<div id="pageContainer"></div>
	<%@ include file="/WEB-INF/jsp/page.jsp"%>
</form>
</body>
</html>