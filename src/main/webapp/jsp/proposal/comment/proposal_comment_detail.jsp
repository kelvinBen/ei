<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>�᰸���۱���ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="�᰸���۱���ϸ" >
<bsp:containbutton action="proposalcomment.cmd?method=forupdate" text="�޸�" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="proposalcommentquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$id" write="false"/>
	<tr>	                   
<!-- ���� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.ID")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="id" property="id" write="true"/></td>
     
<!-- �᰸id -->
  	 
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.PROPOSALID")%>��</td>
      <td class="tdRight" width="35%">
      	<html:label name="proposalid" property="proposalid" collection="PROPOSALCOMMENT_PROPOSALID_COLLECTION" labelProperty="$fk.showCol" labelKey="ID" />
      </td>
     
		</tr>
	<tr>	                   
<!-- ���� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NAME")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="name" property="name" write="true"/></td>
     
<!-- �������� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.CONTENT")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="content" property="content" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ���״̬ -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.STATE")%>��</td>
      <td class="tdRight" width="35%">
      	<html:label name="state" property="state" collection="PROPOSALCOMMENT_STATE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
<!-- ������ -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.SUGGEST")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="suggest" property="suggest" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ����� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWOR")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="reviewor" property="reviewor" write="true"/></td>
     
<!-- �����id -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWORID")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="revieworid" property="revieworid" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ���ʱ�� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWTIME")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="reviewtime" property="reviewtime" write="true"/></td>
     
<!-- ����ʱ�� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.TIME")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="time" property="time" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- �᰸��Ŀ -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.TITLE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="title" property="title" write="true"/></td>
     
<!-- ��ע -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- NOTE2 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE2")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
     
<!-- NOTE3 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE3")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note3" property="note3" write="true"/></td>
     
		</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="proposalcomment.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposalcommentquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>