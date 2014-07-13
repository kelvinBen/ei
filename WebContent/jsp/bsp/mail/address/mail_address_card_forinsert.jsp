<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.TREETITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkMailAddress()
{
  var addressName = document.forms[0].addressName;
  if (trim(addressName.value)=="")
  {
    alert("请输入联系人姓名！");
    addressName.focus();
    return false;
  }
   if( __isQuoteIn( trim(addressName.value) ) )
  {
	alert("数据有误，请重新填写！");
    addressName.focus();
    return false;
  }
  if(byteLength(trim(addressName.value))>80)
  {
	alert("数据超长，请重新填写！");
	addressName.focus();   
	return false;
  }
  addressName.value = trim(addressName.value) ;

  var addressEmail = document.forms[0].addressEmail;
 if (trim(addressEmail.value)=="")
  {
    alert("请输入Email地址！");
    addressName.focus();
    return false;
  }
  if( addressEmail.value != "" )
  {
	if( !__checkEmail(addressEmail.value) )
	{
		alert("请输入正确的EMAIL格式！");
		addressEmail.focus();
		return false;
	}
  }
  addressEmail.value = trim(addressEmail.value) ;
  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="addressType" property="addressType" write="false"/>	
<html:hidden name="categoryId" property="categoryId" write="false"/>

<div class="btnareaCss">
	<html:button onclick="forSave()" name="btn_insert" value="保存"></html:button>
</div>
<fieldset class="FieldsetCss"><legend>联系人信息</legend>
  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">               
                    <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_CARD")%>：</td>
                    <td class="tdRight"><html:text name="addressName" property="addressName" size="30" maxlength="80" /><span id="addressName_span" class="xinghaoCss">*</span></td>
                    </tr>                    
                     <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_EMAIL")%>：</td>
                    <td class="tdRight"><html:text name="addressEmail" property="addressEmail" size="30" maxlength="80" onchange=""/><span id="addressName_span" class="xinghaoCss">*</span></td>
                    </tr>                    
   </table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMailAddress()) return;	
  //保证在提交之前用户只能点击按钮一次
  document.all("btn_insert").disabled=true;
  document.forms[0].action ="mailaddress.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMailAddress()) return;
  document.forms[0].action ="mailaddress.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mailaddressquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>