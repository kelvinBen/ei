<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>消息错误诊断增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpMessageHospital(){
	  var errorMsgId = document.forms[0].errorMsgId;
  	  if ( __isQuoteIn(errorMsgId.value) )
	  {
	    alert("错误分发消息编号不能含有引号或单引号!");
	    errorMsgId.select();
	    errorMsgId.focus();
	    return false;
	  }
      if (trim(errorMsgId.value)=="")
	{
	  alert("请输入错误分发消息编号！");    
	  errorMsgId.focus();
	  return false;
	}
    errorMsgId.value = trim(errorMsgId.value) ;
  	  var msgId = document.forms[0].msgId;
      if (trim(msgId.value)=="")
	{
	  alert("请输入消息编号！");    
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
<bsp:container title="消息错误诊断增加" >
<bsp:containbutton action="mpmessagehospital.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="mpmessagehospital.cmd?method=insertContinue" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="mpmessagehospitalquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.ERROR_MSG_ID")%>：</td>
                    <td class="tdRight"><html:text name="errorMsgId" property="errorMsgId" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.MSG_ID")%>：</td>
                    <td class="tdRight"><html:text name="msgId" property="msgId" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.SEND_TIME")%>：</td>
                    <td class="tdRight"><html:text name="sendTime" property="sendTime" size="17" maxlength="17" /></td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.RECEIVE_MANNER_CODE")%>：</td>
                    <td class="tdRight">
                    	    <html:select name="receiveMannerCode" property="receiveMannerCode" >
	                        	<html:options collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" property="RECEIVE_MANNER_CODE"/>
	                    	</html:select>           
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.RECEIVE_ADDRESS")%>：</td>
                    <td class="tdRight"><html:text name="receiveAddress" property="receiveAddress" size="30" maxlength="30" /></td>
                    </tr>                                                          
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.STATUS")%>：</td>
                    <td class="tdRight"><html:text name="status" property="status" size="10" maxlength="10" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.DESCRIPTION")%>：</td>
                    <td class="tdRight"><html:textarea name="description" property="description" cols="29" rows="3" maxlength="200" /></td>
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
  document.forms[0].action ="mpmessagehospital.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMpMessageHospital()) return;
  document.forms[0].action ="mpmessagehospital.cmd?method=insertContinue";
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