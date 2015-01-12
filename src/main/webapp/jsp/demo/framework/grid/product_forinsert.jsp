<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("PRODUCT.INSERT.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<web:js src="mastfunction.js"/>
<script language="javascript">
function checkProduct(){
	  var itemProductid = document.forms[0].itemProductid;
  	  if ( __isQuoteIn(itemProductid.value) )
	  {
	    alert('<%=ResourcesFactory.getString("PRODUCT.CODEFORMAT")%>');
	    itemProductid.select();
	    itemProductid.focus();
	    return false;
	  }
      if (trim(itemProductid.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("PRODUCT.INPUTPRODUCTCODE")%>');    
	  itemProductid.focus();
	  return false;
	}
    itemProductid.value = trim(itemProductid.value) ;
  	  var itemProductname = document.forms[0].itemProductname;
      if (trim(itemProductname.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("PRODUCT.INPUTPRODUCTNAME")%>');    
	  itemProductname.focus();
	  return false;
	}
    itemProductname.value = trim(itemProductname.value) ;
  	  var itemUnitprice = document.forms[0].itemUnitprice;
      if (trim(itemUnitprice.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("PRODUCT.INPUTPRODUCTPRICE")%>');    
	  itemUnitprice.focus();
	  return false;
	}
    itemUnitprice.value = trim(itemUnitprice.value) ;
      if (! __isFloat(itemUnitprice.value) )   
    {
      alert('<%=ResourcesFactory.getString("PRODUCT.INVALIDFLOATPRICE")%>');
      itemUnitprice.focus();
      return false;
    }   
	  var itemQuantity = document.forms[0].itemQuantity;
      if (trim(itemQuantity.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("PRODUCT.INPUTPRODUCTNUMBER")%>');    
	  itemQuantity.focus();
	  return false;
	}
    itemQuantity.value = trim(itemQuantity.value) ;
      if (! __isFloat(itemQuantity.value) )   
    {
      alert('<%=ResourcesFactory.getString("PRODUCT.INVALIDFLOATNUMBER")%>');
      itemQuantity.focus();
      return false;
    }   
	  var itemAmount = document.forms[0].itemAmount;
      if (trim(itemAmount.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("PRODUCT.INPUTTATALAMOUNT")%>');    
	  itemAmount.focus();
	  return false;
	}
    itemAmount.value = trim(itemAmount.value) ;
      if (! __isFloat(itemAmount.value) )   
    {
      alert('<%=ResourcesFactory.getString("PRODUCT.INVALIDFLOATAMOUNT")%>');
      itemAmount.focus();
      return false;
    }   
	  var itemLevel = document.forms[0].itemLevel;
      if (trim(itemLevel.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("PRODUCT.INPUTPRODUCTLEVEL")%>');    
	  itemLevel.focus();
	  return false;
	}
    itemLevel.value = trim(itemLevel.value) ;
  	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title='<%=ResourcesFactory.getString("PRODUCT.INSERT.TITLE")%>' >
<bsp:containbutton action="product.cmd?method=insert" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="product.cmd?method=insertContinue" text='<%=ResourcesFactory.getString("COMMON.SAVECON")%>' onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.RESET")%>' onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="productquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_PRODUCTID")%>:</td>
                    <td class="tdRight"><html:text name="itemProductid" property="itemProductid" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_PRODUCTNAME")%>:</td>
                    <td class="tdRight"><html:text name="itemProductname" property="itemProductname" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_UNITPRICE")%>:</td>
                    <td class="tdRight"><html:text name="itemUnitprice" property="itemUnitprice" size="5,2" maxlength="5,2" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_QUANTITY")%>:</td>
                    <td class="tdRight"><html:text name="itemQuantity" property="itemQuantity" size="5,2" maxlength="5,2" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_AMOUNT")%>:</td>
                    <td class="tdRight"><html:text name="itemAmount" property="itemAmount" size="5,2" maxlength="5,2" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PRODUCT.ITEM_LEVEL")%>:</td>
                    <td class="tdRight">
                    	<html:select name="itemLevel" property="itemLevel" ><%--
	                        <html:options collection="PRODUCT_ITEMLEVEL_COLLECTION" labelProperty="value" property="key"/>
	                    --%></html:select>
	                </td>
                    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
	var itemUnitprice =document.all('itemUnitprice').value;
	var itemQuantity =document.all('itemQuantity').value;
	var itemAmount =document.all('itemAmount').value;
  if(!checkProduct()) return;	
  if(!__checkMoney(itemUnitprice)){alert('<%=ResourcesFactory.getString("PRODUCT.INVALIDPRICE")%>');return;}
  if(!__isFloat(itemQuantity)){alert('<%=ResourcesFactory.getString("PRODUCT.INVALIDNUMBER")%>');return;}
  if(!__checkMoney(itemAmount)){alert('<%=ResourcesFactory.getString("PRODUCT.INVALIDAMOUNT")%>');return;}
  document.forms[0].action ="product.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
	var itemUnitprice =document.all('itemUnitprice').value;
	var itemQuantity =document.all('itemQuantity').value;
	var itemAmount =document.all('itemAmount').value;
  if(!checkProduct()) return;
  if(!__checkMoney(itemUnitprice)){alert('<%=ResourcesFactory.getString("PRODUCT.INVALIDPRICE")%>');return;}
  if(!__isNum(itemQuantity)){alert('<%=ResourcesFactory.getString("PRODUCT.INVALIDNUMBER")%>');return;}
  if(!__checkMoney(itemAmount)){alert('<%=ResourcesFactory.getString("PRODUCT.INVALIDAMOUNT")%>');return;}
  document.forms[0].action ="product.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="productquery_page_init.cmd?clear=true&clearsearch=true";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>