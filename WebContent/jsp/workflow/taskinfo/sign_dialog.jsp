<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>签名域</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/js/object.js"%>"></script>
<script language="JavaScript">
var type;
function OK() {
	var reValue;
	if (type == "1")
		reValue = document.all("signEdit").InkStr;
	else
		reValue = document.all("edit").value;
	window.returnValue = "<sign type=\"" + type + "\">" + reValue + "</sign>";
	window.close();
}
function load() {
	var arr;
	var reMap;
	if (window.dialogArguments != null && window.dialogArguments !="") {
		reMap = getValue(window.dialogArguments.value);
		type = reMap.get("type");
	}else{
		type = "0";
	}
	if (type == "1"){
		document.all("signEdit").style.display = "";
		document.all("backTo").style.display = "";
		document.all("delAll").style.display = "";
		if (reMap.get("value")!="")
			document.all("signEdit").InkStr = reMap.get("value");
	}else{
		document.all("edit").style.display = "";
		document.all("edit").value = reMap.get("value");
	}
}
function signBackTo(){
	document.all("signEdit").ClearOwnLastInk();
}
function signDelAll(){
	document.all("signEdit").ClearOwenInk();
}

</script>
</HEAD>

<BODY topmargin="10px" onload="load()">

<html:form  name="frmList"  action="">
<div class="btnareaCss">
		<html:button name="backTo" style="display:none" value="撤销" onclick="signBackTo()"></html:button>&nbsp;<html:button name="delAll"  style="display:none" value="删除全部" onclick="signDelAll()"></html:button>&nbsp;<html:button name="确定" value="确定" onclick="OK()"></html:button>&nbsp;<html:button name="取消" value="取消" onclick="javascript:window.close()"></html:button>&nbsp;
</div>
<div align="center">
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" class="tblContent">
		<tr>
			<td>
				<textarea name="edit" id="edit" style="display:none" cols="80" rows="17"></textarea>
			<!-- 	<OBJECT name="signEdit" id="signEdit" style="display:none" CLASSID="CLSID:0631B94A-EC26-11D2-95EC-0060082AA655" codeBase="<%=ClientUtils.getRootUrl(request)+"jsp/workflow/resource/object/CICCInkocx.CAB"%>#version=3,5,0,4" width="580" height="230" VIEWASTEXT> 
	        --> </td>
		</tr> 				                  
	</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
