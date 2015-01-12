<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE>消息增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript">
function checkMpMessage(){
    var msgTypeCode = document.forms[0].msgTypeCode;
      if (trim(msgTypeCode.value)=="-1")
	{
	  alert("请选择消息类型！");    
	  msgTypeCode.focus();
	  return false;
	}
    msgTypeCode.value = trim(msgTypeCode.value) ;
  	  var objectid = document.forms[0].objectid;
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
	
  	  var schedule = document.forms[0].schedule;
  	  schedule.value = trim(schedule.value) ;
	  var usefulTime = document.forms[0].usefulTime;
	  usefulTime.value = trim(usefulTime.value) ;
	  var createTime = document.forms[0].createTime;
	  createTime.value = trim(createTime.value) ;
	  var creater = document.forms[0].creater;
	  creater.value = trim(creater.value) ;
	  var receiveAddress = document.forms[0].receiveAddress;
	  receiveAddress.value = trim(receiveAddress.value) ;
	  var receiveMannerCode = document.forms[0].receiveMannerCode;
	  receiveMannerCode.value = trim(receiveMannerCode.value) ;
	  var status = document.forms[0].status;
	  status.value = trim(status.value) ;
	  if(receiveMannerCode.value!="-1"&&receiveAddress.value==""){
	  	alert("选择了消息接收方式，必须填写消息接收地址。");
	  	return false;
	  }
	  if(receiveMannerCode.value=="-1"&&receiveAddress.value!=""){
	  	alert("填写了消息接收地址，必须选择消息接收方式。");
	  	return false;
	  }
	  
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="" enctype="multipart/form-data">
<bsp:container title="消息增加" >
<bsp:containbutton action="mpmessage.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="mpmessage.cmd?method=insert" text="保存并确认" onclick="forSaveConfirm()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="mpmessagequery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr style="display:none">
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.MSG_ID")%>：</td>
                    <td class="tdRight">
                    	<html:text name="msgId" property="msgId" size="30" maxlength="30" />
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.MSG_TYPE_CODE")%>：</td>
                    <td class="tdRight">
                    	<html:select name="msgTypeCode" property="msgTypeCode" >
                    		<html:option value="-1">请选择</html:option>
		                    <html:options collection="mpMessageType" labelProperty="MSG_TYPE_NAME" property="MSG_TYPE_CODE"/>
		                </html:select><FONT COLOR=#ff0000>&nbsp;*</FONT>
                    </td>
                    </tr>                    
					<tr style="display:none">
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.OBJECTID")%>：</td>
                    <td class="tdRight"><html:text name="objectid" property="objectid" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.SUBJECT")%>：</td>
                    <td class="tdRight"><html:text name="subject" property="subject" size="60" maxlength="100" /><FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.CONTENT")%>：</td>
                    <td class="tdRight"><html:textarea name="content" property="content" cols="59" rows="5" maxlength="1024" /><FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr> 
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.CREATER")%>：</td>
                    <td class="tdRight">
                    	<html:hidden name="creater" property="creater"/>
                    	<html:hidden name="createrName" property="createrName" write="true"/>
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.SCHEDULE")%>：</td>
                    <td class="tdRight" valign="top">
                    <date:date name="schedule" property="schedule" divname="scheduleDiv" hastime="true" hasecond="false" zindex="2" sourceFormat="yyyy/MM/dd HH:mm" targetFormat="yyyyMMdd HH:mm"  readonly="true"></date:date>
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.USEFUL_TIME")%>：</td>
                    <td class="tdRight" valign="top">
                    	<date:date name="usefulTime" property="usefulTime" divname="usefulTimeDiv" hastime="true" zindex="1" hasecond="false" sourceFormat="yyyy/MM/dd HH:mm" targetFormat="yyyyMMdd HH:mm" readonly="true"></date:date>
                    </td>
                    </tr>                    
					<tr style="display:none">
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.CREATE_TIME")%>：</td>
                    <td class="tdRight"><html:text name="createTime" property="createTime" size="17" maxlength="17" /></td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.RECEIVE_MANNER_CODE")%>：</td>
                    <td class="tdRight">
                    	<html:select name="receiveMannerCode" property="receiveMannerCode" onchange="typeChange(this)">
                    		<html:option value="-1">请选择</html:option>
		                    <html:options collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" property="RECEIVE_MANNER_CODE"/>
		                 </html:select><FONT COLOR=#ff0000>&nbsp;如果选择消息接收方式，并填写了接收地址，则消息将直接发送到此处指定的接收地址。</FONT>
                    </td>
                    </tr>                                       
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.RECEIVE_ADDRESS")%>：</td>
                    <td class="tdRight"><html:text name="receiveAddress" property="receiveAddress" size="50" maxlength="1024" />
					<img name="image" src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectCant()" style="display:none">
                    <FONT COLOR=#ff0000>多个消息接收地址之间用;号分割。</FONT>
                    </td>
                    </tr>                    
                    <!--                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.ATTACHMENT")%>：</td>
                    <td class="tdRight"><html:file name="attachment" value=""/></td>
                    </tr>  
                    -->                  
					<tr  style="display:none">
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_MESSAGE.STATUS")%>：</td>
                    <td class="tdRight"><html:text name="status" property="status" size="10" maxlength="10" value="0"/></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
var cmd;
function typeChange(selectObject){
	if(selectObject.value=="DB"){
		document.all("image").style.display="";
		cmd = selectObject.value;
	}else{
		document.all("image").style.display="none";
	}
	document.all("receiveAddress").value="";
}

function selectCant(){
  var url ="jsp/help.jsp?url=user.cmd&method=getcheckboxroot";   
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
	  var arr = win[0].split(",");
	  var temp="";
	  for(var i=0;i<arr.length;i++){
		temp=temp+arr[i]+";";
	  }
    	var temp1=temp.substring(0,temp.length-1);
		document.all("receiveAddress").value=temp1;
  }
}
function forSaveConfirm(){
	document.forms[0].status.value="1";
	if(!checkMpMessage()) return;	
  document.forms[0].action ="mpmessage.cmd?method=insert";
  document.forms[0].submit();

}
function forSave(){
  if(!checkMpMessage()) return;	
  document.forms[0].action ="mpmessage.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMpMessage()) return;
  document.forms[0].action ="mpmessage.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpmessagequery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}

</script>