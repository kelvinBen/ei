<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.eai.mp.view.MpInceptMannerView"%>
<%@ page import="java.util.List"%>

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
	List list = (List)request.getAttribute("listManner");
%>
<bsp:container title="消息订阅" >
<bsp:containbutton action="mpsubscrlist.cmd?method=subscibe" onclick="subscibe()" text="订阅"></bsp:containbutton>
<bsp:containbutton action="mpsubscrlist.cmd?method=forsubscibe" onclick="forsubscibe()" text="取消"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpsubscrlistquery_page_init.cmd">
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_TYPE.MSG_TYPE_NAME")%>' width="200" property="msgTypeName" sortName="MP_MESSAGE_TYPE.MSG_TYPE_NAME"  style="text-align:center"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_TYPE.IS_COMMON_MSG")%>' width="100" property="isCommonMsg" sortName="MP_MESSAGE_TYPE.IS_COMMON_MSG"  style="display:none"></flex:flexCol>
  				<%for(int i=0;i<list.size();i++){
  					MpInceptMannerView view = (MpInceptMannerView)list.get(i);
  				%>
  				<flex:checkboxCol caption='<%=view.getReceiveMannerName()%>' width="100" property="msgTypeCode" name='<%=view.getReceiveMannerCode()%>'  isCheckedProperty='<%=view.getReceiveMannerCode()+"value"%>' sortName="MP_MESSAGE_TYPE.MSG_TYPE_CODE" ></flex:checkboxCol>
				<%}%>
</flex:flexgrid>
<flex:pagePolit action="mpsubscrlistquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function subscibe(){
  document.forms[0].action ="mpsubscrlist.cmd?method=subscibe";    
  document.forms[0].submit();	
}

function forsubscibe(){
document.location.href="mpsubscrlist.cmd?method=forsubscibe";  	
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