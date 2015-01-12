<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
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

<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="确定" value="确定" onclick="forSave()"></html:button>
</div>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss">
<table  cellpadding="0" cellspacing="0" class="tblContent">
	
	<tr>
		<td class="tdright">请选择组织机构或员工：</td>
		<td class="tdright"><input type="hidden" name="organId" value=""><input type="hidden" name="struid" value=""><input type="text" name="organName" value="" size="20" readonly><img src="skins/default/images/liulan.gif"onclick="selectorgan()" style="cursor:hand"></td>
	</tr>
	<table >
	<tr>
	 <td><html:radio name="radio" value="1">按季度统计</html:radio></td>
	 <td><html:radio name="radio" value="2">按月统计</html:radio></td>
	 <td><html:radio name="radio" value="3">按天统计</html:radio></td>
	</tr>
	</table>
</table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
		  var collection;
		  collection=document.all("radio");
		  if(document.all("organId").value==""||document.all("organName").value=="")
		  {alert("请选择要统计的人或组织")
		  return;}
		  else if(!collection[0].checked&&!collection[1].checked&&!collection[2].checked)
		  {alert("请选择统计的方式");
		  return;}
          else{document.forms[0].action="wfpersonanlyze.cmd?method=PersonAnalyze";
	           document.forms[0].submit();}
}
function selectorgan(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2,8&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("organId").value="";
	  document.all("organName").value="";
	  document.all("struid").value="";
  }else{
	  document.all("organId").value=win[0];
	  document.all("organName").value=win[1];
	   document.all("struid").value=win[2];
  }
}
</script>