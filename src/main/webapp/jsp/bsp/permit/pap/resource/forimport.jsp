<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<html>
<head>
<title>���ݵ���</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<%
	String refreshId = (String) request.getAttribute("refreshId");
%>
</head>
<body topmargin="10px">

<html:form method="post" enctype="multipart/form-data" action="">
<widgets:container title="������Դ����" >
<widgets:containbutton text="����" onclick="doUpload()"></widgets:containbutton>
<widgets:containbutton text="����" onclick="forReset()"></widgets:containbutton>
	<table width="100%" cellpadding="0" class="tblContent">
	<tr>
	<td class="tdTitle">ѡ�����ļ�</td>
	<td class="tdRight"><html:file name="uploadFile" value="" onkeydown="return false;" style="ime-mode isabled"  oncontextmenu="return false;"/></td>
	</tr> 
	</table>
</widgets:container>
</html:form>

</body>
</html>
<script language="javascript">

function forReset(){  
  document.forms[0].reset();	
}  
function doUpload(){
   	var files=document.forms[0].uploadFile;
 
	if(files.value==""){
		alert("��ѡ��Ҫ����Ĺ�����Դ�ļ���");
		return;
	}
	if(files.value.lastIndexOf(".xml")==-1){
		alert("��ѡ���ļ���ʽΪ*.xml���ļ�");
		return; 
	} 
    document.forms[0].action="expAndImp.cmd?method=imports&refreshId="+"<%=refreshId%>";
    document.forms[0].submit();
    
}
</script>