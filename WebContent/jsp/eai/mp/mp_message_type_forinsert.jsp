<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>��Ϣ��������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpMessageType(){
	  var msgTypeCode = document.forms[0].msgTypeCode;
  	  if ( __isQuoteIn(msgTypeCode.value) )
	  {
	    alert("��Ϣ���ͱ��벻�ܺ������Ż�����!");
	    msgTypeCode.select();
	    msgTypeCode.focus();
	    return false;
	  }
      if (trim(msgTypeCode.value)=="")
	{
	  alert("��������Ϣ���ͱ��룡");    
	  msgTypeCode.focus();
	  return false;
	}
	if(byteLength(msgTypeCode.value)>30){
		alert("��Ϣ���ͱ��볤�ȹ�����");
		return false;
	}
    msgTypeCode.value = trim(msgTypeCode.value) ;
  	  var msgTypeName = document.forms[0].msgTypeName;
      if (trim(msgTypeName.value)=="")
	{
	  alert("��������Ϣ�������ƣ�");    
	  msgTypeName.focus();
	  return false;
	}
	if ( __isQuoteIn(msgTypeName.value) )
    {
      alert("��Ϣ�������Ʋ��ܺ��������ַ���"); 
      msgTypeName.focus();     
      return false;
    }
	if(byteLength(msgTypeName.value)>30){
		alert("��Ϣ�������Ƴ��ȹ�����");
		return false;
	}
    msgTypeName.value = trim(msgTypeName.value) ;
  	  var isCommonMsg = document.forms[0].isCommonMsg;
    isCommonMsg.value = trim(isCommonMsg.value) ;
  	  var objectTableName = document.forms[0].objectTableName;
	  var subscrLimit = document.forms[0].subscrLimit;
    subscrLimit.value = trim(subscrLimit.value) ;
  	  var mannerLimit = document.forms[0].mannerLimit;
    mannerLimit.value = trim(mannerLimit.value) ;
  	  var moduleCode = document.forms[0].moduleCode;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��Ϣ��������" >
<bsp:containbutton action="mpmessagetype.cmd?method=insert" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="mpmessagetype.cmd?method=insertContinue" text="���沢����" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="mpmessagetypequery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.MSG_TYPE_CODE")%>��</td>
                    <td class="tdRight"><html:text name="msgTypeCode" property="msgTypeCode" size="30" maxlength="30" /> <FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.MSG_TYPE_NAME")%>��</td>
                    <td class="tdRight"><html:text name="msgTypeName" property="msgTypeName" size="30" maxlength="30" /> <FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                   
					<tr style="display:none">
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.IS_COMMON_MSG")%>��</td>
                    <td class="tdRight">
                    <html:radioGroup name="isCommonMsg" property="isCommonMsg" collection="MP_MESSAGE_TYPE_IS_COMMON_MSG" labelProperty="value" labelKey="key" value="1"/>
                    </td>
                    </tr>                    
					<tr style="display:none"> 
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.OBJECT_TABLE_NAME")%>��</td>
                    <td class="tdRight"><html:text name="objectTableName" property="objectTableName" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr style="display:none">
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.SUBSCR_LIMIT")%>��</td>
                    <td class="tdRight"><html:text name="subscrLimit" property="subscrLimit" size="30" maxlength="100" value="*"/> <FONT COLOR=#ff0000>&nbsp;Ҫ���ƵĶ��������ͱ�ţ����֮����;�ָ*�������ơ�</FONT></td>
                    </tr>                    
					<tr style="display:none">
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_TYPE.MANNER_LIMIT")%>��</td>
                    <td class="tdRight"><html:text name="mannerLimit" property="mannerLimit" size="30" maxlength="100" value="*"/> <FONT COLOR=#ff0000>&nbsp;Ҫ���ƵĶ��ķ�ʽ��ţ����֮����;�ָ*�������ơ�</FONT></td>
                    </tr>                                      
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMpMessageType()) return;	
  document.forms[0].action ="mpmessagetype.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMpMessageType()) return;
  document.forms[0].action ="mpmessagetype.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpmessagetypequery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>