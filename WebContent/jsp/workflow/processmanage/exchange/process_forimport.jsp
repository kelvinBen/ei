<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<HTML>
<HEAD>
<TITLE>导入流程</TITLE>
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
function checkAdjunct(){
  var title = document.forms[0].title;
  title.value = trim(title.value) ;
  var content = document.forms[0].content;
  if (trim(content.value)=="")
  {
    alert("请选择文件！");
    content.focus();
    return false;
  }
  content.value = trim(content.value) ;
  if(byteLength(title.value)>250)
  {
	alert('标题长度超长,不能超过255个字符!');
	title.focus();
	return false;
  }
  var organId=document.forms[0].organId;
  organId.value=trim(organId.value);
  if(organId.value==""){
  	alert("请选择流程要导入到的组织结构！");
  	document.forms[0].organName.focus();
  	return false;
  }
  return true
}
function setAdjunctTitle(){
	var file = document.forms[0].content;
	var title = document.forms[0].title;
	var index1 = file.value.lastIndexOf("\\");
	var index2 = file.value.lastIndexOf(".");
	if(index2 == -1 || index2 < index1){
		index2 = file.value.length;
	}
	title.value = file.value.substring(index1+1,index2);
}
</script>
</head>
<BODY topmargin="10px">
<html:form  name="frmList"  enctype="multipart/form-data" action="">
<div class="btnareaCss">
		<html:button name='导入' value='导入'	onclick="forSave()"></html:button>
		<html:button name='返回' value='返回' onclick="forReturn()"></html:button>
</div>
<div align="center">
<br>
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0"cellspacing="0"  class="tblContent">                                         
		
		<tr>
			<td class="tdLeft">组织结构：</td>
			<td class="TdRight">
			<input type="hidden" name="organId" value="" size="20">
			<input type="text" name="organName"  value="" size="20" readonly="true">
			<img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectOrgan()">
			<span id="organid_span" class="xinghaoCss">*</span>
			</td>
		</tr>
		<tr>
			<td class="tdLeft">包名：</td>
			<td class="TdRight"><input name="title" property="title" size="20" maxlength="50" readonly="true" /></td>
		</tr> 				                  
		<tr>
			<td class="tdLeft">请选择要导入的流程包：</td>
			<td class="TdRight">
			<html:file name="content" value="" onkeydown="return false" style="ime-mode:disabled" oncontextmenu="return false;"  onchange="writeTitle();"/><span id="content_span" class="xinghaoCss">*</span></td>
		</tr> 
	</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkAdjunct()) return;
  document.forms[0].导入.disabled=true;
  document.forms[0].返回.disabled=true;
  document.forms[0].action ="processExchange.cmd?method=doimport";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="processquery.cmd?clear=true";
  document.forms[0].submit();	
}
function writeTitle(){
  var fileName=document.forms[0].content.value;
  var dotPlace=fileName.lastIndexOf(".");
  var huaPlace=fileName.lastIndexOf("\\");
  if(dotPlace==-1||dotPlace<=huaPlace){
  dotPlace=fileName.length;
  }
  var fN=fileName.substring(huaPlace+1,dotPlace);
  document.forms[0].title.value=fN;
}
function selectOrgan(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>&showOrganType=1,2";      
 
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("organId").value="";
	  document.all("organName").value="";
  }else{
	  document.all("organId").value=win[0];
	  document.all("organName").value=win[1];
  }
}
</script>