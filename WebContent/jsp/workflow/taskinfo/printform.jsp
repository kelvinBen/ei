<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ page contentType="text/html;charset=GBK" %>
<%
String html=(String)request.getAttribute("formHtml");
			
%>
<HTML>

<HEAD>
<TITLE></TITLE>
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
<!--���Ĵ���-->
<!--���Ĵ���-->
<SCRIPT language="JavaScript" src="jsp/workflow/resource/formeditor/DefFormFunction.js"></SCRIPT>
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
    String bspUserId =
	GetBspInfo.getBspInfo().getEmployee().getOrgan().getOrganId();
	String bspUserName =
	GetBspInfo.getBspInfo().getEmployee().getOrgan().getOrganName();
			
%>

function updateActivityUser(){
//��Ϊ���˸�","�ţ���Ҫȥ��
var activityUser=document.all("activityUser").value.trim();
if(activityUser.length>0){
activityUser=activityUser.substring(0,activityUser.length-1);
document.all("activityUser").value=activityUser;
};
}

</script>
<BODY >

<form name="frmList" action="">

<img  id="loading" src="<%=SkinUtils.getRootUrl(request)+"skins/default/images/loading.gif"%>" width="200" height="50" style="position:absolute;top:100;left:200;display:none;z-index:100">

<input type="hidden" name="bspUserId" value="<%=bspUserId%>">
<input type="hidden" name="bspUserName" value="<%=bspUserName%>">

<%
 
 out.println(html);

%>

<div style="display:none">
<!-- DCwork�ؼ� -->
<OBJECT id="fileObj" CLASSID="CLSID:3DE10180-4375-4269-B3FA-2EC92DCA840F" CODEBASE='<%=ClientUtils.getRootUrl(request)+"plugin/DCworkPlugIn.exe#version=1,0,0,1"%>' VIEWASTEXT></OBJECT>
				
<OBJECT id="data" CLASSID="CLSID:4AB7F4E4-D1AA-4646-8227-A5FA83F5BB8F" CODEBASE='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/data.ocx#version=1,1,12,18"%>' VIEWASTEXT></OBJECT>
<!-- 
   <OBJECT id="signData" CLASSID="CLSID:0631B94A-EC26-11D2-95EC-0060082AA655" CODEBASE='<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/CICCInkocx.CAB#version=3,5,0,4"%>' width='0' height='0' VIEWASTEXT></OBJECT>
 -->
</div>
</form>


</BODY>
</HTML>

<script language="JavaScript">
updateActivityUser();
init();
function init(){//�޸���ǩ�򣬰��������滻ΪͼƬ
	
	var data=document.all("data");
	//����������༭��(�������/ǩ����)��spanԪ�ؽ�����ȡ�滻��ǩ---��ʼ
	 spans=document.getElementsByTagName("span");	
     for(var spanIndex=0;spanIndex<spans.length;spanIndex++){
         var span=spans[spanIndex];
         if(span.id&&span.title&&span.id!=""&&span.title!=""){
		     var pres=span.getElementsByTagName("pre");//����༭�����еģ����������ǩ��(��ͨ����д)��ͼƬǩ��
		     var imgs=span.getElementsByTagName("img");//ͼƬǩ�������е�
		     if(pres && pres.length>0){//��pre��˵��������༭��
		     	for(var i=0;i<pres.length;i++){
		     		var pre=pres[i];
		     		var USERNAME=pre.getAttributeNode("USERNAME").nodeValue;
		     		var SUBTIME=pre.getAttributeNode("SUBTIME").nodeValue;
		     		var sType="";
		     		sType=pre.getAttributeNode("sType").nodeValue;
		     		if(sType=="signSign"){//��ǩ �� ǩ����
		     			
		     			var tempFile = data.tempFileName;
						tempFile = tempFile.substring(0,tempFile.length-4) + ".jpg";
						var signObj=pre.getElementsByTagName("object")[0];
						signObj.SaveJpgFile(tempFile);
						pre.innerHTML="<img src='"+tempFile+ "' >";
		     		}
		     	}
		     }
	     }     
     }//����������༭��(�������/ǩ����)��spanԪ�ؽ�����ȡ�滻��ǩ---����
}



<!--

if (window.Event)
  document.captureEvents(Event.MOUSEUP);

function nocontextmenu()
{
event.cancelBubble = true
event.returnValue = false;

return false;
}

function norightclick(e)
{
if (window.Event)
{
  if (e.which == 2 || e.which == 3)
   return false;
}
else
  if (event.button == 2 || event.button == 3)
  {
   event.cancelBubble = true
   event.returnValue = false;
   return false;
  }

}

document.oncontextmenu = nocontextmenu;
document.onmousedown = norightclick;
//-->
</script>

