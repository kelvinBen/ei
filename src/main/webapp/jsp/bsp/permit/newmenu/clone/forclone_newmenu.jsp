<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE>ѡ��ϵͳ�˵�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
 
<bsp:container title="ѡ��ϵͳ�˵�" >
<bsp:containbutton onclick="clickOk()" text="ȷ��"></bsp:containbutton>
<bsp:containbutton onclick="forClose()" text="�ر�"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="newMenu.cmd?method=forCloneMenu" >
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:radioCol caption="ѡ��" width="100" property="typeId" name="primaryKey" sortName="PUB_MENU_TYPE.TYPE_ID" canSort="false"></flex:radioCol>
				<flex:flexCol caption='�˵�����' width="100" name="text" property="typeName" sortName="PUB_MENU_TYPE.TEXT" canSort="false"></flex:flexCol>
				<flex:flexCol caption='' width="1" name="isSys" property="isSys" sortName="PUB_MENU_TYPE.TEXT" style="display:none"></flex:flexCol>
</flex:flexgrid>
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
	var returnV=new Array(3);
	returnV[0]=key[0];
	returnV[1]=key[1];
	returnV[2]=key[2];
	window.returnValue=returnV;
	parent.close();
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