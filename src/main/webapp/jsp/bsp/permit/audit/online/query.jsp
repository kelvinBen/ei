<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.util.Page"%>
<HTML>
<HEAD>
<TITLE>在线用户查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<% 
	String user_id = request.getParameter("user_idSearch");
	if (user_id==null){
	  user_id="";
	}
    String user_name = request.getParameter("user_nameSearch");
	if (user_name==null){
	  user_name="";
	}
	String corporationId = request.getParameter("corporationId");
	if (corporationId==null){
	  corporationId="";
	}
	String corporationName = request.getParameter("corporationName");
	if (corporationName==null){
	  corporationName="";
	}
%>
<bsp:container title="在线用户查询" >
<bsp:containbutton onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()" text="终止会话"></bsp:containbutton>
<bsp:containbutton onclick="querySessionTerminal()" text="会话追踪" action="securityLog.cmd?method=querySessionTerminal"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="onlinequerying.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td nowrap>用户帐号：<flex:searchText name="user_idSearch" searchName="PUB_ONLINE.USER_ID" dataType="java.lang.String" operSymbol="=" value="<%=user_id%>" size="12"></flex:searchText></td>
    <td nowrap>用户名称：<flex:searchText name="user_nameSearch" searchName="PUB_ONLINE.USER_NAME" dataType="java.lang.String" operSymbol="=" value="<%=user_name%>" size="12"></flex:searchText></td>
    <td align="left">机构：</td>
	<td>
	<flex:searchHidden name="corporationId" searchName="PUB_ONLINE_HIST.CORPORATION_ID" dataType="java.lang.String" operSymbol="=" value="<%=corporationId%>" >
	</flex:searchHidden>
	<flex:searchText name="corporationName" searchName="PUB_ONLINE_HIST.CORPORATION_NAME" dataType="java.lang.String" readonly="true" operSymbol="=" value="<%=corporationName%>" size="12" ondblclick="clean()">
	</flex:searchText><img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectCorporation()">
	</td>
    <td><flex:searchNoPageImg name="chaxun" action="onlinequerying.cmd" image="search.gif" imgClick="return trimSearch();"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
                <flex:radioCol caption="选择" width="40" property="sessionId"  name="primaryKey" sortName="PUB_ONLINE.SESSION_ID"></flex:radioCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE.SESSION_ID")%>' width="100" property="sessionId" sortName="PUB_ONLINE.SESSION_ID" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE.USER_ID")%>' width="100" property="userId" style="text-align:left" sortName="PUB_ONLINE.USER_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE.USER_NAME")%>' width="100" property="userName" style="text-align:left" sortName="PUB_ONLINE.USER_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE.CORPORATION_ID")%>' width="100" property="corporationId" style="text-align:left" sortName="PUB_ONLINE.CORPORATION_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE.CORPORATION_NAME")%>' width="100" property="corporationName" style="text-align:left" sortName="PUB_ONLINE.CORPORATION_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ONLINE.REMOTEADDR")%>' width="100" property="remoteaddr" style="text-align:left" sortName="PUB_ONLINE.REMOTEADDR"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="onlinequerying.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="online.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
grid.setTouAlign(6,"center");
grid.setTouAlign(7,"center");
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="online.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="online.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条会话记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条会话记录!");
    return false;
  }  
  return true;
}
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要终止的会话!");
    return false;
  }
  if (!confirm("真的要终止选中的会话吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
function trimSearch(){
   var user_idSearch=document.all("user_idSearch");
   user_idSearch.value=trim(user_idSearch.value);
   var user_nameSearch=document.all("user_nameSearch");
   user_nameSearch.value=trim(user_nameSearch.value);
  
   return true
}
function querySessionTerminal(){
  if(!getSelect()) return;
  var rowAll = grid.getCheckAll();
  var  row=rowAll.split(",");
  var sessionId = row[1];
  document.forms[0].action ="securityLog.cmd?method=querySessionTerminal&sessionId="+sessionId;    
  document.forms[0].submit();
}

function selectCorporation(){
      var cmdUrl ="stru.cmd&method=getSelectRoot&isCheckBox=0&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=1&organType=1,2"; 
      var url ="jsp/help.jsp?url="+cmdUrl; 
      var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
      if (win == null) {  
  	return;
      }else{
      document.all("corporationId").value=win[2];
      document.all("corporationName").value=win[1];
      }
}

</script>