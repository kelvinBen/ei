<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="net.mast.waf.ComponentFactory" %>
<%@ page import="net.mast.bsp.base.id.domain.support.TestIdtable" %>
<%@ page import="net.mast.bsp.permit.context.BspInfo" %>

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
<td><label class="title">ѡ���ɫ��ʾҳ��</label></td>
<% 
  // TestIdtable testIdtable=(TestIdtable)ComponentFactory.getBean("testIdDomain");
  // testIdtable.test();   
   String file=request.getServletPath().substring(1);
   String app=request.getContextPath();
   //out.println(UserProvider.isHasRole("employee"));
   String roleId=(String)request.getAttribute("roleId");
   if(roleId==null)
	   roleId="GPUBLIC";
   BspInfo bspInfo=(BspInfo)request.getSession().getAttribute("UserLoginInfo");
   out.println("getDataResourcePermit(1)"+bspInfo.getDataResourcePermit("1"));
   out.println("getDefaultDataResourcePermit(1)"+bspInfo.getDefaultDataResourcePermit("1"));
   out.println("getDataResourcePermitList(1)"+bspInfo.getDataResourcePermitList("1"));
   out.println("bspInfo.getDataResourcePermitList(1,00)"+bspInfo.getDataResourcePermitList("1","00"));
   out.println("bspInfo.getDefaultDataResourcePermitWithHashMap(1)"+bspInfo.getDefaultDataResourcePermitWithHashMap("1"));
   
   
%>
</tr>
</table>
<hr>
          <table width="100%" border=1><tr><td colspan=2>ѡ��</td></tr>
		
		   <tr>
		      <td class="tdTitle">ѡ���ɫ(��ѡ):</td>
		      <td class="tdRight">
		      <input type="text" name="roleId" maxlength="60" size="20" value="��ɫ����" readonly="readonly">  
		      <input type="text" name="roleAlias" maxlength="60" size="20" value="��ɫ����" readonly="readonly"> 
		       <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectRole()">
		      </td>
		   </tr> 
		    <tr>
		      <td class="tdTitle">ѡ���ɫ����ѡ��:</td>
		      <td class="tdRight">
		      <input type="text" name="choiceroleId" maxlength="60" size="20" value="��ɫ����" readonly="readonly">  
		      <input type="text" name="choiceroleAlias" maxlength="60" size="20" value="��ɫ����" readonly="readonly"> 
		       <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="select()">
		      </td>
		   </tr> 
		   <tr>
		      <td class="tdTitle">ѡ���û������Σ�:</td>
		      <td class="tdRight">
		      <input type="text" name="userId" maxlength="60" size="20" value="�û�Id" readonly="readonly">  
		      <input type="text" name="userName" maxlength="60" size="20" value="�û�����" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectUser()">
		      </td>
           </tr> 
		   <tr>
		      <td class="tdTitle">ѡ���û����б�:</td>
		      <td class="tdRight">
		      <input type="text" name="userId2" maxlength="60" size="20" value="�û�Id" readonly="readonly">  
		      <input type="text" name="userName2" maxlength="60" size="20" value="�û�����" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectUser2()">
		      </td>
           </tr> 
		  <tr>
		      <td class="tdTitle">ѡ�������ѡ�����Σ�:</td>
		      <td class="tdRight">
		      <input type="text" name="cantId1" maxlength="60" size="20" value="����ID" readonly="readonly">  
		      <input type="text" name="cantName1" maxlength="60" size="20" value="��������" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="cant1()">
		      </td>
           </tr>
           <tr>
		      <td class="tdTitle">ѡ�������ѡ�����Σ�:</td>
		      <td class="tdRight">
		      <input type="text" name="cantId2" maxlength="60" size="20" value="����ID" readonly="readonly">  
		      <input type="text" name="cantName2" maxlength="60" size="20" value="��������" readonly="readonly">
		          <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="cant2()">
		      </td>
           </tr>
          </table>

</body>
</html>
<script language="javascript">
function selectRole(){
  var url ="role.cmd?method=selectroot";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("roleId").value=win[0];
  document.all("roleAlias").value=win[1];
  }
}
function select(){
  var url ="role.cmd?method=choiceroot";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("choiceroleId").value=win[0];
  document.all("choiceroleAlias").value=win[1];
  }
}
function selectUser(){
	//�����ָ�����isCheckBox��roleId
  //var cmdUrl="role.cmd&method=getUserListOfRoleRoot&roleId="+"<%=roleId%>";
  //var cmdUrl="role.cmd&method=getUserListOfRoleRoot&&isCheckBox=0&roleId="+"<%=roleId%>";
  var cmdUrl="role.cmd&method=getUserListOfRoleRoot";
  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("userId").value=win[0];
  document.all("userName").value=win[1];
  }
}

function selectUser2(){
	//�����ָ�����isCheckBox��roleId
  //var cmdUrl="role.cmd&method=doHelpTable&roleId="+"<%=roleId%>";
  //var cmdUrl="role.cmd&method=doHelpTable&&isCheckBox=1&roleId="+"<%=roleId%>";
  var cmdUrl="role.cmd&method=doHelpTable";
  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("userId2").value=win[0];
  document.all("userName2").value=win[1];
  }
}


function cant1(){
	//�����ָ�����isCheckBox��country
//var cmdUrl="cant.cmd&method=getHelpRoot&country=CN&isCheckBox=0"; 
var cmdUrl="cant.cmd&method=getHelpRoot&country=CN&isCheckBox=1";  
    var url ="jsp/help.jsp?url="+cmdUrl;     

  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("cantId1").value=win[0];
  document.all("cantName1").value=win[1];
  }
}
function cant2(){
	//�����ָ�����isCheckBox��country
//var cmdUrl="cant.cmd&method=getHelpRoot&country=CN&isCheckBox=0"; 
var cmdUrl="cant.cmd&method=getHelpRoot&country=CN&isCheckBox=0";  
    var url ="jsp/help.jsp?url="+cmdUrl;     

  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("cantId2").value=win[0];
  document.all("cantName2").value=win[1];
  }
}
</script>
