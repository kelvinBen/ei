<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%
String month=(String)request.getAttribute("MONTH");
if(month==null)month="";
String procDefId=(String)request.getParameter("procDefId");
if(procDefId==null)procDefId="";
String procDefName=(String)request.getParameter("procDefName");
if(procDefName==null)procDefName="";
request.setAttribute(
                Global.getString("flexgrid.unique"),
                "wflasttime.cmd?method=processLastTimeByMonth");
%>
<HTML>
<HEAD>
<TITLE>�������̣�ͳ�Ʒ����������ճ���ʱ��ͳ��</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<!--
<div class="btnareaCss" align="right">
<html:button name="����" value="����" onclick="forReturn()"></html:button>		
</div>
-->
<html:form name="frmList" action="wflasttime.cmd?method=processLastTimeByMonth">
<html:messages/>
<fieldset class="FieldsetCss"><legend>��ѯ����</legend>
<flex:search>
<table id="tblSearch">

	<tr>
	    <td nowrap>�·ݣ�
	    <BUTTON onclick="doPro()" style="width:20px"><<</BUTTON><%=month%>
		        <BUTTON onclick="doNext()" style="width:20px">>></BUTTON>
		        <input type="hidden" name="dateMove" value="">
		        <input type=hidden name=month value="<%=month%>" size="7" maxlength="7">
	    </td>
	    <td nowrap>���̶��壺
	    
                    <input type="hidden" name="procDefId" value="<%=procDefId%>">
                    <input type="text" name="procDefName" value="<%=procDefName%>" size="15" readonly>
                    <img src="skins/default/images/liulan.gif" onclick="doimgclickworkflow()" style="cursor:hand;" border="0">
                    
	    </td>
	    <td><flex:searchImg name="chaxun" action="javascript:forSearch()" image="search.gif"/></td>
	   
	</tr>
</table>
</flex:search>

</fieldset>
<flex:flexgrid name="grid" height="340" action="" isSubmit="false"  export="true" directExport="true">
	<flex:flexCol caption='����' width="50" property="DATE" sortName="MONTH.DATE"></flex:flexCol>
	<flex:flexCol caption='����ʱ��' width="100" property="AVG_LAST_TIME" sortName="MONTH.AVG_LAST_TIME"></flex:flexCol>
	<flex:flexCol caption='����ʱ�䵥λ' width="100" property="UNIT_NAME" sortName="MONTH.UNIT_NAME"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="wflasttime.cmd?method=processLastTimeByMonth">
</flex:pagePolit>
</html:form>
<script language="javascript">
function init(){
setTitleInTreeBar('�������̣�ͳ�Ʒ����������ճ���ʱ��ͳ��');
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
}

function forSearch(){
	
	document.forms[0].action="wflasttime.cmd?method=processLastTimeByMonth";
	document.forms[0].submit();
}
/****ѡ������****/
function doimgclickworkflow(){
var url ="jsp/help.jsp?url=processhelpquery.cmd";
var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:580px;dialogHeight:450px");
if(win==null)return;
var ret = parseMatrix(win);
document.forms[0].procDefId.value=ret[0];
document.forms[0].procDefName.value=ret[1];
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

</script>