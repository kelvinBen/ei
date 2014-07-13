<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@page import="net.mast.util.RequestUtil"%>
<HTML>
<HEAD>
<TITLE>消息队列查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<% 
//保存查询条件
    String id = RequestUtil.getPara2String(request,"ID");
    String sender = RequestUtil.getPara2String(request,"Sender");
    String receiver = RequestUtil.getPara2String(request,"receiver");
    String receive_address = RequestUtil.getPara2String(request,"receive_address");
    String sender_type = RequestUtil.getPara2String(request,"Sender_type");
    String contents = RequestUtil.getPara2String(request,"Contents");
    String is_complex = RequestUtil.getPara2String(request,"IS_complex");
    String message_type = RequestUtil.getPara2String(request,"message_type");
    String send_time = RequestUtil.getPara2String(request,"Send_Time");
    String exception = RequestUtil.getPara2String(request,"Exception");
    String state = RequestUtil.getPara2String(request,"state");
    String sende_num = RequestUtil.getPara2String(request,"Sende_NUM");
    String note = RequestUtil.getPara2String(request,"NOTE");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
    String note3 = RequestUtil.getPara2String(request,"NOTE3");
%>
<bsp:container title="消息队列查询" >
<bsp:containbutton action="mpmessag.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="mpmessag.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="mpmessag.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="mpmessag.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpmessagquery_page_init.cmd">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
     <td>
    消息发送人：<flex:searchText name="Sender" searchName="MP_MESSAG.SENDER" dataType="java.lang.String" operSymbol="=" value="<%=sender%>" size="12"/>
    </td>
    <td>
    消息接收人：<flex:searchText name="receiver" searchName="MP_MESSAG.RECEIVER" dataType="java.lang.String" operSymbol="=" value="<%=receiver%>" size="12"/>
    </td>
    <td>
    消息接收地址：<flex:searchText name="receive_address" searchName="MP_MESSAG.RECEIVE_ADDRESS" dataType="java.lang.String" operSymbol="=" value="<%=receive_address%>" size="12"/>
    </td>
  <td>消息发送方式：
           <flex:searchSelect name="Sender_type" searchName="MP_MESSAG.SENDER_TYPE" dataType="java.lang.String" operSymbol="=" value="<%=sender_type%>" >
	         <option value="">全部</option>
	         <html:options collection="MPMESSAG_SENDERTYPE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
 
<!--     <td>是否复杂消息：
           <flex:searchSelect name="IS_complex" searchName="MP_MESSAG.IS_COMPLEX" dataType="java.lang.String" operSymbol="=" value="<%=is_complex%>" >
	         <option value="">全部</option>
	         <html:options collection="MPMESSAG_ISCOMPLEX_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
  <td>消息类型：
           <flex:searchSelect name="message_type" searchName="MP_MESSAG.MESSAGE_TYPE" dataType="java.lang.String" operSymbol="=" value="<%=message_type%>" >
	         <option value="">全部</option>
	         <html:options collection="MPMESSAG_MESSAGETYPE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>--> 

 
  <td>消息状态：
           <flex:searchSelect name="state" searchName="MP_MESSAG.STATE" dataType="java.lang.String" operSymbol="=" value="<%=state%>" >
	         <option value="">全部</option>
	         <html:options collection="MPMESSAG_STATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>

	<td><flex:searchImg name="chaxun" action="mpmessagquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>

<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- 主键 --><flex:checkboxCol caption="全选" width="35" property="id" name="primaryKey" sortName="MP_MESSAG.ID"></flex:checkboxCol>
<!-- 消息发送人 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAG.Sender")%>' width="100" property="sender" sortName="MP_MESSAG.SENDER"/>
<!-- 消息接收人 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAG.receiver")%>' width="100" property="receiver" sortName="MP_MESSAG.RECEIVER"/>
<!-- 消息接收地址 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAG.receive_address")%>' width="100" property="receiveAddress" sortName="MP_MESSAG.RECEIVE_ADDRESS"/>
<!-- 消息发送方式 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAG.Sender_type")%>' width="100" property="senderType" type="enum" enumCollection="MPMESSAG_SENDERTYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="MP_MESSAG.SENDER_TYPE"/>
<!-- 消息内容 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAG.Contents")%>' width="100" property="contents" sortName="MP_MESSAG.CONTENTS"/>
<!-- 是否复杂消息 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAG.IS_complex")%>' width="100" property="isComplex" type="enum" enumCollection="MPMESSAG_ISCOMPLEX_COLLECTION" enumKey ="key" enumValue="value" sortName="MP_MESSAG.IS_COMPLEX"/>

<!-- 定时发送 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAG.Send_Time")%>' width="100" property="sendTime" sortName="MP_MESSAG.SEND_TIME"/>
<!-- 异常原因 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAG.Exception")%>' width="100" property="exception" sortName="MP_MESSAG.EXCEPTION"/>
<!-- 消息状态 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAG.state")%>' width="100" property="state" type="enum" enumCollection="MPMESSAG_STATE_COLLECTION" enumKey ="key" enumValue="value" sortName="MP_MESSAG.STATE"/>
<!-- 发送次数 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAG.Sende_NUM")%>' width="100" property="sendeNum" sortName="MP_MESSAG.SENDE_NUM"/>

</flex:flexgrid>
<flex:pagePolit action="mpmessagquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
//设置查看链接
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var primaryKey=grid.getCellValue(i, 1);
		var title=grid.getCellValue(i, 2);
		var forlook='<a href="javascript:forDetail(\''+primaryKey+'\')" >'+title+'</a>';
		grid.getCell(i, 2).innerHTML =forlook;
	}

function forInsert(){
  document.forms[0].action ="mpmessag.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
var url="mpmessag.cmd?method=forupdate";    
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"消息队列修改",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDetail(primaryKey){
var url="mpmessag.cmd?method=detail"; 
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"消息队列查看",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpmessag.cmd?method=delete";    
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