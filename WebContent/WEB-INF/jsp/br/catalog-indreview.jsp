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

<title><s:text name="com.cnooc.domain.catalog.indreview.header"/></title>
<SCRIPT type="text/javascript">
$(function(){
	$("#a_sm_indicator_review").addClass("currentLink");
	$("#cancel").click(function(){
		location.href='<s:url namespace="/br" action="indicatorList"><s:param name="testId" value="#request.testId"/></s:url>';
	});
	jQuery.validator.addClassRules("floatnum_css", {
		  required: true,
		  min: 80
		});
	jQuery.validator.addClassRules("infocss", {
		  required: true,
		  minlength: 2000
		});	 
	$("#update_form").validate({										//注册表单校验规则
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
	
});
</SCRIPT>
</head>
<body>

<div id="container">
<%@ include file="/WEB-INF/jsp/sidebar-sm.jsp"%>
	<s:form id="update_form" theme="simple" method="post" action="updateKeyMeasure">
		<s:hidden name="keyMeasurement.id"></s:hidden>
		<s:hidden name="testId"></s:hidden>
			<table class="tblContent" width="100%" cellpadding="0" border="1px" align="left">
			<colgroup>
	      <col style="width:10%;"/>
	      <col style="width:90%;"/>
	    </colgroup>
			<thead>
				<tr>
					<td class="tdTitle" colspan="2" style="height:30px;"><s:text name="com.cnooc.domain.catalog.indreview.title" /></td>
				</tr>
			</thead>
			<tr>
				<td class="tdTitle" width="100px"><s:text name="com.cnooc.domain.catalog.indreview.decription"></s:text><SPAN style="color: red">*</SPAN></td>
				<td align="left"><s:textfield name="keyMeasurement.description" id="descriptionOld"></s:textfield></td>
			</tr>
			<tr>
				<td class="tdTitle" width="100px"><s:text name="com.cnooc.domain.catalog.indreview.moreInfo"></s:text><SPAN style="color: red">*</SPAN></td>
				<td align="left"><s:textarea name="keyMeasurement.moreInfo" id="moreInfoOld" rows="10" cols="40" cssClass="required"></s:textarea></td>
			</tr>
			<tr>
	  		  <td class="tdTitle" ><s:text name="com.cnooc.domain.catalog.indreview.type"></s:text></td>
				<td>
				<s:hidden name="keyMeasurement.type" id="typeOld"/>&nbsp;
				<s:if test="keyMeasurement.type=='date'">日期</s:if>
				<s:elseif test="keyMeasurement.type=='int'">整数</s:elseif>
				<s:elseif test="keyMeasurement.type=='float'">小数</s:elseif>
				<s:elseif test="keyMeasurement.type=='boolean'">是/否</s:elseif>
				<s:else>文本</s:else>
				</td>
			</tr>
		<tr>
			<td class="tdTitle" ><s:text name="com.cnooc.domain.catalog.indreview.necessary"></s:text></td>
			<td><s:checkbox name="keyMeasurement.necessary"
				id="necessaryOld"></s:checkbox></td>
		</tr>
		<tr><td class="tdTitle" ><div>详细内容</div></td>
			<td>
			<s:if test='keyMeasurement.type=="text"'>
				<div id="text">
					<table>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indreview.text"/></td>
						<td><s:select list="#{'single':getText('com.cnooc.domain.catalog.indreview.single'),'multiline':getText('com.cnooc.domain.catalog.indreview.multiline')}" listKey="key" listValue="value" name="keyMeasurement.textOrBoolean" value="keyMeasurement.textOrBoolean" id="oldtextOrBoolean"></s:select></td>
					</tr>
				</table>
				</div>
			</s:if>
			<s:if test='keyMeasurement.type=="int"'>
				<div id="int">
					<table>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indreview.min"/></td>
						<td><s:textfield name="keyMeasurement.intMin" id="intMinOld"></s:textfield></td>
						<td><s:checkbox name="keyMeasurement.minContain"	id="minContainOld"></s:checkbox><s:text name="com.cnooc.domain.catalog.indreview.contain"/></td>
					</tr>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indreview.max" /></td>
						<td><s:textfield name="keyMeasurement.intMax" id="intMaxOld"></s:textfield></td>
						<td><s:checkbox name="keyMeasurement.maxContain"	id="maxContainOld"></s:checkbox><s:text name="com.cnooc.domain.catalog.indreview.contain"/></td>
					</tr>
				</table>
				</div>
			</s:if>
			<s:if test='keyMeasurement.type=="float"'>
				<div id="float">
				<table>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indreview.floatNum"/></td>
						<td><s:textfield name="keyMeasurement.floatNum" id="floatNumOld" readonly="true"></s:textfield></td>
					</tr>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indreview.min" /></td>
						<td><s:textfield name="keyMeasurement.floatMin" id="floatMinOld"></s:textfield></td>
						<td><s:checkbox name="keyMeasurement.minContain"	id="minContainOld"></s:checkbox><s:text name="com.cnooc.domain.catalog.indreview.contain"/></td>
					</tr>
					<tr>
						<td><s:text name="com.cnooc.domain.catalog.indreview.max"/></td>
						<td><s:textfield name="keyMeasurement.floatMax" id="floatMaxOld"></s:textfield></td>
						<td><s:checkbox name="keyMeasurement.maxContain"	id="maxContainOld"></s:checkbox><s:text name="com.cnooc.domain.catalog.indreview.contain"/></td>
					</tr>
				</table>
				</div>
			</s:if>
			<s:if test='keyMeasurement.type=="boolean"'>
				<div id="boolean">
				<table >	
					<tr>
						<td><s:select list="#{'true':getText('com.cnooc.domain.catalog.indreview.true'),'false':getText('com.cnooc.domain.catalog.indreview.false')}" name="keyMeasurement.textOrBoolean" listKey="key" listValue="value" value="keyMeasurement.textOrBoolean" id="oldBoolean"></s:select></td>
					</tr>
				</table>
				</div>
			</s:if>
			<s:if test='keyMeasurement.type=="date"'>
				<div id="date">
					<table>
					<tr>
						<td>date</td>
					</tr>
				</table>
				</div>
			</s:if>
				</td>
			</tr>
			<tr >
				<td colspan="2"><input type="submit" value="<s:text name="com.cnooc.domain.catalog.indreview.save"/>">
					&nbsp;
					<button type="button" id="cancel"><s:text name="com.cnooc.domain.catalog.indadd.cancel"/></button>
				</td>
			</tr>
		</table>
			<!-- 用来传递Id的  -->
			<div style="visibility: hidden"><input type="text" name="testtesttest" value="<%=request.getParameter("testId") %>"></input></div>
		</s:form>
		</div>

</body>
</html>