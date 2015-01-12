<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<html>
<head>
<title><%=ResourcesFactory.getString("GOODS.DETAIL.TITLE")%></title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<web:js src="grid.js"/>
<web:js src="tab.js"/>
<web:js src="calendar.js"/>
<web:js src="louquery.js"/>
<web:js src="mastfunction.js"/>
<script language="javascript">

function forUpdate(){
  document.forms[0].action ="goods.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="goodsquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function forQuery(){
  document.forms[0].action ="goods.cmd?method=querySearch&forward=detail";
  document.forms[0].submit();
}
$(document).ready(function(){
   
	$("#myImg").click(function () {
      $("div[@name=hide]").slideToggle("fast");
      var index=$("#myImg").attr("src").lastIndexOf("up.png");
      if(index!=-1)
        $("#myImg").attr("src","<mast:ui img='down.png'/>");
      else
        $("#myImg").attr("src","<mast:ui img='up.png'/>");
        
    });  
  });
</script>
</head>
<body>
<html:form  name="goodsForm"  action="">
<html:hidden name="primaryKey" property="goodsId" write="false"/>
<bsp:container title='<%=ResourcesFactory.getString("GOODS.DETAIL.TITLE")%>'>
<bsp:containbutton action="goods.cmd?method=forupdate" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>' onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action ="goodsquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>	
	<tab:tab id="tab1Tab" type="table">
   <tab:card id="card1" text='<%=ResourcesFactory.getString("FACTORY.GOODS_ID")%>'>			
   
   <table width="100%" cellpadding="0" class="tblContent">
   <tr>
   </tr>
   <tr>
   <td class="tdTitle"><%=ResourcesFactory.getString("GOODS.GOODS_ID")%></td>
   <td class="tdRight" colspan="1"><html:hidden name="goodsId" property="goodsId" write="true"/></td>
   	 
   </tr>
   <tr>
   <td class="tdTitle"><%=ResourcesFactory.getString("GOODS.GOODS_NAME")%></td>
   <td class="tdRight" colspan="1"><html:hidden name="goodsName" property="goodsName" write="true"/></td>
   	 
   </tr>
   <tr>
   <td class="tdTitle"><%=ResourcesFactory.getString("GOODS.GOODS_PRICE")%></td>
   <td class="tdRight" colspan="1"><html:hidden name="goodsPrice" property="goodsPrice" write="true"/></td>
   	 
   </tr>
   </table>
			
</tab:card>		
		
   <tab:card id="card2" selected="true" text='<%=ResourcesFactory.getString("GOODS.FACTORY")%>'>			
      <table>
<tr>
<td><img id="myImg" src="<mast:ui img='up.png'/>"></img></td>
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
	<grid:grid name="factoryGrid" hasPage="10" action="goods.cmd?method=detail" property="factoryList" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" type="edit" headHeight="22" sumHeight="22" width="100%" height="240">		
       <grid:primaryKeyCol property="factoryId" name="factoryId" caption='<%=ResourcesFactory.getString("FACTORY.FACTORY_ID")%>' width="0" index="1" readonly="true" styleClass="default"/>		
       <grid:textCol property="factoryName" name="factoryName" caption='<%=ResourcesFactory.getString("FACTORY.FACTORY_NAME")%>' width="160" index="2"   readonly="true" styleClass="default" ></grid:textCol>	
       <grid:textCol property="factoryAddress" name="factoryAddress" caption='<%=ResourcesFactory.getString("FACTORY.FACTORY_ADDRESS")%>' width="160" index="3"   readonly="true" styleClass="default" ></grid:textCol>	
       <grid:hideCol property="goodsId" name="goodsId" caption='<%=ResourcesFactory.getString("FACTORY.GOODS_ID")%>' width="160" index="4"  styleClass="default" styleClass="default"/>	 

	</grid:grid>			
   </tab:card>				
</tab:tab>
</bsp:container>
</html:form>
<script language="javascript">
   factoryGrid.show();
</script>
</body>
</html>