<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>消息类型查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String msg_type_name = request.getParameter("msg_type_nameSearch");
	if (msg_type_name==null){
	  msg_type_name="";
	}
    String is_common_msg = request.getParameter("is_common_msgSearch");
	if (is_common_msg==null){
	  is_common_msg="";
	}
%>
<bsp:container title="消息类型查询" >
<bsp:containbutton action="mpmessagetype.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="mpmessagetype.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="mpmessagetype.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="mpmessagetype.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpmessagetypequery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>消息类型名称：<flex:searchText name="msg_type_nameSearch" searchName="MP_MESSAGE_TYPE.MSG_TYPE_NAME" dataType="java.lang.String" operSymbol="=" value="<%=msg_type_name%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="mpmessagetypequery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
  				<flex:checkboxCol caption='选择' width="60" property="msgTypeCode" name="primaryKey" sortName="MP_MESSAGE_TYPE.MSG_TYPE_CODE"></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_TYPE.MSG_TYPE_CODE")%>' width="100" property="msgTypeCode" sortName="MP_MESSAGE_TYPE.MSG_TYPE_CODE"  style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_TYPE.MSG_TYPE_NAME")%>' width="100" property="msgTypeName" sortName="MP_MESSAGE_TYPE.MSG_TYPE_NAME"  style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_TYPE.IS_COMMON_MSG")%>' width="100" property="isCommonMsg" type="enum" enumCollection="MP_MESSAGE_TYPE_IS_COMMON_MSG" enumKey="key" enumValue="value" sortName="MP_MESSAGE_TYPE.IS_COMMON_MSG"  style="text-align:left" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_TYPE.OBJECT_TABLE_NAME")%>' width="100" property="objectTableName" sortName="MP_MESSAGE_TYPE.OBJECT_TABLE_NAME" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_TYPE.SUBSCR_LIMIT")%>' width="100" property="subscrLimit" sortName="MP_MESSAGE_TYPE.SUBSCR_LIMIT"  style="text-align:left" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_TYPE.MANNER_LIMIT")%>' width="100" property="mannerLimit" sortName="MP_MESSAGE_TYPE.MANNER_LIMIT"  style="text-align:left" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mpmessagetypequery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	var id = grid.getCellValue(grid.getCurrentLine(),1);
	location.href="mpmessagetype.cmd?method=detail&primaryKey="+id;
}
grid.show();
function forInsert(){
  document.forms[0].action ="mpmessagetype.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mpmessagetype.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mpmessagetype.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpmessagetype.cmd?method=delete";    
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