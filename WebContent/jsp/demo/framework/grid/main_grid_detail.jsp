<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIN_GRID.DETAIL.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<web:js src="calendar.js"/>
<web:js src="mastfunction.js"/>
<web:js src="grid.js"/>
<bsp:container title='<%=ResourcesFactory.getString("MAIN_GRID.DETAIL.TITLE")%>' >
<bsp:containbutton action="maingrid.cmd?method=forupdate" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>' onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="maingridquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<div style="background-color:#D5EAFD">
  <table style="background-color:#D5EAFD"> 
  		<html:hidden name="pk" property="$mainGridId" write="false"/>
	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.MAIN_GRID_ID")%>:</td>
      <td class="tdRight"><html:hidden name="mainGridId" property="mainGridId" write="true"/></td>
      <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_CODE")%>:</td>
      <td class="tdRight"><html:hidden name="operatorCode" property="operatorCode" write="true"/></td>
	  <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_NAME")%>:</td>
      <td class="tdRight"><html:hidden name="operateName" property="operateName" write="true"/></td>
    </tr>
	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_COOPERATE")%>:</td>
      <td class="tdRight"><html:hidden name="operateCooperate" property="operateCooperate" write="true"/></td>
	  <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_DEPT")%>:</td>
      <td class="tdRight"><html:hidden name="operateDept" property="operateDept" write="true"/></td>
      <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_DATE")%>:</td>
      <td class="tdRight"><html:hidden name="operateDate" property="operateDate" write="true"/></td>
	</tr>
	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_EFFDATE")%>:</td>
      <td class="tdRight"><html:hidden name="operateEffdate" property="operateEffdate" write="true"/></td>
      <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_STATUS")%>:</td>
      <td class="tdRight">
      	<html:label name="operatorStatus" property="operatorStatus" collection="MAINGRID_OPERATORSTATUS_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
      <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_DEPOT")%>:</td>
      <td class="tdRight">
      	<html:label name="operatorDepot" property="operatorDepot" collection="MAINGRID_OPERATORDEPOT_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
	</tr>
  </table>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="listGridItem" type="edit" headHeight="22"  sumHeight="22" width="100%" height="200">		       	
			<grid:textCol property="itemProductid" caption='<%=ResourcesFactory.getString("MAIN_GRID.PRODUCTCODE")%>' width="90" index="2" xml="itemProductid"  name="itemProductid" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
			<grid:textCol property="itemUnitprice" caption='<%=ResourcesFactory.getString("MAIN_GRID.PRODUCTPRICE")%>' width="90" index="3" xml="itemUnitprice"  name="itemUnitprice" style="width:100%" styleClass="default"  readonly="true"></grid:textCol>		
			<grid:labelCol  property="itemDiscount" collection="GRIDITEM_ITEMDISCOUNT_COLLECTION" labelProperty="value" labelKey="key" name="itemDiscount"  caption='<%=ResourcesFactory.getString("MAIN_GRID.PREFERENTIAL")%>'  index="9" width="100" ></grid:labelCol>
			<grid:textCol property="itemQuantity" caption='<%=ResourcesFactory.getString("MAIN_GRID.PRODUCTNUMBER")%>' width="90" index="5" xml="itemQuantity"  name="itemQuantity" style="width:100%" styleClass="default"  readonly="true"></grid:textCol>		
			<grid:textCol property="itemAmount" caption='<%=ResourcesFactory.getString("MAIN_GRID.TATALAMOUNT")%>' width="90" index="6" xml="itemAmount"  name="itemAmount" style="width:100%" styleClass="default"  readonly="true"></grid:textCol>		
			<grid:textCol property="itemDate" caption='<%=ResourcesFactory.getString("MAIN_GRID.OPERATEDATE")%>' width="90" index="7" xml="itemDate"  name="itemDate" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
			<grid:textCol property="itemDatetime" caption='<%=ResourcesFactory.getString("MAIN_GRID.SPECIFICTIME")%>' width="170" index="8" xml="itemDatetime"  name="itemDatetime" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
			<grid:labelCol  property="itemLevel" collection="GRIDITEM_ITEMLEVEL_COLLECTION" labelProperty="value" labelKey="key" name="itemLevel"  caption='<%=ResourcesFactory.getString("MAIN_GRID.PRODUCTLEVEL")%>'  index="9" width="100" ></grid:labelCol>
			<grid:textCol property="itemNote" caption='<%=ResourcesFactory.getString("MAIN_GRID.REMARK")%>' width="90" index="10" xml="itemNote"  name="itemNote" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
		</grid:grid>
</div>
</html:form>
</bsp:container>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="maingrid.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="maingridquery_page_init.cmd";
  document.forms[0].submit();	
}
grid.show();
</script>