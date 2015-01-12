<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("COMBOBOX_TEST.UPDATE.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='ComboBox.css'/>">
<web:js src="ComboBox.js"/>
<web:js src="mastfunction.js"/>
<script language="javascript">
function checkComboboxTest(){
	var comboBoxName = document.forms[0].comboBoxName;
  	if (trim(comboBoxName.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("COMBOBOX_TEST.INSERT.INPUTNAME")%>');   
	  comboBoxName.focus(); 
	  return false;
	}
    comboBoxName.value = trim(comboBoxName.value) ;
      	var comboBoxSex = document.forms[0].comboBoxSex;
	var comboBoxNation = document.forms[0].comboBoxNation;
	var comboBoxAddress = document.forms[0].comboBoxAddress;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title='<%=ResourcesFactory.getString("COMBOBOX_TEST.UPDATE.TITLE")%>' >
<bsp:containbutton action="comboboxtest.cmd?method=update" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="comboboxtestquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
			<html:hidden name="comboBoxId" property="comboBoxId" write="false" />                                                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_NAME")%>:</td>
                    <td class="tdRight"><html:text name="comboBoxName" property="comboBoxName" size="30" maxlength="30" /><font style="color:red;" >*</font></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_SEX")%>:</td>
                    <td class="tdRight">
                    	<html:select name="comboBoxSex" property="comboBoxSex" >
	                        <html:options collection="COMBOBOXTEST_COMBOBOXSEX_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_NATION")%>:</td>
                    <td class="tdRight">
                    <widgets:ComboBox name="comboBoxNation" property="comboBoxNation"  width="220" height="50"  keyProperty="nodeId"  labelProperty="CheckData" helpProperty="helpData" collection="collection"></widgets:ComboBox></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_ADDRESS")%>:</td>
                    <td class="tdRight">
                    <widgets:ComboBoxAsyn  name="comboBoxAddress" property="comboBoxAddress" width="220" height="50" asyn="true" url="comboboxtest.cmd?method=test&key="></widgets:ComboBoxAsyn>
                    </td></tr>                           
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkComboboxTest()) return;	
  document.forms[0].action ="comboboxtest.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="comboboxtestquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>