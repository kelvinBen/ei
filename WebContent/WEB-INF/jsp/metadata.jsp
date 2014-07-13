<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/jquery/jquery.js" />"></script>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/sp/jqueryOverride.js" />"></script>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/jquery/flexigrid.js"/>"></script>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/jquery/jquery-ui.js" />"></script>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/jquery/jquery.validate.js" />"></script>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value='/js/jquery/jquery.query.js'/>"></script>    
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value='/js/jquery/numberformatter.js'/>"></script>    
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/jquery/i18n/jquery.ui.datepicker.%{getText('js.lang')}.js" />"></script>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/jquery/i18n/validate.messages.%{getText('js.lang')}.js" />"></script>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/default.js" />"></script>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/json.js"/>"></script>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/selectOperation.js"/>"></script>
<script charset="UTF-8" language="javascript" type="text/javascript" src="<s:url value="/js/jquery/jquery.easyui.min.js"/>"></script>
<link type="text/css" rel="stylesheet" href="<s:url value="/css/default.css"/>"/>
<!--<link type="text/css" rel="stylesheet" href="<s:url value="/css/theme.css"/>"/>-->
<link rel="stylesheet" type="text/css" href="<s:url value="/css/skin.css"/>"/>
<link rel="stylesheet" type="text/css" href="<s:url value="/css/jquery/flexigrid.css"/>"/>
<link type="text/css" rel="stylesheet" href="<s:url value="/css/jquery/base/jquery.ui.all.css"/>"/>
<link type="text/css" rel="stylesheet" href="<s:url value="/css/jquery/base/jquery.ui.core.css"/>"/>
<link type="text/css" rel="stylesheet" href="<s:url value="/css/jquery/base/jquery.ui.datepicker.css"/>"/>
<link type="text/css" rel="stylesheet" href="<s:url value="/css/easyui.css"/>"/>
<link type="text/css" rel="stylesheet" href="<s:url value="/css/icon.css"/>"/>
<script charset="UTF-8" language="javascript" type="text/javascript" src="jquery-easyui-1.2.3/locale/easyui-lang-zh_CN.js"></script>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<%if("true".equals(request.getParameter("forHistory"))){%>
<script type="text/javascript">
	$(function() {
		$("input,button,select,textarea").attr("disabled", true); 
	});
</script>
<%}%>