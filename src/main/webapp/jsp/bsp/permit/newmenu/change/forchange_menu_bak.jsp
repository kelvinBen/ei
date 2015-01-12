<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%
	String menuName = (String)request.getAttribute("menuName");
	if(menuName==null){
		menuName="";
	}
%>
<HTML>
<HEAD>
<TITLE>切换系统</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<form action="newMenu.cmd?method=forChangeMenu" method="post">
<html:button name="切换系统" onclick="changMenu()" value="切换系统" title="切换系统"></html:button>

<flex:flexgrid name="grid" height="100" hasSum="false"  action="" isSubmit="true">
	<flex:radioCol caption="选择" width="60" isCheckedProperty="isChecked" property="typeId" name="primaryKey" canSort="false"  sortName="PUB_MENU_TYPE.TYPE_ID"></flex:radioCol>
	<flex:flexCol caption='系统名称' width="100" name="text" property="typeName" canSort="false" sortName="PUB_MENU_TYPE.TEXT"></flex:flexCol>
	<flex:flexCol caption='' width="1" name="isSys" property="isSys" canSort="false" sortName="PUB_MENU_TYPE.TEXT" style="display:none"></flex:flexCol>
	
</flex:flexgrid>
</form>
</BODY>
<script language="javascript">
grid.show();
var key;
function changMenu(){
	if (!confirm("您要切换系统吗?")) {
	     return false;
	}
	if(!getSelect()) return;
	var typeId= key[2] + key[0];
	document.forms[0].action="newMenu.cmd?method=changMenu&typeId=" + typeId;
	document.forms[0].submit();
}

function getSelect(){
  var sel=grid.getCheckLine();
  var myall=grid.getCheckAll();
  var ob=myall.split(",");
  key=ob;
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}
</script>