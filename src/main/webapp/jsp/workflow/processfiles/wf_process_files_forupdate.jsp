<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>�����ļ��б��޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkWfProcessFiles(){
	var processId = document.forms[0].processId;
      if ( __isQuoteIn(processId.value) )
    {
      alert("���̶���ID���ܺ������Ż�����!"); 
      processId.focus();     
      return false;
    }
	if (trim(processId.value)=="")
	{
	  alert("���������̶���ID��");   
	  processId.focus(); 
	  return false;
	}
    processId.value = trim(processId.value) ;
      	var name = document.forms[0].name;
  	if (trim(name.value)=="")
	{
	  alert("�������������ƣ�");   
	  name.focus(); 
	  return false;
	}
    name.value = trim(name.value) ;
      	var typeId = document.forms[0].typeId;
  	if (trim(typeId.value)=="")
	{
	  alert("���������ͱ�ţ�");   
	  typeId.focus(); 
	  return false;
	}
    typeId.value = trim(typeId.value) ;
      	var typeName = document.forms[0].typeName;
  	if (trim(typeName.value)=="")
	{
	  alert("�������������ƣ�");   
	  typeName.focus(); 
	  return false;
	}
    typeName.value = trim(typeName.value) ;
      	var organId = document.forms[0].organId;
  	if (trim(organId.value)=="")
	{
	  alert("����������������");   
	  organId.focus(); 
	  return false;
	}
    organId.value = trim(organId.value) ;
      	var organName = document.forms[0].organName;
  	if (trim(organName.value)=="")
	{
	  alert("�����������������ƣ�");   
	  organName.focus(); 
	  return false;
	}
    organName.value = trim(organName.value) ;
      	var isallsub = document.forms[0].isallsub;
  	if (trim(isallsub.value)=="")
	{
	  alert("�������Ƿ��������¼�������ʹ�ã�");   
	  isallsub.focus(); 
	  return false;
	}
    isallsub.value = trim(isallsub.value) ;
      	var formid = document.forms[0].formid;
	var formname = document.forms[0].formname;
	var reservetype = document.forms[0].reservetype;
	var authpr = document.forms[0].authpr;
	var createTime = document.forms[0].createTime;
	var saveimport = document.forms[0].saveimport;
	var versionid = document.forms[0].versionid;
	var istemplet = document.forms[0].istemplet;
	var description = document.forms[0].description;
	var note = document.forms[0].note;
	var note2 = document.forms[0].note2;
	var note3 = document.forms[0].note3;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="�����ļ��б��޸�" >
<bsp:containbutton action="wfprocessfiles.cmd?method=update" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="wfprocessfilesquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>	                   
<!-- ���̶���ID --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.PROCESS_ID")%>��  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="processId" property="processId" size="35"  onblur="checkId(this);"  maxlength="36" /> </td>
<!-- �������� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.NAME")%>��  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="name" property="name" size="35"  maxlength="100" /> </td>
					</tr>
					<tr>	                   
<!-- ���ͱ�� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.TYPE_ID")%>��  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="typeId" property="typeId" size="35"  maxlength="36" /> </td>
<!-- �������� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.TYPE_NAME")%>��  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="typeName" property="typeName" size="35"  maxlength="80" /> </td>
					</tr>
					<tr>	                   
<!-- �������� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.ORGAN_ID")%>��  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="organId" property="organId" size="35"  maxlength="40" /> </td>
<!-- ������������ --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.ORGAN_NAME")%>��  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="organName" property="organName" size="35"  maxlength="100" /> </td>
					</tr>
					<tr>	                   
<!-- �Ƿ��������¼�������ʹ�� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.ISALLSUB")%>��  <span style="color: red">*</span>   	</td>
                    <td class="tdRight">
                    	<html:select name="isallsub" property="isallsub" >
	                        <html:options collection="WFPROCESSFILES_ISALLSUB_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- ��ID --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.FORMID")%>�� 	</td>

                    <td class="tdRight"><html:text name="formid" property="formid" size="35"  maxlength="40" /> </td>
					</tr>
					<tr>	                   
<!-- ������ --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.FORMNAME")%>�� 	</td>

                    <td class="tdRight"><html:text name="formname" property="formname" size="35"  maxlength="100" /> </td>
<!-- ���������� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.RESERVETYPE")%>�� 	</td>

                    <td class="tdRight"><html:text name="reservetype" property="reservetype" size="35"  maxlength="40" /> </td>
					</tr>
					<tr>	                   
<!-- ���� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.AUTHPR")%>�� 	</td>

                    <td class="tdRight"><html:text name="authpr" property="authpr" size="35"  maxlength="80" /> </td>
<!-- ����ʱ�� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.CREATE_TIME")%>�� 	</td>

                    <td class="tdRight"><html:text name="createTime" property="createTime" size="35"  maxlength="20" /> </td>
					</tr>
					<tr>	                   
<!-- �Ƿ��� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.SAVEIMPORT")%>�� 	</td>

                    <td class="tdRight"><html:text name="saveimport" property="saveimport" size="35"  maxlength="10" /> </td>
<!-- �汾�� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.VERSIONID")%>�� 	</td>

                    <td class="tdRight"><html:text name="versionid" property="versionid" size="35"  maxlength="30" /> </td>
					</tr>
					<tr>	                   
<!-- �Ƿ�ģ�� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.ISTEMPLET")%>�� 	</td>
                    <td class="tdRight">
                    	<html:select name="istemplet" property="istemplet" >
	                        <html:options collection="WFPROCESSFILES_ISTEMPLET_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- ���� --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.DESCRIPTION")%>�� 	</td>

                    <td class="tdRight"><html:text name="description" property="description" size="35"  maxlength="300" /> </td>
					</tr>
					<tr>	                   
<!-- ��ע --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE")%>�� 	</td>

                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
<!-- NOTE2 --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE2")%>�� 	</td>

                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
					</tr>
					<tr>	                   
<!-- NOTE3 --><td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE3")%>�� 	</td>

                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="30" /> </td>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkWfProcessFiles()) return;	
  document.forms[0].action ="wfprocessfiles.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="wfprocessfilesquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function ctlent(event) {
	if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {
			forSave();
			return;
	}
}
</script>