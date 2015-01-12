<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<% 
    String superCode = request.getParameter("superCode");
    String country = request.getParameter("country");	
        if(country==null || country.equals("")){
		country="CN";
      }
      if(superCode==null || superCode.equals("")){
		superCode=country;
      }
%> 

<HTML>
<HEAD>
<TITLE>������������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubCant(){
var cantCode = document.forms[0].cantCode;
    if ( __isQuoteIn(cantCode.value) )
    {
      alert("�����������벻�ܺ��������ַ���");
      cantCode.value="";
      cantCode.select();
      cantCode.focus();
      return false;
    }
  if (trim(cantCode.value)=="")
  {
     alert("�����������������룡");
     cantCode.focus();
     return false;
  }
  cantCode.value = trim(cantCode.value) ;
  var rs = /^([0-9]|[a-z]|[A-Z])+$/;
  if(!rs.test(cantCode.value)){
     alert("�����������������Ӣ���ַ������֣�");
     cantCode.value="";
     cantCode.select();
     cantCode.focus();
     return false;
  }
 var cantName = document.forms[0].cantName;
  if ( __isQuoteIn(cantName.value) )
    {
       alert("�����������Ʋ��ܺ��������ַ���");
       cantName.value="";
       cantName.select();
       cantName.focus();
       return false;
    }
  if (trim(cantName.value)=="")
  {
      alert("�����������������ƣ�");
      cantName.focus();
      return false;
  }
  cantName.value = trim(cantName.value) ;
  var shortName = document.forms[0].shortName;
  if ( __isQuoteIn(shortName.value) )
    {
      alert("����������Ʋ��ܺ��������ַ���");
      shortName.value="";
      shortName.select();
      shortName.focus();
      return false;
    }
  shortName.value = trim(shortName.value) ;
  var cantNote = document.forms[0].cantNote;
  cantNote.value = trim(cantNote.value) ;
  var cantNote=document.forms[0].cantNote;
  cantNote.value = trim(cantNote.value) ;
  if(!stringLengthCheck(cantCode,20,"�����������볤�Ȳ��ܳ���20���ַ���")){
      cantCode.value="";
      cantCode.select();
      cantCode.focus();
      return false;
  }
  if(!stringLengthCheck(cantName,250,"�����������Ƴ��Ȳ��ܳ���250���ַ���")){
      cantName.value="";
      cantName.select();
      cantName.focus();
      return false;
  }
  if(!stringLengthCheck(shortName,120,"����������Ƴ��Ȳ��ܳ���120���ַ���")){
     shortName.value="";
     shortName.select();
     shortName.focus();
     return false;
  }
  if(!stringLengthCheck(cantNote,250,"�������Ȳ��ܳ���250���ַ���")){
     cantNote.value="";
     cantNote.select();
     cantNote.focus();
     return false;
  }
  return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="������������" >
<bsp:containbutton text="����" onclick="forSave()" action="cant.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="���沢����" onclick="forSaveContinue()" action="cant.cmd?method=insertContinue"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" ></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
                    <tr>
                       <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_CODE")%>��</td>
                       <td class="tdRight"><html:text name="cantCode" property="cantCode" size="20" maxlength="20" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                    <tr>
                       <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_NAME")%>��</td>
                       <td class="tdRight"><html:text name="cantName" property="cantName" size="40" maxlength="250" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                    <tr>
                       <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.SHORT_NAME")%>��</td>
                       <td class="tdRight"><html:text name="shortName" property="shortName" size="30" maxlength="120" /></td>
                    </tr>                    
                    <tr>
                       <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_TYPE")%>��</td>
                       <td class="tdRight"><html:select name="cantType" property="cantType" >
	               <html:options collection="cantTypeCollection" labelProperty="TYPE_NAME" property="CANT_TYPE"/>
	               </html:select></td>
                    </tr>
                       <html:hidden name="superCode" property="superCode" write="false"/>                           
                       <html:hidden name="countryCode" property="countryCode" write="false"/> 
                    <tr>
                       <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CANT.CANT_NOTE")%>��</td>
                       <td class="tdRight"><html:text name="cantNote" property="cantNote" size="48" maxlength="250" /></td>
                    </tr>                                       
   </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forReturn(){
  document.forms[0].action ="cantquery.cmd?method=query&country=<%=country%>&superCode="+"<%=superCode%>";     
  document.forms[0].submit();
}
function forSave(){
  if(!checkPubCant()) return;	
  document.forms[0].action ="cant.cmd?method=insert&country=<%=country%>&superCode=<%=superCode%>"; 
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkPubCant()) return;
  document.forms[0].action ="cant.cmd?method=insertContinue&country=<%=country%>&superCode=<%=superCode%>"; 
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>