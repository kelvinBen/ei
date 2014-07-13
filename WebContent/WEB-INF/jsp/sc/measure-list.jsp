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

	$("#save_selected").click(function(){
		$("#measure_form").submit();
		return false;
	});	
    
	$("input.flag").click(function(){
	    if(this.checked){
		    $(this).attr("value","true");
	    }else if(!this.checked){
		    $(this).attr("value","false");
	    }
	 });

	$("#currency_exit").click(function(){
		window.location.href="/prc";
		return false;
	});

	$("#create_new").click(function(){
		$("#measure_form").attr("action",'<s:url namespace="/sc/measure" action="create"/>');
		$("#measure_form").submit();
		return false;
	});
	
	$("#show_history").click(function(){
		window.location.href="<s:url namespace="/history/common" action="list"><s:param name="targetClazz">Measure</s:param><s:param name="page.orderBy">mhi.id</s:param><s:param name="page.order">desc</s:param></s:url>";
		return false;
	});
	 $("select").change(function(){
		 if(this.value=="undeleted"){
			$("#measure_form").attr("action",'<s:url namespace="/sc/measure" action="listuse"/>');
			$("#measure_form").submit();
			return false;
		}else if(this.value=="deleted"){
			$("#measure_form").attr("action",'<s:url namespace="/sc/measure" action="listdeleted"/>');
			$("#measure_form").submit();
			return false;
		}else{
			$("#measure_form").attr("action",'<s:url namespace="/sc/measure" action="list"/>');
			$("#measure_form").submit();
			return false;
		}
	 });

});
</script>
<style type="text/css">
#content{
	float:none;
	width:940px;
}
#noborder{
	border-width:0px;
	width: 25%;
}
#text{
	width:90%;
}
</style>
</head>

<body>
<div class="editdiv">
	<table class="tblsummary" width="100%" cellpadding="0">
		<thead>
			<tr>
				<th style="text-align:left;">
					<span>计量单位清单(<s:property value="#request.measureList.size()"/>)&nbsp;&nbsp;&nbsp;&nbsp;<font color="xff0000">*</font><s:text name="cc.header.required"/></span>
				</th>
			</tr>
		</thead>
	</table>	
	<table class="tblContent4list" cellpadding="0" width="100%">
				<s:form id="measure_form" namespace="/sc/measure" action="saveselected" theme="simple" method="post">
					<input type="hidden" name="id" value="" id="mhl_form_id"/>
					<thead>
						<tr>
							<th><s:text name="measure.measureid"/></th>
							<th><s:text name="measure.description_zh_CN"/></th>
							<th><s:text name="measure.description_en_US"/></th>
							<th>
								<s:text name="measure.deleted"/>
								<select  name="viewFlag">
									<option value="all" <s:if test="#request.viewFlag.equals('all')">selected</s:if>><s:text name="cc.header.option2"/></option>
									<option value="undeleted" <s:if test="#request.viewFlag.equals('undeleted')">selected</s:if>><s:text name="cc.header.option3"/></option>
									<option value="deleted" <s:if test="#request.viewFlag.equals('deleted')">selected</s:if>><s:text name="cc.header.option4"/></option>
								</select>(<s:property value="#request.measureList.size()"/>)
							</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#request.measureList" id="measureList" status="status">
						<tr>
							<td><s:property value="#measureList.measureid"/> </td>
							<input type="hidden" value="<s:property value="#measureList.id"/>" name="measures[<s:property value="#status.index" />].id"/>
							<input type="hidden" id="noborder" name="measures[<s:property value="#status.index" />].measureid" value="<s:property value="#measureList.measureid"/>"></input>
							<td><input type="text" id="text" name="measures[<s:property value="#status.index" />].description_zh_CN" value="<s:property value="#measureList.description_zh_CN"/>"></input><font color="#ff0000">*</font></td>
						    <td><input type="text" id="text" name="measures[<s:property value="#status.index" />].description_en_US" value="<s:property value="#measureList.description_en_US"/>"></input><font color="#ff0000">*</font></td>
						    <td>
						    <s:if test="#measureList.deleted == true">
						    <input type="checkbox" class="flag" name="measures[<s:property value="#status.index" />].deleted" id="deleted_<s:property value="#status.index"/>" value="true" checked/>
						    </s:if>
						    <s:else>
						    <input type="checkbox" class="flag" name="measures[<s:property value="#status.index" />].deleted" id="deleted_<s:property value="#status.index"/>" value="false"/>
						    </s:else>
						    </td>
						</tr>
						</s:iterator>
					</tbody>
					</s:form>
				</table>
				<table>
						<tr>
						<td>
							<button type="submit" id="save_selected"><s:text name="button.save"/></button>&nbsp;
							<button type="button" id="create_new"><s:text name="cc.button.input"/></button>&nbsp;
							<button type="button" id="show_history"><s:text name="cc.button.histroy"/></button>&nbsp;
						</td>
						</tr>
				</table>
	</div>
</body>
</html>