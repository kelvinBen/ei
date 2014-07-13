<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE>���ű��ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<% 
    String id = request.getParameter("idIdSearch");
	if (id==null){
	  id="";
	}
%>
<bsp:container title="���ű��ѯ" >
<bsp:containbutton onclick="forInsert()" text="����" action ="pubidtable.cmd?method=forinsert"></bsp:containbutton>
<bsp:containbutton onclick="forUpdate()" text="�޸�" action ="pubidtable.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()" text="��ϸ" action ="pubidtable.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()" text="ɾ��" action ="pubidtable.cmd?method=delete"></bsp:containbutton>
<html:form name="frmList" action="pubidtablequery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>������ʶ��<flex:searchText name="idIdSearch" searchName="PUB_IDTABLE.ID_ID" dataType="java.lang.String" operSymbol="=" value="<%=id%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="pubidtablequery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
      <flex:radioCol caption="ѡ��" width="40" property="id"  name="primaryKey" sortName="PUB_IDTABLE.ID_ID"></flex:radioCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_IDTABLE.ID_NAME")%>' width="150" property="name" style="text-align:left" sortName="PUB_IDTABLE.ID_NAME"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_IDTABLE.ID_VALUE")%>' width="150" property="value" style="text-align:left" sortName="PUB_IDTABLE.ID_VALUE"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_IDTABLE.CACHE_SIZE")%>' width="100" property="cacheSize" style="text-align:left" sortName="PUB_IDTABLE.CACHE_SIZE"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_IDTABLE.ID_LENGTH")%>' width="100" property="idLength" style="text-align:left" sortName="PUB_IDTABLE.ID_LENGTH"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_IDTABLE.ORGAN_ID")%>' width="100" property="organId" style="display:none" sortName="PUB_IDTABLE.ORGAN_ID"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="pubidtablequery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
  var row = grid.getCurrentLine();
  var otr=grid.getCell(row,6);
  var organId=otr.children[0].innerText;
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="pubidtable.cmd?method=detail&organId="+organId+"&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
function forInsert(){
  document.forms[0].action ="pubidtable.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  var row = grid.getCurrentLine();
  var otr=grid.getCell(row,6);
  var organId=otr.children[0].innerText;
  document.forms[0].action ="pubidtable.cmd?method=forupdate&organId="+organId;    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  var row = grid.getCurrentLine();
  var otr=grid.getCell(row,6);
  var organId=otr.children[0].innerText;
  document.forms[0].action ="pubidtable.cmd?method=detail&organId="+organId;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  var row = grid.getCurrentLine();
  var otr=grid.getCell(row,6);
  var organId=otr.children[0].innerText;
  document.forms[0].action ="pubidtable.cmd?method=delete&organId="+organId;    
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