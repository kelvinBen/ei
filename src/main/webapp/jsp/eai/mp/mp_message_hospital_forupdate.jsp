<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>��Ϣ��������޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpMessageHospital(){
	var errorMsgId = document.forms[0].errorMsgId;
      if ( __isQuoteIn(errorMsgId.value) )
    {
      alert("����ַ���Ϣ��Ų��ܺ������Ż�����!"); 
      errorMsgId.focus();     
      return false;
    }
	if (trim(errorMsgId.value)=="")
	{
	  alert("���������ַ���Ϣ��ţ�");   
	  errorMsgId.focus(); 
	  return false;
	}
    errorMsgId.value = trim(errorMsgId.value) ;
      	var msgId = document.forms[0].msgId;
  	if (trim(msgId.value)=="")
	{
	  alert("��������Ϣ��ţ�");   
	  msgId.focus(); 
	  return false;
	}
    msgId.value = trim(msgId.value) ;
      	var sendTime = document.forms[0].sendTime;
	var receiveAddress = document.forms[0].receiveAddress;
	var receiveMannerCode = document.forms[0].receiveMannerCode;
	var attachment = document.forms[0].attachment;
	var status = document.forms[0].status;
	var description = document.forms[0].description;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��Ϣ��������޸�" >
<bsp:containbutton action="mpmessagehospital.cmd?method=update" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="mpmessagehospitalquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.ERROR_MSG_ID")%>��</td>
                    <td class="tdRight"><html:hidden name="errorMsgId" property="errorMsgId" write="true"/></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.MSG_ID")%>��</td>
                    <td class="tdRight"><html:hidden name="msgId" property="msgId" write="true"/></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.SEND_TIME")%>��</td>
                    <td class="tdRight"><html:hidden name="sendTime" property="sendTime" write="true"/></td>
                    </tr> 
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.RECEIVE_MANNER_CODE")%>��</td>
                    <td class="tdRight">
                    	    <html:select name="receiveMannerCode" property="receiveMannerCode" >
	                        	<html:options collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" property="RECEIVE_MANNER_CODE"/>
	                    	</html:select>                      
                    </td>
                    </tr>                                       
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.RECEIVE_ADDRESS")%>��</td>
                    <td class="tdRight"><html:text name="receiveAddress" property="receiveAddress" size="30" maxlength="30" /></td>
                    </tr>                                                         
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.STATUS")%>��</td>
                    <td class="tdRight"><html:hidden name="status" property="status" write="true"/></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.DESCRIPTION")%>��</td>
                    <td class="tdRight"><html:hidden name="description" property="description" write="true"/></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMpMessageHospital()) return;	
  document.forms[0].action ="mpmessagehospital.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpmessagehospitalquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>