<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("COMBOBOX_TEST.INSERT.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='ComboBox.css'/>">
<web:js src="ComboBox.js"/>
<web:js src="mastfunction.js"/>
<script language="javascript">
function checkComboboxTest(){
	  var comboBoxId = document.forms[0].comboBoxId;
  	  if ( __isQuoteIn(comboBoxId.value) )
	  {
	    alert('<%=ResourcesFactory.getString("COMBOBOX_TEST.INSERT.CODEFORMAT1")%>');
	    comboBoxId.select();
	    comboBoxId.focus();
	    return false;
	  }
	  if(!__checkCodeFormat(comboBoxId.value))
	{
	   alert('<%=ResourcesFactory.getString("COMBOBOX_TEST.INSERT.CODEFORMAT2")%>');
	   comboBoxId.select();
	   comboBoxId.focus();
	   return false;
	}
      if (trim(comboBoxId.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("COMBOBOX_TEST.INSERT.INPUTCODE")%>');    
	  comboBoxId.focus();
	  return false;
	}
    comboBoxId.value = trim(comboBoxId.value) ;
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
<bsp:container title='<%=ResourcesFactory.getString("COMBOBOX_TEST.INSERT.TITLE")%>' >
<bsp:containbutton action="comboboxtest.cmd?method=insert" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="comboboxtest.cmd?method=insertContinue" text='<%=ResourcesFactory.getString("COMMON.SAVECON")%>' onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton action ="comboboxtestquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_ID")%>:</td>
                    <td class="tdRight"><html:text name="comboBoxId" property="comboBoxId" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_NAME")%>:</td>
                    <td class="tdRight"><html:text name="comboBoxName" property="comboBoxName" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("COMBOBOX_TEST.COMBOBOX_NATION")%>:</td>
                    <td class="tdRight">
                    <widgets:ComboBox name="comboBoxNation"   width="220" height="50" value="1"  keyProperty="nodeId"  labelProperty="CheckData" helpProperty="helpData" collection="collection"></widgets:ComboBox></td>
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
  document.forms[0].action ="comboboxtest.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkComboboxTest()) return;
  document.forms[0].action ="comboboxtest.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="comboboxtestquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>