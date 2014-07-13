<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
    String mofWindowId = request.getParameter("mofWindowId");
	if (mofWindowId==null){
	  mofWindowId="";
	}
   String mofWindowName = request.getParameter("mofWindowName");
	if (mofWindowName==null){
	  mofWindowName="";
	}
%>
<%
String refreshId=(String)request.getAttribute("refreshId");
if (refreshId==null||refreshId.equals("")){
    refreshId="";
}else{
    refreshId=refreshId+"@W";
}
%>
<HTML>
<HEAD>
<TITLE>Tab明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="Tab明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	<html:hidden name="mofWindowId" property="mofWindowId"/>
	<html:hidden name="mofTabId" property="mofTabId"/>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.MOF_WINDOW_ID")%>：</td>
	<td class="tdRight"><html:hidden name="mofWindowName" value="<%=mofWindowName%>" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.MOF_TABLE_ID")%>：</td>
	<td class="tdRight">
	<html:label name="mofTableId" property="mofTableId" collection="MOFTABLE_IDNAME_COLLECTION" labelProperty="NAME" labelKey="MOF_TABLE_ID" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.MOF_WINDOW_ID")%>：</td>
	<td class="tdRight">
	<html:label name="mofWindowId" property="mofWindowId" collection="MOFWINDOW_IDNAME_COLLECTION" labelProperty="NAME" labelKey="MOF_WINDOW_ID" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.NAME")%>：</td>
	<td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.DESCRIPTION")%>：</td>
	<td class="tdRight"><html:hidden name="description" property="description" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.SEQNO")%>：</td>
	<td class="tdRight"><html:hidden name="seqno" property="seqno" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.INTERCEPTOR")%>：</td>
	<td class="tdRight"><html:hidden name="interceptor" property="interceptor" write="true" /></td>
	</tr>       
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.ISSAMETAB")%>：</td>
	<td class="tdRight">
	<html:label name="issametab" property="issametab" collection="MOFTAB_ISSAMETAB_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.ISMAIN")%>：</td>
	<td class="tdRight">
	<html:label name="ismain" property="ismain" collection="MOFTAB_ISMAIN_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.HASTREE")%>：</td>
	<td class="tdRight">
	<html:label name="hasTree" property="hasTree" collection="MOFTAB_ISMAIN_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.ISDETAIL")%>：</td>
	<td class="tdRight">
	<html:label name="isdetail" property="isdetail" collection="MOFTAB_ISDETAIL_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.forms[0].action ="moftab.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="moftabquery.cmd";
  document.forms[0].submit();	
}
function init(){
    var refreshId ="<%=refreshId%>";
    if (refreshId!=null&&refreshId!=""&&refreshId!=undefined){
        if(getTreeFrame().seltree)
            getTreeFrame().seltree.refreshNodeById(refreshId); 
    }
 }
 init();
</script>