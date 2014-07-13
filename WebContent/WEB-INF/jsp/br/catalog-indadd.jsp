<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>

<%
String items = "";//默认为all
if(request.getParameter("items")!=null && !request.getParameter("items").toString().equals("")){
    items = request.getParameter("items").toString();
}
%>

<title><s:text name="com.cnooc.domain.catalog.indadd.header" /></title>
<SCRIPT type="text/javascript">
$(function(){
	$("#a_sm_indicators").addClass("currentLink");
	$("#submitdate").datepicker();//注册日期选择控件
	$("#cancel").click(function(){
		location.href='<s:url namespace="/br" action="indicatorList"><s:param name="testId" value="#request.testId"/></s:url>';
	});
	$("#save").click(function(){
		$("#keyMeasure_form").validate({
		rules: {
			'keyMeasurement.description': {
				required: true,
				maxlength: 80
			//	number:true
			},
			'keyMeasurement.moreInfo':{
				required:true,
				maxlength:2000
			},
			'keyMeasurement.type':{
				required:true
			},
			'floatNum':{
				min:0,
				max:5
			},
			'dateStr': {
				date: true
			}
		}
	});
	$('.type').change(function(){
		if($('.type').val()=='float')
		{
			$("#floatNum").rules("add", {required:true});
		}
		if($('.type').val()=='boolean'){
			$("#booleanItem").rules("add", {required:true});
		}
	});
		
		
		if(document.getElementById("floatmin").value>document.getElementById("floatmax").value||document.getElementById("intmin").value>document.getElementById("intmax").value)
		{
			alert('<s:text name="com.cnooc.domain.catalog.indadd.alertmessage" />');
			return;
		}
		$("#keyMeasure_form").attr("action",'<s:url namespace="/br" action="indicatorAdd"/>');
		$("#keyMeasure_form").submit();

	});
	
});

	function showdiv() {
		if (document.getElementById("items").value == "int"||document.getElementById("items")[2].selected) {
			document.getElementById("int").style.display = "";
		} else {
			document.getElementById("int").style.display = "none";
		}

		if (document.getElementById("items").value == "text"||document.getElementById("items")[1].selected) {
			document.getElementById("text").style.display = "";
		} else {
			document.getElementById("text").style.display = "none";
		}

		if (document.getElementById("items").value == "float"||document.getElementById("items")[3].selected) {
			document.getElementById("float").style.display = "";
		} else {
			document.getElementById("float").style.display = "none";
		}

		if (document.getElementById("items").value == "boolean"||document.getElementById("items")[4].selected) {
			document.getElementById("boolean").style.display = "";
		} else {
			document.getElementById("boolean").style.display = "none";
		}

		if (document.getElementById("items").value == "date"||document.getElementById("items")[5].selected) {
			document.getElementById("date").style.display = "";
		} else {
			document.getElementById("date").style.display = "none";
		}
	}
