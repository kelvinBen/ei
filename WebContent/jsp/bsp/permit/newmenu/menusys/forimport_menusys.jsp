<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<HTML>
<HEAD><TITLE>系统菜单导入 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
  
 

<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="系统菜单导入" height="200">
<widgets:containbutton onclick="doSave();" text="导入"></widgets:containbutton> 
<table>
<tr>
	<td><font color="red">请选择要导入的系统菜单文件:</font></td>
	<td><html:file name="uploadFile" value="" onkeydown="return false;" style="ime-mode isabled"  oncontextmenu="return false;"/></td>
</tr>
</table>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function doSave(){
	var files=document.forms[0].uploadFile;
 
	if(files.value==""){
		alert("请选择要导入的系统菜单文件！");
		return;
	}
	if(files.value.lastIndexOf(".xml")==-1){
		alert("请选择文件格式为*.xml的文件");
		return; 
	} 
	document.forms[0].action="menusys.cmd?method=importMenu";
	document.forms[0].submit();
}
</script>


