<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%> 
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp3.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<html>
<head>
<title></title>
</head>
<body>

<div align="center">
<table width="100%">
<tr>
<td><label class="title">组织机构演示页面</label></td>
<% String file=request.getServletPath().substring(1);
   String app=request.getContextPath();
%>
</tr>
</table>
<hr>
          <table width="100%" border=1><tr><td colspan=2>选择</td></tr>
           <tr>
		      <td class="tdTitle">不带组织结构参数的通用公司单选(列表):</td>
		      <td class="tdRight">
		      <input type="text" name="CompNewNodeId" maxlength="60" size="20" value="公司组织内码" readonly="readonly">  
		      <input type="text" name="CompNewName" maxlength="60" size="20" value="公司名称" readonly="readonly">
		      <input type="text" name="CompNewId" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="CompNewCode" maxlength="60" size="20" value="公司编码" readonly="readonly">
		      <input type="text" name="CompNewNote" maxlength="60" size="20" value="全称" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewCompId()">
		      </td>
		   </tr> 
		    <tr>
		      <td class="tdTitle">不带组织结构参数的通用公司单选(树):</td>
		      <td class="tdRight">
		      <input type="text" name="CompNewNodeIdTree" maxlength="60" size="20" value="公司组织内码" readonly="readonly">  
		      <input type="text" name="CompNewNameTree" maxlength="60" size="20" value="公司名称" readonly="readonly">
		      <input type="text" name="CompNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="CompNewIdCode" maxlength="60" size="20" value="公司编码" readonly="readonly">
		      <input type="text" name="CompNewIdNote" maxlength="60" size="20" value="全称" readonly="readonly">
		      <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewCompIdTree()">
		      </td>
		   </tr> 
		    <tr>
		      <td class="tdTitle">不带组织结构参数的通用公司多选(列表):</td>
		      <td class="tdRight">
		          <input type="text" name="MultipleCompNewNodeId" maxlength="60" size="20" value="公司组织内码" readonly="readonly"> 
		          <input type="text" name="MultipleCompNewName" maxlength="60" size="20" value="公司名称" readonly="readonly">
		          <input type="text" name="MultipleCompNewId" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultipleCompNewCode" maxlength="60" size="20" value="公司编码" readonly="readonly">
		          <input type="text" name="MultipleCompNewNote" maxlength="60" size="20" value="全称" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewCompId()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">不带组织结构参数的通用公司多选(树):</td>
		      <td class="tdRight">
		          <input type="text" name="MultipleCompNewNodeIdTree" maxlength="60" size="20" value="公司组织内码" readonly="readonly"> 
		          <input type="text" name="MultipleCompNewNameTree" maxlength="60" size="20" value="公司名称" readonly="readonly">
		          <input type="text" name="MultipleCompNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultipleCompNewIdCode" maxlength="60" size="20" value="公司编码" readonly="readonly">
		          <input type="text" name="MultipleCompNewIdNote" maxlength="60" size="20" value="全称" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewCompIdTree()">
		      </td>
		   </tr> 

		
		   <tr>
		      <td class="tdTitle">不带组织结构参数的通用部门单选(列表):</td>
		      <td class="tdRight">
		      <input type="text" name="DeptNewNodeId" maxlength="60" size="20" value="部门组织内码" readonly="readonly">  
		      <input type="text" name="DeptNewName" maxlength="60" size="20" value="部门名称" readonly="readonly">
		      <input type="text" name="DeptNewId" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="DeptNewCode" maxlength="60" size="20" value="部门编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewDeptId()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">不带组织结构参数的通用部门单选(树):</td>
		      <td class="tdRight">
		      <input type="text" name="DeptNewNodeIdTree" maxlength="60" size="20" value="部门组织内码" readonly="readonly">  
		      <input type="text" name="DeptNewNameTree" maxlength="60" size="20" value="部门名称" readonly="readonly">
		      <input type="text" name="DeptNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="DeptNewIdCode" maxlength="60" size="20" value="部门编码" readonly="readonly">
		      <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewDeptIdTree()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">不带组织结构参数的通用部门多选(列表):</td>
		      <td class="tdRight">
		          <input type="text" name="MultipleDeptNewNodeId" maxlength="60" size="20" value="部门组织内码" readonly="readonly"> 
		          <input type="text" name="MultipleDeptNewName" maxlength="60" size="20" value="部门名称" readonly="readonly">
		          <input type="text" name="MultipleDeptNewId" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultipleDeptNewCode" maxlength="60" size="20" value="部门编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewDeptId()">
		      </td>
		   </tr> 
		   
		    <tr>
		      <td class="tdTitle">不带组织结构参数的通用部门多选(树):</td>
		      <td class="tdRight">
		          <input type="text" name="MultipleDeptNewNodeIdTree" maxlength="60" size="20" value="部门组织内码" readonly="readonly"> 
		          <input type="text" name="MultipleDeptNewNameTree" maxlength="60" size="20" value="部门名称" readonly="readonly">
		          <input type="text" name="MultipleDeptNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultipleDeptNewIdCode" maxlength="60" size="20" value="部门编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewDeptIdTree()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">不带组织结构参数的通用岗位单选(列表):</td>
		      <td class="tdRight">
		      <input type="text" name="PostNewNodeId" maxlength="60" size="20" value="岗位组织内码" readonly="readonly">  
		      <input type="text" name="PostNewName" maxlength="60" size="20" value="岗位名称" readonly="readonly">
		      <input type="text" name="PostNewId" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="PostNewCode" maxlength="60" size="20" value="岗位编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewPostId()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">不带组织结构参数的通用岗位单选(树):</td>
		      <td class="tdRight">
		      <input type="text" name="PostNewNodeIdTree" maxlength="60" size="20" value="岗位组织内码" readonly="readonly">  
		      <input type="text" name="PostNewNameTree" maxlength="60" size="20" value="岗位名称" readonly="readonly">
		      <input type="text" name="PostNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="PostNewIdCode" maxlength="60" size="20" value="岗位编码" readonly="readonly">
		      <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewPostIdTree()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">不带组织结构参数的通用岗位多选(列表):</td>
		      <td class="tdRight">
		          <input type="text" name="MultiplePostNewNodeId" maxlength="60" size="20" value="岗位组织内码" readonly="readonly"> 
		          <input type="text" name="MultiplePostNewName" maxlength="60" size="20" value="岗位名称" readonly="readonly">
		          <input type="text" name="MultiplePostNewId" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultiplePostNewCode" maxlength="60" size="20" value="岗位编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewPostId()">
		      </td>
		   </tr> 
		   
		    <tr>
		      <td class="tdTitle">不带组织结构参数的通用岗位多选(树):</td>
		      <td class="tdRight">
		          <input type="text" name="MultiplePostNewNodeIdTree" maxlength="60" size="20" value="岗位组织内码" readonly="readonly"> 
		          <input type="text" name="MultiplePostNewNameTree" maxlength="60" size="20" value="岗位名称" readonly="readonly">
		          <input type="text" name="MultiplePostNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultiplePostNewIdCode" maxlength="60" size="20" value="岗位编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewPostIdTree()">
		      </td>
		   </tr> 
		     <tr>
		      <td class="tdTitle">不带组织结构参数的通用员工单选(列表):</td>
		      <td class="tdRight">
		      <input type="text" name="EmplNewNodeId" maxlength="60" size="20" value="员工组织内码" readonly="readonly">  
		      <input type="text" name="EmplNewName" maxlength="60" size="20" value="员工名称" readonly="readonly">
		      <input type="text" name="EmplNewId" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="EmplNewCode" maxlength="60" size="20" value="员工编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewEmplId()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">不带组织结构参数的通用员工单选(树):</td>
		      <td class="tdRight">
		      <input type="text" name="EmplNewNodeIdTree" maxlength="60" size="20" value="员工组织内码" readonly="readonly">  
		      <input type="text" name="EmplNewNameTree" maxlength="60" size="20" value="员工名称" readonly="readonly">
		      <input type="text" name="EmplNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="EmplNewIdCode" maxlength="60" size="20" value="员工编码" readonly="readonly">
		      <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewEmplIdTree()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">不带组织结构参数的通用员工多选(列表):</td>
		      <td class="tdRight">
		          <input type="text" name="MultipleEmplNewNodeId" maxlength="60" size="20" value="员工组织内码" readonly="readonly"> 
		          <input type="text" name="MultipleEmplNewName" maxlength="60" size="20" value="员工名称" readonly="readonly">
		          <input type="text" name="MultipleEmplNewId" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultipleEmplNewCode" maxlength="60" size="20" value="员工编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewEmplId()">
		      </td>
		   </tr> 
		   
		    <tr>
		      <td class="tdTitle">不带组织结构参数的通用员工多选(树):</td>
		      <td class="tdRight">
		          <input type="text" name="MultipleEmplNewNodeIdTree" maxlength="60" size="20" value="员工组织内码" readonly="readonly"> 
		          <input type="text" name="MultipleEmplNewNameTree" maxlength="60" size="20" value="员工名称" readonly="readonly">
		          <input type="text" name="MultipleEmplNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultipleEmplNewIdCode" maxlength="60" size="20" value="员工编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewEmplIdTree()">
		      </td>
		   </tr> 
		   
		   <tr>
		      <td class="tdTitle">带组织结构参数的通用部门单选:</td>
		      <td class="tdRight">
		      <input type="text" name="DeptStruTypeNewNodeId" maxlength="60" size="20" value="部门组织内码" readonly="readonly">  
		      <input type="text" name="DeptStruTypeNewName" maxlength="60" size="20" value="部门名称" readonly="readonly">
		      <input type="text" name="DeptStruTypeNewId" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="DeptStruTypeNewCode" maxlength="60" size="20" value="部门编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewDeptStruTypeId()">
		      </td>
		   </tr> 
		   <tr>    
		      <td class="tdTitle">带组织结构参数的通用部门单选(树)：</td>
		      <td class="tdRight">
		      <input type="text" name="DeptStruTypeNewNodeIdTree" maxlength="60" size="20" value="部门组织内码" readonly="readonly">  
		      <input type="text" name="DeptStruTypeNewNameTree" maxlength="60" size="20" value="部门名称" readonly="readonly">
		      <input type="text" name="DeptStruTypeNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="DeptStruTypeNewIdCode" maxlength="60" size="20" value="部门编码" readonly="readonly">
		      <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewDeptStruTypeIdTree()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">带组织结构参数的通用部门多选(列表):</td>
		      <td class="tdRight">
		          <input type="text" name="MultipleDeptStruTypeNewNodeId" maxlength="60" size="20" value="部门组织内码" readonly="readonly"> 
		          <input type="text" name="MultipleDeptStruTypeNewName" maxlength="60" size="20" value="部门名称" readonly="readonly">
		          <input type="text" name="MultipleDeptStruTypeNewId" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultipleDeptStruTypeNewCode" maxlength="60" size="20" value="部门编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewDeptStruTypeId()">
		      </td>
		   </tr> 
		   
		    <tr>
		      <td class="tdTitle">带组织结构参数的通用部门多选(树):</td>
		      <td class="tdRight">
		          <input type="text" name="MultipleDeptStruTypeNewNodeIdTree" maxlength="60" size="20" value="部门组织内码" readonly="readonly"> 
		          <input type="text" name="MultipleDeptStruTypeNewNameTree" maxlength="60" size="20" value="部门名称" readonly="readonly">
		          <input type="text" name="MultipleDeptStruTypeNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultipleDeptStruTypeNewIdCode" maxlength="60" size="20" value="部门编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewDeptStruTypeIdTree()">
		      </td>
		   </tr> 
		   
		   <tr>
		      <td class="tdTitle">上级是某种岗位（61）的（组织类型为8）员工的选择:</td>
		      <td class="tdRight">
		      <input type="text" name="CompNewNodeId1" maxlength="60" size="20" value="组织内码" readonly="readonly">  
		      <input type="text" name="CompNewName1" maxlength="60" size="20" value="组织名称" readonly="readonly">
		      <input type="text" name="CompNewId1" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="CompNewCode1" maxlength="60" size="20" value="组织编码" readonly="readonly">
		      <input type="text" name="CompNewNote1" maxlength="60" size="20" value="全称" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="getUnderlingByOrganType()">
		      </td>

		      </td>
		   </tr>
		   <tr>
		      <td class="tdTitle">带showOrganType组织结构参数的通用部门单选(树):</td>
		      <td class="tdRight">
		      <input type="text" name="DeptNewNodeIdTree" maxlength="60" size="20" value="部门组织内码" readonly="readonly">  
		      <input type="text" name="DeptNewNameTree" maxlength="60" size="20" value="部门名称" readonly="readonly">
		      <input type="text" name="DeptNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		      <input type="text" name="DeptNewIdCode" maxlength="60" size="20" value="部门编码" readonly="readonly">
		      <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectNewDeptIdTree1()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">带showOrganType组织结构参数的通用部门多选(树):</td>
		      <td class="tdRight">
		          <input type="text" name="MultipleDeptNewNodeIdTree" maxlength="60" size="20" value="部门组织内码" readonly="readonly"> 
		          <input type="text" name="MultipleDeptNewNameTree" maxlength="60" size="20" value="部门名称" readonly="readonly">
		          <input type="text" name="MultipleDeptNewIdTree" maxlength="60" size="20" value="" readonly="readonly">
		          <input type="text" name="MultipleDeptNewIdCode" maxlength="60" size="20" value="部门编码" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="MultipleselectNewDeptIdTree1()">
		      </td>
		   </tr> 
          </table>