</SCRIPT>
</head>
<body>
<div id="container">
<%@ include file="/WEB-INF/jsp/mainmenu.jsp"%>
<%@ include file="/WEB-INF/jsp/sidebar-sm.jsp"%>

	<s:form id="keyMeasure_form" namespace="/br" method="post" theme="simple">
	<table class="tblContent" width="100%" cellpadding="0" border="1px" align="left">
		<colgroup>
	      <col style="width:10%;"/>
	      <col style="width:90%;"/>
	    </colgroup>
		<thead>
			<tr><td class="tdTitle" colspan="2" style="height:30px;"><s:text name="com.cnooc.domain.catalog.indadd.title" /></td></tr>
		</thead>
		<tr>
			<th class="tdTitle">
				<s:text name="com.cnooc.domain.catalog.indadd.description" />:<span class="star"> *</span>
			</th>
			<td class="TdRight">
				<input type="text" name="keyMeasurement.description" maxlength="80"></input>
			</td>
		</tr>
		<tr>
			<th class="tdTitle">
				<s:text name="com.cnooc.domain.catalog.indadd.moreInfo" />:<span class="star"> *</span>
			</th>
			<td>
				<textarea rows="10" cols="40" name="keyMeasurement.moreInfo"></textarea>
			</td>
		</tr>
		<tr>
	  		  <th class="tdTitle">选择类型:<span class="star"> *</span></th>
				<td><select id="items" class="type" name="keyMeasurement.type" onchange="showdiv()">
					<option value="" <%=items.equals("") ? "selected" : ""%>><s:text name="com.cnooc.domain.catalog.indadd.selecttype" /></option>
					<option value="text" <%=items.equals("text") ? "selected" : ""%>><s:text name="com.cnooc.domain.catalog.indadd.texttype"></s:text></option>
					<option value="int" <%=items.equals("int") ? "selected" : ""%>><s:text name="com.cnooc.domain.catalog.indadd.inttype" /></option>
					<option value="float" <%=items.equals("float") ? "selected" : ""%>><s:text name="com.cnooc.domain.catalog.indadd.floattype"/></option>
					<option value="boolean" <%=items.equals("boolean") ? "selected" : ""%>><s:text name="com.cnooc.domain.catalog.indadd.booleantype" /></option>
					<option value="date" <%=items.equals("date") ? "selected" : ""%>><s:text name="com.cnooc.domain.catalog.indadd.datetype" /></option>
					<option></option>
				</select></td>
			</tr>
			<tr>
	 		  <td></td>
				<td width="300px">
					<div id="text" style="display: none">
						<table>
							<tr>
								<td class="TdRight"><SELECT name="textItem">
									<option value="single"><s:text name="com.cnooc.domain.catalog.indadd.single"/></option>
									<option value="multiline"><s:text name="com.cnooc.domain.catalog.indadd.multiline"/></option>
								</SELECT></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
	 		   <td></td>
				<td width="300px">
				<div id="int" style="display: none">
				<table>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indadd.min"/></td>
						<td><input type="text" name="intmin" id="intmin"></td>
						<td><input type="checkbox" name="minContain"><s:text name="com.cnooc.domain.catalog.indadd.contain" /></td>
					</tr>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indadd.max" /></td>
						<td><input type="text" name="intmax" id="intmax"></input></td>
						<td><input type="checkbox" name="maxContain"><s:text name="com.cnooc.domain.catalog.indadd.contain" /></td>
					</tr>
				</table>
				</div>
				</td>
				
			</tr>
			<tr>
				<td></td>
				<td width="300px">
				<div id="float" style="display: none">
				<table>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indadd.floatnum"/><span class="star"> *</span></td>
						<td><input type="text" name="floatNum" id="floatNum"></td>
					</tr>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indadd.min" /></td>
						<td><input type="text" name="floatmin" id="floatmin"></td>
						<td><input type="checkbox" name="minContain"><s:text name="com.cnooc.domain.catalog.indadd.contain" /></td>
					</tr>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indadd.max" /></td>
						<td><input type="text" name="floatmax" id="floatmax"></td>
						<td><input type="checkbox" name="maxContain"><s:text name="com.cnooc.domain.catalog.indadd.contain" /></td>
					</tr>
				</table>
				</div>
				</td>
				
			</tr>
			<tr>
			    <td></td>
				<td width="300px">
				<div id="boolean" style="display: none">
				<table>			
					<tr>
						<td><select name="booleanItem" id="booleanItem">
							<option value=""><s:text name="com.cnooc.domain.catalog.indadd.select"/></option>
							<option value="true"><s:text name="com.cnooc.domain.catalog.indadd.true"/></option>
							<option value="false"><s:text name="com.cnooc.domain.catalog.indadd.false"/></option>
						</select></td>
					</tr>
				</table>
				</div>
				</td>
				
			</tr>
			<tr>
				<td></td>
				<td width="300px">
				
				</td>
				
			</tr>
			<tr>
				<th class="tdTitle"><div><s:text name="com.cnooc.domain.catalog.indadd.isnecessary"></s:text></div></th>
				<td><input type="checkbox" name="necessary"></td>
			</tr>
			<tr ><td></td><td>
				<button type="button" name="save" id="save"><s:text name="com.cnooc.domain.catalog.indadd.save"/></button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" name="cancel" id="cancel"><s:text name="com.cnooc.domain.catalog.indadd.cancel"/></button>
		</table>
			<!-- 用来传递Id的  -->
			<div style="visibility: hidden"><input type="text" name="testtesttest" value="<%=request.getParameter("testId") %>"></input></div>
		</s:form>
		</div>
</body>
</html>