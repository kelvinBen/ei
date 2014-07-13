<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>订阅地址增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpReceiveAddress(){
  	  var subscrTypeCode = document.forms[0].subscrTypeCode;
      if (trim(subscrTypeCode.value)=="")
	{
	  alert("请输入订阅者类型编码！");    
	  subscrTypeCode.focus();
	  return false;
	}
    subscrTypeCode.value = trim(subscrTypeCode.value) ;
  	  var receiveMannerCode = document.forms[0].receiveMannerCode;
      if (trim(receiveMannerCode.value)=="")
	{
	  alert("请输入订阅方式编码！");    
	  receiveMannerCode.focus();
	  return false;
	}
    receiveMannerCode.value = trim(receiveMannerCode.value) ;
  	  var objectTableName = document.forms[0].objectTableName;
      if (trim(objectTableName.value)=="")
	{
	  alert("请输入对象表！");    
	  objectTableName.focus();
	  return false;
	}
    objectTableName.value = trim(objectTableName.value) ;
  	  var subscriberidField = document.forms[0].subscriberidField;
      if (trim(subscriberidField.value)=="")
	{
	  alert("请输入订阅者标识字段！");    
	  subscriberidField.focus();
	  return false;
	}
    subscriberidField.value = trim(subscriberidField.value) ;
  	  var subscriberidFieldType = document.forms[0].subscriberidFieldType;
      if (trim(subscriberidFieldType.value)=="")
	{
	  alert("请输入订阅者标识字段类型！");    
	  subscriberidFieldType.focus();
	  return false;
	}
    subscriberidFieldType.value = trim(subscriberidFieldType.value) ;
  	  var addressField = document.forms[0].addressField;
      if (trim(addressField.value)=="")
	{
	  alert("请输入消息订阅地址字段！");    
	  addressField.focus();
	  return false;
	}
    addressField.value = trim(addressField.value) ;
  	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="订阅地址增加" >
<bsp:containbutton action="mpreceiveaddress.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="mpreceiveaddress.cmd?method=insertContinue" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="mpreceiveaddressquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr style="display:none">
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.RECEIVE_ADDRESS_ID")%>：</td>
                    <td class="tdRight"><html:text name="receiveAddressId" property="receiveAddressId" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    	<td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.SUBSCR_TYPE_CODE")%>：</td>
                    	<td class="tdRight">
                    		<html:select name="subscrTypeCode" property="subscrTypeCode" value="ExtendUser" >
	                        	<html:options collection="mpSubscriberType" labelProperty="SUBSCR_TYPE_NAME" property="SUBSCR_TYPE_CODE"/>
	                    	</html:select>
	                    	<FONT COLOR=#ff0000>&nbsp;*</FONT>
                    	</td>
                    </tr>                    
					<tr>
                    	<td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.RECEIVE_MANNER_CODE")%>：</td>
	                    <td class="tdRight">
	                    	<html:select name="receiveMannerCode" property="receiveMannerCode" >
		                        	<html:options collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" property="RECEIVE_MANNER_CODE"/>
		                    </html:select>
		                    <FONT COLOR=#ff0000>&nbsp;*</FONT>
	                    </td>
                    </tr>                     
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.OBJECT_TABLE_NAME")%>：</td>
                    <td class="tdRight"><html:text name="objectTableName" property="objectTableName" size="30" maxlength="30" /><FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.SUBSCRIBERID_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="subscriberidField" property="subscriberidField" size="30" maxlength="30" /><FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.SUBSCRIBERID_FIELD_TYPE")%>：</td>
                    <td class="tdRight">
                            <html:select name="subscriberidFieldType" property="subscriberidFieldType" >
	                        	<html:option value="String">字符</html:option>
	                        	<html:option value="int">数字</html:option>
	                    	</html:select>
                    <FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.ADDRESS_FIELD")%>：</td>
                    <td class="tdRight"><html:text name="addressField" property="addressField" size="30" maxlength="30" /><FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMpReceiveAddress()) return;	
  document.forms[0].action ="mpreceiveaddress.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMpReceiveAddress()) return;
  document.forms[0].action ="mpreceiveaddress.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpreceiveaddressquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>