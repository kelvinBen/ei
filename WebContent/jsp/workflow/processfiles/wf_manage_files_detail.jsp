<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>���̶����ļ���ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="���̶����ļ���ϸ" >
<bsp:containbutton action="wfmanagefiles.cmd?method=forupdate" text="�޸�" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="wfmanagefilesquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$processType+':'+fileName" write="false"/>
	<tr>	                   
<!-- ���̶���ID -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_MANAGE_FILES.PROCESS_TYPE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="processType" property="processType" write="true"/></td>
     
<!-- �ļ����� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_MANAGE_FILES.FILE_NAME")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="fileName" property="fileName" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- �ļ����� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_MANAGE_FILES.FILE_CONTENT")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="fileContent" property="fileContent" write="true"/></td>
     
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="wfmanagefiles.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="wfmanagefilesquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>