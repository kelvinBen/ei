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
<TITLE>通用选择查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<bsp:container title="通用选择查询" >
<bsp:containbutton   onclick="clicksure()" text="选择"></bsp:containbutton>
<bsp:containbutton   onclick="colsewin()" text="关闭"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="#">

<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- 帮助编号 --><flex:checkboxCol caption="全选" width="50" property="activityDefId" name="primaryKey" sortName="PUB_COMHELP.HELP_ID"></flex:checkboxCol>
<!-- 帮助标题 --><flex:flexCol caption='环节名称' width="150" property='activityDefName' sortName="PUB_COMHELP.HELP_ID"/>
<!-- 帮助标题 --><flex:flexCol caption='环节编码' width="250" property='activityDefId' sortName="PUB_COMHELP.HELP_ID"/>
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

function colsewin(){
	dataResources='';
  if(dataResources==null) return;
  window.returnValue=dataResources;
  javascript:window.close();
  parent.close();
}

function cmpwin(){

 alert("请选择一条记录!");

}

</script>
