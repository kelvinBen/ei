<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.mast.web.taglib.util.Global"%>
<HTML>
<HEAD>
<TITLE>ͨ��ѡ���ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<bsp:container title="ͨ��ѡ���ѯ" >
<bsp:containbutton   onclick="clicksure()" text="ѡ��"></bsp:containbutton>
<bsp:containbutton   onclick="colsewin()" text="�ر�"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="#">

<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- ������� --><flex:checkboxCol caption="ȫѡ" width="50" property="activityDefId" name="primaryKey" sortName="PUB_COMHELP.HELP_ID"></flex:checkboxCol>
<!-- �������� --><flex:flexCol caption='��������' width="150" property='activityDefName' sortName="PUB_COMHELP.HELP_ID"/>
<!-- �������� --><flex:flexCol caption='���ڱ���' width="250" property='activityDefId' sortName="PUB_COMHELP.HELP_ID"/>
</flex:flexgrid>
<!-- //
<flex:pagePolit action="pubcomhelpquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
 -->

</html:form>
</bsp:container>
<script language="javascript">
grid.show();

function clicksure(){
	var dataResources=grid.getCheckAll();
	if(dataResources==null) return;
    window.returnValue=dataResources;	
    parent.close();
}

function forTest(isCheckBox){
  if(!getSelect()) return;
  var s= grid.getCheckLine();
  alert(s);
 
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

function colsewin(){
	dataResources='';
  if(dataResources==null) return;
  window.returnValue=dataResources;
  javascript:window.close();
  parent.close();
}

function cmpwin(){

 alert("��ѡ��һ����¼!");

}

</script>