<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<HTML>
<HEAD><TITLE>Ԫ���ݵ�������� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='mof.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<widgets:container title="ִ�н��" >
<widgets:containbutton onclick="doReturn();" text="����"></widgets:containbutton>
<html:form method="POST" action="">
<tab:tab  id="tab1" type="table">
  <tab:card text="�����ű�" id="User">
	<table>
	<tr>
	<td class="tdRight" width="20%" ><html:textarea name="createScript" property="createScript" cols="100" rows="10" title="���ݿⴴ���ű�,���Ը�����Ҫ�޸�"/></td>
	</tr>  
	</table>
  </tab:card>
  <tab:card text="���ٽű�" id="User">
	<table>
	<tr>
	<td class="tdRight" width="20%" ><html:textarea name="dropScript" property="dropScript" cols="100" rows="10"  title="���ݿ����ٽű�,���Ը�����Ҫ�޸�"/></td>
	</tr> 
	</table>
  </tab:card>
  <tab:card text="���½ű�" id="User">
	<table>
	<tr>
	<td class="tdRight" width="20%" ><html:textarea name="alterScript" property="alterScript" cols="100" rows="10"  title="���ݿ���½ű�,���Ը�����Ҫ�޸�" /></td>
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


