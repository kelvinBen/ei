<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>�ο���ϸ��ѯ</TITLE>
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<% 
    String mofReferenceId = request.getParameter("mofReferenceId");
    if (mofReferenceId==null){
	mofReferenceId="";
	}
    String mofReferenceName = request.getParameter("mofReferenceName");
    if (mofReferenceName==null){
	mofReferenceName="";
	}
%>
<widgets:container title="�ο���ϸ��ѯ" >
<widgets:containbutton onclick="forInsert()" text="����"></widgets:containbutton>
<widgets:containbutton onclick="forUpdate()" text="�޸�"></widgets:containbutton>
<widgets:containbutton onclick="forDetail()" text="��ϸ"></widgets:containbutton>
<widgets:containbutton onclick="forDelete()" text="ɾ��"></widgets:containbutton>
<widgets:containbutton onclick="forReturn()" text="����"></widgets:containbutton>
<html:form name="frmList" action="mofreflistquery.cmd">
<table id="tblSearch">
<tr><td>
<%=ResourcesFactory.getString("MOF_REFLIST.MOF_REFERENCE_ID")%>:
<html:hidden name="mofReferenceId" value="<%=mofReferenceId%>"></html:hidden>
<html:hidden name="mofReferenceName" value="<%=mofReferenceName%>" write="true"></html:hidden>
</td></tr>
</table>
<flex:flexgrid name="grid" height="340" isSubmit="true">
				<flex:checkboxCol caption="ѡ��" width="100" property="mofReflistId" name="mofReflistId" sortName="MOF_REFLIST.MOF_REFLIST_ID"></flex:checkboxCol>				
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFLIST.NAME")%>' width="100" property="value" sortName="MOF_REFLIST.NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFLIST.DESCRIPTION")%>' width="100" property="description" sortName="MOF_REFLIST.DESCRIPTION"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_REFLIST.VALUE")%>' width="100" property="name" sortName="MOF_REFLIST.VALUE"></flex:flexCol>				
</flex:flexgrid>
<flex:pagePolit action="mofreflistquery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</widgets:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="mofreflist.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mofreflist.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mofreflist.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mofreflist.cmd?method=delete&isRefresh=true";    
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
function forReturn(){
    document.forms[0].action ="mofreferencequery.cmd?clear=true";
    document.forms[0].submit();	
  }

<%
String refreshId=(String)request.getParameter("mofReferenceId");
if (request.getParameter("isRefresh")==null||!"true".equals(request.getParameter("isRefresh"))||refreshId==null||refreshId.equals("")){
    refreshId="";
}else{
    refreshId=refreshId+"@E";
}
%>
function init(){
    var refreshId ="<%=refreshId%>";
    if (refreshId!=null&&refreshId!=""&&refreshId!=undefined){
        if(getTreeFrame().seltree){
            getTreeFrame().seltree.refreshNodeById(refreshId); 
        }
    }
 }
 init();
</script>