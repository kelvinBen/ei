<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>����������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript">
function forUpgradeTable(){
	document.forms[0].action = "upgrade.cmd?method=upgradeTable" ;
	document.forms[0].submit();	
}

function forUpgradeData(){
	document.forms[0].action = "upgrade.cmd?method=upgradeData" ;
	document.forms[0].submit();	
}

</script>

</HEAD>
<BODY topmargin="10px">

<html:form  name="frmList"  action="">

<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
		<tr>
			<td class="tdLeft">
				<p>����˵����</p>
				<p>1����ṹ����
				<br>�����ݱ�WF_PROCESS_MGR���������ֶ�PROCESS_TYPE VARCHAR(255),PROCESS_NAME VARCHAR(255),�������������������������ٽ�����������.
				<br><html:button name="��ṹ����" value="��ṹ����" onclick="forUpgradeTable()"></html:button>
				</p>
				<p>2����������
				<br>�����ݱ�WF_PROCESS_MGR���¼ӵ��ֶ�PROCESS_TYPE,PROCESS_NAME��������Ӧ������.
				<br><html:button name="��������" value="��������" onclick="forUpgradeData()"></html:button>
				</p>
	        </td>
		</tr> 
	</table>
</fieldset>
</html:form>
</BODY>
</HTML>