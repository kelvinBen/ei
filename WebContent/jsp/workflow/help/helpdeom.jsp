<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>

<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="jsp/workflow/resource/js/specialField.js"></script>
<script language="javascript">
function parseMatrixNew(win){
	if(win==null)return;
	//返回值为空字符串的情况
	if (win.length==0){
		var ret = new Array();
		ret[0]="";	
		ret[1]="";
		ret[2]="";
		return ret;	
	}
	//返回值为数组的情况
	var ids="";
	var names="";
	var idnames="";
	var nameurls="";
	for(var i=0;i<win.length;i++){
		var id=win[i][0];
		var name = win[i][1];
		var url = win[i][2];
		if (ids=="")
			ids = id;
		else
			ids=ids+","+id;
		if (names=="")
			names = name;
		else
			names=names+","+name;
		if (idnames=="")
			idnames = id+","+name;
		else
			idnames=idnames+";"+id+","+name;
		if (nameurls=="")
			nameurls="<a href=\""+url+id+"\" target=\"_blank\">"+name+"</a>";
		else
			nameurls=nameurls+","+"<a href=\""+url+id+"\" target=\"_blank\">"+name+"</a>";
	}
	var ret = new Array();
	ret[0]=ids;	
	ret[1]=names;
	ret[2]=nameurls;
	return ret;
}
</script>
<html>
<head>
<title></title>
</head>
<body>

<div align="center">
<table width="100%" class="TabTitleCss" cellspacing=0 cellpadding=0>
	<TR>
		<TD><img src="<%=SkinUtils.getImage(request, "hdReport.gif")%>"	>工作流帮助</td>
	</tr>
</table>


