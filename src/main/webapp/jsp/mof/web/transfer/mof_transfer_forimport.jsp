<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
	<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<HTML>
<HEAD><TITLE>模型导入帮助框 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
 
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
</HEAD>

<BODY topmargin="10px">
<widgets:container title="导入模型" height="200">
<widgets:containbutton onclick="doSave();" text="导入"></widgets:containbutton>
<html:form method="POST" enctype="multipart/form-data" action="" name="formList">
<table name="a" cellspacing='0' class="tblContent" width="100%" >
	<tr>
	<td class="tdTitle">选择导入类型:</td>
	<td class="tdRight">
		<select name="importType">
		<option value="mof">元数据模型</option>
		<option value="mofprocess">流程模型</option>
		<select>
	</td>
	<td class="tdTitle">选择导入方式:</td>
	<td class="tdRight">
	<select name="override" onclick="doAlert(1)" onchange="doAlert(1)" onblur="doHidden(1)">
		<option value="false">普通模式</option>
		<option value="true">更新模式</option>
	<select>
	</td>
	</tr> 
	<tr> 
	<td class="tdTitle">删除冗余模型:</td>
	<td class="tdRight">
	<html:radio name="delete"  value="true" onclick="doAlert(2)" onblur="doHidden(2)">是</html:radio>
	<html:radio name="delete"  value="false">否</html:radio>
	</td>
		<td class="tdTitle"></td>
		<td class="tdRight">
		
		</td>
	</tr>
</table>
<grid:grid name="grid" property="" sumRow="false" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" type="input" headHeight="22"  sumHeight="22" width="100%" height="150">		       	
		<grid:textCol caption="选择模型文件" property="" width="100" index="2" name="linef" style="width:100%" styleClass="default"></grid:textCol>				
</grid:grid>
	<table width="100%" cellpadding="0" class="tblContent" style="border:0px solid #000000">
	 <tr><td align="center">
			<html:button name="AddRow" value="增加一行" onclick="doAddRow()"/>
			<html:button name="DeleteRow" value="删除一行" onclick="doDeleteRow()"/>
		</td></tr>
	</table>
<br>
<br>
<br>
<span id="alertMess"></span>
</html:form>
</widgets:container>
</BODY>
</HTML>
<script language="javascript">
document.getElementsByName("delete")[1].checked=true;
 
grid.show();
grid.setSumText("");
grid.setCellHtml(0,1,' <html:file name="theFile" value=""/>');
doAddRow();
function doAddRow()
{
	grid.addRow();
}
function doDeleteRow()
{
	grid.delRow();
}
function doSave()
{    
	var files=document.forms[0].theFile;
	if(files.length==undefined){
		alert("请选择模型文件！");
		return;
	}
	var type=document.forms[0].importType.value;
	//由于grid第0行中已经有一个空的file项，所以要忽略第0个
	for(var i=1;i<files.length;i++){
		if(files[i].value=="")
		{
			alert("请选择模型文件！");
			files[i].focus();
			return;
		}else{
			if(files[i].value.lastIndexOf(type)==-1)
			{
				alert("请选择文件格式为*."+type+"的文件");
				files[i].focus();
				return;
			}
			var fileType=files[i].value.substring(files[i].value.lastIndexOf(type),files[i].value.length);
			if(fileType!=type){
				alert("请选择文件格式为*."+type+"的文件");
				files[i].focus();
				return;
			}			
		}
	}
	
	if("mof"==type){
		document.forms[0].action="mofTransferCmd.cmd?method=windowImport";
	}else if("mofprocess"==type){
		document.forms[0].action="mofProcessTransferCmd.cmd?method=processImport";
	}
    document.forms[0].submit();
  //  strip.show();
}
function doAlert(type)
{   
	if(type=="1"){
		if(document.forms[0].override.value=="true")
			document.getElementById("alertMess").innerHTML="<font color='red'>更新模式:导入的模型如果跟数据库中ID相同,则执行更新操作(执行INSERT,UPDATE操作)</font>";
		else
			document.getElementById("alertMess").innerHTML="<font color='red'>普通模式:导入的模型如果跟数据库中ID相同,则不执行更新操作(仅执行INSERT操作)</font>";
	}
	if(type=="2")
		document.getElementById("alertMess").innerHTML="<font color='red'>删除冗余模型:对于对象,窗口或者对象关系等父模型,如果数据库中子模型对于导入的xml文件冗余,则删除数据库中的冗余子模型<br>例如:对象模型MOF_TABLE,数据库中包含子模型NAME而xml中没有该属性定义,则删除数据库中的属性描述<br>执行此操作时注意，该操作不可回滚,如果导入的xml文件属性缺失,则可能导致模型信息的丢失</font>";
}
function doHidden()
{    
    document.getElementById("alertMess").innerText="";
}
</script>


