<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>���ķ�ʽ�鿴</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String receive_manner_name = request.getParameter("receive_manner_nameSearch");
	if (receive_manner_name==null){
	  receive_manner_name="";
	}
%>
<bsp:container title="���ķ�ʽ�鿴" >
<bsp:containbutton action="mpinceptmanner.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpinceptmannerquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>���ķ�ʽ���ƣ�<flex:searchText name="receive_manner_nameSearch" searchName="MP_INCEPT_MANNER.RECEIVE_MANNER_NAME" dataType="java.lang.String" operSymbol="=" value="<%=receive_manner_name%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="mpinceptmannerquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption='ѡ��' width="60" property="receiveMannerCode" name="primaryKey" sortName="MP_INCEPT_MANNER.RECEIVE_MANNER_CODE" ></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_INCEPT_MANNER.RECEIVE_MANNER_CODE")%>' width="200" property="receiveMannerCode" sortName="MP_INCEPT_MANNER.RECEIVE_MANNER_CODE"  style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_INCEPT_MANNER.RECEIVE_MANNER_NAME")%>' width="200" property="receiveMannerName" sortName="MP_INCEPT_MANNER.RECEIVE_MANNER_NAME"  style="text-align:left"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mpinceptmannerquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	var id = grid.getCellValue(grid.getCurrentLine(),1);
	location.href="mpinceptmanner.cmd?method=detail&primaryKey="+id;
}
grid.show();
function forInsert(){
  document.forms[0].action ="mpinceptmanner.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mpinceptmanner.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mpinceptmanner.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpinceptmanner.cmd?method=delete";    
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