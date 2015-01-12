<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-graph" prefix="graph" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ page import="java.util.*" %>
<%
String year=(String)request.getAttribute("YEAR");
List list=(List)request.getAttribute("lastTimeData");
for(int i=0;i<list.size();i++){
	Map map = (Map)list.get(i);
	map.put("itemTitle","");
}
String unitName=(String)request.getAttribute("unitName");

String yyName="持续时间【"+unitName+"】";

	//String year = request.getParameter("year");
	if(year == null ){
		year = "";
	}
String procDefId=(String)request.getParameter("procDefId");
if(procDefId==null)procDefId="";
String procDefName=(String)request.getParameter("procDefName");
if(procDefName==null)procDefName="";

%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<!--
<div class="btnareaCss" align="right">

<html:button name="返回" value="返回" onclick="forReturn()"></html:button>
</div>
-->
<br>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">

	 <tr>
       <td nowrap>年份:<BUTTON onclick="doPro()" style="width:20px"><<</BUTTON><%=year%>
		        <BUTTON onclick="doNext()" style="width:20px">>></BUTTON>
		        <input type="hidden" name="dateMove" value="">
			<input type=hidden name=year value="<%=year%>" size="4" maxlength="4">
			
		</td>
		<td nowrap>流程定义：
	    
                    <input type="hidden" name="procDefId" value="<%=procDefId%>">
                    <input type="text" name="procDefName" value="<%=procDefName%>" size="15" readonly>
                    <img src="skins/default/images/liulan.gif" onclick="doimgclickworkflow()" style="cursor:hand;" border="0">
                    
	    </td>
		
    <td nowrap>
    <input name="chaxun" type="image" src="skins/default/images/search.gif" onClick="forSearch()" style="cursor: hand;">
    </td>
	</tr>
</table>
</fieldset>
<div align=center>
<graph:chart title="流程持续时间" type="column3d" width="100%" height="100%"  displayTitle="true" defaultRow="1" newLine="true" newLine="true" graphTitle="value" markPosition="top" xxName="季度" yyName="<%=yyName%>" markXy="true">
<graph:data seriesTitle="QUARTER"  collection="lastTimeData" itemTitle="itemTitle" itemValue="AVG_LAST_TIME">
</graph:data>
</graph:chart>	

</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSearch(){
		document.forms[0].action="wflasttime.cmd?method=processLastTimeByQuarter";
	    document.forms[0].submit();
	
}
function doPro(){
   document.all("dateMove").value="pro" ;
   forSearch();
}
function doNext(){
	document.all("dateMove").value="next";
    forSearch();
}
function forReturn(){
window.location.href="processquery.cmd?clear=true";
}
/****选择流程****/
function doimgclickworkflow(){
var url ="jsp/help.jsp?url=processhelpquery.cmd";
var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:580px;dialogHeight:450px");
if(win==null)return;
var ret = parseMatrix(win);
document.forms[0].procDefId.value=ret[0];
document.forms[0].procDefName.value=ret[1];
}

setTitleInTreeBar("工作流程－统计分析－流程持续时间");
var id=setTimeout("showChart('column3d')",1000);
</script>