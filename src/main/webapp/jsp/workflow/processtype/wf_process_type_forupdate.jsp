<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>���������޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkWfProcessType(){
	var typeId = document.forms[0].typeId;
      if ( __isQuoteIn(typeId.value) )
    {
      alert("���ͱ�Ų��ܺ������Ż�����!"); 
      typeId.focus();     
      return false;
    }
	if (trim(typeId.value)=="")
	{
	  alert("���������ͱ�ţ�");   
	  typeId.focus(); 
	  return false;
	}
    typeId.value = trim(typeId.value) ;
      	var name = document.forms[0].name;
  	if (trim(name.value)=="")
	{
	  alert("�������������ƣ�");   
	  name.focus(); 
	  return false;
	}
    name.value = trim(name.value) ;
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
      	var sortnum = document.forms[0].sortnum;
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
<bsp:container title="���������޸�" >
<bsp:containbutton action="processtype.cmd?method=update" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton   text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
		<tr>	                   
<!-- ���ͱ�� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.TYPE_ID")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="typeId" property="typeId" size="35"  readonly="true"  maxlength="36" /> </td>
<!-- �������� --></tr>
		<tr>
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.NAME")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="name" property="name" size="35"  maxlength="80" /> </td>
		</tr>
		<tr>	                   
<!-- �������� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.ORGAN_ID")%>ID��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"> <html:text name="organId" property="organId" size="35" readonly="true" onclick="selectNewDeptIdTree()" maxlength="40" /> </td>

<!-- ������������ --></tr>
		<tr>
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.ORGAN_NAME")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="organName" property="organName" size="35" readonly="true" onclick="selectNewDeptIdTree()"  maxlength="100" /> 
                   
                    </td>
		</tr>
		<tr>	                   
<!-- �Ƿ��������¼�������ʹ�� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.ISALLSUB")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight">
                    	<html:select name="isallsub" property="isallsub" >
	                        <html:options collection="WFPROCESSTYPE_ISALLSUB_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- ��ʾ˳�� </tr>
		<tr>
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.SORTNUM")%>�� 	</td>
                    <td class="tdRight"><html:text name="sortnum" property="sortnum" size="35"  maxlength="8" /> </td>
		</tr>-->
		<tr>	                   
<!-- ���� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.DESCRIPTION")%>�� 	</td>
                    <td class="tdRight"><html:text name="description" property="description" size="35"  maxlength="300" /> </td>
<!-- ��ע 
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.NOTE")%>�� 	</td>
                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
-->		</tr>
		<tr>	                   
<!-- NOTE2 
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.NOTE2")%>�� 	</td>
                  <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
 --> <!-- NOTE3 
					<td class="tdTitle"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.NOTE3")%>�� 	</td>
                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="30" /> </td>
-->		</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkWfProcessType()) return;	
  document.forms[0].action ="processtype.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
if(window.opener){
	window.close();
}else{
	
  document.forms[0].action ="processtypequery.cmd";
  document.forms[0].submit();	
  }
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

function selectNewDeptIdTree(){
  var url ="stru.cmd?method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=1&showOrganType=1,2";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
	  document.all("organId").value=win[0];
	  document.all("organName").value=win[1];
  }
 
}

</script>