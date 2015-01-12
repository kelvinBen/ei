<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<HTML>
<HEAD><TITLE>元数据导入帮助框 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='mof.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<widgets:container title="SQL脚本" >
<widgets:containbutton onclick="doCreate();" text="创建"></widgets:containbutton>
<widgets:containbutton onclick="doDrop();" text="销毁"></widgets:containbutton>
<widgets:containbutton onclick="doAlter();" text="更新"></widgets:containbutton>
<html:form method="POST" action="">
<table>
<tr>
<td class="tdLeft" width="20%" >对象名:</td>
<td class="tdRight" width="20%" ><html:text name="mofTable" property="mofTable" readonly="true" title="对象名"/></td>
</tr>  
</table>
<tab:tab  id="tab1" type="table">
  <tab:card text="创建脚本" id="User">
	<table>
	<tr>
	<td class="tdRight" width="20%" ><html:textarea name="createScript" property="createScript" cols="100" rows="10" title="数据库创建脚本,可以根据需要修改"/></td>
	</tr>  
	</table>
  </tab:card>
  <tab:card text="销毁脚本" id="User">
	<table>
	<tr>
	<td class="tdRight" width="20%" ><html:textarea name="dropScript" property="dropScript" cols="100" rows="10"  title="数据库销毁脚本,可以根据需要修改"/></td>
	</tr> 
	</table>
  </tab:card>
  <tab:card text="更新脚本" id="User">
	<table>
	<tr>
	<td class="tdRight" width="20%" ><html:textarea name="alterScript" property="alterScript" cols="100" rows="10"  title="数据库更新脚本,可以根据需要修改" /></td>
	</tr> 
	</table>
  </tab:card>
</tab:tab>
</html:form>
</widgets:container>
</BODY>
</HTML>
<script language="javascript">
function doCreate()
{    
	alert("创建");
	document.forms[0].action="mofDataModel.cmd?method=create";
	document.forms[0].submit();
	disableButton(true);
}
function doDrop()
{    
	alert("销毁");
	document.forms[0].action="mofDataModel.cmd?method=drop";
	document.forms[0].submit();
	disableButton(true);
}
function doAlter()
{    
	alert("更新");
	document.forms[0].action="mofDataModel.cmd?method=alter";
	document.forms[0].submit();
	disableButton(true);
}
</script>


