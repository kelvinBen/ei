<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>�᰸/���ĸ�������ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="�᰸/���ĸ�������ϸ" >
<bsp:containbutton action="proposalattachment.cmd?method=forupdate" text="�޸�" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="proposalattachmentquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$id" write="false"/>
	<tr>	                   
<!-- ���� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.ID")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="id" property="id" write="true"/></td>
     
<!-- �᰸/����id -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.FOREIGNID")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="foreignid" property="foreignid" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- �������� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.FILENAME")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="filename" property="filename" write="true"/></td>
     
<!-- ����·�� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.FILEPATH")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="filepath" property="filepath" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ��ע -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.NOTE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
<!-- NOTE2 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.NOTE2")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- NOTE3 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.NOTE3")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note3" property="note3" write="true"/></td>
     
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="proposalattachment.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposalattachmentquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>