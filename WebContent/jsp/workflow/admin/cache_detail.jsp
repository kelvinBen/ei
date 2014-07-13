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
<html:button name="设置流程管理器缓存" value="设置流程管理器缓存" onclick="setCacheSize('processMgr')"></html:button>
<html:button name="清除流程管理器缓存" value="清除流程管理器缓存" onclick="clearCache('processMgr')"></html:button>
<html:button name="设置流程缓存" value="设置流程缓存" onclick="setCacheSize('process')"></html:button>
<html:button name="清除流程缓存" value="清除流程缓存" onclick="clearCache('process')"></html:button>
<html:button name="设置资源缓存" value="设置资源缓存" onclick="setCacheSize('resource')"></html:button>
<html:button name="清除资源缓存" value="清除资源缓存" onclick="clearCache('resource')"></html:button>
<html:button name="刷新" value="刷新" onclick="refreshCache()"></html:button>
</div>
<br>
<html:messages/>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss">
<table width="100%" cellpadding="0" cellspacing="0" class="tblContent">
	<tr>
      <td class="TdLeft">流程管理器缓存：</td>
      <td class="TdRight"><html:hidden name="procMgrCacheSize" property="procMgrCacheSize" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">流程管理器缓存数目：</td>
      <td class="TdRight"><html:hidden name="procMgrCacheItems" property="procMgrCacheItems" write="true"/></td>
    </tr>
	<tr>
      <td class="TdLeft">流程缓存：</td>
      <td class="TdRight"><html:hidden name="procCacheSize" property="procCacheSize" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">流程缓存数目：</td>
      <td class="TdRight"><html:hidden name="procCacheItems" property="procCacheItems" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">资源缓存：</td>
      <td class="TdRight"><html:hidden name="resCacheSize" property="resCacheSize" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft">资源缓存数目：</td>
      <td class="TdRight"><html:hidden name="resCacheItems" property="resCacheItems" write="true"/></td>
    </tr>
  </table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("工作流程－缓存管理－缓存明细");
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