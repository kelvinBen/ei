<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>ϵͳ������Ϣ������ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="ϵͳ������Ϣ������ϸ" >
<bsp:containbutton action="sysmessag.cmd?method=forupdate" text="�޸�" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="sysmessagquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$id" write="false"/>
	<tr>	                   
<!-- ���� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("SYS_MESSAG.ID")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="id" property="id" write="true"/></td>
     
<!-- ��Ϣ������ -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("SYS_MESSAG.Sender")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="sender" property="sender" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ��Ϣ������ -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("SYS_MESSAG.receiver")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="receiver" property="receiver" write="true"/></td>
     
<!-- ����ʱ�� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("SYS_MESSAG.Send_Time")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="sendTime" property="sendTime" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ��Ϣ���� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("SYS_MESSAG.Contents")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="contents" property="contents" write="true"/></td>
     
<!-- ��Ϣ���� -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("SYS_MESSAG.message_type")%>��</td>
      <td class="tdRight" width="35%">
      	<html:label name="messageType" property="messageType" collection="SYSMESSAG_MESSAGETYPE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
		</tr>
	<tr>	                   
<!-- ��Ϣ���� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("SYS_MESSAG.subject")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="subject" property="subject" write="true"/></td>
     
<!-- ��Ϣ״̬ -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("SYS_MESSAG.state")%>��</td>
      <td class="tdRight" width="35%">
      	<html:label name="state" property="state" collection="SYSMESSAG_STATE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
		</tr>
	<tr>	                   
<!-- NOTE -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("SYS_MESSAG.NOTE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
<!-- NOTE2 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("SYS_MESSAG.NOTE2")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
     
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
  document.forms[0].action ="sysmessag.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="sysmessagquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>