<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%
   String refreshId = (String)request.getAttribute("refreshId");
%>

<HTML>
<HEAD>
<TITLE>模块增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubModules(){
	  var moduleId = document.forms[0].moduleId;
	  if ( __isQuoteIn(moduleId.value) )
	  {
	    alert("模块代码不能含有特殊字符！");
	    moduleId.value="";
	    moduleId.select();
	    moduleId.focus();
	    return false;
	  }
	if (trim(moduleId.value)=="")
	{
	  alert("请输入模块代码！");   
	  moduleId.select();
	  moduleId.focus();
	  return false;
	}
    moduleId.value = trim(moduleId.value) ;
     var rs = /^([0-9]|[a-z]|[A-Z])+$/;
     if(!rs.test(moduleId.value)){
       alert("模块代码必须是英文字符或数字！");
       moduleId.value="";
	   moduleId.select();
	   moduleId.focus(); 
       return false;
    }
	var moduleName = document.forms[0].moduleName;
	if (trim(moduleName.value)=="")
	{
	  alert("请输入模块名称！"); 
	  moduleName.select();
	  moduleName.focus();  
	  return false;
	}
		 if(byteLength(trim(moduleName.value))>"40")
  {
  	alert("模块名称输入过长");
    moduleName.focus();
    return false;
  }
    moduleName.value = trim(moduleName.value) ;
    
	return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="模块增加" >
<bsp:containbutton text="保存" onclick="forSave()" action="module.cmd?method=insert"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle">模块代码：</td>
                    <td class="tdRight"><html:text name="moduleId" property="moduleId" size="30" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>    
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>        
					<tr>
                    <td class="tdTitle">模块名称：</td>
                    <td class="tdRight"><html:text name="moduleName" property="moduleName" size="40" maxlength="40" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>  
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>        
                    
                    
                    <html:hidden name="parentModuleId" property="parentModuleId" />
                                    
					<tr>
                    <td class="tdTitle">上级模块名称：</td>
                    <td class="tdRight"><html:hidden name="parentModuleName" property="parentModuleName" write="true" /></td>
                    </tr>   
                     
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>                      
					<tr>
                    <td class="tdTitle">是否末级模块：</td>
                    <td class="tdRight"><html:checkbox name="isLeaf" property="isLeaf" value="1" /></td>
                    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubModules()) return;	
  document.forms[0].action ="module.cmd?method=insert&refreshId="+"<%=refreshId%>";
  document.forms[0].submit();	
}
</script>