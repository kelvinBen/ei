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
     isLeafName = "��";
   else
     isLeafName = "��";
%>

<HTML>
<HEAD>
<TITLE>ģ���޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubModules(){ 
	var moduleId = document.forms[0].moduleId;
    if ( __isQuoteIn(moduleId.value) )
    {
      alert("ģ����벻�ܺ��������ַ���");  
      moduleId.value="";
      moduleId.select();
      moduleId.focus();    
      return false;
    }
	if (trim(moduleId.value)=="")
	{
	  alert("������ģ����룡");  
	  moduleId.focus(); 
	  return false;
	}
    moduleId.value = trim(moduleId.value) ;
	var moduleName = document.forms[0].moduleName;
	if (trim(moduleName.value)=="")
	{
	  alert("������ģ�����ƣ�");   
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
<bsp:container title="ģ���޸�" >
<bsp:containbutton text="����" onclick="forSave()" action="module.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle">ģ����룺</td>
                    <td class="tdRight"><html:hidden name="moduleId" property="moduleId" write="true" /></td>
                    </tr>      
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>                
					<tr>
                    <td class="tdTitle">ģ�����ƣ�</td>
                    <td class="tdRight"><html:text name="moduleName" property="moduleName" size="40" maxlength="40" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>    
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>      
                    
                    <html:hidden name="parentModuleId" property="parentModuleId" />
                                     
					<tr>
                    <td class="tdTitle">�ϼ�ģ�����ƣ�</td>
                    <td class="tdRight"><html:hidden name="parentModuleName" property="parentModuleName" write="true" /></td>
                    </tr>    
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>    
                    
                    <html:hidden name="isLeaf" property="isLeaf" />
                                       
					<tr>
                    <td class="tdTitle">�Ƿ�ĩ��ģ�飺</td>
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