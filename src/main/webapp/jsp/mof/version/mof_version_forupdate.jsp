<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>�汾�����޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMofVersion(){
	var version = document.forms[0].version;
      version.value = trim(version.value);
	 if ( byteLength(version.value)>60 ) 
    {
  	  alert("����汾��̫�������ó���60���ֽ�!");
  	  version.focus();
	  return false;
    }
  	  /* 
   	 if ( __isQuoteIn(version.value) )
	  {
	    alert("�汾�Ų��ܺ������Ż�����!");
	    version.select();
	    version.focus();
	    return false;
	  }
	  */
 	var versionDate = document.forms[0].versionDate;
  	if (trim(versionDate.value)=="")
	{
	  alert("�����뱣��ʱ�䣡");   
	  versionDate.focus(); 
	  return false;
	}
    versionDate.value = trim(versionDate.value) ;
    var versionUser = document.forms[0].versionUser;
    if ( byteLength(trim(versionUser.value))>60 ) 
    {
  	  alert("���뱣����Ա������̫�������ó���60���ֽ�!");
  	  versionUser.focus();
	  return false;
    }
	var versionNote = document.forms[0].versionNote;
	if ( byteLength(trim(versionNote.value))>255 ) 
    {
  	  alert("����ı�ע̫�������ó���255���ֽ�!");
  	  versionNote.focus();
	  return false;
    }
	var versionType = document.forms[0].versionType;
  	if (trim(versionType.value)=="")
	{
	  alert("������ģ���������ͣ�");   
	  versionType.focus(); 
	  return false;
	}
    versionType.value = trim(versionType.value) ;
      	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="�汾�����޸�" >
<bsp:containbutton action="mofversion.cmd?method=update" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="mofversionquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_VERSION.VERSION")%>��</td>
                    <td class="tdRight"><html:hidden name="version" property="version" write="true"/></td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_VERSION.VERSION_DATE")%>��</td>
                    <td class="tdRight"><html:hidden name="versionDate" property="versionDate" write="true"/></td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_VERSION.VERSION_USER")%>��</td>
                    <td class="tdRight"><html:text name="versionUser" property="versionUser" size="60" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_VERSION.VERSION_NOTE")%>��</td>
                    <td class="tdRight"><html:textarea name="versionNote" property="versionNote" rows="5" cols="80" /></td>
                    </tr>                    
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MOF_VERSION.VERSION_TYPE")%>��</td>
                    <td class="tdRight"><html:label name="versionType" property="versionType" collection="MOFVERSION_VERSIONTYPE_COLLECTION" labelProperty="value" labelKey="key" /></td>
                    </tr>                                  
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMofVersion()) return;	
  document.forms[0].action ="mofversion.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofversionquery_page_init.cmd?clear=true";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>