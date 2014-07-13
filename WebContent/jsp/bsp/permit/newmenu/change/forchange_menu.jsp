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
<TITLE>�л�ϵͳ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<form action="newMenu.cmd?method=forChangeMenu" method="post">

<flex:flexgrid name="grid" height="120" hasSum="false"  action="" isSubmit="true">
	<flex:radioCol caption="ѡ��" width="60" isCheckedProperty="isChecked" property="typeId" name="primaryKey" canSort="false" style="display:none" sortName="PUB_MENU_TYPE.TYPE_ID"></flex:radioCol>
	<flex:flexCol caption='ϵͳ����' width="100" name="text" property="typeName" canSort="false" sortName="PUB_MENU_TYPE.TEXT"></flex:flexCol>
	<flex:flexCol caption='' width="1" name="isSys" property="isSys" canSort="false" sortName="PUB_MENU_TYPE.TEXT" style="display:none"></flex:flexCol>
	<flex:flexCol caption='�л�' width="100" name="text" property="isSys" canSort="false" sortName="PUB_MENU_TYPE.TEXT"></flex:flexCol>
	
</flex:flexgrid>
</form>
</BODY>
<script language="javascript">
grid.show();

for(var i=1;i<grid.returnRowCount()+1;i++){
		var typeId=grid.getCellValue(i, 1);
	
		var forlook='<a href="javascript:changMenu2(\'S'+typeId+'\')" style="color:blue">ϵͳ�л�</a>';
		grid.getCell(i, 4).innerHTML =forlook;
}
function changMenu2(typeId){
	if (!confirm("��Ҫ�л�ϵͳ��?")) {
	     return ;
	}
	document.forms[0].action="newMenu.cmd?method=changMenu&typeId=" + typeId;
	document.forms[0].submit();
}


var key;
function changMenu(typeId){
	if(!getSelect()) return;
	
	if (!confirm("��Ҫ�л�ϵͳ��?")) {
	     return ;
	}
	
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
</script>