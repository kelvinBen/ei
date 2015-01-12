<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("PRODUCT.QUERY.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<web:js src="flexgrid.js"/>
<web:js src="mastfunction.js"/>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<BODY bgcolor="#EAF4FD">
<% 
    String item_productid = request.getParameter("item_productidSearch");
	if (item_productid==null){
	  item_productid="";
	}
    String item_productname = request.getParameter("item_productnameSearch");
	if (item_productname==null){
	  item_productname="";
	}
    String item_unitprice = request.getParameter("item_unitpriceSearch");
	if (item_unitprice==null){
	  item_unitprice="";
	}
    String item_quantity = request.getParameter("item_quantitySearch");
	if (item_quantity==null){
	  item_quantity="";
	}
%>
<widgets:container title='<%=ResourcesFactory.getString("PRODUCT.QUERY.TITLE")%>' >
<widgets:containbutton onclick="showcheckdata()" text='<%=ResourcesFactory.getString("COMMON.OK")%>'></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text='<%=ResourcesFactory.getString("PRODUCT.CLOSE")%>'></widgets:containbutton>
<widgets:containbutton onclick="forCancel()" text='<%=ResourcesFactory.getString("COMMON.RESET")%>'></widgets:containbutton>
<html:messages></html:messages>
<form name="frmList" action="productquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td><%=ResourcesFactory.getString("PRODUCT.ITEM_PRODUCTID")%>:<flex:searchText name="item_productidSearch" property="item_productidSearch" searchName="PRODUCT.ITEM_PRODUCTID" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
    <td><%=ResourcesFactory.getString("PRODUCT.ITEM_PRODUCTNAME")%>:<flex:searchText name="item_productnameSearch" property="item_productnameSearch" searchName="PRODUCT.ITEM_PRODUCTNAME" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
	</tr>
	<tr>
    <td><%=ResourcesFactory.getString("PRODUCT.ITEM_UNITPRICE")%>:<flex:searchText name="item_unitpriceSearch" property="item_unitpriceSearch" onchange="isNum1()"searchName="PRODUCT.ITEM_UNITPRICE" dataType="java.lang.String" operSymbol="=" size="12">
	</flex:searchText></td>
    <td><%=ResourcesFactory.getString("PRODUCT.ITEM_QUANTITY")%>:<flex:searchText name="item_quantitySearch" property="item_quantitySearch" onchange="isNum2()" searchName="PRODUCT.ITEM_QUANTITY" dataType="java.lang.String" operSymbol="="  size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="productquery_page_init.cmd?clear=true&clearsearch=true" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="false">
				<flex:radioCol caption='<%=ResourcesFactory.getString("COMMON.CHOOSE")%>' width="100" property="itemProductid" name="primaryKey" sortName="PRODUCT.ITEM_PRODUCTID"></flex:radioCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PRODUCT.ITEM_PRODUCTNAME")%>' width="100" property="itemProductname" sortName="PRODUCT.ITEM_PRODUCTNAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PRODUCT.ITEM_UNITPRICE")%>' width="100" property="itemUnitprice" sortName="PRODUCT.ITEM_UNITPRICE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PRODUCT.ITEM_QUANTITY")%>' width="100" property="itemQuantity" sortName="PRODUCT.ITEM_QUANTITY"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PRODUCT.ITEM_AMOUNT")%>' width="100" property="itemAmount" sortName="PRODUCT.ITEM_AMOUNT"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PRODUCT.ITEM_LEVEL")%>' width="100" property="itemLevel" type="enum" enumCollection="PRODUCT_ITEMLEVEL_COLLECTION" enumKey ="key" enumValue="value" sortName="PRODUCT.ITEM_LEVEL"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PRODUCT.ITEM_LEVEL")%>' width="100" style="display:none" property="itemLevel" type="enum" enumCollection="PRODUCT_ITEMLEVEL_COLLECTION" enumKey ="key" enumValue="key" sortName="PRODUCT.ITEM_LEVEL"></flex:flexCol>

</flex:flexgrid>
<flex:pagePolit action="productquery_page_init.cmd?clear=true&clearsearch=true">
</flex:pagePolit>
</form>
</widgets:container>
</BODY>
<script language="javascript">
grid.show();
function isNum1(){
 var isnum = document.forms[0].item_unitpriceSearch; 
 if(!__isFloat(isnum.value)){
	 alert('<%=ResourcesFactory.getString("PRODUCT.INPUTFLOATVALUE")%>');
	 document.forms[0].item_unitpriceSearch.value="";
 }
}
function isNum2(){
 var isnum = document.forms[0].item_quantitySearch; 
 if(!__isFloat(isnum.value)){
	 alert('<%=ResourcesFactory.getString("PRODUCT.INPUTFLOATVALUE")%>');
	 document.forms[0].item_quantitySearch.value="";
 }
}
function showcheckdata(){
        var returnV=new Array(5);
        var rows=grid.getCheckLineNo(); 
        if(rows==""){
           alert('<%=ResourcesFactory.getString("COMMON.SELECT_A_RECORD")%>');
           return ;
        }
        returnV[0]=grid.getCellValue(rows,1);
        returnV[1]=grid.getCellValue(rows,2);
        returnV[2]=grid.getCellValue(rows,3);
        returnV[3]=grid.getCellValue(rows,4);
        returnV[4]=grid.getCellValue(rows,5);
        returnV[5]=grid.getCellValue(rows,7);  
        window.returnValue=returnV;
        parent.close();
}
function forCancel(){
    var returnV=new Array(3);
    returnV[0]="";
    returnV[1]=""; 
    returnV[2]="";
    returnV[3]="";
    returnV[4]="";
    returnV[5]="";
    window.returnValue=returnV;
	parent.close();
}
function forClose(){
 parent.close();
}
</script>