</body>
</html>
<script language="javascript">
//公司
function selectNewCompId(){
  var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=1&isCheckBox=0&isIncludeSelf=0&isTree=0&isIncludeStruPath=0";
  var url ="jsp/help.jsp?url="+cmdUrl;     
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("CompNewNodeId").value=win[0];
  document.all("CompNewName").value=win[1];
  document.all("CompNewId").value=win[2];
  document.all("CompNewCode").value=win[3];
  document.all("CompNewNote").value=win[4];
  }
}

function selectNewCompIdTree(){
   var struId= document.all("CompNewIdTree");
   var checkStruId="" ;
   checkStruId=struId.value;

  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=1&isCheckBox=0&isIncludeSelf=0&isTree=1&isIncludeStruPath=0&checkStruId="+checkStruId;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("CompNewNodeIdTree").value=win[0];
  document.all("CompNewNameTree").value=win[1];
  document.all("CompNewIdTree").value=win[2];
  document.all("CompNewIdCode").value=win[3];
  document.all("CompNewIdNote").value=win[4];
  }
}
function MultipleselectNewCompId(){
  
  var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=1&isCheckBox=1&isIncludeSelf=1&isTree=0&isIncludeStruPath=1";
  var url ="jsp/help.jsp?url="+cmdUrl;        
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultipleCompNewNodeId").value=win[0];
  document.all("MultipleCompNewName").value=win[1];
  document.all("MultipleCompNewId").value=win[2];
  document.all("MultipleCompNewCode").value=win[3];
  document.all("MultipleCompNewNote").value=win[4];
  }
}

