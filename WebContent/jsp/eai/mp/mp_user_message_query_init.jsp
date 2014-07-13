<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>用户消息查询</TITLE>
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
    String subject = request.getParameter("subjectSearch");
	if (subject==null){
	  subject="";
	}
	String statusSearch = request.getParameter("statusSearch");
	if (statusSearch==null){
	  statusSearch="0";
	}
%>
<bsp:container title="用户消息查询" >

<bsp:containbutton action="mpusermessage.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="mpusermessage.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpusermessagequery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>消息类型：<flex:searchSelect name="msg_type_codeSearch" searchName="MP_USER_MESSAGE.MSG_TYPE_CODE" dataType="java.lang.String" operSymbol="=" value="<%=msg_type_code%>">
		<html:option value="-1">全部</html:option>
		<html:options collection="mpMessageType" labelProperty="MSG_TYPE_NAME" property="MSG_TYPE_CODE"/>
	</flex:searchSelect>&nbsp;</td>
	<td>是否已读：<flex:searchSelect name="statusSearch" searchName="MP_USER_MESSAGE.STATUSSEARCH" dataType="java.lang.String" operSymbol="=" value="<%=statusSearch%>">
		<html:options collection="MP_USER_MESSAGE_STATUS" labelProperty="value" property="key"/>
	</flex:searchSelect>&nbsp;</td>
    <td>消息标题：<flex:searchText name="subjectSearch" searchName="MP_USER_MESSAGE.SUBJECT" dataType="java.lang.String" operSymbol="=" value="<%=subject%>" size="12">
	</flex:searchText>&nbsp;</td>
	<td><flex:searchImg name="chaxun" action="mpusermessagequery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
  				<flex:checkboxCol caption='选择' width="60" property="userMessageId" name="primaryKey" sortName="MP_USER_MESSAGE.USER_MESSAGE_ID"></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_USER_MESSAGE.MSG_TYPE_CODE")%>' width="100" property="msgTypeCode" type="enum" enumCollection="mpMessageType" enumKey="MSG_TYPE_CODE" enumValue="MSG_TYPE_NAME" sortName="MP_USER_MESSAGE.MSG_TYPE_CODE" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_USER_MESSAGE.SUBSCR_TYPE_CODE")%>' width="150" property="subscrTypeCode" type="enum" enumCollection="mpSubscriberType" enumKey="SUBSCR_TYPE_CODE" enumValue="SUBSCR_TYPE_NAME"  sortName="MP_USER_MESSAGE.SUBSCR_TYPE_CODE" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_USER_MESSAGE.ARRIVE_TIME")%>' width="150" property="arriveTime" sortName="MP_USER_MESSAGE.ARRIVE_TIME" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_USER_MESSAGE.SUBJECT")%>' width="350" property="subject" sortName="MP_USER_MESSAGE.SUBJECT" style="text-align:left;cursor:hand;color: #000000; text-decoration: underline" onclick="clickSubject(this)"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_USER_MESSAGE.CONTENT")%>' width="100" property="content" sortName="MP_USER_MESSAGE.CONTENT" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_USER_MESSAGE.CREATER")%>' width="100" property="creater" sortName="MP_USER_MESSAGE.CREATER"  style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_USER_MESSAGE.CREATE_TIME")%>' width="100" property="createTime" sortName="MP_USER_MESSAGE.CREATE_TIME" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_USER_MESSAGE.STATUS")%>' width="100" property="status" sortName="MP_USER_MESSAGE.STATUS" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mpusermessagequery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	var id = grid.getCellValue(grid.getCurrentLine(),1);
	location.href="mpusermessage.cmd?method=detail&primaryKey="+id;
}
grid.show();
function forInsert(){
  document.forms[0].action ="mpusermessage.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mpusermessage.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mpusermessage.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpusermessage.cmd?method=delete";    
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
function clickSubject(cell){
  key=cell.parentElement.children[1].children[0].value;
  document.forms[0].action ="mpusermessage.cmd?method=detail&primaryKey="+key;     
  document.forms[0].submit();
}
</script>