<table width="100%" cellpadding="0" class="tblContent">
 <tr>
    <td >工作流单选:</td>
    <td >
    <input type="text" name="ProcessId" maxlength="60" size="20" value="工作流id" readonly="readonly">  
    <input type="text" name="ProcessName" maxlength="60" size="20" value="工作流名称" readonly="readonly">
	  <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="ProcessRadio()">
    </td>
 </tr> 
 <tr>
    <td >工作流单选(带URL):</td>
    <td >
    <input type="text" name="ProcessIdUrl" maxlength="60" size="20" value="工作流id" readonly="readonly">  
    <input type="text" name="ProcessNameUrl" maxlength="60" size="20" value="工作流名称" readonly="readonly">
    <span id="ProcessRadioUrl" title="url"></span>  				
	  <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="ProcessRadioUrl()">
    </td>
 </tr> 
 <tr style="display:none">
    <td >通用部门单选(列表):</td>
    <td >
    <input type="text" name="DeptNewNodeId" maxlength="60" size="20" value="部门内码" readonly="readonly">  
    <input type="text" name="DeptNewName" maxlength="60" size="20" value="部门名称" readonly="readonly">
    <input type="text" name="DeptNewId" maxlength="60" size="20" value="部门内码" readonly="readonly">
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewDeptId()">
    </td>
 </tr> 
 <tr style="display:none">
    <td >通用部门单选(树):</td>
    <td >
    <input type="text" name="DeptNewNodeIdTree" maxlength="60" size="20" value="部门内码" readonly="readonly">  
    <input type="text" name="DeptNewNameTree" maxlength="60" size="20" value="部门名称" readonly="readonly">
    <input type="text" name="DeptNewIdTree" maxlength="60" size="20" value="部门内码" readonly="readonly">
    <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewDeptIdTree()">
    </td>
 </tr> 
 <tr style="display:none">
    <td >通用部门多选(列表):</td>
    <td >
        <input type="text" name="MultipleDeptNewNodeId" maxlength="60" size="20" value="部门内码" readonly="readonly"> 
        <input type="text" name="MultipleDeptNewName" maxlength="60" size="20" value="部门名称" readonly="readonly">
        <input type="text" name="MultipleDeptNewId" maxlength="60" size="20" value="部门内码" readonly="readonly">
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewDeptId()">
    </td>
 </tr> 
 
  <tr style="display:none">
    <td >通用部门多选(树):</td>
    <td >
        <input type="text" name="MultipleDeptNewNodeIdTree" maxlength="60" size="20" value="部门内码" readonly="readonly"> 
        <input type="text" name="MultipleDeptNewNameTree" maxlength="60" size="20" value="部门名称" readonly="readonly">
        <input type="text" name="MultipleDeptNewIdTree" maxlength="60" size="20" value="部门内码" readonly="readonly">
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewDeptIdTree()">
    </td>
 </tr> 
  <tr>
    <td >人员单选(带URL):</td>
    <td >
        <input type="text" name="PartyRadioId" maxlength="60" size="20" value="人员内码" readonly="readonly"> 
        <input type="text" name="PartyRadioName" maxlength="60" size="20" value="人员名称" readonly="readonly">
        <span id="PartyRadioUrl" title="url"></span>
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="PartyRadio()">
    </td>
 </tr> 
  <tr>
    <td >人员多选(带URL):</td>
    <td >
        <input type="text" name="PartyCheckboxId" maxlength="60" size="20" value="人员内码" readonly="readonly"> 
        <input type="text" name="PartyCheckboxName" maxlength="60" size="20" value="人员名称" readonly="readonly">
        <span id="PartyCheckboxUrl" title="url"></span>
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="PartyCheckbox()">
    </td>
 </tr> 
  <tr>
    <td >文档多选(带URL):</td>
    <td >
        <input type="text" name="DocRadioId" maxlength="60" size="20" value="文档内码" readonly="readonly"> 
        <input type="text" name="DocRadioName" maxlength="60" size="20" value="文档名称" readonly="readonly">
        <span id="DocRadioUrl" title="url"></span> 
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="DocCheckbox()">
    </td>
 </tr> 
  <tr>
    <td >项目单选(带URL):</td>
    <td >
        <input type="text" name="PrjRadioId" maxlength="60" size="20" value="项目内码" readonly="readonly"> 
        <input type="text" name="PrjRadioName" maxlength="60" size="20" value="项目名称" readonly="readonly">
        <span id="PrjRadioUrl" title="url"></span> 
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="PrjRadioUrl()">
    </td>
 </tr> 
  <tr>
    <td >客户单选(带URL):</td>
    <td >
        <input type="text" name="CustomerRadioId" maxlength="60" size="20" value="客户内码" readonly="readonly"> 
        <input type="text" name="CustomerRadioName" maxlength="60" size="20" value="客户名称" readonly="readonly">
        <span id="CustomerRadioUrl" title="url"></span> 
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="CustomerRadioUrl()">
    </td>
 </tr> 
  <tr>
    <td >客户多选(带URL):</td>
    <td >
        <input type="text" name="CustomerCheckboxId" maxlength="60" size="20" value="客户内码" readonly="readonly"> 
        <input type="text" name="CustomerCheckboxName" maxlength="60" size="20" value="客户名称" readonly="readonly">
        <span id="CustomerCheckboxUrl" title="url"></span> 
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="CustomerCheckbox()">
    </td>
 </tr> 
  <tr>
    <td >工作地点单选(带URL):</td>
    <td >
        <input type="text" name="WorkplaceRadioId" maxlength="60" size="20" value="工作地点内码" readonly="readonly"> 
        <input type="text" name="WorkplaceRadioName" maxlength="60" size="20" value="工作地点名称" readonly="readonly">
        <span id="WorkplaceRadioUrl" title="url"></span> 
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="WorkplaceRadioUrl()">
    </td>
 </tr> 
   <tr>
    <td >角色单选(带URL):</td>
    <td >
        <input type="text" name="hrRoleRadioId" maxlength="60" size="20" value="角色内码" readonly="readonly"> 
        <input type="text" name="hrRoleRadioName" maxlength="60" size="20" value="角色名称" readonly="readonly">
        <span id="hrRoleRadioUrl" title="url"></span> 
        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="hrRoleRadio()">
    </td>
 </tr>
</table>

