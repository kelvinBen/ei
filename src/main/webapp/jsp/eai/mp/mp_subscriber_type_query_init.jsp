<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>订阅者类型查看</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String subscr_type_name = request.getParameter("subscr_type_nameSearch");
	if (subscr_type_name==null){
	  subscr_type_name="";
	}
%>
<bsp:container title="订阅者类型查看" >
<bsp:containbutton action="mpsubscribertype.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpsubscribertypequery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>订阅者类型名称：<flex:searchText name="subscr_type_nameSearch" searchName="MP_SUBSCRIBER_TYPE.SUBSCR_TYPE_NAME" dataType="java.lang.String" operSymbol="=" value="<%=subscr_type_name%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="mpsubscribertypequery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption='选择' width="60" property="subscrTypeCode" name="primaryKey" sortName="MP_SUBSCRIBER_TYPE.SUBSCR_TYPE_CODE"></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_SUBSCRIBER_TYPE.SUBSCR_TYPE_CODE")%>' width="150" property="subscrTypeCode" sortName="MP_SUBSCRIBER_TYPE.SUBSCR_TYPE_CODE" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_SUBSCRIBER_TYPE.SUBSCR_TYPE_NAME")%>' width="150" property="subscrTypeName" sortName="MP_SUBSCRIBER_TYPE.SUBSCR_TYPE_NAME" style="text-align:left"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mpsubscribertypequery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	var id = grid.getCellValue(grid.getCurrentLine(),1);
	location.href="mpsubscribertype.cmd?method=detail&primaryKey="+id;
}
grid.show();
function forInsert(){
  document.forms[0].action ="mpsubscribertype.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mpsubscribertype.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mpsubscribertype.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpsubscribertype.cmd?method=delete";    
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