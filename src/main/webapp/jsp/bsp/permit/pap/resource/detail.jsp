<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.util.Global"%>

<HTML>
<HEAD>   
<TITLE>������ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<%
   String refreshId = (String) request.getAttribute("refreshId");
   String string = Global.getString("net.mast.bsp.isExactPermit");
%>

</HEAD>
<BODY topmargin="10px">

<bsp:container title="��Դ��ϸ" >
<html:form  name="frmList"  action="">
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
  
    <html:hidden name="functionId" property="functionId"/> 
	<tr>
      <td class="tdTitle">�������룺</td>
      <td class="tdRight"><html:hidden name="resourceId" property="resourceId" write="true"/></td>
    </tr>

	<tr>
        <td class="tdRight">&nbsp </td>
    </tr>
    		
    <tr>
      <td class="tdTitle">�������ƣ�</td>
      <td class="tdRight"><html:hidden name="resourceName" property="resourceName" write="true"/></td>
    </tr>
    
    <tr>
    <td class="tdRight">&nbsp </td>
    </tr>
    
     <tr>
      <td class="tdTitle">ҵ���壺</td>
      <td class="tdRight"><html:hidden name="resourceAlias" property="resourceAlias" write="true"/></td>
    </tr>
    <%
    if(string!=null && string.equals("true")){
    %>
        <tr>
    <td class="tdRight">&nbsp </td>
    </tr>
		<tr>
      <td class="tdTitle">�������ͣ�</td>
      <td class="tdRight"><html:hidden name="resTypeName" property="resTypeName" write="true"/></td>
    </tr>
		<%
		}else{
	%>
		    <tr style="display:none">
      <td class="tdTitle">�������ͣ�</td>
      <td class="tdRight"><html:hidden name="resTypeName" property="resTypeName" write="true"  /></td>
    </tr>
		<%
		}
       %>
    <tr>
    <td class="tdRight">&nbsp </td>
    </tr>
    
    <tr>
      <td class="tdTitle">URL��</td>
      <td class="tdRight"><html:hidden name="urlNames" property="urlNames" write="true"/></td>
    </tr>
    
    <tr>
    <td class="tdRight">&nbsp </td>
    </tr>
    
    <tr>
      <td class="tdTitle">��ȫ����</td>
      <td class="tdRight">
      	<html:label name="securityLevel" property="securityLevel" collection="PUBRESOURCES_SECURITYLEVEL_COLLECTION" labelProperty="LEVEL_NAME" labelKey="SECURITY_LEVEL" />
      </td>
    </tr>
    
    <tr>
    <td class="tdRight">&nbsp </td>
    </tr>
         
    <tr>   
      <td class="tdTitle">ȱʡ������</td>
      <td class="tdRight"><html:checkbox name="isDefault" property="isDefault" value="1"/></td>
    </tr> 
    
    <tr>
    <td class="tdRight">&nbsp </td>
    </tr>
    
    <tr>   
      <td class="tdTitle">��Ҫ��ƣ�</td>
      <td class="tdRight"><html:checkbox name="isAudit" property="isAudit" value="1"/></td>
    </tr> 
					
  </table>
</div>
</html:form>
</bsp:container>

</BODY>
</HTML>
<script language="javascript">

function init(){
  var refreshId = "<%=refreshId%>"; 
  getTreeFrame().seltree.refreshNodeById(refreshId);
}
init();

</script>