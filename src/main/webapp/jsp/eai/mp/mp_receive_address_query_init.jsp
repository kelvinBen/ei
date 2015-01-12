<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>订阅地址查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String subscr_type_code = request.getParameter("subscr_type_codeSearch");
	if (subscr_type_code==null){
	  subscr_type_code="";
	}
    String receive_manner_code = request.getParameter("receive_manner_codeSearch");
	if (receive_manner_code==null){
	  receive_manner_code="";
	}

%>
<bsp:container title="订阅地址查询" >
<bsp:containbutton action="mpreceiveaddress.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="mpreceiveaddress.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="mpreceiveaddress.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="mpreceiveaddress.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpreceiveaddressquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>订阅者类型：<flex:searchSelect name="subscr_type_codeSearch" searchName="MP_RECEIVE_ADDRESS.SUBSCR_TYPE_CODE" dataType="java.lang.String" operSymbol="=" value="<%=subscr_type_code%>">
    	<html:option value="-1">全部</html:option>
    	<html:options collection="mpSubscriberType" labelProperty="SUBSCR_TYPE_NAME" property="SUBSCR_TYPE_CODE"/>
	</flex:searchSelect></td>
    <td>订阅方式：<flex:searchSelect name="receive_manner_codeSearch" searchName="MP_RECEIVE_ADDRESS.RECEIVE_MANNER_CODE" dataType="java.lang.String" operSymbol="=" value="<%=receive_manner_code%>">
    	<html:option value="-1">全部</html:option>
    	<html:options collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" property="RECEIVE_MANNER_CODE"/>
	</flex:searchSelect></td>
	<td><flex:searchImg name="chaxun" action="mpreceiveaddressquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
  				<flex:checkboxCol caption='选择' width="60" property="receiveAddressId" name="primaryKey" sortName="MP_RECEIVE_ADDRESS.RECEIVE_ADDRESS_ID" ></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.SUBSCR_TYPE_CODE")%>' width="100" property="subscrTypeCode" type="enum" enumCollection="mpSubscriberType" enumKey="SUBSCR_TYPE_CODE" enumValue="SUBSCR_TYPE_NAME" sortName="MP_RECEIVE_ADDRESS.SUBSCR_TYPE_CODE"  style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.RECEIVE_MANNER_CODE")%>' width="100" property="receiveMannerCode" type="enum" enumCollection="mpInceptManner" enumKey="RECEIVE_MANNER_CODE" enumValue="RECEIVE_MANNER_NAME" sortName="MP_RECEIVE_ADDRESS.RECEIVE_MANNER_CODE"  style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.OBJECT_TABLE_NAME")%>' width="100" property="objectTableName" sortName="MP_RECEIVE_ADDRESS.OBJECT_TABLE_NAME"  style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.SUBSCRIBERID_FIELD")%>' width="100" property="subscriberidField" sortName="MP_RECEIVE_ADDRESS.SUBSCRIBERID_FIELD"  style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.SUBSCRIBERID_FIELD_TYPE")%>' width="100" property="subscriberidFieldType" sortName="MP_RECEIVE_ADDRESS.SUBSCRIBERID_FIELD_TYPE" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_RECEIVE_ADDRESS.ADDRESS_FIELD")%>' width="100" property="addressField" sortName="MP_RECEIVE_ADDRESS.ADDRESS_FIELD" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mpreceiveaddressquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	var id = grid.getCellValue(grid.getCurrentLine(),1);
	location.href="mpreceiveaddress.cmd?method=detail&primaryKey="+id;
}
grid.show();
function forInsert(){
  document.forms[0].action ="mpreceiveaddress.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mpreceiveaddress.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mpreceiveaddress.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpreceiveaddress.cmd?method=delete";    
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