function MultipleselectNewCompIdTree(){
   var struId= document.all("MultipleCompNewIdTree");
   var checkStruId="" ;
   checkStruId=struId.value;
   
  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=1&isCheckBox=1&isIncludeSelf=1&isTree=1&isIncludeStruPath=1&checkStruId="+checkStruId;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultipleCompNewNodeIdTree").value=win[0];
  document.all("MultipleCompNewNameTree").value=win[1];
  document.all("MultipleCompNewIdTree").value=win[2];
  document.all("MultipleCompNewIdCode").value=win[3];
  document.all("MultipleCompNewIdNote").value=win[4];
  }
}
// 部门

function selectNewDeptId(){
  var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=2&isCheckBox=0&isIncludeSelf=0&isTree=0";      
  var url ="jsp/help.jsp?url="+cmdUrl;   
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("DeptNewNodeId").value=win[0];
  document.all("DeptNewName").value=win[1];
  document.all("DeptNewId").value=win[2];
  document.all("DeptNewCode").value=win[3];
  }
}

function selectNewDeptIdTree(){
   var struId= document.all("DeptNewIdTree")[0];
   var checkStruId="" ;
   checkStruId=struId.value;

  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=2&isCheckBox=0&isIncludeSelf=0&isTree=1&checkStruId="+checkStruId;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("DeptNewNodeIdTree").value=win[0];
  document.all("DeptNewNameTree").value=win[1];
  document.all("DeptNewIdTree").value=win[2];
  document.all("DeptNewIdCode").value=win[3];
  }
}
function MultipleselectNewDeptId(){
  var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=2&isCheckBox=1&isIncludeSelf=1&isTree=0";
  var url ="jsp/help.jsp?url="+cmdUrl;       
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultipleDeptNewNodeId").value=win[0];
  document.all("MultipleDeptNewName").value=win[1];
  document.all("MultipleDeptNewId").value=win[2];
  document.all("MultipleDeptNewCode").value=win[3];
  }
}

