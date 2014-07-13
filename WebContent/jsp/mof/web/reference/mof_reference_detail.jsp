<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>参考类型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<%
String refreshId=(String)request.getAttribute("refreshId");
if (refreshId==null||refreshId.equals("")){
    refreshId="";
}
String method = request.getParameter("method");
%>
<html:form  name="frmList"  action="">
<widgets:container title="参考类型明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
       <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.MOF_REFERENCE_ID")%>：</td>
       <td class="tdRight"><html:hidden name="mofReferenceId" property="mofReferenceId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.NAME")%>：</td>
      <td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.DISCRIPTION")%>：</td>
      <td class="tdRight"><html:hidden name="discription" property="discription" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.VALIDATIONTYPE")%>：</td>
      <td class="tdRight"><html:label name="validationtype" property="validationtype" collection="VALIDATION_TYPE" labelKey="key" labelProperty="value"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.HELPNO")%>：</td>
      <td class="tdRight"><html:hidden name="helpno" property="helpno" write="true"/></td>
    </tr>
    <tr>
    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.IMPL_CLASS")%>：</td>
    <td class="tdRight"><html:hidden name="implClass" property="implClass" write="true"/></td>
    </tr> 
    <tr>
    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.IMPL_LOGIC")%>：</td>
    <td class="tdRight"><html:hidden name="implLogic" property="implLogic" write="true"/></td>
    </tr> 
    <tr>
    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFERENCE.CATEGORY")%>：</td>
    <td class="tdRight"><html:label name="category" property="category" collection="MOFCATEGORY_COLLECTION" labelKey="CATEGORY_ID" labelProperty="NAME"/></td>
    </tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.forms[0].action ="mofreference.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofreferencequery.cmd";
  document.forms[0].submit();	
}
function init(){
    var refreshId ="<%=refreshId%>";
    var validationtype =document.forms[0].validationtype.value;
    if (validationtype=="Enumeration"){
        refreshId=refreshId==""?"__EnumValue":refreshId+"@C_E";
    }else if (validationtype=="Table"){
        refreshId=refreshId==""?"__TableValue":refreshId+"@C_T"
    }else if (validationtype=="DataValue"){
        refreshId="__DataValue";
    }else if(validationtype=="SysButton"){
    	refreshId="__SysBtnValue";
    }
    if (refreshId!=null&&refreshId!=""&&refreshId!=undefined){
       if(getTreeFrame()&&getTreeFrame().seltree){
           getTreeFrame().seltree.refreshNodeById(refreshId); 
       }
    }
 }
 if("<%=method%>"!="detail")
	 init();
</script>