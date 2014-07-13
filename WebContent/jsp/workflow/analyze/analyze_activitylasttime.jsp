<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-graph" prefix="graph" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ page import="java.util.*" %>
<%
List list=(List)request.getAttribute("lastTimeData");
for(int i=0;i<list.size();i++){
	Map map = (Map)list.get(i);
	map.put("itemTitle","");
}
String unitName=(String)request.getAttribute("unitName");

String yyName="持续时间【"+unitName+"】";

	String process_creator = request.getParameter("process_creator");
	if(process_creator == null ){
		process_creator = "";
	}
	String process_creator_name = request.getParameter("process_creator_name");
	if(process_creator_name == null ){
		process_creator_name = "";
	}
	String process_startTime = request.getParameter("process_startTime");
	if(process_startTime == null ){
		process_startTime = "";
	}
	String process_endTime = request.getParameter("process_endTime");
	if(process_endTime == null ){
		process_endTime = "";
	}
	String process_startTime_end = request.getParameter("process_startTime_end");
	if(process_startTime_end == null ){
		process_startTime_end = "";
	}
	String process_endTime_end = request.getParameter("process_endTime_end");
	if(process_endTime_end == null ){
		process_endTime_end = "";
	}
	String wfmgrname = request.getParameter("wfmgrname");
	if(wfmgrname == null ){
		wfmgrname = "";
	}
	
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
<div class="btnareaCss" align="right">

<html:button name="返回" value="返回" onclick="forReturn()"></html:button>
</div>
<br>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">

	
        <tr>
    	<td nowrap>发起时间:
			<date:date name="process_startTime"  divname="beginDatedd" value="<%=process_startTime%>"   readonly="true">
			</date:date><input style="visibility:hidden"> - <date:date name="process_endTime"   divname="endDatedd" value="<%=process_endTime%>"   readonly="true">
			</date:date><input style="visibility:hidden">
		</td>
    		
    <td nowrap>发起人:<img src="skins/default/images/liulan.gif" onclick="selectCreator()" style="cursor:hand;" border="0"><html:hidden name="process_creator" value="<%=process_creator%>" write="false"/>
			<html:hidden name="process_creator_name" value="<%=process_creator_name%>" write="false"/>
            <span id="process_creator_dis" ><%=process_creator_name%></span>
        </td>
       </tr>
       <tr>
       <td nowrap>完成时间:
			<date:date name="process_startTime_end"  divname="beginDatedd_end" value="<%=process_startTime_end%>"   readonly="true">
			</date:date><input style="visibility:hidden"> - <date:date name="process_endTime_end"   divname="endDatedd_end" value="<%=process_endTime_end%>"   readonly="true">
			</date:date><input style="visibility:hidden">
		</td>	
    <td nowrap><input type="hidden" name="wfmgrname" value="<%=wfmgrname%>">
    <input name="chaxun" type="image" src="skins/default/images/search.gif" onClick="javascript:this.form.action='wflasttime.cmd?method=activityLastTime';" style="cursor: hand;">
    </td>
	</tr>

</table>
</fieldset>
<div align=center>
<graph:chart title="环节平均持续时间" type="column3d" width="100%" height="100%"  displayTitle="true" defaultRow="1" newLine="true" newLine="true" graphTitle="value" markPosition="top" xxName="环节名称" yyName="<%=yyName%>" markXy="true">
<graph:data seriesTitle="ACT_DEF_NAME"  collection="lastTimeData" itemTitle="itemTitle" itemValue="AVG_LAST_TIME">
</graph:data>
</graph:chart>	
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forReturn(){
window.location.href="processmgradminquery.cmd?clear=true";
}
function selectCreator(){
	var url ="jsp/help.jsp?url=stru.cmd&method=getEmpRoot";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:580px;dialogHeight:530px");
	if(win==null)return;
	var ret = parseTree(win);
	document.all('process_creator').value=ret[0];
	document.all('process_creator_name').value=ret[1];	
	document.getElementById("process_creator_dis").innerHTML=ret[1];
}
setTitleInTreeBar("工作流程－统计分析－环节平均持续时间");
var id=setTimeout("showChart('column3d')",1000);
</script>