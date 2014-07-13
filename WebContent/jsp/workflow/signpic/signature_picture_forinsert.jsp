
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import = "net.mast.bsp.permit.context.GetBspInfo" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>aa</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<%
	String accessRootId=GetBspInfo.getBspInfo().getAccessRootId();
%>
</HEAD>

<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="forSave" value='保存' onclick="forSave()"></html:button>
<html:button name="forReturn" value='返回' onclick="forReturn()"></html:button>
</div>

<html:messages/>

<html:form  name="frmList" method="post" enctype="multipart/form-data"  action="">
<fieldset class="FieldsetCss" ><legend>增加签名图片</legend>
<div align="center">

  <table width="100%" cellpadding="0" cellspacing="0" class="tblContent" border="0">
     <tr>
	     <td class="tdLeft">人员：</td>
	     <td class="tdRight">
		     <input type="text" name="person_name" value="" size="10" notnull=true readOnly=true />
		     <input type="hidden" name="person_id" value="" size="10">
		     <img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectPerson()" onchange="checkinputNullInDcWork ('person','span_person')" />
		     <span id="span_person" class="xinghaoCss">*</span>
	     </td>
     </tr>
     <tr>
	     <td class="tdLeft">签名图片：</td>
	     <td class="tdRight">
		     <html:file name="theFile" value="" onchange="checkinputNullInDcWork ('theFile','theFile_span')" onkeydown="return false;" style="ime-mode:disabled"  oncontextmenu="return false;" />
		     <span id="theFile_span" class="xinghaoCss">*</span>
	     </td>
     </tr>
   </table>
</div>
</fieldset>
</html:form>
<script type="text/javascript">
setTitleInTreeBar("签名图片-增加");
function forSave(){
	if(!checkData()){
		return;	
	}
	document.forms[0].action = "signpic.cmd?method=insert&person_id="+document.all("person_id").value+"&person_name="+document.all("person_name").value;
	document.forms[0].submit();
}
function forReturn(){
	window.location.href="signpic.cmd?method=query";
}
function selectPerson(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1&rootId=<%=accessRootId%>";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("person_name").value="";
	  document.all("person_id").value="";
  }else{
	  document.all("person_name").value=win[1];
	  document.all("person_id").value=win[0];
  }
}
function checkData(){
	var person_id=document.all("person_id");
	if(person_id.value==""){
		alert("请选择人员！");
		return false;
	}
	var fileName=document.all("theFile").value;
	if(fileName==""){
		alert("请选择签名图片文件！");
		return false;
	}
	if(fileName.indexOf(".")<0 || fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase()!="jpg"){
		alert("签名图片必须为JPG文件！");
		return false;
	}
	return true;
}
</script>
</body>

	