<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
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
<%@ page import="net.mast.bsp.permit.pap.domain.IResType"%>
<%@ page import="net.mast.bsp.permit.pap.domain.support.ResType"%>
<%@ page import="net.mast.bsp.permit.pap.view.ResTypeView"%>
<%@ page import="net.mast.bsp.permit.pap.view.FunctionView"%>

<%
	String update = request.getParameter("update");
	if (update == null) {
		update = "";
	}
	String moduleIdForUpdate = (String)request.getAttribute("moduleIdForUpdate");
	if (moduleIdForUpdate == null) {
		moduleIdForUpdate = "";
	}
	String roleId = (String) request.getParameter("roleId");
	if (roleId == null) {
		roleId = "";
	}
	String moduleId = request.getParameter("moduleId");
	if (moduleId == null) {
		moduleId = "";
	}

	String moduleName = request.getParameter("moduleName");
	if (moduleName == null) {
		moduleName = "";
	}

	List list = (List) request.getAttribute("resTypeList");
	
%>
<HTML>
<HEAD>
<TITLE>角色资源查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
</HEAD>

<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<BODY style="margin:0" >

<html:form action="function.cmd?method=queryTRoles">
	<table width="100%">
		<flex:search>
            <html:hidden name="update" value="<%=update%>"/>
            <html:hidden name="moduleIdForUpdate" value="<%=moduleIdForUpdate%>"/>
			<tr>
				<td align="left">所属模块： <flex:searchHidden name="moduleId"
					searchName="PUB_MODULES.MODULE_ID" dataType="java.lang.String"
					operSymbol="like" value="<%=moduleId%>">
				</flex:searchHidden> <flex:searchText name="moduleName"
					searchName="PUB_MODULES.MODULE_NAME" dataType="java.lang.String"
					readonly="true" operSymbol="like" value="<%=moduleName%>" size="12"
					ondblclick="clean()">
				</flex:searchText> 
				<flex:searchHidden name="roleId"
					searchName="PUB_ROLE_RESOURCE.ROLE_ID" dataType="java.lang.String"
					operSymbol="like" value="<%=roleId%>">
				</flex:searchHidden> 
				<img src="skins/default/images/liulan.gif" width="28"
					style="cursor:hand" height="16" border="0"
					onclick="selectModuleId()"> <flex:searchNoPageImg
					name="chaxun" action="function.cmd?method=queryTRoles" image="search.gif" />
				</td>
				<%
	            if (update.equalsIgnoreCase("true")){
	            %>
				<td align="right"><html:button name="btn.submit"
					onclick="onSumit()" value="提交"></html:button></td>
			    <%}%>
			</tr>
		</flex:search>
	</table>
	<flex:flexgrid name="function1" height="300" isSubmit="true" action="">
		
		<flex:flexCol property="modulePath" caption="模块" style="width:150px"
			sortName="PUB_MODULES.MODUEL_NAME"></flex:flexCol>
		<flex:flexCol property="functionName" caption="功能" style="width:150px"
			sortName="PUB_FUNCTIONS.FUNCTION_NAME"></flex:flexCol>
		<%
				for (int i = 0; i < list.size(); i++) {
				ResType view = (ResType) list.get(i);
				if (update.equalsIgnoreCase("true")){
		%>
		<flex:checkboxCol caption='<%=view.getResTypeName()%>' width="100"
			property="functionId" name='<%=view.getResTypeId()%>'
			isCheckedProperty='<%=view.getResTypeId()+"value"%>'
			sortName="PUB_RES_TYPE.RES_TYPE_ID"></flex:checkboxCol>
		<%}
				else{
		%>
		<flex:checkboxCol caption='<%=view.getResTypeName()%>' width="100"
			property="functionId" name='<%=view.getResTypeId()%>'
			isCheckedProperty='<%=view.getResTypeId()+"value"%>'
			sortName="PUB_RES_TYPE.RES_TYPE_ID" disabled="true"></flex:checkboxCol>
		<%}%>		
	    <flex:flexCol property='<%=view.getResTypeId()+"isDisnable"%>' caption="" sortName="m.m"
			style="display:none" ></flex:flexCol>
	    <flex:flexCol property='<%=view.getResTypeId()+"isGray"%>' caption="" sortName="m.m"
			style="display:none" ></flex:flexCol>
		<%
		}
		%>
	</flex:flexgrid>
</html:form>
</BODY>
</HTML>

<script language="javascript">
function init(){
	var otd = function1.getCell(0,1);
	var table = otd.parentElement.parentElement;
	if(table.tagName!="TABLE"&&table.tagName!="TBODY")return;
	for(var i=1;i<function1.returnRowCount()+1;i++){	
		for(var j=0;j<table.rows[0].cells.length;j++){
			if(table.rows[i].cells[j].children[0].tagName=="INPUT"&&(table.rows[i].cells[j].children[0].type=="radio"||table.rows[i].cells[j].children[0].type=="checkbox")){
				if(trim(table.rows[i].cells[j+1].innerText)=="1"){
					table.rows[i].cells[j].children[0].disabled=true;
				}
				if(trim(table.rows[i].cells[j+2].innerText)=="1"){
				    table.rows[i].cells[j].children[0].style.width="17px";
					table.rows[i].cells[j].children[0].indeterminate=table.rows[i].cells[j].children[0].checked;
				}
				j=j+2;
			}
		}
	}
}

var flag =true;

function1.dblclickEvent=function()
{
	var tdObj = function1.getCell(function1.getCurrentLine(),1);
	var trObj = tdObj.parentNode;
	var radios = trObj.getElementsByTagName("INPUT");
	for(var i=0;i<radios.length;i++){
		if(radios[i].type=="checkbox"){
			if(flag==true){
			  if(!radios[i].disabled){
				 radios[i].checked=true;
				 radios[i].indeterminate = false;
				 }
			}
			else{
			if(!radios[i].disabled)
				radios[i].checked=false;
			}
		}
	}
   if(flag==true)
      flag = false;
   else 
      flag=true;
}	

if(document.body.clientHeight>0){
	function1.show();
	function1.setSumText("");
	init();
}
function doTextFocusInGrid(obj){
	var pobj=obj.parentElement.children[1];
	obj.style.display="none";
	pobj.style.display="block";
	pobj.children[0].focus();
}
function selectModuleId(){
		var url ="module.cmd?method=getModuleRoot&rootId=root";     
		var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
		if (win == null ) {  
			return;
		}else{
			document.all("moduleId").value=win[0];
			document.all("moduleName").value=win[1];
		}
}

function onSumit(){
   if (document.forms[0].moduleName.value==""){
	    alert("请先选择所属模块、功能后再提交修改！");  
	    return; 
	  }
   if (document.forms[0].moduleIdForUpdate.value==""){
        alert("请先查询出所要修改的功能！");
        return;
      }
   document.forms[0].action="tRoleopts.cmd?method=updateTRoleResource";
   document.forms[0].submit();
}

function clean(){
	document.forms[0].moduleId.value="";
	document.forms[0].moduleName.value="";
}

 
</script>
