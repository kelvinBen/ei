<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<html:form name="frmList" action="">
<div align="right">

</div>

<support:flexgrid name="grid" height="200" action="" isSubmit="true">
                          <flex:flexCol caption='流程名称' width="100" property="sysProcessName" sortName="taskinfo.sysProcessName"></flex:flexCol>
                          
                          
</support:flexgrid>
</html:form>
<script language="javascript">

grid.show();
grid.setSumText("");
setTitleInTreeBar("工作流程－流程管理－表单查询－查询结果列表");

</script>