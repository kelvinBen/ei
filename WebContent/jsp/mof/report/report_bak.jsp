<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>

<HTML>
<HEAD>
<TITLE>报表查询条件页面已生成</TITLE>

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="部门销售月报查询" >
	<div align="center">
	<table width="80%" height="100%" cellpadding="0" class="tblContent" style="border:1px solid #000000">
	<tr>
		<td class="tdTitle" style="text-align:center" colspan="4"><h3><b>部门销售月报查询</b></h3></td>
	</tr>
	<tr>
		<td class="tdTitle" width="10%">部门名称：</td>
		<td class="tdRight"  align="left" colspan="3"><html:text name="name" value="sfsd" size="40" maxlength="40" /></td>
	</tr>
	<tr>
		<td class="tdTitle" width="10%">开始日期：</td>
		<td class="tdRight"  align="left" colspan="1"><date:date name="startDate" divname="startDate_div" value="" zindex="4" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"  readonly="true" /><input style="visibility:hidden"/></td>
		
		<td class="tdTitle" width="10%">结束日期：</td>
		<td class="tdRight"  align="left" colspan="1"><date:date name="endDate" divname="endDate_div" value="" zindex="4" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"  readonly="true" /><input style="visibility:hidden"/></td>
	</tr>
	
	<tr>
		<td class="tdRight" width="10%" colspan="4" align="center">
			<html:button name="submit" value="  确  定  " onclick="queryReport()"/>&nbsp;&nbsp; <html:button name="reset" value="  取  消  " />
		</td>
	</tr>
	</table>

</div>

</widgets:container>
</html:form>
</BODY>
<script language="javascript">
	function queryReport(){
		alert("开始查询报表");
		document.forms[0].action="";
		document.forms[0].submit();
	}
</script>
</HTML>