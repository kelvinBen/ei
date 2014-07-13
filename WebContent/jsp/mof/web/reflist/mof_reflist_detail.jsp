<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
    String mofReferenceId = request.getParameter("mofReferenceId");
    if (mofReferenceId==null){
	mofReferenceId="";
	}
    String mofReferenceName = request.getParameter("mofReferenceName");
    if (mofReferenceName==null){
	mofReferenceName="";
	}
%>
<%
String refreshId=(String)request.getAttribute("refreshId");
if (refreshId==null||refreshId.equals("")){
    refreshId="";
}else{
    refreshId=refreshId+"@E";
}
%>
<HTML>
<HEAD>
<TITLE>参考明细明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="参考明细明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	<html:hidden name="mofReferenceId" value="<%=mofReferenceId%>"></html:hidden>    
	<html:hidden name="mofReflistId" property="mofReflistId"></html:hidden>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFLIST.MOF_REFERENCE_ID")%>：</td>
	<td class="tdRight"><html:hidden name="mofReferenceName" value="<%=mofReferenceName%>" write="true"></html:hidden></td>
	</tr>      		
	<tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFLIST.NAME")%>：</td>
	<td class="tdRight"><html:hidden name="value" property="value" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFLIST.DESCRIPTION")%>：</td>
	<td class="tdRight"><html:hidden name="description" property="description" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFLIST.VALUE")%>：</td>
	<td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
	</tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.forms[0].action ="mofreflist.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofreflistquery.cmd";
  document.forms[0].submit();	
}
function init(){
    var refreshId ="<%=refreshId%>";
    if (refreshId!=null&&refreshId!=""&&refreshId!=undefined){
        if(getTreeFrame()&&getTreeFrame().seltree)
            getTreeFrame().seltree.refreshNodeById(refreshId); 
    }
 }
 init();
</script>