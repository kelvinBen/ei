<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人员检索</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<script type="text/javascript">
var jsonResult=new Array();
$(function() {
	$('#searchBut').click(function(){
		var url = <c:if test="${param.searchType=='typeRadio'}">'<s:url namespace="/user/search" action="searchRadioInit"/>'</c:if><c:if test="${param.searchType!='typeRadio'}">'<s:url namespace="/user/search" action="searchCheckboxInit"/>'</c:if>;
		window.open(url, '<s:text name="menu.pri.create" />', 'height=660px, width=650px, top=0, left=250, toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no');
		return false;		
	});
	
	$('#submitBut').click(function(){
		if(jsonResult==null || jsonResult.length==0){
			alert("<s:text name='division.title.select.staff'/>");
			return false;
		}else{
			//window.returnValue = jsonResult;
			window.opener.addStaff(jsonResult);
			window.close();
		}
	});
});

function addStaff(result){
	var objTemp;
	var strValue="";
	for(var i=0;i<result.length;i++){
		objTemp = $.extend(true,{},result[i]);
		jsonResult.push(objTemp);
		if(strValue==""){
			//strValue = strValue+unicodeChange.un(result[i].lastName)+unicodeChange.un(result[i].firstName);
			strValue = strValue+unicodeChange.un(result[i].name);
		}
		else
			//strValue = strValue+","+unicodeChange.un(result[i].lastName)+unicodeChange.un(result[i].firstName);
			strValue = strValue+","+unicodeChange.un(result[i].name);
	}
	$('#textContainer').attr("value",strValue);
}

var unicodeChange = {
	    on: function(str) {
	        var a = [],
	        i = 0;
	        for (; i < str.length;) a[i] = str.charCodeAt(i++);
	        return "&#" + a.join(";&#") + ";";
	    },
	    un: function(str) {
	        return str.replace(/&#(x)?([^&]{1,5});?/g,function(a, b, c) {return String.fromCharCode(parseInt(c, b ? 16 : 10));});
	    }
	};
</script>

</head>
<body>
  <div class="editdiv">
	<table class="tblContent" width="100%" cellpadding="0">	
	<form id="form1" name="form1" action="">
	<tr>
		<th class="tdTitle">人员检索</th>
		<td class="TdRight">
		  <input type="text" value="" id="textContainer" name="userName" style="margin-right:10px;" readonly/>
		  <input type="button" id='searchBut' value="<s:text name='button.search'/>" />
		</td>
	</tr>
	<tr>
	  <td colspan="2" class="TdRight" style="text-align:center;">
	   <button id='submitBut'><s:text name="button.submit"/></button>
	   <button onclick="window.close();"><s:text name="button.quit"/></button>
	  </td>
	</tr>
	</form>
	</table>
  </div>
</body>
</html>