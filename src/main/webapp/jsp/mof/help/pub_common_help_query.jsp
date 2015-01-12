<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>ͨ�ð�����ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String help_id = request.getParameter("help_idSearch");
	if (help_id==null){
	  help_id="";
	}
%>

<widgets:container title="ͨ�ð�����ѯ" >
<widgets:containbutton onclick="forInsert()" text="����"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="�޸�"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="��ϸ"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="ɾ��"></widgets:containbutton>


<html:form name="frmList" action="pubcommonhelpquery.cmd" >

<table id="tblSearch">
<flex:search>
	<tr>
    <td>������ţ�<flex:searchText name="help_idSearch" searchName="PUB_COMMON_HELP.HELP_ID" dataType="java.lang.String" operSymbol=" like " value="<%=help_id%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="pubcommonhelpquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<support:flexgrid name="grid" height="242" action="" isSubmit="true">
                          <flex:checkboxCol caption="ѡ��" width="50" property="helpId"  name="primaryKey" sortName="PUB_COMMON_HELP.HELP_ID"></flex:checkboxCol>
                                  <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_ID")%>' width="200" property="helpId" sortName="PUB_COMMON_HELP.HELP_ID" style='text-align:left'></flex:flexCol>
                                  <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_TABLE")%>' width="200" property="helpTable" sortName="PUB_COMMON_HELP.HELP_TABLE" style='text-align:left'></flex:flexCol>
                                  <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_TITLE")%>' width="300" property="helpTitle" sortName="PUB_COMMON_HELP.HELP_TITLE" style='text-align:left'></flex:flexCol>
                                  
        </support:flexgrid>
<flex:pagePolit action="pubcommonhelpquery.cmd" pageSize="10">
</flex:pagePolit>
</html:form>

</widgets:container>
<script language="javascript">
grid.show();
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="pubcommonhelp.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="pubcommonhelp.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="pubcommonhelp.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="pubcommonhelp.cmd?method=delete";    
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