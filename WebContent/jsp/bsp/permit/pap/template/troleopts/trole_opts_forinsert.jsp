<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>��Ȩģ���ɫ��Դ����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubTroleOpts(){
if (trim(roleId.value)=="")
	{
	  alert("�������ɫ���룡");
	  roleId.select();
	  roleId.focus();  
	  return false;
	}
    roleId.value = trim(roleId.value) ;
	 
	  var resourceId = document.forms[0].resourceId;
	  if ( __isQuoteIn(resourceId.value) )
	  {
	    alert("��Դ���벻�ܺ��������ַ���");
	    resourceId.value="";
	    resourceId.select();
	    resourceId.focus();
	    return false;
	  }
	if (trim(resourceId.value)=="")
	{
	  alert("��������Դ���룡"); 
	  resourceId.select();
	  resourceId.focus();   
	  return false;
	}
    resourceId.value = trim(resourceId.value) ;
    
  if(!stringLengthCheck(roleId,30,"��ɫ���벻�ܳ���30���ַ�!")){
      roleId.value="";
  	  roleId.select();
	  roleId.focus(); 
      return false;
  }
  if(!stringLengthCheck(resourceId,30,"��Դ���벻�ܳ���30���ַ�!")){
      resourceId.value="";
  	  resourceId.select();
	  resourceId.focus();   
      return false;
  } 
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<%
String tRoleId = (String)request.getAttribute("tRoleId");
if (tRoleId==null){
    tRoleId="";
}
%>
<html:form  name="frmList"  action="">
<bsp:container title="��Ȩģ���ɫ��Դ����" >
<bsp:containbutton text="���沢����" onclick="forSaveContinue()" action ="tRoleopts.cmd?method=insertContinue"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action ="troleoptsquery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
				  	<tr>
				      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_TROLE_OPTS.ROLE_ID")%>��</td>
				      <td class="tdRight"><html:text name="roleId" property="roleId" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>

				    </tr>
				  	<tr>
				      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_TROLE_OPTS.RESOURCE_ID")%>��</td>
				      <td class="tdRight">
				      
				      	<html:text name="resourceId" property="resourceId" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
			
				    </tr>
  </table>
</div>
</bsp:container>
<html:hidden name="tRoleId"  write="true" value='<%=tRoleId%>'/>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSaveContinue(){
  if(!checkPubTroleOpts()) return;
  var tRoleId=document.all("tRoleId").value;
  alert("tRoleId"+tRoleId);
  document.forms[0].action ="tRoleopts.cmd?method=insertContinue&tRoleId="+tRoleId;
  document.forms[0].submit();	
}
function forReturn(){
  var tRoleId=document.all("tRoleId").value;
  document.forms[0].action ="troleoptsquery.cmd?tRoleId="+tRoleId;
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>