<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<html>
<head>
<title><%=ResourcesFactory.getString("GOODS.INSERT.TITLE")%></title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<web:js src="grid.js"/>
<web:js src="tab.js"/>
<web:js src="calendar.js"/>
<web:js src="mastfunction.js"/>
<script language="javascript">
function forSave(){
  if(!checkGoods()||!checkFactory()) return;	
  document.forms[0].action ="goods.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkGoods()||!checkFactory()) return;
  document.forms[0].action ="goods.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="goodsquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function checkGoods(){
	var goodsId=document.forms[0].goodsId;
	if(trim(goodsId.value)==""){
	   alert('<%=ResourcesFactory.getString("GOODS.GOODSIDNULL")%>');
	   goodsId.select();
	   goodsId.focus();
	   return false;
	}
	if(__isQuoteIn(goodsId.value)){
	   alert('<%=ResourcesFactory.getString("GOODS.PRIMARYFORMAT")%>');
	   goodsId.select();
	   goodsId.focus();
	   return false;
	}

	var goodsName=document.forms[0].goodsName;
	if(trim(goodsName.value)==""){
	   alert('<%=ResourcesFactory.getString("GOODS.GOODSNAMENULL")%>');
	   goodsName.select();
	   goodsName.focus();
	   return false;
	}

	var goodsPrice=document.forms[0].goodsPrice;
	if(trim(goodsPrice.value)==""){
	   alert('<%=ResourcesFactory.getString("GOODS.GOODSPRICENULL")%>');
	   goodsPrice.select();
	   goodsPrice.focus();
	   return false;
	}
	return true;
}
function checkFactory(){	
	var rows=factoryGrid.returnRowCount();	
	for(var i=1;i<=rows;i++){
		if(!checkFactoryLine(i)){
			return false;
		}
	}
	return true;
}
function checkFactoryLine(row){
	if(factoryGrid.getCellValue(row,2)==""){
		alert('<%=ResourcesFactory.getString("GOODS.INPUTFACTORYNAME")%>'); 
		return false;		
	}
	if(factoryGrid.getCellValue(row,3)==""){
		alert('<%=ResourcesFactory.getString("GOODS.INPUTFACTORYADDRESS")%>'); 
		return false;		
	}	
	return true;
}
	
</script>
</head>
<body>
<html:form  name="goodsForm"  action="">
<bsp:container title='<%=ResourcesFactory.getString("GOODS.INSERT.TITLE")%>'>
<bsp:containbutton action="goods.cmd?method=insert" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="goods.cmd?method=insertContinue" text='<%=ResourcesFactory.getString("COMMON.SAVECON")%>' onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.RESET")%>' onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="goodsquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>	
	<tab:tab id="tab1Tab" type="table">
   <tab:card id="card1" selected="true" text='<%=ResourcesFactory.getString("FACTORY.GOODS_ID")%>'>			
   
   <table width="100%" cellpadding="0" class="tblContent">
   <tr>   
   <td class="tdTitle" width="10%"><%=ResourcesFactory.getString("GOODS.GOODS_ID")%></td>
   <td class="tdRight"  colspan="1" width="90%"><html:text name="goodsId" property="goodsId" maxlength="32" size="32" readonly="false" /></td>         
   </tr>
   <tr>   
   <td class="tdTitle" width="10%"><%=ResourcesFactory.getString("GOODS.GOODS_NAME")%></td>
   <td class="tdRight" colspan="1" ><html:text name="goodsName" property="goodsName" maxlength="32" size="32" readonly="false" /></td>         
   </tr>
   <tr>   
   <td class="tdTitle" width="10%"><%=ResourcesFactory.getString("GOODS.GOODS_PRICE")%></td>
   <td class="tdRight" colspan="1" ><html:text name="goodsPrice" property="goodsPrice" maxlength="32" size="32" readonly="false" /></td>         
   </tr>
   </table>			
</tab:card>				
   <tab:card id="card2"  text='<%=ResourcesFactory.getString("GOODS.FACTORY")%>'>			
   <table width="100%"><tr><td>
   <grid:grid name="factoryGrid" hasPage="10" action="goods.cmd?method=saveandinsert" property="factoryList" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" type="edit" headHeight="22" sumHeight="22" width="100%" height="240" >		
   <grid:primaryKeyCol property="factoryId" name="factoryId" caption='<%=ResourcesFactory.getString("FACTORY.FACTORY_ID")%>' width="0" index="1" ></grid:primaryKeyCol>		
      <grid:textCol property="factoryName" name="factoryName" caption='<%=ResourcesFactory.getString("FACTORY.FACTORY_NAME")%>' width="160" index="2"  styleClass="default" ></grid:textCol>					
			
      <grid:textCol property="factoryAddress" name="factoryAddress" caption='<%=ResourcesFactory.getString("FACTORY.FACTORY_ADDRESS")%>' width="160" index="3"  styleClass="default" ></grid:textCol>					
			
   <grid:hideCol property="goodsId" name="goodsId" caption='<%=ResourcesFactory.getString("FACTORY.GOODS_ID")%>' width="160" index="4"  styleClass="default" styleClass="default"/>	
   </grid:grid>
</td></tr>
<tr><td align="center">
<button onclick="addNewRow();"><%=ResourcesFactory.getString("COMMON.ADD_ROW")%></button>&nbsp;&nbsp;<button onclick="factoryGrid.delRow();"><%=ResourcesFactory.getString("COMMON.DELETE_ROW")%></button>
</td></tr>
</table>
				
</tab:card>				
</tab:tab>
</bsp:container>
</html:form>
<script language="javascript">
   factoryGrid.show();
function addNewRow(){
	   if(trim(document.forms[0].goodsId.value)!=""&&trim(document.forms[0].goodsName.value)!=""&&trim(document.forms[0].goodsPrice.value)!="")
		   factoryGrid.addRow();
	   else 
		   alert('<%=ResourcesFactory.getString("GOODS.FILLTABLE")%>');
   }
function comhelp(cmdUrl,textObj,idObj){
   var url ="jsp/help.jsp?url="+cmdUrl;
   var win = showModalDialog(url,window,"scroll:auto;status:no;dialogWidth:600px;dialogHeight:400px");
   if (win == null){
      return;
   }else{
      idObj.value=win[0];    
      textObj.value=win[1];
   }
}
function gridcomhelp(cmdUrl,gridObj,idIndex,textIndex){
   var url ="jsp/help.jsp?url="+cmdUrl;
   var win = showModalDialog(url,window,"scroll:auto;status:no;dialogWidth:600px;dialogHeight:400px");
   if (win == null){
      return;
   }else{
   	  gridObj.setCellValue(gridObj.getCurrentLine(),idIndex,win[0]);
   	  gridObj.setCellValue(gridObj.getCurrentLine(),textIndex,win[1]);
   	}	
}
function clean(textObj,idObj){
textObj="";
idObj="";
}
</script>
</body>
</html>