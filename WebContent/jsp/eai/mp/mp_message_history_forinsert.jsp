<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>��ʷ��Ϣ����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpMessageHistory(){
	  var msgId = document.forms[0].msgId;
  	  if ( __isQuoteIn(msgId.value) )
	  {
	    alert("��Ϣ��Ų��ܺ������Ż�����!");
	    msgId.select();
	    msgId.focus();
	    return false;
	  }
      if (trim(msgId.value)=="")
	{
	  alert("��������Ϣ��ţ�");    
	  msgId.focus();
	  return false;
	}
    msgId.value = trim(msgId.value) ;
  	  var msgTypeCode = document.forms[0].msgTypeCode;
      if (trim(msgTypeCode.value)=="")
	{
	  alert("��������Ϣ���ͱ��룡");    
	  msgTypeCode.focus();
	  return false;
	}
    msgTypeCode.value = trim(msgTypeCode.value) ;
  	  var objectid = document.forms[0].objectid;
	  var subject = document.forms[0].subject;
      if (trim(subject.value)=="")
	{
	  alert("��������Ϣ���⣡");    
	  subject.focus();
	  return false;
	}
    subject.value = trim(subject.value) ;
  	  var content = document.forms[0].content;
      if (trim(content.value)=="")
	{
	  alert("��������Ϣ���ݣ�");    
	  content.focus();
	  return false;
	}
    content.value = trim(content.value) ;
  	  var schedule = document.forms[0].schedule;
	  var usefulTime = document.forms[0].usefulTime;
	  var createTime = document.forms[0].createTime;
	  var sendTime = document.forms[0].sendTime;
	  var creater = document.forms[0].creater;
	  var receiveAddress = document.forms[0].receiveAddress;
	  var receiveMannerCode = document.forms[0].receiveMannerCode;
	  var status = document.forms[0].status;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��ʷ��Ϣ����" >
<bsp:containbutton action="mpmessagehistory.cmd?method=insert" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="mpmessagehistory.cmd?method=insertContinue" text="���沢����" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="mpmessagehistoryquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.MSG_ID")%>��</td>
                    <td class="tdRight"><html:text name="msgId" property="msgId" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.MSG_TYPE_CODE")%>��</td>
                    <td class="tdRight"><html:text name="msgTypeCode" property="msgTypeCode" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.OBJECTID")%>��</td>
                    <td class="tdRight"><html:text name="objectid" property="objectid" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.SUBJECT")%>��</td>
                    <td class="tdRight"><html:text name="subject" property="subject" size="100" maxlength="100" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.CONTENT")%>��</td>
                    <td class="tdRight"><html:text name="content" property="content" size="1024" maxlength="1024" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.SCHEDULE")%>��</td>
                    <td class="tdRight"><html:text name="schedule" property="schedule" size="14" maxlength="14" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.USEFUL_TIME")%>��</td>
                    <td class="tdRight"><html:text name="usefulTime" property="usefulTime" size="14" maxlength="14" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.CREATE_TIME")%>��</td>
                    <td class="tdRight"><html:text name="createTime" property="createTime" size="17" maxlength="17" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.SEND_TIME")%>��</td>
                    <td class="tdRight"><html:text name="sendTime" property="sendTime" size="17" maxlength="17" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.CREATER")%>��</td>
                    <td class="tdRight"><html:text name="creater" property="creater" size="30" maxlength="30" />
                    <html:text name="createName" property="createName" size="30" maxlength="30" />
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.RECEIVE_ADDRESS")%>��</td>
                    <td class="tdRight"><html:text name="receiveAddress" property="receiveAddress" size="1024" maxlength="1024" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.RECEIVE_MANNER_CODE")%>��</td>
                    <td class="tdRight"><html:text name="receiveMannerCode" property="receiveMannerCode" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HISTORY.STATUS")%>��</td>
                    <td class="tdRight"><html:text name="status" property="status" size="10" maxlength="10" /></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMpMessageHistory()) return;	
  document.forms[0].action ="mpmessagehistory.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMpMessageHistory()) return;
  document.forms[0].action ="mpmessagehistory.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpmessagehistoryquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>