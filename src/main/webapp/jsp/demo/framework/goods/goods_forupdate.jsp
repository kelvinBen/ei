<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<html>
<head>
<title><%=ResourcesFactory.getString("GOODS.UPDATE.TITLE")%></title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<web:js src="grid.js"/>
<web:js src="tab.js"/>
<web:js src="calendar.js"/>
<web:js src="flexgrid.js"/>
<web:js src="louquery.js"/>
<web:js src="mastfunction.js"/>
<script language="javascript">
function forSave(){
  if(!checkGoods()||!checkFactory()) return;	
  document.forms[0].action ="goods.cmd?method=update";
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
  var rows = factoryGrid.returnRowCount();
  factoryGrid.focus(rows,2); 
  while(factoryGrid.getCellValue(rows,2)==""){		
		factoryGrid.delLine();
		rows--;
  }; 
}
function forQuery(){
  document.forms[0].action ="goods.cmd?method=querySearch&forward=forupdate";
  document.forms[0].submit();
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

$(document).ready(function(){
   
	$("Img[@name=hide]").click(function () {
      $("div[@name=hide]").slideToggle("fast");
       var index=$("Img[@name=hide]").attr("src").lastIndexOf("up.png");
      if(index!=-1)
        $("Img[@name=hide]").attr("src","<mast:ui img='down.png'/>");
      else
        $("Img[@name=hide]").attr("src","<mast:ui img='up.png'/>");
    });  
  });

</script>
</head>
<body>
<html:form  name="goodsForm"   action="">


<html:hidden name="primaryKey" property="goodsId" write="false"/>
<bsp:container title='<%=ResourcesFactory.getString("GOODS.UPDATE.TITLE")%>' >
<bsp:containbutton action="goods.cmd?method=update" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.RESET")%>' onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="goodsquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>	
	<tab:tab id="tab1Tab" type="table">
   <tab:card id="card1" text='<%=ResourcesFactory.getString("FACTORY.GOODS_ID")%>'>			
   
   <table width="100%" cellpadding="0" class="tblContent">
   <tr>
   </tr>
   <tr>   
   <td class="tdTitle"><%=ResourcesFactory.getString("GOODS.GOODS_ID")%></td>
   <td class="tdRight" colspan="1"><html:text name="goodsId" property="goodsId" maxlength="32" size="32" readonly="true" /></td>    
   </tr>
   <tr>   
   <td class="tdTitle"><%=ResourcesFactory.getString("GOODS.GOODS_NAME")%></td>
   <td class="tdRight" colspan="1"><html:text name="goodsName" property="goodsName" maxlength="32" size="32" readonly="true" /></td>    
   </tr>
   <tr>   
   <td class="tdTitle"><%=ResourcesFactory.getString("GOODS.GOODS_PRICE")%></td>
   <td class="tdRight" colspan="1"><html:text name="goodsPrice" property="goodsPrice" maxlength="32" size="32" readonly="true" /></td>    
   </tr>
   </table>			
</tab:card>				
   <tab:card id="card2"  selected="true" text='<%=ResourcesFactory.getString("GOODS.FACTORY")%>'>
   <table>
<tr>
<td><img name='hide' src="<mast:ui img='up.png'/>"></img></td>
<td>
<div name="hide" >
<table id="tblSearch"> 
	 <tr>
  <td><%=ResourcesFactory.getString("FACTORY.FACTORY_NAME")%>:<input name="FACTORY_NAME_SEARCH" value="<%=request.getParameter("FACTORY_NAME_SEARCH")==null?"":request.getParameter("FACTORY_NAME_SEARCH") %>" type="text"  size="12"></td> 
  <td><%=ResourcesFactory.getString("FACTORY.FACTORY_ADDRESS")%>:<input name="FACTORY_ADDRESS_SEARCH" value="<%=request.getParameter("FACTORY_ADDRESS_SEARCH")==null?"":request.getParameter("FACTORY_ADDRESS_SEARCH") %>" type="text" size="12"></td>  
  <td><input type="button" name="chaxun" onclick="forQuery();" value='<%=ResourcesFactory.getString("COMMON.SEARCH")%>' /></td>   
    </tr>
	</table>
</div>
</td>
</tr>
</table>			
   <table width="100%"><tr><td>
   <grid:grid name="factoryGrid"  hasPage="10" action="goods.cmd?method=saveandupdate" property="factoryList" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" type="edit" headHeight="22" sumHeight="22" width="100%" height="240">		
   <grid:primaryKeyCol property="factoryId" name="factoryId" caption='<%=ResourcesFactory.getString("FACTORY.FACTORY_ID")%>' width="0" index="1" ></grid:primaryKeyCol>		
   <grid:textCol property="factoryName" name="factoryName" caption='<%=ResourcesFactory.getString("FACTORY.FACTORY_NAME")%>' width="160" index="2"  styleClass="default" ></grid:textCol>					
   <grid:textCol property="factoryAddress" name="factoryAddress" caption='<%=ResourcesFactory.getString("FACTORY.FACTORY_ADDRESS")%>' width="160" index="3"  styleClass="default" ></grid:textCol>					
   <grid:hideCol property="goodsId" name="gooId" caption='<%=ResourcesFactory.getString("FACTORY.GOODS_ID")%>' width="160" index="4"  styleClass="default" styleClass="default"/>	
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