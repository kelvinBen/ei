<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>选择类型</TITLE>
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
	var arr = new Array();
	arr[0] = document.all("processType").value;
	if(arr[0]==""){
		alert("请选择类型！");
		return;
	}
	window.returnValue = arr;
	window.close();
}

</script>

</HEAD>
<BODY topmargin="10px">

<html:form  name="frmList"  action="">
<div class="btnareaCss">
<html:button name="确定" value="确定" onclick="forReturn()"></html:button>&nbsp;<html:button name="取消" value="取消" onclick="javascript:window.close();"></html:button>
</div>
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
		<tr>
			<td class="tdLeft">
				选择类型：
	        </td>
			<td class="TdRight">
				<html:select  name="processType" property="processType" >
	          <html:options collection="processtypelist" labelProperty="name" property="physicalname"/>
	          </html:select>
	        </td>
		</tr> 
	</table>
</fieldset>
</html:form>
</BODY>
</HTML>