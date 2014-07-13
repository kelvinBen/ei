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
</HEAD>
<%
	String matrix = request.getParameter("matrix");
%>
<BODY topmargin="10px">
<div class="btnareaCss">
<!--<html:button name="修改" value="修改" onclick="forUpdate()">--></html:button>&nbsp;<html:button name="btnReturn" value="返回" onclick="forReturn()"></html:button>
</div>
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<fieldset class="FieldsetCss">
  <table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
<html:hidden name="processtype" property="processtype"/>

	<tr>
      <td class="TdLeft">类型名称：</td>
      <td class="TdRight"><html:hidden name="name" property="name" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">组织机构：</td>
      <td class="TdRight"><html:hidden name="organizeName" property="organizeName" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">类型描述：</td>
      <td class="TdRight"><html:hidden name="description" property="description" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">显示顺序：</td>
      <td class="TdRight"><html:hidden name="order" property="order" write="true"/></td>
    </tr>
  </table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("工作流程－流程管理－流程类型明细");
function forUpdate(){
  document.all("primaryKey").value=document.all("processtype").value;
  document.forms[0].action ="processtype.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
<%
if(matrix != null&&matrix.equals("true")){
%>
	window.history.back();
<%
}else{
%>
  document.forms[0].action ="processtypequery.cmd?clear=true";
  document.forms[0].submit();	
<%
}	
%>
}
</script>