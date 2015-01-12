<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<HTML>
<HEAD>
<TITLE>通用流程</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="jsp/workflow/resource/formeditor/grid.css">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src='<%=SkinUtils.getJS(request, "tab.js")%>'></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="jsp/workflow/resource/js/formverify/extendString.js"></script>
<script language="javascript" src="jsp/workflow/resource/js/formverify/formVerify.js"></script>
<script language="javascript" src="jsp/workflow/resource/js/formverify/runFormVerify.js"></script>
<script language="javascript" src="jsp/workflow/resource/js/wfoption.js"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<!--特殊处理域方法-->
<script language="javascript" src="jsp/workflow/resource/js/specialField.js"></script>
<SCRIPT language="JavaScript" src="jsp/workflow/resource/js/object.js"></SCRIPT>
<!--正文处理-->
<SCRIPT language="JavaScript" src="jsp/workflow/resource/js/office.js"></SCRIPT>
<!--表单的处理-->
<SCRIPT language="JavaScript" src="jsp/workflow/resource/formeditor/DefFormFunction.js"></SCRIPT>
<script language="javascript">
function showAdjunct(){
	var dataId=document.all("Ins_DATAID").value;
	var editSign="0";
	var url = 'adjunctquery.cmd?isEdit='+editSign+'&dataId='+dataId;
	var adjunctFrame = document.getElementById("adjunctFrame");
	adjunctFrame.src = url;
}
</script>
<%
	String formHtmlStr=(String)request.getAttribute("formHtmlStr");
	if(formHtmlStr==null) formHtmlStr="";
	
	String withOpn=(String)request.getParameter("withOpn");
	if(withOpn==null) withOpn="3";
	
	String hasText=(String)request.getAttribute("hasText");
	if(hasText==null) hasText="false";
	
	String hasAdjunct=(String)request.getAttribute("hasAdjunct");
	if(hasAdjunct==null) hasText="false";
	hasText="true";
	hasAdjunct="true";
%>
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
<BODY topmargin="10px" onload="init();">
<div class="btnareaCss" >
<html:button name="btn_forsave" value="保存意见" onclick="forSave()" ></html:button>
<html:button name="btn_forFW" value="转发" onclick="forForward()" ></html:button>
<html:button name="btn_forReturn" value="返回" onclick="forReturn()" ></html:button>
</div>
<html:messages></html:messages>

<tab:tab id="tab1" type="table">

<tab:card id="card_forminfo" text='表单' >
<%=formHtmlStr %>
</tab:card>
<%if("true".equals(hasText)){%>
<tab:card id="card_text" text='正文'>
<br>
<table width="100%" cellpadding="0" cellspacing="0" border=0> 
<tr>
	<td align="right">
	<div style="display:none"><div id="textMenu" ></div></div>
	</td>
</tr>
<tr>
	<td  align="center">
		<object id='TANGER_OCX' classid='clsid:C9BC4DFF-4248-4a3c-8A49-63A7D317F404' codebase='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/OfficeControl.cab#Version=3,0,1,0"%>' width='100%' height='500'>
			<param name="BorderStyle" value="1">
			<param name="BorderColor" value="14402205">
			<param name="MakerCaption" value="">
			<param name="MakerKey" value="F763D91E30EC2FE0D97589012330DA259BC79EC6">
			<param name="ProductCaption" value="        ">
	        <param name="ProductKey" value="1814A6D27F1C7504D5763201865365D85B9D5DE9">
	        <SPAN STYLE="color:red">不能装载文档控件，请在检查浏览器的选项中检查浏览器的安全设置。</SPAN>
	    </object>
	   <!--  
		<object  id="webOfficeNt" classid="clsid:C9BC4DFF-4248-4a3c-8A49-63A7D317F404" codebase='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/OfficeControl.cab#Version=3,0,1,0"%>' style="display:none">
			<param name="BorderStyle" value="1">
			<param name="TitlebarColor" value="42768">
			<param name="TitlebarTextColor" value="0">	 
			<param name="Caption" value="正文内容">
			<param name="MakerCaption" value="">
			<param name="MakerKey" value="F763D91E30EC2FE0D97589012330DA259BC79EC6">
			<param name="ProductCaption" value="        ">
            <param name="ProductKey" value="1814A6D27F1C7504D5763201865365D85B9D5DE9">
		</object>
		-->
		<SCRIPT language=JScript for=TANGER_OCX event=OnDocumentOpened(str,obj)>
			OnDocumentOpenedNtko(str, obj);
		</SCRIPT>
	</td>
</tr>
</table>
</tab:card>
<%}%>
<%if("true".equals(hasAdjunct)){%>
<tab:card id="card_adjunct" text='附件' selected="1">
	<br>
	<iframe style="display: block" id="adjunctFrame" width="100%" height="450" frameborder="0"></iframe>
	<script language="javascript">
	showAdjunct();
	</script>
</tab:card>
<%}%>

