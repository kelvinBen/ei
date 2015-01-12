<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<html>
<head>
<title>数据导入</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<%
	String refreshId = (String) request.getAttribute("refreshId");
%>
</head>
<body topmargin="10px">

<html:form method="post" enctype="multipart/form-data" action="">
<widgets:container title="功能资源导入" >
<widgets:containbutton text="导入" onclick="doUpload()"></widgets:containbutton>
<widgets:containbutton text="重置" onclick="forReset()"></widgets:containbutton>
	<table width="100%" cellpadding="0" class="tblContent">
	<tr>
	<td class="tdTitle">选择导入文件</td>
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
		alert("请选择要导入的功能资源文件！");
		return;
	}
	if(files.value.lastIndexOf(".xml")==-1){
		alert("请选择文件格式为*.xml的文件");
		return; 
	} 
    document.forms[0].action="expAndImp.cmd?method=imports&refreshId="+"<%=refreshId%>";
    document.forms[0].submit();
    
}
</script>