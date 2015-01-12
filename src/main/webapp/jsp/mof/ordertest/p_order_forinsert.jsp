<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<HTML>
<HEAD>
<TITLE>销售订单增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript">
function checkPOrder(){
	  var orderId = document.forms[0].orderId;
	  if ( __isQuoteIn(orderId.value) )
	  {
	    alert("订单内码不能含有引号或单引号");
	    orderId.select();
	    orderId.focus();
	    return false;
	  }
	if (trim(orderId.value)=="")
	{
	  alert("请输入订单内码！");    
	  return false;
	}
    orderId.value = trim(orderId.value) ;
	  var orderNo = document.forms[0].orderNo;
	if (trim(orderNo.value)=="")
	{
	  alert("请输入订单编号！");    
	  return false;
	}
    orderNo.value = trim(orderNo.value) ;
	  var customerId = document.forms[0].customerId;
	if (trim(customerId.value)=="")
	{
	  alert("请输入销售客户！");    
	  return false;
	}
    customerId.value = trim(customerId.value) ;
	  var createdate = document.forms[0].createdate;
	if (trim(createdate.value)=="")
	{
	  alert("请输入制单日期！");    
	  return false;
	}
    createdate.value = trim(createdate.value) ;
	  var note = document.forms[0].note;
	if (trim(note.value)=="")
	{
	  alert("请输入备注！");    
	  return false;
	}
    note.value = trim(note.value) ;
return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<widgets:container title="销售订单增加" >
<widgets:containbutton text="增加一行" onclick="doAddRow()"></widgets:containbutton>
<widgets:containbutton text="删除一行" onclick="doDeleteRow()"></widgets:containbutton>
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="保存并继续" onclick="forSaveContinue()"></widgets:containbutton>
<widgets:containbutton text="恢复" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<html:messages></html:messages>
<html:form  name="frmList"  action="">
<div style="background-color:#D5EAFD">
  <table style="background-color:#D5EAFD"> 
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("P_ORDER.ORDER_ID")%>：</td>
                    <td class="tdRight"><html:text name="orderId" property="orderId" size="20" maxlength="20" /></td>                                       
                    <td class="tdTitle"><%=ResourcesFactory.getString("P_ORDER.ORDER_NO")%>：</td>
                    <td class="tdRight"><html:text name="orderNo" property="orderNo" size="30" maxlength="30" /></td>                                       
					</tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("P_ORDER.CUSTOMER_ID")%>：</td>
                    <td class="tdRight"><html:text name="customerId" property="customerId" size="30" maxlength="30" /></td>                                       
                    <td class="tdTitle"><%=ResourcesFactory.getString("P_ORDER.CREATEDATE")%>：</td>
                    <td class="tdRight"><html:text name="createdate" property="createdate" size="8" maxlength="8" /></td>                                       
					</tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("P_ORDER.NOTE")%>：</td>
                    <td class="tdRight" colspan="3"><html:text name="note" property="note" size="100" maxlength="100" /></td>                                       
					
					</tr>
  </table>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="listPOrderline" type="input" headHeight="22"  sumHeight="22" width="100%" height="200">		       	
			<grid:primaryKeyCol property="orderlineId" caption="订单行内码" width="90" index="0" xml="orderlineId"  name="orderlineId" style="width:100%" styleClass="default"></grid:primaryKeyCol>
			<grid:textCol property="orderId" caption="订单内码" width="90" index="1" xml="orderId"  name="orderId" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="productId" caption="销售商品" width="90" index="2" xml="productId"  name="productId" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="price" caption="销售价格" width="90" index="3" xml="price"  name="price" style="width:100%" styleClass="default"></grid:textCol>		
			<grid:textCol property="quantity" caption="销售数量" width="90" index="4" xml="quantity"  name="quantity" style="width:100%" styleClass="default"></grid:textCol>		
			<grid:textCol property="tax" caption="税率" width="90" index="5" xml="tax"  name="tax" style="width:100%" styleClass="default"></grid:textCol>		
			<grid:textCol property="total" caption="价税合计" width="90" index="6" xml="total"  name="total" style="width:100%" styleClass="default" sumScript="grid.setSumFieldValue(0,7,grid.sum(7))" onblur="grid.CountSum()"></grid:textCol>		
		</grid:grid>
</div>
</html:form>
</widgets:container>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPOrder()) return;	
  document.forms[0].action ="porder.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkPOrder()) return;
  document.forms[0].action ="porder.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="porderquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function doAddRow()
{
    grid.addRow();
}
function doDeleteRow()
{
    grid.delRow();
}

grid.show();
grid.addRow();
</script>