<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>����֤�����û�ӳ����ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String dn = request.getParameter("dnSearch");
	if (dn==null){
	  dn="";
	}
    String user_id = request.getParameter("user_idSearch");
	if (user_id==null){
	  user_id="";
	}
%>
<bsp:container title="����֤�����û�ӳ����ѯ" >
<bsp:containbutton action="certuser.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="certuser.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="certuser.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="certuser.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="certuserquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td nowrap>֤�����⣺<flex:searchText name="dnSearch" searchName="CERT_USER.DN" dataType="java.lang.String" operSymbol="=" value="<%=dn%>" size="12">
	</flex:searchText></td>
    <td nowrap>�û���½����<flex:searchText name="user_idSearch" searchName="CERT_USER.USER_ID" dataType="java.lang.String" operSymbol="=" value="<%=user_id%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="certuserquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250"  action="" isSubmit="true">
				<flex:radioCol caption="ѡ��" width="40"  property="dn" name="primaryKey"  sortName="CERT_USER.DN"></flex:radioCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("CERT_USER.DN")%>' width="250" property="dn" sortName="CERT_USER.DN" ></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("CERT_USER.USER_ID")%>' width="150" property="userId" sortName="CERT_USER.USER_ID"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="certuserquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="certuser.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="certuser.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="certuser.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="certuser.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="certuser.cmd?method=delete";    
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