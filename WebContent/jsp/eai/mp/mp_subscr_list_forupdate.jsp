<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>��Ϣ�����б��޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpSubscrList(){
	var subscrId = document.forms[0].subscrId;
      if ( __isQuoteIn(subscrId.value) )
    {
      alert("��Ϣ���ı�Ų��ܺ������Ż�����!"); 
      subscrId.focus();     
      return false;
    }
	if (trim(subscrId.value)=="")
	{
	  alert("��������Ϣ���ı�ţ�");   
	  subscrId.focus(); 
	  return false;
	}
    subscrId.value = trim(subscrId.value) ;
      	var msgTypeCode = document.forms[0].msgTypeCode;
  	if (trim(msgTypeCode.value)=="")
	{
	  alert("��������Ϣ���ͱ��룡");   
	  msgTypeCode.focus(); 
	  return false;
	}
    msgTypeCode.value = trim(msgTypeCode.value) ;
      	var subscriberid = document.forms[0].subscriberid;
  	if (trim(subscriberid.value)=="")
	{
	  alert("�����붩���߱�ʶ��");   
	  subscriberid.focus(); 
	  return false;
	}
    subscriberid.value = trim(subscriberid.value) ;
      	var subscrTypeCode = document.forms[0].subscrTypeCode;
  	if (trim(subscrTypeCode.value)=="")
	{
	  alert("�����붩�������ͱ��룡");   
	  subscrTypeCode.focus(); 
	  return false;
	}
    subscrTypeCode.value = trim(subscrTypeCode.value) ;
      	var receiveMannerCode = document.forms[0].receiveMannerCode;
  	if (trim(receiveMannerCode.value)=="")
	{
	  alert("��������Ϣ���շ�ʽ���룡");   
	  receiveMannerCode.focus(); 
	  return false;
	}
    receiveMannerCode.value = trim(receiveMannerCode.value) ;
      	var receiveAddress = document.forms[0].receiveAddress;
	var filter = document.forms[0].filter;
	
	var extendinfo = document.forms[0].extendinfo;
	 if(document.getElementById("trtr").style.display!="none"){
	 	if(extendinfo.value=="-1"){
	 		alert("��ѡ����չ�û����ڵı�");
	 		return false;
	 	}
	 }else{
	 	extendinfo.value =""; 
	 }
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��Ϣ�����б��޸�" >
<bsp:containbutton action="mpsubscrlist.cmd?method=update" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="mpsubscrlistquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.SUBSCR_ID")%>��</td>
                    <td class="tdRight"><html:hidden name="subscrId" property="subscrId" write="true"/></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.MSG_TYPE_CODE")%>��</td>
                    <td class="tdRight">
                    	<html:select name="msgTypeCode" property="msgTypeCode" >
		                        <html:options collection="mpMessageType" labelProperty="MSG_TYPE_NAME" property="MSG_TYPE_CODE"/>
		                </html:select>
		                <FONT COLOR=#ff0000>&nbsp;*</FONT>
                    </td>
                    </tr> 
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.SUBSCR_TYPE_CODE")%>��</td>
                    <td class="tdRight">
                           <html:select name="subscrTypeCode" property="subscrTypeCode"  onchange="typeChange(this)">
	                        	<html:options collection="mpSubscriberType" labelProperty="SUBSCR_TYPE_NAME" property="SUBSCR_TYPE_CODE" />
	                    	</html:select>
	                    	<FONT COLOR=#ff0000>&nbsp;*</FONT>
                    </td>
                    </tr> 
                    <tr id="trtr" style="display:none">
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.EXTENDINFO")%>��</td>
                    <td class="tdRight">
                    	    <html:select name="extendinfo" property="extendinfo">
                    	    	<html:option value="-1">��ѡ��</html:option>
	                        	<html:options collection="extendusers" labelProperty="label" property="key"/>
	                    	</html:select>						
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.SUBSCRIBERID")%>��</td>
                    <td class="tdRight">
                    	<html:text name="subscriberid" property="subscriberid"  size="30" maxlength="30"/>
                    	<img name="image" src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectTree()" style="display:none">
                    <FONT COLOR=#ff0000>&nbsp;*</FONT>
                    </td>
                    </tr>                                       
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.RECEIVE_MANNER_CODE")%>��</td>
                    <td class="tdRight">
                    	    <html:select name="receiveMannerCode" property="receiveMannerCode" >
	                        	<html:options collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" property="RECEIVE_MANNER_CODE"/>
	                    	</html:select> 
	                    	<FONT COLOR=#ff0000>&nbsp;*</FONT>                   
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.RECEIVE_ADDRESS")%>��</td>
                    <td class="tdRight"><html:text name="receiveAddress" property="receiveAddress" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.FILTER")%>��</td>
                    <td class="tdRight"><html:text name="filter" property="filter" size="30" maxlength="30" />
                    <FONT COLOR=#ff0000>&nbsp;���Թ�����Ϣ�����а��������ݵ���Ϣ��</FONT>
                    </td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
var cmd;
document.all("subscrTypeCode").onchange();
function typeChange(selectObject){
	if(selectObject.value=="Organ"||selectObject.value=="User"||selectObject.value=="Role"){
		document.all("image").style.display="";
		cmd = selectObject.value;
	}else{
		document.all("image").style.display="none";
	}
	if(selectObject.value=="ExtendUser"){
		document.getElementById("trtr").style.display="";
	}else{
		document.getElementById("trtr").style.display="none";
	}
	//document.all("subscriberid").value="";
	document.all("extendinfo").value="-1";
}
function selectTree(){
  var url;
  if(cmd=="Organ"){
  	url="stru.cmd?method=getSelectRoot&organType=1,2&struType=00&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=1&showOrganType=1,2"; 
  }
  if(cmd=="User"){
  	url="user.cmd?method=getchoiceroot";
  }
  if(cmd=="Role"){
  	url = "role.cmd?method=choiceroot";
  }     
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	 document.all("subscriberid").value="";	
  }else{
	 document.all("subscriberid").value=win[0];
  }
}
function forSave(){
  if(!checkMpSubscrList()) return;	
  document.forms[0].action ="mpsubscrlist.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpsubscrlistquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>