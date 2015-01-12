<%@ page contentType="text/html;charset=GBK"%>
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
String organId=(String)request.getAttribute("organId");
String organName=(String)request.getAttribute("organName");
String struid=(String)request.getAttribute("struid");
request.setAttribute(
                Global.getString("flexgrid.unique"),
                "wfpersonanlyze.cmd?method=PersonAnalyze");
%>
<HTML>
<HEAD>
<TITLE>�������̣�ͳ�Ʒ�����������ҵ������ͳ��</TITLE>
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>

<div class="btnareaCss" align="right"><html:button name="����" value="����"
	onclick="forReturn()"></html:button></div>
<html:form name="frmList"
	action="wfportfolio.cmd?method=processPortfolioByMonth">
	<html:messages />
	<fieldset class="FieldsetCss"><legend>��ѯ����</legend> <flex:search>
		<table id="tblSearch">

			<tr>
				<td nowrap>�·�
				<BUTTON onclick="doPro()" style="width:20px"><<</BUTTON>
				<%=month%>
				<BUTTON onclick="doNext()" style="width:20px">>></BUTTON>
				<input type="hidden" name="dateMove" value=""> <input type=hidden
					name=month value="<%=month%>" size="7" maxlength="7">
					<input type="hidden" name="organId" value="<%=organId%>">
				<input type="hidden" name="organName" value="<%=organName%>">
			<input type="hidden" name="struid" value="<%=struid%>"></td>
			</tr>
		</table>
	</flex:search></fieldset>
	<%out.println(organName+"������ͳ��");
     %>
	<flex:flexgrid name="grid" height="340" action="" isSubmit="false"
		export="true" directExport="true">
		<flex:flexCol caption='����' width="50" property="DATE"
			sortName="MONTH.DATE"></flex:flexCol>
		<flex:flexCol caption='����' width="100" property="CREATE_COUNT"
			sortName="MONTH.CREATE_COUNT"></flex:flexCol>
		<flex:flexCol caption='���' width="100" property="FINISH_COUNT"
			sortName="MONTH.FINISH_COUNT"></flex:flexCol>
		<flex:flexCol caption='����δ���' width="100"
			property="CREATE_AND_NOT_FINISH_COUNT"
			sortName="MONTH.CREATE_AND_NOT_FINISH_COUNT"></flex:flexCol>
		<flex:flexCol caption='���������' width="100"
			property="CREATE_AND_FINISH_COUNT"
			sortName="MONTH.CREATE_AND_FINISH_COUNT"></flex:flexCol>
	</flex:flexgrid>
	<flex:pagePolit action="wfportfolio.cmd?method=processPortfolioByMonth">
	</flex:pagePolit>
</html:form>
</body>
</html>
<script language="javascript">
function init(){
setTitleInTreeBar('�������̣�ͳ�Ʒ�����������ҵ������ͳ��');
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
}

function doPro(){
   document.all("dateMove").value="pro" ;
    document.forms[0].action="wfpersonanlyze.cmd?method=PersonAnalyzeByDay";
   document.forms[0].submit();
}
function doNext(){
	document.all("dateMove").value="next";
   document.forms[0].action="wfpersonanlyze.cmd?method=PersonAnalyzeByDay";
   document.forms[0].submit();
}
function forReturn(){
  window.location.href="wfpersonanlyze.cmd?method=PersonSelectPro";
}

</script>