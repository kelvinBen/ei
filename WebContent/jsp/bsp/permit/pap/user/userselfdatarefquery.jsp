<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
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
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%
	String corporationId = (String)request.getAttribute("corporationId");
	String userId = (String)request.getAttribute("userId");
	String isWritable = (String)request.getAttribute("isWritable");
	String dataResType = request.getParameter("dataResType");
	String update = request.getParameter("update");
	if (dataResType==null){
		dataResType = "";
	}
	String dataResourceName = request.getParameter("dataResourceName");
	if (dataResourceName==null){
		dataResourceName = "";
	}
%>
<HTML>
<HEAD>
<TITLE>用户数据参考对应查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
</HEAD>

<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<BODY style="margin:0">

<html:form action="userselfdatarefquery.cmd">
<table width="100%"  class="tblList">
<flex:search>
	<html:hidden name="userId" value="<%=userId%>"/>
	<html:hidden name="corporationId" value="<%=corporationId%>"/>
	<html:hidden name="update" value="<%=update%>"/>
	<tr>
	<td class="tdLeft">
	参考类型：<html:select name="dataResType" value="<%=dataResType%>">
	<html:option value=""></html:option>
	<html:options collection="dataResType" labelProperty="typeName" property="dataResType" />
	</html:select>
	资源名称：<html:text name="dataResourceName" value="<%=dataResourceName%>"/>
	<flex:searchNoPageImg name="chaxun" action="userselfdatarefquery.cmd" image="search.gif"/>
	</td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="dataResources" height="300" isSubmit="true">        
        <flex:flexCol property="dataResourceId" caption="资源内码" style="display:none" sortName="userDataReferenceView.dataResourceId"></flex:flexCol>
        <flex:flexCol property="dataResourceName" caption="资源名称" style="width:150px" sortName="userDataReferenceView.dataResourceName"></flex:flexCol>
        <flex:flexCol property="dataResType" caption="参考类型ID" style="display:none" sortName="userDataReferenceView.dataResType"></flex:flexCol>
        <flex:flexCol property="typeName" caption="参考类型" style="width:150px" sortName="userDataReferenceView.typeName"></flex:flexCol>
        <flex:flexCol property="isDefault" caption="是否缺省"  style="width:90px" canSort="false" sortName="userDataReferenceView.isDefault" showTitle="false"></flex:flexCol>
        <flex:checkboxCol name="isWritable" property="dataResourceId" caption="是否可写"  style="width:90px"  sortName="userDataReferenceView.isWritable" isCheckedProperty="isWritable" disabled="true"></flex:checkboxCol>
        <flex:flexCol property="refId" caption="主键列" style="display:none" sortName="userDataReferenceView.refId"></flex:flexCol>
	    <flex:flexCol property="struId" caption="组织结构内码" style="display:none" sortName="userDataReferenceView.struId"></flex:flexCol>
        <flex:flexCol property="struType" caption="组织结构类型" style="display:none" sortName="userDataReferenceView.struType"></flex:flexCol>
</flex:flexgrid>
</html:form>

<script language="javascript">
if(document.body.clientHeight>0){
	dataResources.show();
	dataResources.setSumText("");
}
function doTextFocusInGrid(obj){
	var pobj=obj.parentElement.children[1];
	obj.style.display="none";
	pobj.style.display="block";
	pobj.children[0].focus();
}
function doSelBlurInGrid(obj){
	var nobj=obj.parentElement.parentElement.children[0];
	var opt=obj.options[obj.selectedIndex];
	nobj.value=opt.innerText;
	obj.parentElement.style.display="none";
	nobj.style.display="block";
}
function  myIsWritable(){
    var select = event.srcElement;
} 
function  myIsDefault(){
	var select = event.srcElement;
	var type = select.parentElement.parentElement.parentElement.previousSibling.previousSibling.children[0].innerText;
	alert(type);	
	var value = select.value;
	var struId = select.parentElement.parentElement.parentElement.nextSibling.nextSibling.children[0].innerText;
	if(value=="0") {
		alert("有且仅有一个缺省值！");
		select.options[0].selected =true;
		doSelBlurInGrid(select);
		return;
	}else {
		var selects = new Array();
		selects = document.all("isDefault");
		for (var i=0;i<selects.length;i++){
			var type1 = selects[i].parentElement.parentElement.parentElement.previousSibling.previousSibling.children[0].innerText;				
			var default1 = selects[i].options(selects[i].selectedIndex).text;			
			if(type1==type && default1=="是" && selects[i]!=select){
				selects[i].options[1].selected = true;
				doSelBlurInGrid(selects[i]);
				return ;
			}
		}		
	}	
  }
function addRowDataResources(){
	var rootId = "<%=corporationId%>"; 
	var userId = "<%=userId%>";
	var cmdUrl = "user.cmd&method=selectUserDataResRef&rootId="+rootId+"&isCheckBox=1&userId="+userId;
	var url ="jsp/help.jsp?url="+cmdUrl; 
	showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:600px;dialogHeight:384px");    
}
function deleteRowDataResources(){
	var row = dataResources.getCurrentLine();
	if(row==null){
		alert("请选择一行记录！");
		return false;
	}
	if(!confirm("该操作无法恢复，确定删除吗？"))
		return;
	var refId = dataResources.getCell(row,6).children[0].children[0];
	document.forms[0].action="userdataref.cmd?method=delete&refId="+refId.value;
	document.forms[0].submit();
	return;
} 
function refresh(){
	document.forms[0].action="userdatarefquery.cmd";
	document.forms[0].submit();
}  
</script>
</BODY>
</HTML>