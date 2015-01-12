<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/web-graph" prefix="graph"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%String year = (String) request.getAttribute("YEAR");
			List list = (List) request.getAttribute("portfolioData");
			Map map = null;
			List retList = new ArrayList();
			for (int i = 0; i < list.size(); i++) {
				Map tmpmap = (Map) list.get(i);
				map = new HashMap();
				map.put("seriesTitle", "����");
				map.put("itemTitle", tmpmap.get("QUARTER"));
				map.put("itemValue", tmpmap.get("CREATE_COUNT"));
				map.put("lineTitle", "����");
				map.put("endLine", tmpmap.get("QUARTER"));
				map.put("grpType", "curve");
				retList.add(map);

				map = new HashMap();
				map.put("seriesTitle", "���");
				map.put("itemTitle", tmpmap.get("QUARTER"));
				map.put("itemValue", tmpmap.get("FINISH_COUNT"));
				map.put("lineTitle", "����");
				map.put("endLine", tmpmap.get("QUARTER"));
				map.put("grpType", "curve");
				retList.add(map);

				map = new HashMap();
				map.put("seriesTitle", "����δ���");
				map.put("itemTitle", tmpmap.get("QUARTER"));
				map.put("itemValue", tmpmap.get("CREATE_AND_NOT_FINISH_COUNT"));
				map.put("lineTitle", "����");
				map.put("endLine", tmpmap.get("QUARTER"));
				map.put("grpType", "curve");
				retList.add(map);

				map = new HashMap();
				map.put("seriesTitle", "���������");
				map.put("itemTitle", tmpmap.get("QUARTER"));
				map.put("itemValue", tmpmap.get("CREATE_AND_FINISH_COUNT"));
				map.put("lineTitle", "����");
				map.put("endLine", tmpmap.get("QUARTER"));
				map.put("grpType", "curve");
				retList.add(map);
			}
			request.setAttribute("portfolioData", retList);

			if (year == null) {
				year = "";
			}
			String procDefId = (String) request.getParameter("procDefId");
			if (procDefId == null)
				procDefId = "";
			String procDefName = (String) request.getParameter("procDefName");
			if (procDefName == null)
				procDefName = "";
			String processtype = (String) request.getParameter("processtype");
			if (processtype == null)
				processtype = "";
			String processtypename = (String) request
					.getParameter("processtypename");
			if (processtypename == null)
				processtypename = "";
			String i = (String) request.getAttribute("title");
			String title;
			if ("1".equals(i)) {
				title = "���̡�" + procDefName + " ��������ͳ��";
			} else if ("2".equals(i)) {
				title = "�������͡�" + processtypename + "��������ͳ��";
			} else {
				title = "�������̵�����ͳ��";
			}
//			��Ա���߲���
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
<TITLE>�������̣�ͳ�Ʒ��������̼���ҵ������ͳ��</TITLE>
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
<!--
<div class="btnareaCss" align="right"><html:button name="����" value="����"
	onclick="forReturn()"></html:button></div>
<br>
-->
<html:form name="frmList" action="">
	<fieldset class="FieldsetCss"><legend>��ѯ����</legend>
	<table id="tblSearch">

		<tr>
			<td nowrap>���:
			<BUTTON onclick="doPro()" style="width:20px"><<</BUTTON>
			<%=year%>
			<BUTTON onclick="doNext()" style="width:20px">>></BUTTON>
			<input type="hidden" name="dateMove" value=""> <input type=hidden
				name=year value="<%=year%>" size="4" maxlength="4"></td>
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
	</fieldset>
	<div align=center><graph:chart title="<%=title%>" type="column3d"
		width="100%" height="100%" displayTitle="true" defaultRow="1"
		newLine="true" newLine="true" graphTitle="value" markPosition="top"
		xxName="����" yyName="����" markXy="true">
		<graph:data seriesTitle="seriesTitle" grpType="grpType"
			collection="portfolioData" itemTitle="itemTitle"
			itemValue="itemValue" lineTitle="lineTitle" endLine="endLine">
		</graph:data>
	</graph:chart></div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
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
		  document.forms[0].action="wfportfolio.cmd?method=processPortfolioByQuarter";
	      document.forms[0].submit();}
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
setTitleInTreeBar("�������̣�ͳ�Ʒ��������̼���ҵ������ͳ��");
var id=setTimeout("showChart('column3d')",100);

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
