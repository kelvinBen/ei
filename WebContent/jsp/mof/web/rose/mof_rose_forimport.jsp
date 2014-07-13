<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<HTML>
<HEAD><TITLE>元数据导入帮助框 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='progress.js'/>"></script>
</HEAD>

<BODY topmargin="10px">
<widgets:container title="元数据导入" >
<widgets:containbutton onclick="doSave();" text="导入"></widgets:containbutton>

<html:form method="POST" enctype="multipart/form-data" action="">
<table>
	<tr>
	<td class="tdTitle">选择导入文件:</td>
	<td class="tdRight"><html:file name="theFile" value="" title="rose类图文件,暂时只支持mdl;不支持cat"/><font color="#FF0000">*</font></td>
	</tr>
	<tr>
	<td class="tdTitle">数据库表名模版:</td>
	<td class="tdRight"><html:text name="tablePatten" property="tablePatten" size="40" maxlength="40" value="@ClassName@" title="数据库表名称定义模版,@ClassName@表示类名称,生成时会被动态替换掉"/></td>
	</tr>   
	<tr>
	<td class="tdTitle">数据库列名模版:</td>
	<td class="tdRight"><html:text name="columnPatten" property="columnPatten" size="40" maxlength="40" value="@AttributeName@" title="数据库表列名称定义模版,@AttributeName@表示类属性名称,生成时会被动态替换掉"/></td>
	</tr>  
	<tr>
	<td class="tdTitle">默认主键列模版:</td>
	<td class="tdRight"><html:text name="keyColumnPattern" property="keyColumnPattern" size="40" maxlength="40" value="@TABLE_NAME@_ID" title="主键名模式,如果对象已经有主键列,则该设置无效;如若没有则添加该列" /></td>
	</tr> 
</table>				        
</html:form>
<!--
<center>
  <html:button name="submit_btn" value="确 定" onclick="closeWindow(true)"/> &nbsp;&nbsp; 
  &nbsp;&nbsp; <html:button name="reset_btn" value="取 消" onclick="closeWindow(false)"/>
</center>
-->
</widgets:container>
</BODY>
</HTML>
<script language="javascript">
strip.write();
strip.setMsg("正在导入数据,请稍候...");
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
		alert("请选择要上传的文件");
		return false;
	}else if(document.forms[0].theFile.value.indexOf(".mdl")<0){
		alert("只支持.mdl格式文件上传");
		return false;
	}
	return true;
}
</script>


