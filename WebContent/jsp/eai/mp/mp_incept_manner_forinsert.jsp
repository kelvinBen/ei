<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>����/���շ�ʽ����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpInceptManner(){
	  var receiveMannerCode = document.forms[0].receiveMannerCode;
  	  if ( __isQuoteIn(receiveMannerCode.value) )
	  {
	    alert("����/���շ�ʽ���벻�ܺ������Ż�����!");
	    receiveMannerCode.select();
	    receiveMannerCode.focus();
	    return false;
	  }
      if (trim(receiveMannerCode.value)=="")
	{
	  alert("�����붩��/���շ�ʽ���룡");    
	  receiveMannerCode.focus();
	  return false;
	}
    receiveMannerCode.value = trim(receiveMannerCode.value) ;
  	  var receiveMannerName = document.forms[0].receiveMannerName;
      if (trim(receiveMannerName.value)=="")
	{
	  alert("�����붩��/���շ�ʽ���ƣ�");    
	  receiveMannerName.focus();
	  return false;
	}
    receiveMannerName.value = trim(receiveMannerName.value) ;
  	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="����/���շ�ʽ����" >
<bsp:containbutton action="mpinceptmanner.cmd?method=insert" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="mpinceptmanner.cmd?method=insertContinue" text="���沢����" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="mpinceptmannerquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_INCEPT_MANNER.RECEIVE_MANNER_CODE")%>��</td>
                    <td class="tdRight"><html:text name="receiveMannerCode" property="receiveMannerCode" size="30" maxlength="30" /> <FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_INCEPT_MANNER.RECEIVE_MANNER_NAME")%>��</td>
                    <td class="tdRight"><html:text name="receiveMannerName" property="receiveMannerName" size="30" maxlength="30" /> <FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMpInceptManner()) return;	
  document.forms[0].action ="mpinceptmanner.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMpInceptManner()) return;
  document.forms[0].action ="mpinceptmanner.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpinceptmannerquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>