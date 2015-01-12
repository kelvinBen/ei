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
<%
String colName=(String)request.getAttribute("colName");
%>

<HTML>
<HEAD>
<TITLE>ѡ������Ȩ��</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

<bsp:container title="����Ȩ��" >
<html:form name="frmList" action="">

<bsp:containbutton onclick="clickOk()" text="ѡ��" ></bsp:containbutton>
<bsp:containbutton onclick="clickCancel()" text="ȡ��" ></bsp:containbutton>

<table id="tblSearch">
</table>

<support:flexgrid name="grid" height="250"  action="" isSubmit="true">
   <flex:checkboxCol caption="ѡ��" width="40" property="objectId"  name="primaryKey" sortName="PUB_DATA_RES_TYPE.VALUE_COL"></flex:checkboxCol>
   <flex:flexCol caption='<%=colName%>' width="250" property="objectName" sortName="PUB_DATA_RES_TYPE.NAME_COL"></flex:flexCol>                          
</support:flexgrid>


</html:form>
</bsp:container>
<script language="javascript">
grid.show();

function clickOk(){
	if(getSelect()==null) return;
	var returnV=getSelect();
	window.returnValue=returnV;
	parent.close();
}

function clickCancel(){
	parent.close();
}

function getSelect(){
  var sel=grid.getCheckLine();
  var myall=grid.getCheckAll();
  var arrOut="";
  var arrOut1="";
  var arrOut2="";
  var ob=myall.split("|");
  for(var i=0;i<ob.length;i++)
  {
  var arr=ob[i].split(",");
  if(i<ob.length-1){
  arrOut+=arr[0]+",";
  arrOut1+=arr[1]+",";
  arrOut2+=arr[0]+",";
  }
  else{
  arrOut+=arr[0];
  arrOut1+=arr[1];
  arrOut2+=arr[0];
  
  }
  }
 return new Array(arrOut,arrOut1,arrOut2);
 
}

</script>