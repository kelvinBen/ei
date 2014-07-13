<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
    String version = request.getParameter("versionSearch");
	if (version==null){
	  version="";
	}else{
		  if(version.indexOf("%")!=-1){
			  version=version.replaceAll("%"," ");
			  }
			}
	version=version.trim();
%>

<bsp:container title="��֯�ṹ�汾��ѯ" >
        <html:form name="frmList" action="struversionquery.cmd" onsubmit="check()">
        <bsp:containbutton onclick="forDetail()" text="������ʷ�汾��Ϣ" ></bsp:containbutton>
        <bsp:containbutton onclick="forInsert()" text="���浱ǰ��������" action="struversion.cmd?method=forinsert"></bsp:containbutton>
        <bsp:containbutton onclick="forUpdate()" text="�޸�" action="struversion.cmd?method=forupdate"></bsp:containbutton>
        <bsp:containbutton onclick="forDelete()" text="ɾ��" action="struversion.cmd?method=delete"></bsp:containbutton>

<table id="tblSearch">
<flex:search>
	<tr>
    <td>��֯�ṹ�汾�ţ�<flex:searchHidden name="versionSearch" searchName="PUB_STRU_VERSION.VERSION" dataType="java.lang.String" operSymbol=" like " value="<%=version%>" >
	</flex:searchHidden><input type="text" size="12" name="temp"></td>
	<td><flex:searchImg name="chaxun" action="struversionquery.cmd" image="search.gif" imgClick=""/></td>
	</tr>
</flex:search>
</table>
<support:flexgrid name="grid" height="340" action="" isSubmit="true">
 <flex:checkboxCol caption="ѡ��" width="40" property="VERSION"  name="primaryKey" sortName="PUB_STRU_VERSION.VERSION"></flex:checkboxCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION")%>' width="100" property="VERSION" style="text-align:left" sortName="PUB_STRU_VERSION.VERSION"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_DATE")%>' width="100" property="VERSION_DATE" style="text-align:left" sortName="PUB_STRU_VERSION.VERSION_DATE"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_USER")%>' width="100" property="VERSION_USER" style="text-align:left" sortName="PUB_STRU_VERSION.VERSION_USER"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_NOTE")%>' width="200" property="VERSION_NOTE" style="text-align:left" sortName="PUB_STRU_VERSION.VERSION_NOTE"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="struversionquery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
function forInsert(){
  document.forms[0].action ="struversion.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="struversion.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  //top.contents.tree.src="struversion.cmd?method=detail&primaryKey="+grid.getCheckLine();
  <% String app=request.getContextPath();%>
  	//����v3�����濪�������������δ���
	//getMainFrame().location.href="jsp/content.jsp";
	//getTreeFrame().location.href="<%=app%>"+"/stru.cmd?method=getHistRoot&version="+grid.getCheckLine();
	//����bsp�����濪�������������δ���
	var url=top.contents.document.all("new_date").src.index
	top.contents.document.all("new_date").src="<%=app%>"+"/stru.cmd?method=getHistRoot&version="+grid.getCheckLine();
	top.contents.document.all("new_menu").style.display="none";
	top.contents.document.all("new_date").style.display="block";
	//top.contents.menu.background="<mast:ui img='menu1.gif'/>";
	//top.contents.tree.background="<mast:ui img='tree1_h.gif'/>";	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="struversion.cmd?method=delete";    
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

function check(){
  var versionSearch=document.all("temp").value;
  versionSearch=trim(versionSearch);
   if(versionSearch.indexOf("%")==-1){
     versionSearch="%"+versionSearch+"%";
     document.all("versionSearch").value=versionSearch;
  } 
  
  return true
}
</script>