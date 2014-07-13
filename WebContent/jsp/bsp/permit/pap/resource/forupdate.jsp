<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>

<% 
    String functionId = (String)request.getAttribute("functionId");
String string = Global.getString("net.mast.bsp.isExactPermit");
%>

<HTML>
<HEAD>
<TITLE>��Դ�޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubResources(){
	  var resourceName = document.forms[0].resourceName;
	  if (trim(resourceName.value)==""){
	    alert("������������ƣ�");    
	    return false;
	  }
      resourceName.value = trim(resourceName.value) ;
	  var resourceAlias = document.forms[0].resourceAlias;	
      if (trim(resourceAlias.value)==""){
	    alert("���������ҵ���壡");    
	    return false;
	  }
      resourceAlias.value = trim(resourceAlias.value) ;
	  var urlNames = document.forms[0].urlNames;
	  if (trim(urlNames.value)==""){
	    alert("������URL��");    
	    return false;
	  }
      urlNames.value = trim(urlNames.value) ;
       if(!stringLengthCheck(resourceName,30,"�������Ʋ��ܳ���30���ַ�!")){
        resourceName.value="";
        resourceName.select();
        resourceName.focus();
        return false;
      }
      if(!stringLengthCheck(resourceAlias,60,"ҵ���岻�ܳ���60���ַ�!")){
        resourceAlias.value="";
        resourceAlias.select();
        resourceAlias.focus();
        return false;
      } 
	  return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��Դ�޸�" >
<bsp:containbutton text="����" onclick="forSave()" action="resources.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forCancel()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  
                    <html:hidden name="functionId" property="functionId"/>
                    <html:hidden name="resTypeName" property="resTypeName"/>
                    
                    
		    <tr style="display:none">
                    <td class="tdTitle" >�������룺</td>
                    <td class="tdRight"><html:hidden name="resourceId" property="resourceId" write="true"/></td>           
                    </tr>    
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>
                                    
		    <tr>
                    <td class="tdTitle">�������ƣ�</td>
                    <td class="tdRight"><html:text name="resourceName" property="resourceName" size="30" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>   
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>                 
					<tr>
                    <td class="tdTitle">ҵ���壺</td>
                    <td class="tdRight"><html:text name="resourceAlias" property="resourceAlias" size="40" maxlength="60" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr> 
                       <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>        
                             
                    
              <%
			if (string != null && string.equals("true")) {
			%>
			
			  <tr>
                    <td class="tdTitle">�������ͣ�</td>
                       <td class="tdRight">
                       <html:select name="resTypeId" property="resTypeId" >
	               <html:options collection="resTypeCollection" labelProperty="RES_TYPE_NAME" property="RES_TYPE_ID"/>
	               </html:select></td>
                    </tr> 
                     <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>            
			<%
			} else {
			%>
			<tr style="display:none">
                    <td class="tdTitle">�������ͣ�</td>
                       <td class="tdRight">
                       <html:select name="resTypeId" property="resTypeId" >
	               <html:options collection="resTypeCollection" labelProperty="RES_TYPE_NAME" property="RES_TYPE_ID"/>
	               </html:select></td>
                    </tr>        
			<%
			}
			%>
            
                    
                      
                                             
		    <tr>
                    <td class="tdTitle">URL��</td>
                    <td class="tdRight"><html:textarea name="urlNames" property="urlNames" cols="40"   /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>
                                        
		    <tr>
		    <td class="tdTitle">��ȫ����</td>
		    <td class="tdRight">
			<html:select name="securityLevel" property="securityLevel" >
			<html:options collection="PUBRESOURCES_SECURITYLEVEL_COLLECTION" labelProperty="LEVEL_NAME" property="SECURITY_LEVEL" />
			</html:select>
		    </td>
		    </tr>
		    
	            <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>
		    
		    <tr>   
               	    <td class="tdTitle">ȱʡ������</td>
                    <td class="tdRight"><html:checkbox name="isDefault" property="isDefault" value="1"/></td>
                    </tr> 
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>
                    
                    <tr>   
               	    <td class="tdTitle">��Ҫ��ƣ�</td>
                    <td class="tdRight"><html:checkbox name="isAudit" property="isAudit" value="1"/></td>
                    </tr> 
					
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubResources()) 
	  return;	
	var functionId=document.all("functionId").value;
	var select = document.getElementById("resTypeId");		
	document.all("resTypeName").value = select.options[select.selectedIndex].innerText;
	document.forms[0].action="resources.cmd?method=update&functionId="+functionId;
	document.forms[0].submit();

}
function forCancel(){
	document.forms[0].reset();	
}

</script>