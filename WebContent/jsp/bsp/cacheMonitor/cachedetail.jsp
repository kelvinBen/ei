<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ComponentFactory"%>
<%@ page import="net.mast.commons.cache.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>缓存明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">

<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>

</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">

<bsp:container title="缓存明细" >
<bsp:containbutton onclick="forReturn()" text="返回" ></bsp:containbutton>
<bsp:containbutton onclick="forClear()" text="清空" ></bsp:containbutton>
<bsp:containbutton onclick="forClearGroup()" text="清空当前缓存所在组的所有缓存" ></bsp:containbutton>

<html:hidden name="primaryKey" property="$groupName+'@'+cacheName" write="false"/>

  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle">缓存组名：</td>
      <td class="tdRight"><html:hidden name="groupName" property="groupName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">缓存名称：</td>
      <td class="tdRight"><html:hidden name="cacheName" property="cacheName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">登记时间：</td>
      <td class="tdRight"><html:hidden name="createTime" property="createTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">命中次数：</td>
      <td class="tdRight"><html:hidden name="hits" property="hits" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">失误次数：</td>
      <td class="tdRight"><html:hidden name="misses" property="misses" write="true"/></td>
    </tr>
	<tr>
      <td class="tdTitle">清空次数：</td>
      <td class="tdRight"><html:hidden name="clears" property="clears" write="true"/></td>
    </tr>
	<tr>
      <td class="tdTitle">缓存最大容量：</td>
      <td class="tdRight"><html:hidden name="maxSize" property="maxSize" write="true"/></td>
    </tr>
	<tr>
      <td class="tdTitle">缓存已用容量：</td>
      <td class="tdRight"><html:hidden name="usedSize" property="usedSize" write="true"/></td>
    </tr>
		<tr>
      <td class="tdTitle">描述：</td>
      <td class="tdRight"><html:hidden name="description" property="description" write="true"/></td>
    </tr>
  </table>

</bsp:container>
</html:form>
</body>

<script language="javascript">
function forReturn(){
  document.forms[0].action ="bspCache.cmd?method=query";    
  document.forms[0].submit()
}
function forClear(){
  document.forms[0].action ="bspCache.cmd?method=clear";    
  document.forms[0].submit()
  
  }
function forClearGroup(){
  document.forms[0].action ="bspCache.cmd?method=clearGroup";    
  document.forms[0].submit()
  
  }

</script>
</html>