function MultipleselectNewDeptIdTree(){

   var struId= document.all("MultipleDeptNewIdTree")[0];
   var checkStruId="" ;
   checkStruId=struId.value;

  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=2&isCheckBox=1&isIncludeSelf=0&isTree=1&checkStruId="+checkStruId;         
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultipleDeptNewNodeIdTree").value=win[0];
  document.all("MultipleDeptNewNameTree").value=win[1];
  document.all("MultipleDeptNewIdTree").value=win[2];
  document.all("MultipleDeptNewIdCode").value=win[3];
  }
 } 
  //岗位
  function selectNewPostId(){
  var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=6&isCheckBox=0&isIncludeSelf=0&isTree=0";
  var url ="jsp/help.jsp?url="+cmdUrl;        
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("PostNewNodeId").value=win[0];
  document.all("PostNewName").value=win[1];
  document.all("PostNewId").value=win[2];
  document.all("PostNewCode").value=win[3];
  }
}

function selectNewPostIdTree(){
   var struId= document.all("PostNewIdTree");
   var checkStruId="" ;
   checkStruId=struId.value;

  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=6&isCheckBox=0&isIncludeSelf=0&isTree=1&checkStruId="+checkStruId;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("PostNewNodeIdTree").value=win[0];
  document.all("PostNewNameTree").value=win[1];
  document.all("PostNewIdTree").value=win[2];
  document.all("PostNewIdCode").value=win[3];
  }
}
function MultipleselectNewPostId(){
  var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=6&isCheckBox=1&isIncludeSelf=1&isTree=0";      
  var url ="jsp/help.jsp?url="+cmdUrl;    
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultiplePostNewNodeId").value=win[0];
  document.all("MultiplePostNewName").value=win[1];
  document.all("MultiplePostNewId").value=win[2];
  document.all("MultiplePostNewCode").value=win[3];
  }
}

