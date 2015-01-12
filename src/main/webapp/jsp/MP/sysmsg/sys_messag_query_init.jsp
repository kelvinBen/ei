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
<TITLE>系统在线消息提醒查询</TITLE>
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
    String send_time = RequestUtil.getPara2String(request,"Send_Time");
    String contents = RequestUtil.getPara2String(request,"Contents");
    String message_type = RequestUtil.getPara2String(request,"message_type");
    String subject = RequestUtil.getPara2String(request,"subject");
    String state = RequestUtil.getPara2String(request,"state");
    String note = RequestUtil.getPara2String(request,"NOTE");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
%>
<bsp:container title="系统在线消息提醒查询" >
<bsp:containbutton action="sysmessag.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="sysmessag.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="sysmessag.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="sysmessag.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="sysmessagquery_page_init.cmd">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
 
    <td>
    消息发送人：<flex:searchText name="Sender" searchName="SYS_MESSAG.SENDER" dataType="java.lang.String" operSymbol="=" value="<%=sender%>" size="12"/>
    </td>
    <td>
    消息接收人：<flex:searchText name="receiver" searchName="SYS_MESSAG.RECEIVER" dataType="java.lang.String" operSymbol="=" value="<%=receiver%>" size="12"/>
    </td>
 
  <td>消息类型：
           <flex:searchSelect name="message_type" searchName="SYS_MESSAG.MESSAGE_TYPE" dataType="java.lang.String" operSymbol="=" value="<%=message_type%>" >
	         <option value="">全部</option>
	         <html:options collection="SYSMESSAG_MESSAGETYPE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
    <td>
    消息标题：<flex:searchText name="subject" searchName="SYS_MESSAG.SUBJECT" dataType="java.lang.String" operSymbol="=" value="<%=subject%>" size="12"/>
    </td>
  <td>消息状态：
           <flex:searchSelect name="state" searchName="SYS_MESSAG.STATE" dataType="java.lang.String" operSymbol="=" value="<%=state%>" >
	         <option value="">全部</option>
	         <html:options collection="SYSMESSAG_STATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
 
	<td><flex:searchImg name="chaxun" action="sysmessagquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>

<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- 主键 --><flex:checkboxCol caption="全选" width="35" property="id" name="primaryKey" sortName="SYS_MESSAG.ID"></flex:checkboxCol>
<!-- 消息发送人 --><flex:flexCol caption='<%=ResourcesFactory.getString("SYS_MESSAG.Sender")%>' width="100" property="sender" sortName="SYS_MESSAG.SENDER"/>
<!-- 消息接收人 --><flex:flexCol caption='<%=ResourcesFactory.getString("SYS_MESSAG.receiver")%>' width="100" property="receiver" sortName="SYS_MESSAG.RECEIVER"/>
<!-- 发送时间 --><flex:flexCol caption='<%=ResourcesFactory.getString("SYS_MESSAG.Send_Time")%>' width="100" property="sendTime" sortName="SYS_MESSAG.SEND_TIME"/>
<!-- 消息内容 --><flex:flexCol caption='<%=ResourcesFactory.getString("SYS_MESSAG.Contents")%>' width="100" property="contents" sortName="SYS_MESSAG.CONTENTS"/>
<!-- 消息类型 --><flex:flexCol caption='<%=ResourcesFactory.getString("SYS_MESSAG.message_type")%>' width="100" property="messageType" type="enum" enumCollection="SYSMESSAG_MESSAGETYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="SYS_MESSAG.MESSAGE_TYPE"/>
<!-- 消息标题 --><flex:flexCol caption='<%=ResourcesFactory.getString("SYS_MESSAG.subject")%>' width="100" property="subject" sortName="SYS_MESSAG.SUBJECT"/>
<!-- 消息状态 --><flex:flexCol caption='<%=ResourcesFactory.getString("SYS_MESSAG.state")%>' width="100" property="state" type="enum" enumCollection="SYSMESSAG_STATE_COLLECTION" enumKey ="key" enumValue="value" sortName="SYS_MESSAG.STATE"/>
<!-- NOTE --><flex:flexCol caption='<%=ResourcesFactory.getString("SYS_MESSAG.NOTE")%>' width="100" property="note" sortName="SYS_MESSAG.NOTE"/>
<!-- NOTE2 --><flex:flexCol caption='<%=ResourcesFactory.getString("SYS_MESSAG.NOTE2")%>' width="100" property="note2" sortName="SYS_MESSAG.NOTE2"/>
</flex:flexgrid>
<flex:pagePolit action="sysmessagquery_page_init.cmd" pageSize="15">
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
  document.forms[0].action ="sysmessag.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
var url="sysmessag.cmd?method=forupdate";    
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"系统在线消息提醒修改",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDetail(primaryKey){
var url="sysmessag.cmd?method=detail"; 
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"系统在线消息提醒查看",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="sysmessag.cmd?method=delete";    
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