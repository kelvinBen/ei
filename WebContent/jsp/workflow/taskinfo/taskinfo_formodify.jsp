<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ page import="java.util.*"%>	
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%
String html=(String)request.getAttribute("formHtml");

String tag="false";
if(html.indexOf("showReadText(this)")>0) 
    tag="true";
%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src='<%=SkinUtils.getJS(request, "tab.js")%>'></script>

<link rel="stylesheet" type="text/css" href="jsp/workflow/resource/formeditor/grid.css">
<script language="javascript" src="jsp/workflow/resource/js/formverify/extendString.js"></script>
<script language="javascript" src="jsp/workflow/resource/js/formverify/formVerify.js"></script>
<script language="javascript" src="jsp/workflow/resource/js/formverify/runFormVerify.js"></script>
<script language="javascript" src="jsp/workflow/resource/js/wfoption.js"></script>
<!--���⴦���򷽷�-->
<script language="javascript" src="jsp/workflow/resource/js/specialField.js"></script>
<SCRIPT language="JavaScript" src="jsp/workflow/resource/js/object.js"></SCRIPT>
<!-- ��չ������༭���� -->
<SCRIPT language="Javascript" src="jsp/workflow/resource/js/specialEditExtend.js"></SCRIPT>
<!--���Ĵ���-->
<SCRIPT language="JavaScript" src="jsp/workflow/resource/js/office.js"></SCRIPT>
<!--���Ĵ���-->
<!--<SCRIPT language="JavaScript" src="jsp/workflow/resource/formeditor_traditional/DefFormFunction.js"></SCRIPT>-->

<!--�¼�����  ò��û��-->
<SCRIPT language="JavaScript" src="jsp/workflow/resource/js/event.js"></SCRIPT>

<!-- �������Ĵ��� -->



<script language="vbscript">
function CountSumInVbs(ss)
CountSumInVbs=""&eval(ss)&""
end function
</script>
<%
	String formversion = (String)request.getAttribute("formversion");
    if(!"workform_version_3.2.1".equals(formversion)){
%>
<SCRIPT language="JavaScript" src="jsp/workflow/resource/formeditor_traditional/DefFormFunction.js"></SCRIPT>
<% }else{%>
<SCRIPT language="JavaScript" src="jsp/workflow/resource/formeditor/DefFormFunction.js"></SCRIPT>
	<%}%>	
<!-- �����Ĵ��� -->
<script language="javascript" src="jsp/workflow/resource/js/adjunct.js"></script>
</HEAD>
<style>
table
{
border-collapse:collapse;
}
td
{
border:1 solid #dddddd;
}
</style>
<script language="javascript">

<%
			String extEdocType=request.getParameter("EXT_EDOC_TYPE");
            if(extEdocType==null)extEdocType="";
            String extReturnUrl=request.getParameter("EXT_RETURN_URL");
            if(extReturnUrl==null)extReturnUrl="commonsingleparms.cmd?method=getportal";
            
            String bspUserId =
			GetBspInfo.getBspInfo().getEmployee().getOrgan().getOrganId();
			String bspUserName =
			GetBspInfo.getBspInfo().getEmployee().getOrgan().getOrganName();
			
%>

function setExtendsFieldsHtml(){
	document.getElementById("EXTENDS_FIELDS_HTML").innerHTML="";
	//�����������ݳ�ʼ����ֻ��Ҫ���½������ʱ����һ�¾Ϳ��ԡ�
	var dataId=document.all("Ins_DATAID").value;
	if(dataId==""){
		document.all("Ins_EXT_EDOC_TYPE").value="<%=extEdocType%>";	
	}
	document.all("EXT_RETURN_URL").value="<%=extReturnUrl%>";	

}
function updateActivityUser(){
//��Ϊ���˸�","�ţ���Ҫȥ��
var activityUser=document.all("activityUser").value.trim();
if(activityUser.length>0){
activityUser=activityUser.substring(0,activityUser.length-1);
document.all("activityUser").value=activityUser;
};
}
function showMemberBBS(){
	
	var processId=document.forms[0].processId.value;
	if(processId=="" || processId==null){
		alert("���ȱ������");
		return;
	}else{
		
		var url = 'actionexchange.cmd?method=forinsert&actionId='+processId;
		var mbbsframe = document.getElementById("memberbbsFrame");
		mbbsframe.src = url;
		//��������ѽ�������������д����
		if(document.all("curProcessState").value=="closed.completed"){
			var doc = mbbsframe.document;
			doc.onreadystatechange=function(){
				if(doc.readyState=="complete"){
					var fs = memberbbsFrame.document.getElementById("fs1");			
					if(fs!=null){
						fs.style.display="none";
					}
				}
			}
		}
	}
}
function showProcStatus(){
	var curFlowId=document.all("curFlowId").value;
	var processId=document.all("processId").value;
	var curFormId=document.all("curFormId").value;
  	var url="taskinfo.cmd?method=displaystatus&processId="+ processId+ "&curFormId=" +curFormId+"&curFlowId="+curFlowId;
	var procStatusFrame = document.getElementById("procStatusFrame");
	procStatusFrame.src = url;
	
}
function showAdjunct(){
		var dataId=document.all("Ins_DATAID").value;
	<%
		String isEdit="0";
		if(html.indexOf("adjunctManage('1')")>0){
			isEdit="1";
		}else if(html.indexOf("adjunctManage('0')")>0){
			isEdit="0";
		}
		%>
		var editSign="<%=isEdit%>";
		if(dataId=="" || dataId==null)
			editSign="0";
	var url = 'adjunctquery.cmd?isEdit='+editSign+'&dataId='+dataId;
	var adjunctFrame = document.getElementById("adjunctFrame");
	adjunctFrame.src = url;
}
function returnUrl(){
window.location.href=document.all("EXT_RETURN_URL").value;
}
</script>
<BODY>
<table width="100%" border="0" cellspacing="0" cellpadding="0">