function MultipleselectNewPostIdTree(){

   var struId= document.all("MultiplePostNewIdTree");
   var checkStruId="" ;
   checkStruId=struId.value;
  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=6&isCheckBox=1&isIncludeSelf=1&isTree=1&checkStruId="+checkStruId;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultiplePostNewNodeIdTree").value=win[0];
  document.all("MultiplePostNewNameTree").value=win[1];
  document.all("MultiplePostNewIdTree").value=win[2];
  document.all("MultiplePostNewIdCode").value=win[3];
  }
}
//员工
  function selectNewEmplId(){
  var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=0";      
  var url ="jsp/help.jsp?url="+cmdUrl;     
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("EmplNewNodeId").value=win[0];
  document.all("EmplNewName").value=win[1];
  document.all("EmplNewId").value=win[2];
  document.all("EmplNewCode").value=win[3];
  }
}
function selectNewEmplIdTree(){
   var struId= document.all("EmplNewIdTree");
   var checkStruId="" ;
   checkStruId=struId.value;
  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1&checkStruId="+checkStruId; 
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("EmplNewNodeIdTree").value=win[0];
  document.all("EmplNewNameTree").value=win[1];
  document.all("EmplNewIdTree").value=win[2];
  document.all("EmplNewIdCode").value=win[3];
  }
}
function MultipleselectNewEmplId(){
  var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=8&isCheckBox=1&isIncludeSelf=1&isTree=0";      
  var url ="jsp/help.jsp?url="+cmdUrl;    
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultipleEmplNewNodeId").value=win[0];
  document.all("MultipleEmplNewName").value=win[1];
  document.all("MultipleEmplNewId").value=win[2];
  document.all("MultipleEmplNewCode").value=win[3];
  }
}

function MultipleselectNewEmplIdTree(){
   var struId= document.all("MultipleEmplNewIdTree");
   var checkStruId="" ;
  checkStruId=struId.value;
  var url ="stru.cmd?method=getSelectRoot&rootId=1&organType=8&isCheckBox=1&isIncludeSelf=1&isTree=1&checkStruId="+checkStruId;    
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultipleEmplNewNodeIdTree").value=win[0];
  document.all("MultipleEmplNewNameTree").value=win[1];
  document.all("MultipleEmplNewIdTree").value=win[2];
  document.all("MultipleEmplNewIdCode").value=win[3];
  }
}
//部门 （加了struType）

function selectNewDeptStruTypeId(){
  var cmdUrl="stru.cmd&method=getSelectRoot&organType=2&isCheckBox=0&isIncludeSelf=0&isTree=0&struType=00";      
  var url ="jsp/help.jsp?url="+cmdUrl;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("DeptStruTypeNewNodeId").value=win[0];
  document.all("DeptStruTypeNewName").value=win[1];
  document.all("DeptStruTypeNewId").value=win[2];
  document.all("DeptStruTypeNewCode").value=win[3];
  }
}

