<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<%
String refreshId=(String)request.getAttribute("refreshId");
if (refreshId==null||refreshId.equals("")){
    refreshId="";
}
%>
<html:form  name="frmList"  action="">
<widgets:container title="表明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <html:hidden name="mofTableId" property="mofTableId"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.NAME")%>：</td>
      <td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.TABLENAME")%>：</td>
      <td class="tdRight"><html:hidden name="tablename" property="tablename" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.ACCESSLEVEL")%>：</td>
      <td class="tdRight"><html:hidden name="accesslevel" property="accesslevel" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.DESCRIPTION")%>：</td>
      <td class="tdRight"><html:hidden name="description" property="description" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.ISUPDATEABLE")%>：</td>
      <td class="tdRight">
      	<html:label name="isupdateable" property="isupdateable" collection="MOFTABLE_ISUPDATEABLE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.ISACTIVE")%>：</td>
      <td class="tdRight">
      	<html:label name="isactive" property="isactive" collection="MOFTABLE_ISACTIVE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.ISVIEW")%>：</td>
      <td class="tdRight">
      	<html:label name="isview" property="isview" collection="MOFTABLE_ISVIEW_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    
	<tr>
       <td class="tdTitle"><%=ResourcesFactory.getString("MOF_TABLE.VALIDATION")%>：</td>
       <td class="tdRight"><html:hidden name="validation" property="validation" write="true" />
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
  document.forms[0].action ="moftable.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="moftablequery.cmd";
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