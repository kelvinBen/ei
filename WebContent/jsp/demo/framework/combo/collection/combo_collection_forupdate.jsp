<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("COMBO_COLLECTION.UPDATE.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<web:js src="mastfunction.js"/>
<script language="javascript">
function checkComboCollection(){
	var comboName = document.forms[0].comboName;
  	if (trim(comboName.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("COMBO_COLLECTION.INSERT.INPUTADDRESS")%>');   
	  comboName.focus(); 
	  return false;
	}
    comboName.value = trim(comboName.value) ;
      	var comboHelp = document.forms[0].comboHelp;
  	if (trim(comboHelp.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("COMBO_COLLECTION.INSERT.INPUTHELP")%>');   
	  comboHelp.focus(); 
	  return false;
	}
    comboHelp.value = trim(comboHelp.value) ;
      	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title='<%=ResourcesFactory.getString("COMBO_COLLECTION.UPDATE.TITLE")%>'>
<bsp:containbutton action="combocollection.cmd?method=update" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.RESET")%>' onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="combocollectionquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
			<html:hidden name="comboId" property="comboId" write="false" />                                   
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("COMBO_COLLECTION.COMBO_NAME")%>:</td>
                    <td class="tdRight"><html:text name="comboName" property="comboName" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("COMBO_COLLECTION.COMBO_HELP")%>:</td>
                    <td class="tdRight"><html:text name="comboHelp" property="comboHelp" size="30" maxlength="30" /></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkComboCollection()) return;	
  document.forms[0].action ="combocollection.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="combocollectionquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>