</body>
</html>
<script language="javascript">
function hrRoleRadio(){
  var url ="roleradiourl.cmd?method=choiceroot";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("hrRoleRadioName").value=getValue(win);
  document.all("hrRoleRadioUrl").innerHTML=getDisplayValue(win);
  }
}
function WorkplaceRadioUrl(){
  var url ="jsp/help.jsp?url=workplacehelpurlradio.cmd";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("WorkplaceRadioName").value=getValue(win);
  document.all("WorkplaceRadioUrl").innerHTML=getDisplayValue(win);
  }
}
function CustomerCheckbox(){
  var url ="jsp/help.jsp?url=customerhelpurlcheckbox.cmd";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{

//  var ret = parseMatrixNew(win);
//  document.all("CustomerCheckboxId").value=ret[0];
//  document.all("CustomerCheckboxName").value=ret[1];
//  document.all("CustomerCheckboxUrl").innerHTML=ret[2];
//  document.all("CustomerCheckboxId").value=ret[0];
  document.all("CustomerCheckboxName").value=getValue(win);
  document.all("CustomerCheckboxUrl").innerHTML=getDisplayValue(win);
  }
}
function CustomerRadioUrl(){
  var url ="jsp/help.jsp?url=customerhelurlpradio.cmd";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
//	var ret = parseMatrixNew(win);
//  document.all("CustomerRadioId").value=ret[0];
//  document.all("CustomerRadioName").value=ret[1];
//  document.all("CustomerRadioUrl").innerHTML=ret[2];
  document.all("CustomerRadioName").value=getValue(win);
  document.all("CustomerRadioUrl").innerHTML=getDisplayValue(win);
  }
}
function PrjRadioUrl(){
  var url ="jsp/help.jsp?url=prjhelpurlradio.cmd";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
	var ret = parseMatrixNew(win);
//  document.all("PrjRadioId").value=ret[0];
//  document.all("PrjRadioName").value=ret[1];
//  document.all("PrjRadioUrl").innerHTML=ret[2];
  document.all("PrjRadioName").value=getValue(win);
  document.all("PrjRadioUrl").innerHTML=getDisplayValue(win);
  }
}
function ProcessRadioUrl(){
  var url ="jsp/help.jsp?url=processhelpurlquery.cmd";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
	var ret = parseMatrixNew(win);
//  document.all("processIdUrl").value=ret[0];
//  document.all("ProcessNameUrl").value=ret[1];
//  document.all("ProcessRadioUrl").innerHTML=ret[2];
  document.all("ProcessNameUrl").value=getValue(win);
  document.all("ProcessRadioUrl").innerHTML=getDisplayValue(win);
  }
}
function ProcessRadio(){
  var url ="jsp/help.jsp?url=processhelpquery.cmd";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
	var ret = parseMatrix(win);
  document.all("processId").value=ret[0];
  document.all("ProcessName").value=ret[1];
  }
}
function DocCheckbox(){
  var url ="jsp/help.jsp?url=dochelpcheckboxurl.cmd";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
	var ret = parseMatrixNew(win);
//  document.all("DocRadioId").value=ret[0];
//  document.all("DocRadioName").value=ret[1];
//  document.all("DocRadioUrl").innerHTML=ret[2];
  document.all("DocRadioName").value=getValue(win);
  document.all("DocRadioUrl").innerHTML=getDisplayValue(win);
  }
}
function PartyCheckbox(){
  var url ="jsp/help.jsp?url=hrempforhelpcheckboxurl.cmd";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{

  var ret = parseMatrixNew(win);
//  document.all("PartyCheckboxId").value=ret[0];
//  document.all("PartyCheckboxName").value=ret[1];
 // document.all("PartyCheckboxUrl").innerHTML=ret[2];
  document.all("PartyCheckboxName").value=getValue(win);
  document.all("PartyCheckboxUrl").innerHTML=getDisplayValue(win);
  }
}
function PartyRadio(){
  var url ="jsp/help.jsp?url=hrempforhelpradiourl.cmd";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
	var ret = parseMatrixNew(win);
//  document.all("PartyRadioId").value=ret[0];
//  document.all("PartyRadioName").value=ret[1];
//  document.all("PartyRadioUrl").innerHTML=ret[2];
  document.all("PartyRadioName").value=getValue(win);
  document.all("PartyRadioUrl").innerHTML=getDisplayValue(win);
  }
}
function selectNewDeptId(){
  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=2&isCheckBox=0&isIncludeSelf=0&isTree=0";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("DeptNewId").value=win[0];
  document.all("DeptNewName").value=win[1];
  document.all("DeptNewNodeId").value=win[2];
  }
}

function selectNewDeptIdTree(){

  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=2&isCheckBox=0&isIncludeSelf=0&isTree=1";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("DeptNewNodeIdTree").value=win[0];
  document.all("DeptNewNameTree").value=win[1];
  document.all("DeptNewIdTree").value=win[2];
  }
}
function MultipleselectNewDeptId(){
  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=2&isCheckBox=1&isIncludeSelf=1&isTree=0";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultipleDeptNewId").value=win[0];
  document.all("MultipleDeptNewName").value=win[1];
  document.all("MultipleDeptNewNodeId").value=win[2];
  }
}

function MultipleselectNewDeptIdTree(){
  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=2&isCheckBox=1&isIncludeSelf=1&isTree=1";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultipleDeptNewNodeIdTree").value=win[0];
  document.all("MultipleDeptNewNameTree").value=win[1];
  document.all("MultipleDeptNewIdTree").value=win[2];
  }
}
</script>
