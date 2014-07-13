<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>

<HTML>
<HEAD>
<TITLE>��������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>

<%
    String refreshId = (String)request.getAttribute("refreshId");
  
%>
<script language="javascript">
function checkPubFunctions(){
	 var functionId = document.forms[0].functionId;

	 if (trim(functionId.value)==""){
	    alert("�����빦��ϵͳ���룡");
	    //tab1.doCardShow("card0");
	    functionId.select();
	    functionId.focus(); 
	    return false;
	 }
     functionId.value = trim(functionId.value) ;
     var rs = /^([0-9]|[a-z]|[A-Z])+$/;
     if(!rs.test(functionId.value)){
       alert("����ϵͳ���������Ӣ���ַ������֣�");
	    tab1.doCardShow("card0");
	    functionId.value="";
	    functionId.select();
	    functionId.focus(); 
       return false;
    }
	 var functionCode = document.forms[0].functionCode;
	 if (trim(functionCode.value)==""){
	    alert("�����빦�ܱ�ţ�");  
	   //tab1.doCardShow("card0");
       functionCode.select();
       functionCode.focus();  
	    return false;
	 }
     functionCode.value = trim(functionCode.value) ;
     var rs = /^([0-9]|[a-z]|[A-Z])+$/;
     if(!rs.test(functionCode.value)){
       alert("���ܱ�ű�����Ӣ���ַ������֣�");
      // tab1.doCardShow("card0");
       functionCode.value="";
       functionCode.select();
       functionCode.focus(); 
       return false;
    }
 
	 var functionName = document.forms[0].functionName;
	 if (trim(functionName.value)==""){
	    alert("�����빦�����ƣ�"); 
	   // tab1.doCardShow("card0");
        functionName.select();
        functionName.focus();   
	    return false;
	 }
     functionName.value = trim(functionName.value);
    
    if(!stringLengthCheck(functionId,30,"����ϵͳ���벻�ܳ���30���ַ�!")){
     // tab1.doCardShow("card0");
      functionId.value="";
	  functionId.select();
	  functionId.focus();
      return false;
    }
    if(!stringLengthCheck(functionCode,99,"���ܱ�Ų��ܳ���99���ַ�!")){
       tab1.doCardShow("card0");
       functionCode.value="";
       functionCode.select();
       functionCode.focus();  
      return false;
    }
    if(!stringLengthCheck(functionName,40,"�������Ʋ��ܳ���40���ַ�!")){
     // tab1.doCardShow("card0");
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
<bsp:container title="���ӹ���" >
<bsp:containbutton text="����" onclick="doConfirm()" action="function.cmd?method=insert"></bsp:containbutton>
<html:form  name="frmList"  action="resourcesQuery.cmd">
  <table width="100%" cellpadding="0" class="tblContent">  
  
                    <html:hidden name="moduleId" property="moduleId"/>
                    
		            <tr>
                         <td class="tdTitle">����ϵͳ���룺</td>
                         <td class="tdRight"><html:text name="functionId" property="functionId" size="30" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>      
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>                
		    
		            <tr>
                         <td class="tdTitle">���ܱ�ţ�</td>
                         <td class="tdRight"><html:text name="functionCode" property="functionCode" size="40" maxlength="99" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>       
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>                  
		    
		            <tr>
                         <td class="tdTitle">�������ƣ�</td>
                         <td class="tdRight"><html:text name="functionName" property="functionName" size="30" maxlength="40" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr> 
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>     
 <%                    
//                     <tr>
//						<td class="tdTitle">����Ȩ�����ͣ�</td>
//						<td class="tdRight">
//						<html:select name="dataResType"	property="dataResType">
//							<html:options collection="PUBFUNCTIONS_DATARESTYPE_COLLECTION" labelProperty="typeName" property="dataResType"/>
//						</html:select>
//					    </td>
//				    </tr>
				    %>                 	
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>     
                    
                    <tr>
                         <td class="tdTitle">�Ƿ�ϵͳ���ܣ�</td>
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
  document.forms[0].action="function.cmd?method=insert&refreshId="+"<%=refreshId%>";	
  document.forms[0].submit();
}
</script>