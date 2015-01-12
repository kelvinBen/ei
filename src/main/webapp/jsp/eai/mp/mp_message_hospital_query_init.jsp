<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>消息错误诊断查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String receive_manner_code = request.getParameter("receive_manner_codeSearch");
	if (receive_manner_code==null){
	  receive_manner_code="";
	}
%>
<bsp:container title="消息错误诊断查询" >
<bsp:containbutton action="mpmessagehospital.cmd?method=send" onclick="forSend()" text="批量发送"></bsp:containbutton>
<bsp:containbutton action="mpmessagehospital.cmd?method=forupdate" onclick="forUpdate()" text="更正"></bsp:containbutton>
<bsp:containbutton action="mpmessagehospital.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="mpmessagehospital.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpmessagehospitalquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>消息接收方式：<flex:searchSelect name="receive_manner_codeSearch" searchName="MP_MESSAGE_HOSPITAL.RECEIVE_MANNER_CODE" dataType="java.lang.String" operSymbol="=" value="<%=receive_manner_code%>">
		<html:option value="-1">全部</html:option>
		<html:options collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" property="RECEIVE_MANNER_CODE"/>
	</flex:searchSelect></td>
	<td><flex:searchImg name="chaxun" action="mpmessagehospitalquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
  				<flex:checkboxCol caption='选择' width="60" property="errorMsgId" name="primaryKey" sortName="MP_MESSAGE_HOSPITAL.ERROR_MSG_ID"></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.MSG_ID")%>' width="120" property="msgId" sortName="MP_MESSAGE_HOSPITAL.MSG_ID" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.SEND_TIME")%>' width="120" property="sendTime" sortName="MP_MESSAGE_HOSPITAL.SEND_TIME" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.RECEIVE_MANNER_CODE")%>' width="150" property="receiveMannerCode" sortName="MP_MESSAGE_HOSPITAL.RECEIVE_MANNER_CODE" type="enum" enumCollection="mpInceptManner" enumKey="RECEIVE_MANNER_CODE" enumValue="RECEIVE_MANNER_NAME" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.RECEIVE_ADDRESS")%>' width="150" property="receiveAddress" sortName="MP_MESSAGE_HOSPITAL.RECEIVE_ADDRESS" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.STATUS")%>' width="150" property="status" sortName="MP_MESSAGE_HOSPITAL.STATUS" style="text-align:left" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.DESCRIPTION")%>' width="100" property="description" sortName="MP_MESSAGE_HOSPITAL.DESCRIPTION" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mpmessagehospitalquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	var id = grid.getCellValue(grid.getCurrentLine(),1);
	location.href="mpmessagehospital.cmd?method=detail&primaryKey="+id;
}
grid.show();
function forSend(){
	  var sel=grid.getCheckLine();
	  if(sel==""){
	    alert("请选择要发送的记录!");
	    return false;
	  }
	document.forms[0].action ="mpmessagehospital.cmd?method=send";    
  	document.forms[0].submit();	
}
function forInsert(){
  document.forms[0].action ="mpmessagehospital.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mpmessagehospital.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mpmessagehospital.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpmessagehospital.cmd?method=delete";    
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