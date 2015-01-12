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
<widgets:container title="执行结果" >
<widgets:containbutton onclick="doReturn();" text="返回"></widgets:containbutton>
<html:form method="POST" action="">
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
function doReturn()
{    
	window.history.go(-1);
	disableButton(true);
}
</script>


