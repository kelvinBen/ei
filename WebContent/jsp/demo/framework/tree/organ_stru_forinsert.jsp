<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.*"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("ORGAN_STRU.INSERT.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<web:js src="bsp.js"/>
<web:js src="mastfunction.js"/>
<web:js src="calendar.js"/>
<script language="javascript">
function checkOrganStru(){
	  var organId = document.forms[0].organId;
      if (trim(organId.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("ORGAN_STRU.QUERY.INPUTORGCODE")%>');    
	  organId.focus();
	  return false;
	}
    organId.value = trim(organId.value) ;
  	  var organAlias = document.forms[0].organAlias;
      if (trim(organAlias.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("ORGAN_STRU.QUERY.INPUTALIAS")%>');    
	  organAlias.focus();
	  return false;
	}
    organAlias.value = trim(organAlias.value) ;
  	  var organType = document.forms[0].organType;
      if (trim(organType.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("ORGAN_STRU.QUERY.INPUTSTRUTYPE")%>');    
	  organType.focus();
	  return false;
	}
    organType.value = trim(organType.value) ;
  	  var parentId = document.forms[0].parentId;
	  var principalId = document.forms[0].principalId;
  	  var beginDate = document.forms[0].beginDate;
      if (trim(beginDate.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("ORGAN_STRU.QUERY.INPUTRECORDEFFDATE")%>');    
	  beginDate.focus();
	  return false;
	}
    beginDate.value = trim(beginDate.value) ;
  	  var endDate = document.forms[0].endDate;
      if (trim(endDate.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("ORGAN_STRU.QUERY.INPUTRECORDUNAVAILABLE")%>');    
	  endDate.focus();
	  return false;
	}
    endDate.value = trim(endDate.value) ;
  	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title='<%=ResourcesFactory.getString("ORGAN_STRU.INSERT.TITLE")%>' >
<bsp:containbutton action="organstru.cmd?method=insert" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="organstru.cmd?method=insertContinue" text='<%=ResourcesFactory.getString("COMMON.SAVECON")%>' onclick="forSaveContinue()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
<html:hidden name="primaryKey" property="parentId" write="false"/>   
<html:hidden name="type" property="organType" write="false"/>  
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.PARENT_ID")%>:</td>
                    <td class="tdRight"><html:text readonly="true"name="parentId" property="parentId" size="30" maxlength="30" /></td>
                    </tr> 
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_ID")%>:</td>
                    <td class="tdRight"><html:text name="organId" property="organId" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_ALIAS")%>:</td>
                    <td class="tdRight"><html:text name="organAlias" property="organAlias" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.ORGAN_TYPE")%>:</td>
                    <td class="tdRight">
                    	<html:select name="organType" property="organType" >
	                        <html:options collection="ORGANSTRU_ORGANTYPE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>                  
					
			<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.PRINCIPAL_ID")%>:</td>
                    <td class="tdRight"><html:hidden name="principalId" property="principalId" write="false"/>
                    <html:text name="principalName" property="principalName" value='<%=ResourcesFactory.getString("ORGAN_STRU.QUERY.SELECTPRINCIPALS")%>' size="20" maxlength="60"  readonly="true" />
                    <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectPrincipalId()"></td>
		   </tr>   <tr>                                 
                    <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.BEGIN_DATE")%>:</td>
                    <td class="tdRight">
                    <date:date  readonly="true" property="beginDate" name="beginDate" divname="beginDatedd" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"></date:date>
                    </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.END_DATE")%>:</td>
                    <td class="tdRight">
                    <date:date readonly="true" name="endDate" value="99991231" divname="endDatedd" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"></date:date>
                    </td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("ORGAN_STRU.IS_LEAF")%>:</td>
                    <td class="tdRight">
                    	<html:select name="isLeaf" property="isLeaf" >
	                        <html:options collection="ORGANSTRU_ISLEAF_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>                        
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
 getTreeFrame().seltree.openNodeById(document.all("parentId").value);
 getTreeFrame().seltree.refreshNodeById(document.all("parentId").value); 
function selectPrincipalId(){
  var url ="organstru.cmd?method=getHelp";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("principalId").value=win[0];
  document.all("principalName").value=win[1];
  }
}
function forSave(){
  if(!checkOrganStru()) return;	
  document.forms[0].action ="organstru.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkOrganStru()) return;
  document.forms[0].action ="organstru.cmd?method=insertContinue";
  document.forms[0].submit();	
}	
</script>