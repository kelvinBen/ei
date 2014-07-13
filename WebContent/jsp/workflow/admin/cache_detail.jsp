<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="�������̹���������" value="�������̹���������" onclick="setCacheSize('processMgr')"></html:button>
<html:button name="������̹���������" value="������̹���������" onclick="clearCache('processMgr')"></html:button>
<html:button name="�������̻���" value="�������̻���" onclick="setCacheSize('process')"></html:button>
<html:button name="������̻���" value="������̻���" onclick="clearCache('process')"></html:button>
<html:button name="������Դ����" value="������Դ����" onclick="setCacheSize('resource')"></html:button>
<html:button name="�����Դ����" value="�����Դ����" onclick="clearCache('resource')"></html:button>
<html:button name="ˢ��" value="ˢ��" onclick="refreshCache()"></html:button>
</div>
<br>
<html:messages/>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss">
<table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
	<tr>
      <td class="TdLeft">���̹��������棺</td>
      <td class="TdRight"><html:hidden name="procMgrCacheSize" property="procMgrCacheSize" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">���̹�����������Ŀ��</td>
      <td class="TdRight"><html:hidden name="procMgrCacheItems" property="procMgrCacheItems" write="true"/></td>
    </tr>
	<tr>
      <td class="TdLeft">���̻��棺</td>
      <td class="TdRight"><html:hidden name="procCacheSize" property="procCacheSize" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">���̻�����Ŀ��</td>
      <td class="TdRight"><html:hidden name="procCacheItems" property="procCacheItems" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">��Դ���棺</td>
      <td class="TdRight"><html:hidden name="resCacheSize" property="resCacheSize" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">��Դ������Ŀ��</td>
      <td class="TdRight"><html:hidden name="resCacheItems" property="resCacheItems" write="true"/></td>
    </tr>
  </table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("�������̣��������������ϸ");
function refreshCache(){
  document.forms[0].action ="wfadminoperate.cmd?method=cacheAdmin";
  document.forms[0].submit();	
}
function clearCache(type){
  document.forms[0].action ="wfadminoperate.cmd?method=clearCache&type="+type;
  document.forms[0].submit();	
}
function setCacheSize(type){
  document.forms[0].action ="wfadminoperate.cmd?method=forSetCacheSize&type="+type;
  document.forms[0].submit();	
}
</script>