<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<HTML>
<HEAD><TITLE>Ԫ���ݵ�������� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='progress.js'/>"></script>
</HEAD>

<BODY topmargin="10px">
<widgets:container title="Ԫ���ݵ���" >
<widgets:containbutton onclick="doSave();" text="����"></widgets:containbutton>

<html:form method="POST" enctype="multipart/form-data" action="">
<table>
	<tr>
	<td class="tdTitle">ѡ�����ļ�:</td>
	<td class="tdRight"><html:file name="theFile" value="" title="rose��ͼ�ļ�,��ʱֻ֧��mdl;��֧��cat"/><font color="#FF0000">*</font></td>
	</tr>
	<tr>
	<td class="tdTitle">���ݿ����ģ��:</td>
	<td class="tdRight"><html:text name="tablePatten" property="tablePatten" size="40" maxlength="40" value="@ClassName@" title="���ݿ�����ƶ���ģ��,@ClassName@��ʾ������,����ʱ�ᱻ��̬�滻��"/></td>
	</tr>   
	<tr>
	<td class="tdTitle">���ݿ�����ģ��:</td>
	<td class="tdRight"><html:text name="columnPatten" property="columnPatten" size="40" maxlength="40" value="@AttributeName@" title="���ݿ�������ƶ���ģ��,@AttributeName@��ʾ����������,����ʱ�ᱻ��̬�滻��"/></td>
	</tr>  
	<tr>
	<td class="tdTitle">Ĭ��������ģ��:</td>
	<td class="tdRight"><html:text name="keyColumnPattern" property="keyColumnPattern" size="40" maxlength="40" value="@TABLE_NAME@_ID" title="������ģʽ,��������Ѿ���������,���������Ч;����û������Ӹ���" /></td>
	</tr> 
</table>				        
</html:form>
<!--
<center>
  <html:button name="submit_btn" value="ȷ ��" onclick="closeWindow(true)"/> &nbsp;&nbsp; 
  &nbsp;&nbsp; <html:button name="reset_btn" value="ȡ ��" onclick="closeWindow(false)"/>
</center>
-->
</widgets:container>
</BODY>
</HTML>
<script language="javascript">
strip.write();
strip.setMsg("���ڵ�������,���Ժ�...");
function doSave()
{    
	if(checkFile()){
	    document.forms[0].action="mofRose.cmd?method=roseImport";
	    document.forms[0].submit();
	    strip.show();
	}

}
function checkFile()
{
	if(document.forms[0].theFile.value==""){
		alert("��ѡ��Ҫ�ϴ����ļ�");
		return false;
	}else if(document.forms[0].theFile.value.indexOf(".mdl")<0){
		alert("ֻ֧��.mdl��ʽ�ļ��ϴ�");
		return false;
	}
	return true;
}
</script>


