<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>ϵͳ�˵����ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
     
    String text = request.getParameter("textSearch");
	if (text==null){
	  text="";
	}
     
    String type = request.getParameter("typeSearch");
	if (type==null){
	  type="";
	}
     
%>
<bsp:container title="ϵͳ�˵����ѯ" >
<bsp:containbutton action="menusysitem.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="menusysitem.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="menusysitem.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="menusysitem.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="menusysitemquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td nowrap>���ƣ�<flex:searchText name="textSearch" searchName="PUB_MENU_SYS_ITEM.TEXT" dataType="java.lang.String" operSymbol="=" value="<%=text%>" size="12">
	</flex:searchText></td>
    
    <td nowrap>���ͣ�<flex:searchSelect name="typeSearch" searchName="PUB_MENU_SYS_ITEM.TYPE" dataType="java.lang.String" operSymbol="=" value="<%=type%>">
    		<option value="">ȫ��</option>
    		<html:options collection="PUB_MENU_SYS_ITEM_COLLECTION" labelProperty="value" property="key"/>
     </flex:searchSelect></td>	 
	<td><flex:searchImg name="chaxun" imgClick="if(addSymbol()) return false;" action="menusysitemquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption="ѡ��" width="40" property="menuId" name="primaryKey" sortName="PUB_MENU_SYSITEM.MENU_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TEXT")%>' width="100" property="text" sortName="PUB_MENU_SYSITEM.TEXT"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TYPE")%>' canSort="false" width="100" name="type" property="type" type="enum" enumCollection="PUB_MENU_SYS_ITEM_COLLECTION" enumKey="key" enumValue="value" sortName="PUB_MENU_SYSITEM.TYPE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_MENU_SYSITEM.VALUE")%>' width="300" property="value" sortName="PUB_MENU_SYSITEM.VALUE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_MENU_SYSITEM.FUNCTION_ID")%>' canSort="false" width="100" property="functionId" sortName="PUB_MENU_SYSITEM.FUNCTION_ID"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="menusysitemquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();

function addSymbol(){
if(!checkCondition()) return true;
}
function checkCondition(){
	 if ( __isQuoteIn(document.forms[0].textSearch.value) )
		  {
		    alert("���Ʋ��ܺ��������ַ���");
		    document.forms[0].textSearch.select();
		    document.forms[0].textSearch.focus();
		    return false;
		  }
	return true;
	}
	
function forInsert(){
  document.forms[0].action ="menusysitem.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="menusysitem.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="menusysitem.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="menusysitem.cmd?method=delete";    
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