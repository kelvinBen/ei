<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>销售订单查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String order_id = request.getParameter("order_idSearch");
	if (order_id==null){
	  order_id="";
	}
    String order_no = request.getParameter("order_noSearch");
	if (order_no==null){
	  order_no="";
	}
    String customer_id = request.getParameter("customer_idSearch");
	if (customer_id==null){
	  customer_id="";
	}
    String createdate = request.getParameter("createdateSearch");
	if (createdate==null){
	  createdate="";
	}
    String note = request.getParameter("noteSearch");
	if (note==null){
	  note="";
	}
%>
<widgets:container title="销售订单查询" >
<widgets:containbutton onclick="forInsert()" text="增加"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="修改"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="明细"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="删除"></widgets:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="porderquery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>订单内码：<flex:searchText name="order_idSearch" searchName="P_ORDER.ORDER_ID" dataType="java.lang.String" operSymbol="=" value="<%=order_id%>" size="12">
	</flex:searchText></td>
    <td>订单编号：<flex:searchText name="order_noSearch" searchName="P_ORDER.ORDER_NO" dataType="java.lang.String" operSymbol="=" value="<%=order_no%>" size="12">
	</flex:searchText></td>
    <td>销售客户：<flex:searchText name="customer_idSearch" searchName="P_ORDER.CUSTOMER_ID" dataType="java.lang.String" operSymbol="=" value="<%=customer_id%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="porderquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
				<flex:checkboxCol caption="选择" width="100" property="ORDER_ID" name="primaryKey" sortName="P_ORDER.ORDER_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("P_ORDER.ORDER_NO")%>' width="100" property="ORDER_NO" sortName="P_ORDER.ORDER_NO"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("P_ORDER.CUSTOMER_ID")%>' width="100" property="CUSTOMER_ID" sortName="P_ORDER.CUSTOMER_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("P_ORDER.CREATEDATE")%>' width="100" property="CREATEDATE" sortName="P_ORDER.CREATEDATE"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("P_ORDER.NOTE")%>' width="100" property="NOTE" sortName="P_ORDER.NOTE" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="porderquery.cmd" pageSize="14">
</flex:pagePolit>
</html:form>
</widgets:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="porder.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="porder.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="porder.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="porder.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要删除的记录!");
    return false;
  }
  if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
</script>