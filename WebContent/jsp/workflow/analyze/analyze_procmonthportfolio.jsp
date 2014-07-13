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
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%
String month=(String)request.getAttribute("MONTH");
if(month==null)month="";
String procDefId=(String)request.getParameter("procDefId");
if(procDefId==null)procDefId="";
String procDefName=(String)request.getParameter("procDefName");
if(procDefName==null)procDefName="";
request.setAttribute(
                Global.getString("flexgrid.unique"),
                "wfportfolio.cmd?method=processPortfolioByMonth");
//System.out.println(request.getAttribute("flexgrid.data"));
String processtype=(String)request.getParameter("processtype");
if(processtype==null)processtype="";
String processtypename=(String)request.getParameter("processtypename");
if(processtypename==null)processtypename="";
      String title = (String) request.getAttribute("title");
      String s="";
      if ("1".equals(title)) {
	    s="����\""+procDefName+"\"������ͳ��";
       } else if ("2".equals(title)) {
	     s="��������\""+processtypename+"\"������ͳ��";
       } else {
	    s="�������̵�����ͳ��";
       }
//    ��Ա���߲���
		String organId=request.getParameter("organId");
		if(organId==null)
			organId="";
		String organName=request.getParameter("organName");
		if(organName==null)
			organName="";
		String struid=request.getParameter("struid");
		if(struid==null)
			struid="";
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
<!--
<div class="btnareaCss" align="right"><html:button name="����" value="����"
	onclick="forReturn()"></html:button></div>
-->
<html:form name="frmList"
	action="wfportfolio.cmd?method=processPortfolioByMonth">
	<html:messages />
	<fieldset class="FieldsetCss"><legend><%=s%></legend> <flex:search>
		<table id="tblSearch">

			<tr>
				<td nowrap>�·�
				<BUTTON onclick="doPro()" style="width:20px"><<</BUTTON>
				<%=month%>
				<BUTTON onclick="doNext()" style="width:20px">>></BUTTON>
				<input type="hidden" name="dateMove" value=""> <input type=hidden
					name=month value="<%=month%>" size="7" maxlength="7"></td>
				<td>&nbsp;&nbsp;</td>
				<td>
				<table>
					<tr>
						<td><html:radio name="radio" value="1">�����̶���ͳ�ƣ�</html:radio></td>
						<td nowrap><input type="hidden" name="procDefId"
							value="<%=procDefId%>"> <input type="text" name="procDefName"
							value="<%=procDefName%>" size="15" readonly> <img
							src="skins/default/images/liulan.gif"
							onclick="doimgclickworkflow()" style="cursor:hand;" border="0"></td>
					</tr>
					<tr>
						<td><html:radio name="radio" value="2">����������ͳ�ƣ�</html:radio></td>
						<td nowrap><input type="hidden" name="processtype"
							value="<%=processtype%>"> <input type="text"
							name="processtypename" value="<%=processtypename%>" size="15"
							readonly> <img src="skins/default/images/liulan.gif"
							onclick="selectProcType()" style="cursor:hand;" border="0"></td>
					</tr>
				</table>
				</td>
				<td>&nbsp;</td>
				<td >��ѡ����֯������Ա����</td>
				<td >
					<input type="hidden" name="organId" value="<%=organId %>">
					<input type="hidden" name="struid" value="<%=struid %>">
					<input type="text" name="organName" value="<%=organName %>" size="20" readonly>
					<img src="skins/default/images/liulan.gif"onclick="selectorgan()" style="cursor:hand">
				</td>
				<td>&nbsp;</td>
				<td nowrap><input name="chaxun" type="image"
					src="skins/default/images/search.gif" onClick="forSearch()"
					style="cursor: hand;"></td>
			</tr>
		</table>
	</flex:search></fieldset>

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
<script language="javascript">
function init(){
setTitleInTreeBar('�������̣�ͳ�Ʒ�����������ҵ������ͳ��');
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
}

function forSearch(){
		  var collection;
		  collection=document.all("radio");
		 
		  if (collection[0].checked&&document.all("procDefName").value=="")
		  {alert("��ѡ��Ҫͳ�Ƶ�����");
		  return;
		  }
		  else if(collection[1].checked&&document.all("processtypename").value=="")
		  {alert("��ѡ��Ҫͳ�Ƶ���������");
		  return;
		  }
		  else{
		  document.forms[0].action="wfportfolio.cmd?method=processPortfolioByMonth";
	      document.forms[0].submit();}
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
function selectProcType(){
var url="jsp/help.jsp?url=processtypehelpquery.cmd";
var win=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:450px;status:no;scroll:no');
if(win==null)return;
 document.all("processtype").value=win[0];
 document.all("processtypename").value=win[1];
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

/**ѡ����Ա���߲���*/
function selectorgan(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2,8&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("organId").value="";
	  document.all("organName").value="";
	  document.all("struid").value="";
  }else{
	  document.all("organId").value=win[0];
	  document.all("organName").value=win[1];
	   document.all("struid").value=win[2];
  }
}


</script>