<tab:card id="card_opinion" text='意见'>
<br>
<html:form  name="frmOpn"  action="">
<div align="center">
<table width="100%" cellpadding="0" class="tblContent">  
<tr>
<td class="tdTitle" width="100%"><%=ResourcesFactory.getString("WF_UNIPROCESS.OPINION")%>：
&nbsp;&nbsp;转发时
<html:select name="withOpn" value="<%=withOpn%>">
<html:option value="3" >附带历史意见和个人意见</html:option>
<html:option value="2" >只附带个人意见</html:option>
<html:option value="1" >只附带历史意见</html:option>
<html:option value="0" >不附带任何意见</html:option>
</html:select>
</td>
</tr>
<tr>
<td class="tdRight">
<html:textarea name="opinion" property="opinion" rows="10" cols="70" ></html:textarea>
</td>
<tr>
<td class="tdTitle" width="100"><%=ResourcesFactory.getString("WF_UNIPROCESS.OLDOPINION")%>：</td>
</tr>
<tr>
<td class="tdRight">
<html:textarea name="oldopinion" property="oldopinion" rows="10" cols="70" readonly="true" ></html:textarea>
</td>
</tr>                    
</table>
<html:hidden name="id" property="id"/>
<html:hidden name="processid" property="processid"  />
<html:hidden name="processname" property="processname"  />
<html:hidden name="subject" property="subject"  />
<html:hidden name="formid" property="formid"  />
<html:hidden name="dataid" property="dataid"  />
<html:hidden name="userid" property="userid"  />
<html:hidden name="username" property="username"  />
<html:hidden name="olduserid" property="olduserid"  />
<html:hidden name="oldusername" property="oldusername"  />
<html:hidden name="fwdate" property="fwdate"  />
<html:hidden name="status" property="status"  />

<html:hidden name="newUserIds" value=""  />
<html:hidden name="newUserNames" value=""  />
</div>
</html:form>
</tab:card>
</tab:tab>
<OBJECT id="data" CLASSID="CLSID:4AB7F4E4-D1AA-4646-8227-A5FA83F5BB8F" CODEBASE='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/data.ocx#version=1,1,12,18"%>' VIEWASTEXT></OBJECT>
<!-- <OBJECT id="signData" CLASSID="CLSID:0631B94A-EC26-11D2-95EC-0060082AA655" CODEBASE='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/CICCInkocx.CAB#version=3,5,0,4"%>' width='0' height='0' VIEWASTEXT></OBJECT>
 -->
</BODY>
</HTML>
<script language="javascript">
initMainForm();
tab1.doCardClick=function(card){ 
	if(card.id=="card_text"){
		if(isSavedNtko())
	   		openFileNtKo();
   	}
}

function init(){
	tab1.doCardShow("card_forminfo");
}
function checkWfUniprocess(){
 	var opinion = document.frmOpn.opinion;//all("opinion");
	if (trim(opinion.value)=="")
	{
	  alert("请输入个人意见！");    
	  return false;
	}
    opinion.value = trim(opinion.value) ;
 	return true
}
function forSave(){
  if(!checkWfUniprocess()) return;	
  document.frmOpn.action ="wfuniprocess.cmd?method=save";
  document.frmOpn.submit();	
}
function forForward(){
	if(!checkWfUniprocess()) return;
	var url ="struhelp.cmd?method=getSelectRoot&isTree=1&isCheckBox=1&isIncludeSelf=0&organType=8&rootId=1&clearButtonVisible=false&mustSelect=true";    
 	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
 	//取消
 	if (win==null) return;

 	//确定 organId#organName,organId#organName
 	var organIdNames=win[4];
 	var ids="";
 	var names="";
 	var idNamesArr=organIdNames.split(",");
 	for(var i=0;i<idNamesArr.length;i++){
 		if(ids==""){
 			ids=idNamesArr[i].split("#")[0];
 			names=idNamesArr[i].split("#")[1];
 		}else{
 			ids+=","+idNamesArr[i].split("#")[0];
 			names+=","+idNamesArr[i].split("#")[1];
 		}
 	}
 	document.frmOpn.newUserIds.value=ids;
 	document.frmOpn.newUserNames.value=names;
 	document.frmOpn.action="wfuniprocess.cmd?method=forward";
 	document.frmOpn.submit();
}
function forReturn(){
  document.frmOpn.action ="wfuniprocessquery_page_init.cmd";
  document.frmOpn.submit();	
}

</script>