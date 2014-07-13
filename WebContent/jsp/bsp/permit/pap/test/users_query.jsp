<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>�û���ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<widgets:container title="�û���ѯ" >
<widgets:containbutton onclick="forInsert()" text="����"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="�޸�"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="��ϸ"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="ɾ��"></widgets:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="usersquery.cmd">
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
	<flex:checkboxCol caption="ѡ��" name="primaryKey" width="50" property="userId" sortName="USERS.USER_ID"></flex:checkboxCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("USERS.USER_ID")%>' width="100" property="userId" sortName="USERS.USER_ID" ></flex:flexCol>
 	<flex:flexCol caption='<%=ResourcesFactory.getString("USERS.USER_NAME")%>' width="100" property="userName" sortName="USERS.USER_NAME" ></flex:flexCol>
 	<flex:flexCol caption='<%=ResourcesFactory.getString("USERS.E_MAIL")%>' width="100" property="email" sortName="USERS.E_MAIL" ></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="usersquery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</widgets:container>
<script language="javascript">
grid.show();
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="users.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="users.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="users.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="users.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("��ѡ��һ����¼!");
    return false;
  }  
  return true;
}
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��Ҫɾ���ļ�¼!");
    return false;
  }
  if (!confirm("���Ҫɾ��ѡ�еļ�¼�𣿴˲������ָܻ���")) {
   	     return false;
   	     }  
  return true;
}
</script>