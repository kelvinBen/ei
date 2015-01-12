<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE></TITLE>
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
function checkform()
{
	var size = document.forms[0].size;
	if (trim(size.value)=="")
	{
		alert('"缓存大小"不能为空！');
	    size.focus();
		return false;
	}
	if ( !isInteger(size) )
	{
		alert('"缓存大小"应为整数！');
		size.focus();
		return false;
	}
	if(!isIntegerMaxMin(size,100000,-1)){
		alert('"缓存大小"超出范围,应大于等于0小于100000！');
		size.focus();
		return false;	
	}
	return true;
}
</script>
</HEAD>
<%
	String type = (String)request.getAttribute("type");
	String size = (String)request.getAttribute("size");
%>
<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="确定" value="确定" onclick="confirm()"></html:button>
<html:button name="返回" value="返回" onclick="cancle()"></html:button>
</div>
<html:form  name="frmList"  action="">
<input type="hidden" name="type" value="<%=type%>">
<fieldset class="FieldsetCss">
<table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
	<tr>
      <td class="TdLeft">缓存大小</td>
      <td class="TdRight"><input type="text" name="size" value="<%=size%>" onchange="checkinputNullInDcWork('size','size_span')"/><span id="size_span" class="xinghaoCss">*</span></td>
    </tr>
  </table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("工作流程－缓存管理－设置缓存大小");
function confirm(){
	if(!checkform()){
		return;
	}
  document.forms[0].action ="wfadminoperate.cmd?method=setCacheSize";
  document.forms[0].submit();	
}
function cancle(){
  document.forms[0].action ="wfadminoperate.cmd?method=cacheAdmin";
  document.forms[0].submit();	
}
</script>