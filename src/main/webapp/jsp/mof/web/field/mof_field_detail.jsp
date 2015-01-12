<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
    String mofTabId = request.getParameter("mofTabId");
	if (mofTabId==null){
	  mofTabId="";
	}
   String mofTabName = request.getParameter("mofTabName");
	if (mofTabName==null){
	  mofTabName="";
	}
%>
<%
String refreshId=(String)request.getAttribute("refreshId");
if (refreshId==null||refreshId.equals("")){
    refreshId="";
}else{
    refreshId=refreshId+"@T";
}
%>
<HTML>
<HEAD>
<TITLE>域明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="域明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	<html:hidden name="mofFieldId" property="mofFieldId"/>
	<html:hidden name="mofTabId" value="<%=mofTabId%>"/>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.MOF_TAB_ID")%>：</td>
	<td class="tdRight"><html:hidden name="mofTabName" value="<%=mofTabName%>" write="true"/></td>
	</tr> 
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.MOF_COLUMN_ID")%>：</td>
	<td class="tdRight">
	<html:label name="mofColumnId" property="mofColumnId" collection="MOFCOLUMN_BYTABID_COLLECTION" labelProperty="NAME" labelKey="MOF_COLUMN_ID" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.NAME")%>：</td>
	<td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.DESCRIPTION")%>：</td>
	<td class="tdRight"><html:hidden name="description" property="description" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.ISDISPLAY")%>：</td>
	<td class="tdRight">
	<html:label name="isdisplay" property="isdisplay" collection="MOFFIELD_ISDISPLAY_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.DISPLAYLOGIC")%>：</td>
	<td class="tdRight"><html:hidden name="displaylogic" property="displaylogic" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.SEQNO")%>：</td>
	<td class="tdRight"><html:hidden name="seqno" property="seqno" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.ISREADONLY")%>：</td>
	<td class="tdRight">
	<html:label name="isreadonly" property="isreadonly" collection="MOFFIELD_ISREADONLY_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.ISQUERY")%>：</td>
	<td class="tdRight">
	<html:label name="isquery" property="isquery" collection="MOFFIELD_ISQUERY_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.ISSAMELINE")%>：</td>
	<td class="tdRight">
	<html:label name="issameline" property="issameline" collection="MOFFIELD_ISSAMELINE_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.LENGTH")%>：</td>
	<td class="tdRight"><html:hidden name="length" property="length" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_FIELD.ISCONDITION")%>：</td>
	<td class="tdRight">
	<html:label name="iscondition" property="iscondition" collection="MOFFIELD_ISCONDITION_COLLECTION" labelProperty="value" labelKey="key" />
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
  document.forms[0].action ="moffield.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="moffieldquery.cmd";
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