function selectNewDeptStruTypeIdTree(){

   var struId= document.all("DeptStruTypeNewIdTree");
   var checkStruId="" ;
  checkStruId=struId.value;
  var url ="stru.cmd?method=getSelectRoot&organType=2&isCheckBox=0&isIncludeSelf=0&isTree=1&struType=00&checkStruId="+checkStruId;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("DeptStruTypeNewNodeIdTree").value=win[0];
  document.all("DeptStruTypeNewNameTree").value=win[1];
  document.all("DeptStruTypeNewIdTree").value=win[2];
  document.all("DeptStruTypeNewIdCode").value=win[3];
  }
}
function MultipleselectNewDeptStruTypeId(){
  var cmdUrl="stru.cmd&method=getSelectRoot&organType=2&isCheckBox=1&isIncludeSelf=1&isTree=0&struType=00";      
  var url ="jsp/help.jsp?url="+cmdUrl;       
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultipleDeptStruTypeNewNodeId").value=win[0];
  document.all("MultipleDeptStruTypeNewName").value=win[1];
  document.all("MultipleDeptStruTypeNewId").value=win[2];
  document.all("MultipleDeptStruTypeNewCode").value=win[3];
  }
}

function MultipleselectNewDeptStruTypeIdTree(){

   var struId= document.all("MultipleDeptStruTypeNewIdTree");
   var checkStruId="" ;
  checkStruId=struId.value;
  var url ="stru.cmd?method=getSelectRoot&organType=2&isCheckBox=1&isIncludeSelf=1&isTree=1&struType=00&checkStruId="+checkStruId;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("MultipleDeptStruTypeNewNodeIdTree").value=win[0];
  document.all("MultipleDeptStruTypeNewNameTree").value=win[1];
  document.all("MultipleDeptStruTypeNewIdTree").value=win[2];
  document.all("MultipleDeptStruTypeNewIdCode").value=win[3];
  }
 }
 function getUnderlingByOrganType(){
 //上级是部门2的岗位6的选择
 // var cmdUrl="stru.cmd&method=getUnderlingByOrganType&rootId=S00000000000101&parentOrganType=2&isCheckBox=1&isIncludeSelf=0&isIncludeStruPath=1&underlingOrganType=6";
//上级是岗位61的员工8的选择
var cmdUrl="stru.cmd&method=getUnderlingByOrganType&rootId=S00000000000101&parentOrganType=61&isCheckBox=1&isIncludeSelf=0&isIncludeStruPath=1&underlingOrganType=8";
  var url ="jsp/help.jsp?url="+cmdUrl;     
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("CompNewNodeId1").value=win[0];
  document.all("CompNewName1").value=win[1];
  document.all("CompNewId1").value=win[2];
  document.all("CompNewCode1").value=win[3];
  document.all("CompNewNote1").value=win[4];
  }
}

function selectNewDeptIdTree1(){
   var struId= document.all("DeptNewIdTree")[1];
   var checkStruId="" ;
   checkStruId=struId.value;

  var url ="stru.cmd?method=getSelectRoot&rootId=1&showOrganType=1,2&organType=2&isCheckBox=0&isIncludeSelf=0&isTree=1&checkStruId="+checkStruId;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("DeptNewNodeIdTree").value=win[0];
  document.all("DeptNewNameTree").value=win[1];
  document.all("DeptNewIdTree").value=win[2];
  document.all("DeptNewIdCode").value=win[3];
  }
}

function MultipleselectNewDeptIdTree1(){
	var struId= document.all("MultipleDeptNewIdTree")[1];
	var checkStruId="" ;
	checkStruId=struId.value;
	var url ="stru.cmd?method=getSelectRoot&rootId=1&showOrganType=1,2&organType=2&isCheckBox=1&isIncludeSelf=0&isTree=1&checkStruId="+checkStruId;         
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
	if (win == null) {  
	return;
	}else{
	document.all("MultipleDeptNewNodeIdTree").value=win[0];
	document.all("MultipleDeptNewNameTree").value=win[1];
	document.all("MultipleDeptNewIdTree").value=win[2];
	document.all("MultipleDeptNewIdCode").value=win[3];
	}
 } 
</script>
