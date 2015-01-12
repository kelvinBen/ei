<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<%
    String rootId = (String)request.getAttribute("rootId");
    String isCheckBox = (String)request.getAttribute("isCheckBox");
%>

<%
    String dataResType = request.getParameter("dataResType");
	if (dataResType==null){
	  dataResType = "";
	}
    String organCode = request.getParameter("organCode");
	if (organCode==null){
	   organCode = "";
	}
    String organName = request.getParameter("organName");
	if (organName==null){
	  organName="";
	}
%>	

<HTML>
<HEAD>
<TITLE>选择数据资源</TITLE>

<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<widgets:container title="数据资源" >
<widgets:containbutton onclick="clickOk()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="clickCancel()" text="关闭"></widgets:containbutton>
<html:form name="form1" action="">
<table id="tblSearch">
<tr>
<td>参考类型</td>
<td> <html:select name="dataResType" value="<%=dataResType%>">
<html:options collection="dataResType" labelProperty="typeName" property="typeStru" />
</html:select>&nbsp;&nbsp;&nbsp;
</td>
<td>组织编码:</td>
<td><html:text name="organCode" value="<%=organCode%>" size="10" maxlength="30"/>&nbsp;&nbsp;</td>
<td>组织名称:</td>
<td><html:text name="organName" value="<%=organName%>" size="10" maxlength="30"/>&nbsp;&nbsp;</td>
<td><img src="skins\default\images\search.gif" onclick="search()" style="cursor:hand;"></td>
</tr>
</table>

<support:flexgrid name="grid" height="250"  action="" isSubmit="true">
   <flex:checkboxCol caption="选择" width="40" property="dataResourceId"  name="primaryKey" sortName="stru.struId"></flex:checkboxCol>
   <flex:flexCol property="dataResourceName" name="dataResourceName" caption="资源名称" width="200"  style="text-align:left" sortName="stru.organName"></flex:flexCol>                          
   <flex:flexCol property="dataResType" name="dataResType" caption="参考类型ID" width="40"  style="display:none" sortName="stru.organId" style="display:none"></flex:flexCol> 
   <flex:flexCol property="typeName" name="typeName" caption="参考类型" width="200"  style="text-align:left" sortName="stru.organId" style="display:none"></flex:flexCol> 
   <flex:flexCol property="struId" name="struId" caption="组织结构内码" width="40"  style="display:none" sortName="stru.organId" style="display:none"></flex:flexCol> 
   <flex:flexCol property="struType" name="struType" caption="组织结构类型" width="40"  style="display:none" sortName="stru.organId" style="display:none"></flex:flexCol> 
   
</support:flexgrid>


</html:form>
</widgets:container>
<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
grid.setTouAlign(6,"center");
document.onkeydown = keyDown;
function keyDown(){
  if(event.keyCode==13) {
    search();
  }
}
function search(){
  var temp = document.all("dataResType");
  var typeStru = temp.value;
  var typeName = temp.options[temp.selectedIndex].innerText; 
  var organCode = document.all("organCode").value;
  var organName = document.all("organName").value;
  document.forms[0].action="user.cmd?method=selectUserDataResRef1&rootId="+"<%=rootId%>"+"&typeName="+typeName+"&isCheckBox="+"<%=isCheckBox%>";
  document.forms[0].submit();
} 
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
  var arrOut3="";
  var arrOut4="";
  var arrOut5="";
  var ob=myall.split("|");
  for(var i=0;i<ob.length;i++)
  {
	  var arr=ob[i].split(",");
	  if(i<ob.length-1){
	  arrOut+=arr[0]+",";
	  arrOut1+=arr[1]+",";
	  arrOut2+=arr[2]+",";
	  arrOut3+=arr[3]+",";
	  arrOut4+=arr[4]+",";
	  arrOut5+=arr[5]+",";
  }
  else{
	  arrOut+=arr[0];
	  arrOut1+=arr[1];
	  arrOut2+=arr[2];
	  arrOut3+=arr[3];
	  arrOut4+=arr[4];
	  arrOut5+=arr[5];
  }
  }
 return new Array(arrOut,arrOut1,arrOut2,arrOut3,arrOut4,arrOut5);
 
}
</script>