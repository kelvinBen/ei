<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>授权模板修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubTemplates(){
	var templateId = document.forms[0].templateId;
    if ( __isQuoteIn(templateId.value) )
    {
       alert("模板内码不能含有特殊字符！");  
       templateId.value="";
       templateId.select();
       templateId.focus();  
       return false;
    }
	if (trim(templateId.value)=="")
	{
	  alert("请输入模板内码！");
	  templateId.select();
      templateId.focus();       
	  return false;
	}
    templateId.value = trim(templateId.value) ;
	var templateName = document.forms[0].templateName;
	if (trim(templateName.value)=="")
	{
	  alert("请输入模板名称！"); 
	  templateName.select();
	  templateName.focus();   
	  return false;
	}
    templateName.value = trim(templateName.value) ;
   if(!stringLengthCheck(templateId,30,"模板内码不能超过30个字符!")){
     templateId.value="";
     templateId.select();
     templateId.focus();   
     return false;
  } 
   if(!stringLengthCheck(templateName,100,"模板名称不能超过100个字符!")){
     templateName.value="";
     templateName.select();
	 templateName.focus(); 
     return false;
  }
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="授权模板修改" >
<bsp:containbutton text="保存" onclick="forSave()" action ="templates.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action ="templatesquery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	 <tr>
       <td class="tdTitle"><%=ResourcesFactory.getString("PUB_TEMPLATES.TEMPLATE_ID")%>：</td>
       <td class="tdRight"><html:text name="templateId" property="templateId" size="30" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
     </tr>                    
	<tr>
       <td class="tdTitle"><%=ResourcesFactory.getString("PUB_TEMPLATES.TEMPLATE_NAME")%>：</td>
       <td class="tdRight"><html:text name="templateName" property="templateName" size="100" maxlength="100" /><FONT COLOR=#ff0000>*</FONT></td>
    </tr>    
   
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubTemplates()) return;	
  document.forms[0].action ="templates.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="templatesquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>