<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<% 
	String corporationId=(String)request.getAttribute("corporationId");
	String departmentId = (String)request.getAttribute("departmentId");
	String departmentName = (String)request.getAttribute("departmentName");
%>
<HTML>
<HEAD>
<TITLE>有权限访问菜单的角色和用户统计表</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="有权限访问菜单的角色和用户统计表" >
<bsp:containbutton text="查询" onclick="forQuery()"></bsp:containbutton>
    <div align="center">
    <font size="5pt">有权限访问菜单的角色和用户统计表</font>
    <table cellpadding="0" class="tblContent">      
                    <tr>
                       <td class="tdTitle">系统菜单：</td>
                       <td class="tdRight" align="center">
                       <html:select name="typeId" value="" onchange="menuSysOnChang()">
                           <html:options collection="allMenuTypeList" labelProperty="typeName" property="typeId"/>
                       </html:select>
                       <html:hidden name="typeName" value=""/>
                       </td>
                    </tr>  				
                    <tr>
                       <td class="tdTitle">菜单项：</td>
                       <td class="tdRight" align="center"><html:hidden name="menuSysId" value="" write="false"/><html:text name="menuText"  value="" size="20" maxlength="20"  readonly="true" ondblclick="clean1()"/> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectMenu()"></td>
                    </tr>   
                    <tr>
                       <td class="tdTitle">用户帐户所属机构：</td>
                       <td class="tdRight" align="center"><html:hidden name="departmentId" value="<%=departmentId%>" write="false"/><html:text name="departmentName"  value="<%=departmentName%>" size="20" maxlength="20"  readonly="true" ondblclick="clean2()"/> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectDepartment()"></td>
                    </tr>                               
    </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function menuSysOnChang(){
	document.forms[0].menuSysId.value="";
	document.forms[0].menuText.value="";
}
function clean1(){
	document.forms[0].menuId.value="";   
	document.forms[0].menuText.value=""; 	
}
function clean2(){
	document.forms[0].departmentId.value="";   
	document.forms[0].departmentName.value=""; 	
}
function forQuery(){
  var menuSysId = document.forms[0].menuSysId;
  if(menuSysId.value=="")
  {
  	  alert("请选择菜单项后进行查询！");
      menuSysId.value="";
      menuSysId.select();
      return;
  }
  var departmentId = document.forms[0].departmentId;
  if(departmentId.value=="")
  {
  	  alert("请选择用户帐户所属机构后进行查询！");
      departmentId.value="";
      departmentId.select();
      return;
  }  
  var select = document.getElementById("typeId");
  document.forms[0].typeName.value = select.options[select.selectedIndex].innerText;
  
  document.forms[0].action ="menuvisitor.cmd?method=query";     
  document.forms[0].submit();
}
function selectDepartment(){
    var url="user.cmd?method=getStruUserRoot&isSelect=1";
    var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
    if(win==null)
       return;
    document.all("departmentId").value=win[2];
    document.all("departmentName").value=win[1];
}
function selectMenu(){
	var typeId = document.forms[0].typeId.value;
	var url ="menusys.cmd?method=getMenuSysRootHelp&menuTypeId="+typeId+"&isCheckBox=0";
    var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
    if(win==null)
       return;
    document.all("menuSysId").value=win[0];
    document.all("menuText").value=win[1];
}
</script>