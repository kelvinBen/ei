<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
	<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<HTML>
<HEAD><TITLE>ģ�͵�������� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
 
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
</HEAD>

<BODY topmargin="10px">
<widgets:container title="����ģ��" height="200">
<widgets:containbutton onclick="doSave();" text="����"></widgets:containbutton>
<html:form method="POST" enctype="multipart/form-data" action="" name="formList">
<table name="a" cellspacing='0' class="tblContent" width="100%" >
	<tr>
	<td class="tdTitle">ѡ��������:</td>
	<td class="tdRight">
		<select name="importType">
		<option value="mof">Ԫ����ģ��</option>
		<option value="mofprocess">����ģ��</option>
		<select>
	</td>
	<td class="tdTitle">ѡ���뷽ʽ:</td>
	<td class="tdRight">
	<select name="override" onclick="doAlert(1)" onchange="doAlert(1)" onblur="doHidden(1)">
		<option value="false">��ͨģʽ</option>
		<option value="true">����ģʽ</option>
	<select>
	</td>
	</tr> 
	<tr> 
	<td class="tdTitle">ɾ������ģ��:</td>
	<td class="tdRight">
	<html:radio name="delete"  value="true" onclick="doAlert(2)" onblur="doHidden(2)">��</html:radio>
	<html:radio name="delete"  value="false">��</html:radio>
	</td>
		<td class="tdTitle"></td>
		<td class="tdRight">
		
		</td>
	</tr>
</table>
<grid:grid name="grid" property="" sumRow="false" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" type="input" headHeight="22"  sumHeight="22" width="100%" height="150">		       	
		<grid:textCol caption="ѡ��ģ���ļ�" property="" width="100" index="2" name="linef" style="width:100%" styleClass="default"></grid:textCol>				
</grid:grid>
	<table width="100%" cellpadding="0" class="tblContent" style="border:0px solid #000000">
	 <tr><td align="center">
			<html:button name="AddRow" value="����һ��" onclick="doAddRow()"/>
			<html:button name="DeleteRow" value="ɾ��һ��" onclick="doDeleteRow()"/>
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
		alert("��ѡ��ģ���ļ���");
		return;
	}
	var type=document.forms[0].importType.value;
	//����grid��0�����Ѿ���һ���յ�file�����Ҫ���Ե�0��
	for(var i=1;i<files.length;i++){
		if(files[i].value=="")
		{
			alert("��ѡ��ģ���ļ���");
			files[i].focus();
			return;
		}else{
			if(files[i].value.lastIndexOf(type)==-1)
			{
				alert("��ѡ���ļ���ʽΪ*."+type+"���ļ�");
				files[i].focus();
				return;
			}
			var fileType=files[i].value.substring(files[i].value.lastIndexOf(type),files[i].value.length);
			if(fileType!=type){
				alert("��ѡ���ļ���ʽΪ*."+type+"���ļ�");
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
			document.getElementById("alertMess").innerHTML="<font color='red'>����ģʽ:�����ģ����������ݿ���ID��ͬ,��ִ�и��²���(ִ��INSERT,UPDATE����)</font>";
		else
			document.getElementById("alertMess").innerHTML="<font color='red'>��ͨģʽ:�����ģ����������ݿ���ID��ͬ,��ִ�и��²���(��ִ��INSERT����)</font>";
	}
	if(type=="2")
		document.getElementById("alertMess").innerHTML="<font color='red'>ɾ������ģ��:���ڶ���,���ڻ��߶����ϵ�ȸ�ģ��,������ݿ�����ģ�Ͷ��ڵ����xml�ļ�����,��ɾ�����ݿ��е�������ģ��<br>����:����ģ��MOF_TABLE,���ݿ��а�����ģ��NAME��xml��û�и����Զ���,��ɾ�����ݿ��е���������<br>ִ�д˲���ʱע�⣬�ò������ɻع�,��������xml�ļ�����ȱʧ,����ܵ���ģ����Ϣ�Ķ�ʧ</font>";
}
function doHidden()
{    
    document.getElementById("alertMess").innerText="";
}
</script>


