<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/web-graph" prefix="graph"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ page import="java.util.*"%>

<%String year = (String) request.getAttribute("YEAR");
			List list = (List) request.getAttribute("personbymonth");
			Map map = null;
			List retList = new ArrayList();
			for (int i = 0; i < list.size(); i++) {
				Map tmpmap = (Map) list.get(i);
				map = new HashMap();
				map.put("seriesTitle", "创建");
				map.put("itemTitle", tmpmap.get("MONTH"));
				map.put("itemValue", tmpmap.get("CREATE_COUNT"));
				map.put("lineTitle", "月份");
				map.put("endLine", tmpmap.get("MONTH"));
				map.put("grpType", "curve");
				retList.add(map);

				map = new HashMap();
				map.put("seriesTitle", "完成");
				map.put("itemTitle", tmpmap.get("MONTH"));
				map.put("itemValue", tmpmap.get("FINISH_COUNT"));
				map.put("lineTitle", "月份");
				map.put("endLine", tmpmap.get("MONTH"));
				map.put("grpType", "curve");
				retList.add(map);

				map = new HashMap();
				map.put("seriesTitle", "创建未完成");
				map.put("itemTitle", tmpmap.get("MONTH"));
				map.put("itemValue", tmpmap.get("CREATE_AND_NOT_FINISH_COUNT"));
				map.put("lineTitle", "月份");
				map.put("endLine", tmpmap.get("MONTH"));
				map.put("grpType", "curve");
				retList.add(map);

				map = new HashMap();
				map.put("seriesTitle", "创建并完成");
				map.put("itemTitle", tmpmap.get("MONTH"));
				map.put("itemValue", tmpmap.get("CREATE_AND_FINISH_COUNT"));
				map.put("lineTitle", "月份");
				map.put("endLine", tmpmap.get("MONTH"));
				map.put("grpType", "curve");
				retList.add(map);
			}
			request.setAttribute("personbymonth", retList);

			if (year == null) {
				year = "";
			}
			String organId=(String)request.getAttribute("organId");
			String organName=(String)request.getAttribute("organName");
			String struid=(String)request.getAttribute("struid");
			String title=organName+"的流量分析";
			%>

<HTML>
<HEAD>
<TITLE>工作流程－统计分析－流程月业务流量统计</TITLE>
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='skin.css'/>">
<script language="javascript"
	src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<div class="btnareaCss" align="right"><html:button name="返回" value="返回"
	onclick="forReturn()"></html:button></div>
<br>
<html:form name="frmList" action="">
	<fieldset class="FieldsetCss"><legend>查询条件</legend>
	<table id="tblSearch">

		<tr>
			<td nowrap>年份:
			<BUTTON onclick="doPro()" style="width:20px"><<</BUTTON>
			<%=year%>
			<BUTTON onclick="doNext()" style="width:20px">>></BUTTON>
			<input type="hidden" name="dateMove" value=""> <input type=hidden
				name=year value="<%=year%>" size="4" maxlength="4">
				<input type="hidden" name="organId" value="<%=organId%>">
				<input type="hidden" name="organName" value="<%=organName%>">
			<input type="hidden" name="struid" value="<%=struid%>"></td>
			</tr>
	</table>
	</fieldset>
	<div align=center><graph:chart title="<%=title%>" type="column3d"
		width="100%" height="100%" displayTitle="true" defaultRow="1"
		newLine="true" newLine="true" graphTitle="value" markPosition="top"
		xxName="月份" yyName="数量" markXy="true">
		<graph:data seriesTitle="seriesTitle" grpType="grpType"
			collection="personbymonth" itemTitle="itemTitle"
			itemValue="itemValue" lineTitle="lineTitle" endLine="endLine">
		</graph:data>
	</graph:chart></div>
</html:form>
</BODY>
</HTML>
<script language="javascript">

function doPro(){
   document.all("dateMove").value="pro" ;
 document.forms[0].action="wfpersonanlyze.cmd?method=PersonAnalyzeByMonth";
   document.forms[0].submit();
}
function doNext(){
	document.all("dateMove").value="next";
document.forms[0].action="wfpersonanlyze.cmd?method=PersonAnalyzeByMonth";
   document.forms[0].submit();
}
function forReturn(){
window.location.href="wfpersonanlyze.cmd?method=PersonSelectPro";
}
var id=setTimeout("showChart('column3d')",1000);
</script>
