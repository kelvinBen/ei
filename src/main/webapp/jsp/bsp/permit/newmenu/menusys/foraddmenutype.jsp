<%@ page contentType="text/html;charset=GBK" %>
 
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>系统菜单增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="系统菜单增加" >
<bsp:containbutton action="menusys.cmd?method=addMenuType" text="确定" onclick="addMenuType()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle">菜单代码：</td>
      <td class="tdRight"><html:text name="typeId" property="typeId" size="30" maxlength="10" /><FONT COLOR=#ff0000>*</FONT></td>
    </tr>
    <tr>
      <td class="tdTitle">菜单名称：</td>
      <td class="tdRight"><html:text name="typeName" property="typeName" size="30" maxlength="60" /><FONT COLOR=#ff0000>*</FONT></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function   jslen(str)   
  {   
  jlen   =   str.length   
  for   (i=0;i<str.length;i++)   
  {   
  if   (str.charCodeAt(i)>255)   jlen++   
  }   
  return   jlen   
  } 
  
function addMenuType(){
	var typeId = document.forms[0].typeId;
	 
  	if(trim(typeId.value)==""){
		alert("请输入菜单代码!");
		document.forms[0].typeId.focus();
		return;
	}   
	if(jslen(typeId.value)>10){
	  alert("菜单代码长度不能超过10个字符！");
      typeId.value="";
      typeId.focus();
      return false;
	}
	if ( __isQuoteIn(typeId.value) )
	  {
	    alert("菜单代码不能含有特殊字符！");
	    typeId.select();
	    typeId.focus();
	    return false;
	  }
 
	var typeName = document.forms[0].typeName;
  	if(trim(typeName.value)==""){
		alert("请输入菜单名称!");
		document.forms[0].typeName.focus();
		return;
	}    	
	if(jslen(typeName.value)>60){
	  alert("菜单名称长度不能超过60个字符！");
      typeName.value="";
      typeName.focus();
      return false;
  }
  if ( __isQuoteIn(typeName.value) )
	  {
	    alert("菜单名称不能含有特殊字符！");
	    typeName.select();
	    typeName.focus();
	    return false;
	  }
  
  typeId = trim(typeId.value);
  typeName = trim(typeName.value);
  		
  document.forms[0].action ="menusys.cmd?method=addMenuType";
  document.forms[0].submit();	
}
</script>