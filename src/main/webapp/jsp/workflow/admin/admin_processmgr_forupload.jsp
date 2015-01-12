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
<TITLE>上传XPDL流程定义</TITLE>
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
function checkUpload(){
  var docContent = document.forms[0].docContent;
  if (trim(docContent.value)=="")
  {
    alert("请选择文件！");
    docContent.focus();
    return false;
  }
  docContent.value = trim(docContent.value) ;
  
  return true
}
</script>
</head>

<BODY topmargin="10px">
<html:form  name="frmList"  enctype="multipart/form-data" action="">
<div class="btnareaCss">
		<html:button name='<%=ResourcesFactory.getString("button.save")%>' value='<%=ResourcesFactory.getString("button.save")%>'	onclick="forSave()"></html:button>
		<html:button name='<%=ResourcesFactory.getString("button.return")%>' value='<%=ResourcesFactory.getString("button.return")%>' onclick="forReturn()"></html:button>
</div>
<div align="center">
<br>
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0"cellspacing="0"  class="tblContent">                                         


			                  
		<tr>
			<td class="tdLeft">文件：</td>
			<td class="TdRight"><html:file name="docContent" value="" onkeydown="return false" onchange="checkinputNullInDcWork ('docContent','docContent_span')"/><span id="docContent_span" class="xinghaoCss">*</span></td>
		</tr> 
		
	</table>
	<table width="100%" cellpadding="0"cellspacing="0"  class="tblContent">  
	<tr>
		<td  class="tdLeft" colspan="2"><font color=red>注意：此功能适用于与表单无关的流程定义，其他请从流程管理中按常规方式载入引擎！</font></td>
		</tr>
		</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("工作流程-流程监控-上传XPDL流程定义");
function forSave(){
  if(!checkUpload()) return;	
  document.forms[0].action ="processmgr.cmd?method=uploadProcess";
  document.forms[0].submit();	
}
function forReturn(){
  window.location.href="processmgradminquery.cmd?clear=true";
}
</script>