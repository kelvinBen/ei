<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>������Ϣ����ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="������Ϣ����ϸ" >
<bsp:containbutton action="proposaljoint.cmd?method=forupdate" text="�޸�" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="proposaljointquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$id" write="false"/>
	<tr>	                   
<!-- ���� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.ID")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="id" property="id" write="true"/></td>
     
<!-- �᰸id -->
  	 
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.PROPOSALID")%>��</td>
      <td class="tdRight" width="35%">
      	<html:label name="proposalid" property="proposalid" collection="PROPOSALJOINT_PROPOSALID_COLLECTION" labelProperty="$fk.showCol" labelKey="ID" />
      </td>
     
		</tr>
	<tr>	                   
<!-- ίԱ��� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.NO")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="no" property="no" write="true"/></td>
     
<!-- ίԱ���� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.NAME")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="name" property="name" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ��ϵ�绰 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.PHONE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="phone" property="phone" write="true"/></td>
     
<!-- ������λ -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.DEPT")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="dept" property="dept" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ְ�� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.DUTY")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="duty" property="duty" write="true"/></td>
     
<!-- ��� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.SORTINDEX")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="sortindex" property="sortindex" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ������� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.CONSTITUENCY")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="constituency" property="constituency" write="true"/></td>
     
<!-- ��ע -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- NOTE2 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE2")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
     
<!-- NOTE3 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE3")%>��</td>
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
  document.forms[0].action ="proposaljoint.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposaljointquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>