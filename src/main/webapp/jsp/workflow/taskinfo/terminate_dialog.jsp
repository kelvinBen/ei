<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
function forReturn(){
	
	var result = new Array();
	
	var msgTypeArray=document.forms[0].msgType;
	var msgTypes="";
	for(var i=0;i<msgTypeArray.length;i++){
		if(msgTypeArray[i].checked==true)
		{
			if(i>0)msgTypes=msgTypes+",";
			msgTypes+=msgTypeArray[i].value;
		}
		
	}
	//��Ϣ���ѷ�ʽ���ַ�����ϸ�ʽ��typeid,typeid,......
	result[0]=msgTypes;
	//��Ϣ֪ͨ��
	result[1]=document.all("activityManager").value;
	//����ԭ��
	result[2]=document.forms[0].reason.value;
	if(byteLength(document.forms[0].reason.value)>350){
		alert("����ԭ�����ݳ��Ȳ��ܳ���350���ַ���");
		document.forms[0].reason.focus();
		return;
	}
	window.returnValue = result;
	window.close();
}
function selEmp(){
  var url ="struhelp.cmd?method=getCheckEmpRoot";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null)return;
   if(win.length==0){
  document.all("activityManager").value="";
  document.all("activityManagerDisName").value="";
  return;   
   }
  var x = eval("/"+MatrixCol+"/g;");
  document.all("activityManager").value=win[0].replace(x,",");
  document.all("activityManagerDisName").value=win[1].replace(x,",");
  document.getElementById("activityManagerDis").innerHTML=win[1].replace(x,",");
}
</script>
</HEAD>

<BODY topmargin="10px">

<html:form  name="frmList"  action="">
<input type="hidden" name="actDefId" value="">
<input type="hidden" name="actDisName" value="">
<div class="btnareaCss">
		<html:button name="ȷ��" value="ȷ��" onclick="forReturn()"></html:button>
		<html:button name="ȡ��" value="ȡ��" onclick="javascript:window.close();"></html:button>
</div>		
<div align="center">

<br><fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" class="tblContent">
		<tr>
		<td class="tdLeft">��Ϣ���ѷ�ʽ��</td>
		<td class="TdRight">
			<%
				List msgTypeList=(List)request.getAttribute("messageTypeList");
				for(int i=0;i<msgTypeList.size();i++){
					Map msgm=(Map)msgTypeList.get(i);
					String msgTypeId=(String)msgm.get("msgTypeId");
					String msgTypeName=(String)msgm.get("msgTypeName");
					%>
					<input type="checkbox" name="msgType" value="<%=msgTypeId%>"><%=msgTypeName%>&nbsp;&nbsp;
					<%
				}
			%>		
		</td>
		</tr>	
		<tr>
		<td class="tdLeft">��Ϣ֪ͨ�ˣ�</td>
		<td class="TdRight">
		<input type="hidden" name="activityManager" value=""><input type="hidden" name="activityManagerDisName" value=""><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selEmp()"><span id="activityManagerDis"></span>
		</td>
		</tr>	
		<tr>
		<td class="tdLeft">����ԭ��</td>
		<td class="TdRight"><textarea cols="40" rows="5" name="reason"></textarea>
		</td>
		</tr>
		</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>

