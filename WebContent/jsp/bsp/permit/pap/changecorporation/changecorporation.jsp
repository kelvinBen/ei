<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE>切换机构</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String corporation = (String)session.getAttribute("CORPORATIONNAME");
%>  
<bsp:container title="切换机构" >
<html:form name="frmList" action="">

<bsp:containbutton onclick="clickOk()" text="切换机构" action="changecorporation.cmd?method=change"></bsp:containbutton>

<table id="tblSearch">
<flex:search>
	<tr>
    <td>当前机构：</td><td><%=corporation%></td>
	</tr>
</flex:search>
</table>
<input type="hidden" name="corporationId" value="">
<support:flexgrid name="grid" height="340"  action="" isSubmit="true">

   <flex:radioCol caption="选择" width="40" property="struId"  name="primaryKey" sortName="stru.struId"></flex:radioCol>
   <flex:flexCol caption='机构名称' width="400" property="organName" style="text-align:left" sortName="stru.organName" ></flex:flexCol>
</support:flexgrid>


</html:form>
</bsp:container>
<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
var key;


function clickOk(){
	if(!getSelect()) return;
	document.all("corporationId").value=key;
	document.forms[0].action="changecorporation.cmd?method=change";
	document.forms[0].target="_top";
	document.forms[0].submit();
	//var url="changecorporation.cmd?method=change";
 	//top.location.href=url; 	
}

function clickCancel(){
	
}

function getSelect(){
  var sel=grid.getCheckLine();
  var myall=grid.getCheckAll();
  var ob=myall.split(",");
  key=ob[0];
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