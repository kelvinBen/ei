<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<HTML>
<HEAD><TITLE>ģ�͵��������� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>

<BODY topmargin="10px">
<widgets:container title="����ģ��">
<widgets:containbutton onclick="forExport();" text="ȷ��"></widgets:containbutton>
<html:form method="POST" action="">
<table name="a" cellspacing='0' class="tblContent" width="100%" >
	<tr>
	<td class="tdTitle">ѡ�񵼳�����:</td>
	<td class="tdRight">
		<select name="importType">
		<option value="mof">Ԫ����ģ��</option>
		<option value="process">����ģ��</option>
		<select>
	</td>
	</tr>
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
function forExport()
{    
	var type=document.forms[0].importType.value;
	if("mof"==type){
		document.forms[0].action="mofexecquery.cmd?window_name=mof_windowExport";
	}else if("process"==type){
		document.forms[0].action="mofexecquery.cmd?window_name=mof_wfprocessExport";
	}
    document.forms[0].submit();
}
</script>


