<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>用户消息增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpUserMessage(){
	  var userMessageId = document.forms[0].userMessageId;
  	  if ( __isQuoteIn(userMessageId.value) )
	  {
	    alert("用户消息编号不能含有引号或单引号!");
	    userMessageId.select();
	    userMessageId.focus();
	    return false;
	  }
      if (trim(userMessageId.value)=="")
	{
	  alert("请输入用户消息编号！");    
	  userMessageId.focus();
	  return false;
	}
    userMessageId.value = trim(userMessageId.value) ;
  	  var msgTypeCode = document.forms[0].msgTypeCode;
      if (trim(msgTypeCode.value)=="")
	{
	  alert("请输入消息类型编码！");    
	  msgTypeCode.focus();
	  return false;
	}
    msgTypeCode.value = trim(msgTypeCode.value) ;
  	  var subscriberid = document.forms[0].subscriberid;
      if (trim(subscriberid.value)=="")
	{
	  alert("请输入订阅者标识！");    
	  subscriberid.focus();
	  return false;
	}
    subscriberid.value = trim(subscriberid.value) ;
  	  var subscrTypeCode = document.forms[0].subscrTypeCode;
      if (trim(subscrTypeCode.value)=="")
	{
	  alert("请输入订阅者类型编码！");    
	  subscrTypeCode.focus();
	  return false;
	}
    subscrTypeCode.value = trim(subscrTypeCode.value) ;
  	  var subject = document.forms[0].subject;
      if (trim(subject.value)=="")
	{
	  alert("请输入消息标题！");    
	  subject.focus();
	  return false;
	}
    subject.value = trim(subject.value) ;
  	  var content = document.forms[0].content;
      if (trim(content.value)=="")
	{
	  alert("请输入消息内容！");    
	  content.focus();
	  return false;
	}
    content.value = trim(content.value) ;
  	  var creater = document.forms[0].creater;
	  var createTime = document.forms[0].createTime;
	  var arriveTime = document.forms[0].arriveTime;
	  var attachment = document.forms[0].attachment;
	  var status = document.forms[0].status;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="用户消息增加" >
<bsp:containbutton action="mpusermessage.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="mpusermessage.cmd?method=insertContinue" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="mpusermessagequery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.USER_MESSAGE_ID")%>：</td>
                    <td class="tdRight"><html:text name="userMessageId" property="userMessageId" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.MSG_TYPE_CODE")%>：</td>
                    <td class="tdRight">
                    	<html:select name="msgTypeCode" property="msgTypeCode" >
		                        <html:options collection="mpMessageType" labelProperty="MSG_TYPE_NAME" property="MSG_TYPE_CODE"/>
		                </html:select>
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.SUBSCRIBERID")%>：</td>
                    <td class="tdRight"><html:text name="subscriberid" property="subscriberid" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.SUBSCR_TYPE_CODE")%>：</td>
                    <td class="tdRight">
                    	    <html:select name="subscrTypeCode" property="subscrTypeCode" >
	                        	<html:options collection="mpSubscriberType" labelProperty="SUBSCR_TYPE_NAME" property="SUBSCR_TYPE_CODE"/>
	                    	</html:select>
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.SUBJECT")%>：</td>
                    <td class="tdRight"><html:text name="subject" property="subject" size="100" maxlength="100" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.CONTENT")%>：</td>
                    <td class="tdRight"><html:textarea name="content" property="content" cols="29" rows="3" maxlength="1024" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.CREATER")%>：</td>
                    <td class="tdRight"><html:text name="creater" property="creater" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.CREATE_TIME")%>：</td>
                    <td class="tdRight"><html:text name="createTime" property="createTime" size="17" maxlength="17" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.ARRIVE_TIME")%>：</td>
                    <td class="tdRight"><html:text name="arriveTime" property="arriveTime" size="17" maxlength="17" /></td>
                    </tr>  
                    <!--                  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.ATTACHMENT")%>：</td>
                    <td class="tdRight"><html:text name="attachment" property="attachment" size="8" maxlength="8" /></td>
                    </tr>                    
					<tr>
					-->
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_USER_MESSAGE.STATUS")%>：</td>
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
  if(!checkMpUserMessage()) return;	
  document.forms[0].action ="mpusermessage.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMpUserMessage()) return;
  document.forms[0].action ="mpusermessage.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpusermessagequery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>