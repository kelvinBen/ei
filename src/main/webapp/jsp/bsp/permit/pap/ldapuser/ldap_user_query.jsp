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
<TITLE>�û�����ͬ�����ѯ</TITLE>
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
<widgets:container title="�û�����ͬ�����ѯ" >
<widgets:containbutton onclick="doSynch()" text="ִ��ͬ��"></widgets:containbutton>
<widgets:containbutton onclick="synchronizeUser()" text="���û�����ϵͳ"></widgets:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="ldapuserquery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>�û���½����<flex:searchText name="user_id" searchName="PUB_LDAP_USER.USER_ID" dataType="java.lang.String" operSymbol="=" value="<%=user_id%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="ldapuserquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
				<flex:checkboxCol caption="ѡ��" width="40" property="USER_ID"  name="primaryKey" sortName="PUB_LDAP_USER.USER_ID"></flex:checkboxCol>
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
    alert("��ѡ��һ����¼!");
    return false;
  }
  return true;
}
</script>