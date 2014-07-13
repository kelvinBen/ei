<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
    String refresh_id=(String)request.getAttribute("REFRESHID");
    boolean flag=true;
    if(refresh_id==null || refresh_id.equals("")){
    flag=false;
    }
	
%>
<web:js src="bsp.js"/>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("ORGAN_STRU.DETAIL.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title='<%=ResourcesFactory.getString("ORGAN_STRU.DETAIL.TITLE")%>' >
<bsp:containbutton action="organstru.cmd?method=forupdate" name="updatebutton" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>' onclick="forUpdate()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$organId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.PARENT_ID")%>:</td>
      <td class="tdRight"><html:hidden name="parentId" property="parentId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_ID")%>:</td>
      <td class="tdRight"><html:hidden name="organId" property="organId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_ALIAS")%>:</td>
      <td class="tdRight"><html:hidden name="organAlias" property="organAlias" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_TYPE")%>:</td>
      <td class="tdRight">
      	<html:label name="organType" property="organType" collection="ORGANSTRU_ORGANTYPE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.PRINCIPAL_ID")%>:</td>
      <td class="tdRight"><html:hidden name="principalName" property="principalName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.BEGIN_DATE")%>:</td>
      <td class="tdRight"><html:hidden name="beginDate" property="beginDate" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.END_DATE")%>:</td>
      <td class="tdRight"><html:hidden name="endDate" property="endDate" write="true"/></td>
    </tr> 
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function init(){
var flag=<%=flag%>; 
 if(flag){
        var parent_id = "<%=refresh_id%>";
        getTreeFrame().seltree.openNodeById(parent_id);
        getTreeFrame().seltree.refreshNodeById(parent_id);        
}
if(document.all("parentId").value=="root"&document.all("organType").value=="root")	
		document.all("updatebutton").style.display="none";

}
init();
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="organstru.cmd?method=forupdate";
  document.forms[0].submit();	
}
</script>