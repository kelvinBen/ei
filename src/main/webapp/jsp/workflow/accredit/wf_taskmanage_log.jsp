<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ page import="net.mast.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<html:form name="frmList" action="">
<div class="btnareaCss">
</div>
<div><fieldset class="FieldsetCss"><legend>��ѯ����</legend>
<table id="tblSearch">
<flex:search>
<tr>
<td class="tdLeft">ԭ�����ˣ�</td>
<td class="tdRight" ><html:text name="OLD_USERNAME" value="" size="20"></html:text></td>
<td class="tdLeft">�����ˣ�</td>
<td class="tdRight" ><html:text name="AGENT_USERNAME" value="" size="20"></html:text></td>
<td class="tdLeft">��Ȩ�ˣ�</td>
<td class="tdRight" ><html:text name="OPERATION_USERNAME" value="" size="20"></html:text></td>
<td width="100" align="center"><flex:searchImg name="chaxun" action="#" image="search.gif"/></td>
	</tr>
	<tr>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
		<flex:flexCol caption='�ɰ������' width="200" property="PLAN_NO" sortName="l.PLAN_NO" canSort="false"></flex:flexCol>
        <flex:flexCol caption='ԭ������' width="200" property="OLD_USERNAME" sortName="l.OLD_USERNAME" canSort="false"></flex:flexCol>
		<flex:flexCol caption='������' width="200" property="AGENT_USERNAME" sortName="l.AGENT_USERNAME" canSort="false"></flex:flexCol>
        <flex:flexCol caption='��Ȩ��' width="300" property="OPERATION_USERNAME" sortName="l.OPERATION_USERNAME"  canSort="false">  </flex:flexCol>
        <flex:flexCol caption='��Ȩʱ��' width="300" property="OPERATION_TIME" sortName="l.OPERATION_TIME"  canSort="false">  </flex:flexCol>          
 </support:flexgrid>
<flex:pagePolit action="taskLogQuery.cmd">
</flex:pagePolit>
</html:form>
</body>
</html>
<script language="javascript">
function init(){
grid.show();
grid.setSumText("");
}
</script>
