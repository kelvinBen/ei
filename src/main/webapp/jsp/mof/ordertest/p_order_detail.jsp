<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<HTML>
<HEAD>
<TITLE>销售订单明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<widgets:container title="销售订单明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<html:messages></html:messages>
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<div style="background-color:#D5EAFD">
  <table style="background-color:#D5EAFD"> 
  		<html:hidden name="pk" property="$orderId" write="false"/>
	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("P_ORDER.ORDER_ID")%>：</td>
      <td class="tdRight"><html:hidden name="orderId" property="orderId" write="true"/></td>
      <td class="tdTitle"><%=ResourcesFactory.getString("P_ORDER.ORDER_NO")%>：</td>
      <td class="tdRight"><html:hidden name="orderNo" property="orderNo" write="true"/></td>
	</tr>
	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("P_ORDER.CUSTOMER_ID")%>：</td>
      <td class="tdRight"><html:hidden name="customerId" property="customerId" write="true"/></td>
      <td class="tdTitle"><%=ResourcesFactory.getString("P_ORDER.CREATEDATE")%>：</td>
      <td class="tdRight"><html:hidden name="createdate" property="createdate" write="true"/></td>
	</tr>
	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("P_ORDER.NOTE")%>：</td>
      <td class="tdRight"  colspan="3"><html:hidden name="note" property="note" write="true"/></td>
	</tr>
  </table>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="listPOrderline" type="edit" headHeight="22"  sumHeight="22" width="100%" height="200">       	
			<grid:primaryKeyCol property="orderlineId" caption="订单行内码" width="90" index="0" xml="orderlineId"  name="orderlineId" style="width:100%" styleClass="default" readonly="true"></grid:primaryKeyCol>		       	
			<grid:textCol property="orderId" caption="订单内码" width="90" index="1" xml="orderId"  name="orderId" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
			<grid:textCol property="productId" caption="销售商品" width="90" index="2" xml="productId"  name="productId" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
			<grid:textCol property="price" caption="销售价格" width="90" index="3" xml="price"  name="price" style="width:100%" styleClass="default"  readonly="true"></grid:textCol>		
			<grid:textCol property="quantity" caption="销售数量" width="90" index="4" xml="quantity"  name="quantity" style="width:100%" styleClass="default"  readonly="true"></grid:textCol>		
			<grid:textCol property="tax" caption="税率" width="90" index="5" xml="tax"  name="tax" style="width:100%" styleClass="default"  readonly="true"></grid:textCol>		
			<grid:textCol property="total" caption="价税合计" width="90" index="6" xml="total"  name="total" style="width:100%" styleClass="default"  readonly="true" sumScript="grid.setSumFieldValue(0,7,grid.sum(7))"></grid:textCol>		
		</grid:grid>
</div>
</html:form>
</widgets:container>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="porder.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="porderquery.cmd";
  document.forms[0].submit();	
}
grid.show();
</script>