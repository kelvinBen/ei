<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>表单打印模板明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<div class="btnareaCss">
	<html:button onclick="forUpdate()" name="btn_update" value="修改"></html:button>
	<html:button onclick="forReturn()" name="btn_delete" value="返回"></html:button>
</div>
<html:messages/>
<fieldset class="FieldsetCss">
  <table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
<html:hidden name="id" property="id" />
<html:hidden name="formid" property="formid" />
<html:hidden name="processid" property="processid" />
    <tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("FormPrintTemplet.TEMPLETNAME")%>：</td>
      <td class="TdRight"><html:hidden name="templetname" property="templetname" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("FormPrintTemplet.EXTENDNAME")%>：</td>
      <td class="TdRight"><html:hidden name="extendname" property="extendname" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("FormPrintTemplet.NOTE")%>：</td>
      <td class="TdRight"><html:hidden name="note" property="note" write="true"/></td>
    </tr>
  </table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar('表单打印模板明细');
function forUpdate(){
  document.all("primaryKey").value=document.all("id").value;
  document.forms[0].action ="formprinttemplet.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  var formId = document.all("formid").value;
  var processId = document.all("processid").value;
  document.forms[0].action ="formprinttempletquery.cmd?formId="+formId+"&processType="+processId;
  document.forms[0].submit();	
}
</script>