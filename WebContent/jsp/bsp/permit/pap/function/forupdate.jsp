<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
 
<HTML>
<HEAD>
<TITLE>功能修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script> 
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>

<%
    String refreshId = (String)request.getAttribute("refreshId");
%>
<script language="javascript">
function checkPubFunctions(){
	 var functionCode = document.forms[0].functionCode;
	 if (trim(functionCode.value)==""){
	   alert("请输入功能编号！"); 
	   tab1.doCardShow("card0");
       functionCode.select();
       functionCode.focus();   
	    return false;
	 }
     functionCode.value = trim(functionCode.value) ;
//     var rs = /^([0-9]|[a-z]|[A-Z])+$/;
//    if(!rs.test(functionCode.value)){
//       alert("功能编号必须是英文字符或数字！");
//       tab1.doCardShow("card0");
//       functionCode.value="";
//       functionCode.select();
//       functionCode.focus();
//      return false;
//    }
    
	 var functionName = document.forms[0].functionName;
	 if (trim(functionName.value)==""){
	    alert("请输入功能名称！");    
	 //   tab1.doCardShow("card0");
        functionName.select();
        functionName.focus();
	    return false;
	 }
     functionName.value = trim(functionName.value);
     if(!stringLengthCheck(functionCode,99,"功能编号不能超过99个字符!")){
     //	tab1.doCardShow("card0");
     	functionCode.value="";
        functionCode.select();
        functionCode.focus();  
        return false;
     }
     if(!stringLengthCheck(functionName,40,"功能名称不能超过40个字符!")){
    // 	tab1.doCardShow("card0");
     	functionName.value="";
        functionName.select();
        functionName.focus();
        return false;
     }
	 return true
}

</script>
</HEAD>
<BODY topmargin="5px">
<bsp:container title="功能修改" >
<bsp:containbutton text="保存" onclick="doConfirm()" action="function.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<html:form  name="frmList"  action="">
  <table width="100%" cellpadding="0" class="tblContent">  
  
                <html:hidden name="moduleId" property="moduleId"/>
                
                <tr>
                    <td class="tdTitle">功能系统编码：</td>
                    <td class="tdRight"><html:hidden name="functionId" property="functionId" write="true" /></td>
                </tr>
                
                <tr>
                    <td class="tdRight">&nbsp </td>
                </tr> 
                
		        <tr>
                    <td class="tdTitle">功能编号：</td>
                    <td class="tdRight"><html:text name="functionCode" property="functionCode" size="40" maxlength="99" /><FONT COLOR=#ff0000>*</FONT></td>
                </tr>    
                
                <tr>
                    <td class="tdRight">&nbsp </td>
                </tr>
                                
		        <tr>
                    <td class="tdTitle">功能名称：</td>
                    <td class="tdRight"><html:text name="functionName" property="functionName" size="30" maxlength="40" /><FONT COLOR=#ff0000>*</FONT></td>
                </tr> 
                
                <tr>
                    <td class="tdRight">&nbsp </td>
                </tr>
                
                <tr>
                    <td class="tdRight">&nbsp </td>
                </tr>
                
               	<tr>
                    <td class="tdTitle">是否系统功能：</td>
                    <td class="tdRight"><html:checkbox name="isSys" property="isSys" value="1" /></td>
                </tr>  	
  </table>

</html:form>
</bsp:container>
</body>
</html>
<script language="javascript">

function doConfirm(){
if(!checkPubFunctions()) return;
  document.forms[0].action="function.cmd?method=update&refreshId="+"<%=refreshId%>";
  document.forms[0].submit();
}
function forReset(){  
  document.forms[0].reset();	
}

</script>
