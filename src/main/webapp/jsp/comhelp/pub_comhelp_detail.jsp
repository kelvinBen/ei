<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>ͨ��ѡ����ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="ͨ��ѡ����ϸ" >
<bsp:containbutton action="pubcomhelp.cmd?method=forupdate" text="�޸�" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="pubcomhelpquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$helpId" write="false"/>
	<tr>	                   
<!-- ������� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_ID")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="helpId" property="helpId" write="true"/></td>
     
<!-- �������� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_TITLE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="helpTitle" property="helpTitle" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ��ʾѡ���SQL -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_SQL")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="helpSql" property="helpSql" write="true"/></td>
     
<!-- Ψһ��ʾ�ֶ� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.ID_FIELD")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="idField" property="idField" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- �����ֶ� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.NAME_FIELD")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="nameField" property="nameField" write="true"/></td>
     
<!-- ��ʾ�ֶ� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.SHOW_FIELD")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="showField" property="showField" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- �����ֶ� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.RETURN_FIELD")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="returnField" property="returnField" write="true"/></td>
     
<!-- ��ѯ�����ֶ� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.SHEARCH_FIELD")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="shearchField" property="shearchField" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- �����ֶ���ʾ���� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.SHOW_NAME")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="showName" property="showName" write="true"/></td>
     
<!-- �����õı��� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_TABLE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="helpTable" property="helpTable" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ˵�� -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_NOTE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="helpNote" property="helpNote" write="true"/></td>
     
<!-- ����Դ -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.DATASOURCE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="datasource" property="datasource" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- ��ע -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
<!-- NOTE2 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE2")%>��</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- NOTE3 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE3")%>��</td>
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
  document.forms[0].action ="pubcomhelp.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="pubcomhelpquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>