<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>用户数据同步表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String user_id = request.getParameter("user_id");
	if (user_id==null){
	  user_id="";
	}
%>
<widgets:container title="用户数据同步表查询" >
<widgets:containbutton onclick="doSynch()" text="执行同步"></widgets:containbutton>
<widgets:containbutton onclick="synchronizeUser()" text="将用户加入系统"></widgets:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="ldapuserquery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>用户登陆名：<flex:searchText name="user_id" searchName="PUB_LDAP_USER.USER_ID" dataType="java.lang.String" operSymbol="=" value="<%=user_id%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="ldapuserquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
				<flex:checkboxCol caption="选择" width="40" property="USER_ID"  name="primaryKey" sortName="PUB_LDAP_USER.USER_ID"></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_LDAP_USER.USER_ID")%>' width="100" property="USER_ID" sortName="PUB_LDAP_USER.USER_ID"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_LDAP_USER.USER_NAME")%>' width="100" property="USER_NAME" sortName="PUB_LDAP_USER.USER_NAME"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_LDAP_USER.E_MAIL")%>' width="100" property="E_MAIL" sortName="PUB_LDAP_USER.E_MAIL"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_LDAP_USER.MOBILE")%>' width="100" property="MOBILE" sortName="PUB_LDAP_USER.MOBILE"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="ldapuserquery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</widgets:container>
</body>
</html>
<script language="javascript">
grid.show();
grid.setSumText("");
function doSynch(){
  document.forms[0].action ="ldapUser.cmd?method=synchronizeLdap";    
  document.forms[0].submit();	
}
function synchronizeUser(){
  if(!getSelect()) return;
  document.forms[0].action ="ldapUser.cmd?method=synchronizeUser";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  return true;
}
</script>