<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.bsp.permit.pap.view.ModuleView"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%
   String refreshId = (String)request.getAttribute("refreshId");
   ModuleView moduleView = (ModuleView)request.getAttribute("html.data");
   String isLeaf= moduleView.getIsLeaf();
   String isLeafName = "";
   if(isLeaf.equals("1"))
     isLeafName = "是";
   else
     isLeafName = "否";
%>

<HTML>
<HEAD>
<TITLE>模块修改</TITLE>
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
	  moduleId.focus(); 
	  return false;
	}
    moduleId.value = trim(moduleId.value) ;
	var moduleName = document.forms[0].moduleName;
	if (trim(moduleName.value)=="")
	{
	  alert("请输入模块名称！");   
	  moduleName.select();
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
<bsp:container title="模块修改" >
<bsp:containbutton text="保存" onclick="forSave()" action="module.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle">模块代码：</td>
                    <td class="tdRight"><html:hidden name="moduleId" property="moduleId" write="true" /></td>
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
                    
                    <html:hidden name="isLeaf" property="isLeaf" />
                                       
					<tr>
                    <td class="tdTitle">是否末级模块：</td>
                    <td class="tdRight"><%=isLeafName%></td>
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
  document.forms[0].action ="module.cmd?method=update&refreshId="+"<%=refreshId%>";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>