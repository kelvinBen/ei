<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
	<%@ taglib uri="/tags/web-html" prefix="html"%>
<META http-equiv="Content-Type" content="text/html; charset=GB18030">
<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>uploadFile.jsp</TITLE>
</HEAD>
<script language="javascript">
function uploadFile(){
	if (document.all("upload").value !="")
		document.forms[0].submit();
}
function closeMe(value){
	window.parent.returnValue = value;
	window.parent.close();
}
</script>
<BODY>
<img name="uploadFileImg" src="<%=request.getAttribute("com.mast.workform.uploadFileName")==null?"/GWPWEB/resource/statictree/icons/folder.gif":request.getAttribute("com.mast.workform.uploadFileName")%>">
<html:form method="post" enctype="multipart/form-data" action="workformgraph.cmd?method=updateFile">
<html:file name="upload" value="" style="display:none" onchange="uploadFile();"/>
<input type="hidden" name="path">
</html:form>
<script language="javascript">
var upload = "<%=request.getAttribute("com.mast.workform.uploadFileName")%>";
if (upload!="null" && upload !=""){
	var width=document.all("uploadFileImg").width;
	var height=document.all("uploadFileImg").height;
	var arr = new Array();
	arr["width"]=width;
	arr["height"]=height;
	arr["url"]=upload;
	closeMe(arr);
}
</script>

</BODY>
</HTML>
