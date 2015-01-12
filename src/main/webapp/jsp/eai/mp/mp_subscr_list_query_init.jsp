<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>消息订阅列表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String msg_type_code = request.getParameter("msg_type_codeSearch");
	if (msg_type_code==null){
	  msg_type_code="";
	}
    String subscr_type_code = request.getParameter("subscr_type_codeSearch");
	if (subscr_type_code==null){
	  subscr_type_code="";
	}
%>
<bsp:container title="消息订阅列表查询" >
<bsp:containbutton action="mpsubscrlist.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="mpsubscrlist.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="mpsubscrlist.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="mpsubscrlist.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpsubscrlistquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>消息类型：<flex:searchSelect name="msg_type_codeSearch" searchName="MP_SUBSCR_LIST.MSG_TYPE_CODE" dataType="java.lang.String" operSymbol="=" value="<%=msg_type_code%>">
		<html:option value="-1">全部</html:option>
		<html:options collection="mpMessageType" labelProperty="MSG_TYPE_NAME" property="MSG_TYPE_CODE"/>
	</flex:searchSelect></td>
    <td>订阅者类型：<flex:searchSelect name="subscr_type_codeSearch" searchName="MP_SUBSCR_LIST.SUBSCR_TYPE_CODE" dataType="java.lang.String" operSymbol="=" value="<%=subscr_type_code%>">
		<html:option value="-1">全部</html:option>
		<html:options collection="mpSubscriberType" labelProperty="SUBSCR_TYPE_NAME" property="SUBSCR_TYPE_CODE"/>
	</flex:searchSelect></td>
	<td><flex:searchImg name="chaxun" action="mpsubscrlistquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
  				<flex:checkboxCol caption='选择' width="60" property="subscrId" name="primaryKey" sortName="MP_SUBSCR_LIST.SUBSCR_ID"></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_SUBSCR_LIST.MSG_TYPE_CODE")%>' width="120" property="msgTypeCode" type="enum" enumCollection="mpMessageType" enumKey="MSG_TYPE_CODE" enumValue="MSG_TYPE_NAME" sortName="MP_SUBSCR_LIST.MSG_TYPE_CODE" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_SUBSCR_LIST.SUBSCRIBERID")%>' width="150" property="subscriberName" sortName="MP_SUBSCR_LIST.SUBSCRIBERID" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_SUBSCR_LIST.SUBSCR_TYPE_CODE")%>' width="150" property="subscrTypeCode" type="enum" enumCollection="mpSubscriberType" enumKey="SUBSCR_TYPE_CODE" enumValue="SUBSCR_TYPE_NAME" sortName="MP_SUBSCR_LIST.SUBSCR_TYPE_CODE" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_SUBSCR_LIST.RECEIVE_MANNER_CODE")%>' width="150" property="receiveMannerCode"  type="enum" enumCollection="mpInceptManner" enumKey="RECEIVE_MANNER_CODE" enumValue="RECEIVE_MANNER_NAME" sortName="MP_SUBSCR_LIST.RECEIVE_MANNER_CODE" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_SUBSCR_LIST.RECEIVE_ADDRESS")%>' width="100" property="receiveAddress" sortName="MP_SUBSCR_LIST.RECEIVE_ADDRESS" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_SUBSCR_LIST.FILTER")%>' width="100" property="filter" sortName="MP_SUBSCR_LIST.FILTER" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mpsubscrlistquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	var id = grid.getCellValue(grid.getCurrentLine(),1);
	location.href="mpsubscrlist.cmd?method=detail&primaryKey="+id;
}
grid.show();
function forInsert(){
  document.forms[0].action ="mpsubscrlist.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mpsubscrlist.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mpsubscrlist.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpsubscrlist.cmd?method=delete";    
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