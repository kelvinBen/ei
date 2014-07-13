<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.bsp.util.DateUtil"%>

<%
    String currentDay = DateUtil.GetToday();
%>

<HTML>
<HEAD>
<TITLE>安全日志查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css_xp4.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>

<bsp:container title="批量删除日志" >
<bsp:containbutton onclick="doDelete()" text="执行" action="securityLog.cmd?method=delete"/>
<bsp:containbutton onclick="forReturn()" text="返回"></bsp:containbutton>
<html:form name="frmList" action="securityLog.cmd">
<table width="100%" cellspacing="0" class="tblContent">
<tr>
<td  class="tdTitle">
开始日期：
</td>
<td class="tdRight">
<date:date name="fromDay" divname="date1" value="<%=currentDay%>" zindex="12" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd" />
<FONT COLOR=#ff0000>*</FONT><input style="visibility:hidden">
</td>

</tr>
<tr>
<td  class="tdTitle">
结束日期：
</td>
<td class="tdRight">
<date:date name="toDay" divname="date2" value="<%=currentDay%>" zindex="11" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd" />
<FONT COLOR=#ff0000>*</FONT><input style="visibility:hidden">
</td>

</tr>
</table>
</html:form>
</bsp:container>
</body>
<script language="javascript">
function doDelete(){
	var time1=document.forms[0].fromDay;
	var time2=document.forms[0].toDay;
	
	if(time1.value==""){
	alert("开始日期不可以为空！");
	time1.focus();
	return false;
	}
	if(time2.value==""){
	alert("结束日期不可以为空！");
	time2.focus();
	return false;
	}
	
 	if(!checkDateFormat("yyyyMMdd",time1.value)){
  	alert("开始日期格式应该是'yyyyMMdd'的形式！");
  	document.all("fromDay").select();
    document.all("fromDay").focus();
    return false;
  }
  
  if(!checkDateFormat("yyyyMMdd",time2.value)){
  	alert("结束日期格式应该是'yyyyMMdd'的形式！");
  	document.all("toDay").select();
    document.all("toDay").focus();
    return false;
  }
	if(time1.value>time2.value){
	alert("开始日期不能比结束日期晚！");
	return false;
	}


  document.forms[0].action ="securityLog.cmd?method=delete";    
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="querySecurityLog.cmd";
  document.forms[0].submit();	
}


</script>
</html>