<tr>
	<td>
	<div id="mainfrmDiv">
	<html:form name="frmList" action="" enctype="multipart/form-data">
	<tab:tab id="tab11" type="table">

<tab:card id="card_forminfo" text='��' selected="1">
<div style="background-color:#ffffff;height:100%;width:100%;">
		<input type="hidden" name="bspUserId" value="<%=bspUserId%>">
		<input type="hidden" name="bspUserName" value="<%=bspUserName%>">
		<input type="hidden" name="tag" value="">
		<p align="center">
		<%out.println(html); //���������...%>

	<%if(isEdit.equals("1")){ %>
	<p align = "center">
	<html:button name="addAdjunctRows" onclick="addAdjunctRow();">������</html:button>
	<html:button name="delAdjunctRows" onclick="deleteAdjunctRow();">ɾ����</html:button>
		<TABLE  border=1 width="80%" style="border-collapse:collapse;border:1 solid;" cellspacing=0 id="adjucntTab">
			<TR class="divToucss">
				<TD width=50><span>ѡ��</span></TD><TD><span>����</span></TD>
			</TR>
			<TR>
			</TR>
		</TABLE>
	<%} %>
	<%	
		if(html.indexOf("adjunctManage('1')")>0 || html.indexOf("adjunctManage('0')")>0){
	%>
		<p align="center">
		<a name="adjunct"></a>
			<iframe style="display: block" id="adjunctFrame" width="100%" height="450" frameborder="0"></iframe>
				<script language="javascript">
					showAdjunct();
				</script>
	<%}%>
  </div>
</tab:card>

<%
if(html.indexOf("showText(this)")>0||html.indexOf("showReadText(this)")>0){
%>
<tab:card id="card_text" text='����'>
<p align="center">
<!--���Ŀؼ�-->
	<table width="100%" cellpadding="0" cellspacing="0" border='0'>
		<tr>
			<td align="right">
			<div id="textMenu"></div>
			</td>
		</tr>
		
		<tr>
			<td  align="center">
				<object id='webOfficeNt' classid='clsid:C9BC4DFF-4248-4a3c-8A49-63A7D317F404' codebase='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/OfficeControl.cab#Version=3,0,1,0"%>' width='100%' height='500'>
					<param name="BorderStyle" value="1">
					<param name="BorderColor" value="14402205">
					<param name="MakerCaption" value="">
					<param name="MakerKey" value="F763D91E30EC2FE0D97589012330DA259BC79EC6">
					<param name="ProductCaption" value="        ">
			        <param name="ProductKey" value="1814A6D27F1C7504D5763201865365D85B9D5DE9">
			        <SPAN STYLE="color:red">����װ���ĵ��ؼ������ڼ���������ѡ���м��������İ�ȫ���á�</SPAN>
			    </object>			
 
					<SCRIPT language=JScript for=TANGER_OCX event=OnDocumentOpened(str,obj)>
						OnDocumentOpenedNtko(str, obj);
					</SCRIPT>
			</td>
		</tr>
	</table>
</tab:card>
<%}%>

</tab:tab>	
			
<OBJECT id="data" CLASSID="CLSID:4AB7F4E4-D1AA-4646-8227-A5FA83F5BB8F" CODEBASE='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/data.ocx#version=1,1,12,18"%>' VIEWASTEXT></OBJECT>

<iframe id="up" src='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/printtemplet/uploadFile.jsp"%>' width="0" height="0"></iframe>
<iframe name="ContentBakFrm" width="0" height="0" style="display:none"></iframe>

		</html:form>
		</div>	
    </td>
</tr>
</table>

<iframe name="saveFormFrame" width="0" height="0" style="display:none"></iframe>
</BODY>
</HTML>

<script language="javascript">
initMainForm();
document.all("tag").value="<%=tag%>";
var tag =document.all("tag").value;
setExtendsFieldsHtml();
updateActivityUser();
 
tab11.beforeCardHidden=function(card){ 
	if(card.id=="card_text"){
   		if(!isSavedNtko())
   		{
   	  saveDocFile();
   	}
}
}
tab11.doCardClick=function(card){ 
	if(card.id=="card_text"){
   	openFileNtKo();
   	}
    if(card.id=="card_proc_status"){
   		showProcStatus();
   	}}
</script>


