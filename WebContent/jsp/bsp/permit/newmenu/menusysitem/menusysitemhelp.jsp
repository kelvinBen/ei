<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%> 
<HTML>
<HEAD>
<TITLE>选择系统菜单项</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
     
    String text = request.getParameter("textSearch");
	if (text==null){
	  text="";
	}
     
    String type = request.getParameter("typeSearch");
	if (type==null){
	  type="";
	}
     
    String value = request.getParameter("valueSearch");
	if (value==null){
	  value="";
	} 
%>
<bsp:container title="选择系统菜单项" >
<bsp:containbutton onclick="clickOk()" text="确定"></bsp:containbutton>
<bsp:containbutton onclick="forClose()" text="关闭"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="menusysitemhelp.cmd" >
<table id="tblSearch">
<flex:search>
	<tr>
    <td>名称：<flex:searchText name="textSearch" searchName="PUB_MENU_SYS_ITEM.TEXT" dataType="java.lang.String" operSymbol="=" value="<%=text%>" size="12">
	</flex:searchText></td>
    
    <td>类型：<flex:searchSelect name="typeSearch" searchName="PUB_MENU_SYS_ITEM.TYPE" dataType="java.lang.String" operSymbol="=" value="<%=type%>">
    		<option value="">全部</option>
    		<html:options collection="PUB_MENU_SYS_ITEM_COLLECTION" labelProperty="value" property="key"/>
     </flex:searchSelect></td>	 

    <td>值：<flex:searchText name="valueSearch" searchName="PUB_MENU_SYS_ITEM.VALUE" dataType="java.lang.String" operSymbol="=" value="<%=value%>" size="12">
	</flex:searchText></td>
	     
	<td><flex:searchImg name="chaxun" action="menusysitemhelp.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption="选择" width="40" property="menuId" name="primaryKey" sortName="PUB_MENU_SYSITEM.MENU_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TEXT")%>' width="100" name="text" property="text" sortName="PUB_MENU_SYSITEM.TEXT"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TYPE")%>' width="60" name="type" property="type" type="enum" enumCollection="PUB_MENU_SYS_ITEM_COLLECTION" enumKey="key" enumValue="value" sortName="PUB_MENU_SYSITEM.TYPE"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_MENU_SYSITEM.VALUE")%>' width="240" name="value"  property="value" sortName="PUB_MENU_SYSITEM.VALUE"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="menusysitemhelp.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
var key;
function forClose(){
 parent.close();
}
function clickOk(){

	if(!getSelect()) return;
  	var sel=grid.getCheckLine(); 
	window.returnValue=sel;
	parent.close();
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