<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>类别管理明细</TITLE>
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
<html:hidden name="primaryKey" value=""/>
<widgets:container title="类别管理明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$categoryId" write="false"/>
    <tr>
      <td class="tdTitle" style="display:none"><%=ResourcesFactory.getString("MOF_CATEGORY.CATEGORY_ID")%>：</td>
      <td class="tdRight"><html:hidden name="categoryId" property="categoryId"  style="display:none"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_CATEGORY.NAME")%>：</td>
      <td class="tdRight"><html:hidden name="categoryName" property="categoryName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_CATEGORY.PARENT")%>：</td>
      <td class="tdRight"><html:hidden name="parent" property="parent" write="true"/></td>
    </tr>
    <tr>
    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_CATEGORY.TYPE")%>：</td>
    <td class="tdRight"><html:hidden name="type" property="type" write="true"/></td>
  </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_CATEGORY.NOTE")%>：</td>
      <td class="tdRight"><html:hidden name="note" property="note" write="true"/></td>
    </tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="mofcategory.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofcategoryquery.cmd?clear=true";
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