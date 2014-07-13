<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@page import="java.util.*"%>
<html>

<head>
<title>待接收任务</title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">

<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>

<script language="javascript">
	function myLoad(){
		setTitleInTreeBar("工作流程－任务管理－角色任务");
	}
	function dolistedocsOfType(){
		window.location.href="roletaskinfoquery.cmd?clear=true&processType="+seltree.getValue("NodeId");
	}
	function doLink(procDefId,processType){
		window.location.href="roletaskinfoquery.cmd?clear=true&procDefId="+procDefId+"&processType="+processType;
	}
	function listalledocs(){
		window.location.href="roletaskinfoquery.cmd?clear=true";
	}
</script>
</head>

<BODY  topmargin="0" leftmargin="0" onLoad="myLoad()" style="padding:0px;" marginheight="0" marginwidth="0"  text="#000000" >
 <form>
<div class="btnareaCss" style="display: none;">
<html:button onclick="listalledocs()" name="btnListAll" value="所有角色任务"></html:button>
</div>
<div><fieldset class="FieldsetCss"><legend>共有<%=request.getAttribute("TOTAL_NUMBER")%>个待接收任务</legend>

  <table width="100%"  borderColor=#3784c9 cellpadding="5" border=1 cellspacing="0" >  
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>	
<%
	Map typeList=(Map)request.getAttribute("typelist");
	Iterator it= typeList.keySet().iterator();
	while(it.hasNext()){
	String processType=(String)it.next();
	List processlist=(List) typeList.get(processType);
	Map mtype= (Map)request.getAttribute(processType);
	String typename=(String)mtype.get("processTypeName");
	int TYPE_COUNT=(Integer)mtype.get("TYPE_COUNT");
	%>
 <tr>
 <td colspan=2 bgcolor=#CCDBEE><b><img src="<%=SkinUtils.getImagePath(request)%>/dot-2.gif">&nbsp;<%=typename%>(<%=processType%>)</b></td> 
 <td bgcolor=#CCDBEE align="right">共有：<%=TYPE_COUNT %>件待接收</td>
 </tr>

	<%
	for(int j=0;j<processlist.size();j++){
		Map processMap =(Map)processlist.get(j);
		String procDefId=(String)processMap.get("PRO_DEFINITION_ID");
		String procDefName=(String)processMap.get("PROCESS_NAME");
		String TASK_COUNT=(String)processMap.get("TASK_COUNT");
		String formplugin =(String)processMap.get("formPlugin"); // 这个字段有什么作用??
		
    %>
		<tr>
		<td>&nbsp;</td>
		<td>
		 
			<a style="color: blue" href="javascript:doLink('<%=procDefId%>','<%=processType%>','<%=formplugin %>')"><%=procDefName%></a>
		 
		</td>
		<td align="left">共有：<%=TASK_COUNT%> 件待接收</td>
		</tr>
	<%}; %>
<%
	};
%>
</table>
</fieldset>
 </div>

</form>
</body>

</html>

