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
<TITLE>工作流升级</TITLE>
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
				<p>升级说明：</p>
				<p>1、表结构升级
				<br>在数据表WF_PROCESS_MGR中增加新字段PROCESS_TYPE VARCHAR(255),PROCESS_NAME VARCHAR(255),升级后需重新启动服务器后再进行数据升级.
				<br><html:button name="表结构升级" value="表结构升级" onclick="forUpgradeTable()"></html:button>
				</p>
				<p>2、数据升级
				<br>在数据表WF_PROCESS_MGR中新加的字段PROCESS_TYPE,PROCESS_NAME中填入相应的数据.
				<br><html:button name="数据升级" value="数据升级" onclick="forUpgradeData()"></html:button>
				</p>
	        </td>
		</tr> 
	</table>
</fieldset>
</html:form>
</BODY>
</HTML>