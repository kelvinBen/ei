<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>

<HTML> 
<HEAD>
<TITLE>��������ļ��</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<script language="javascript">
function checkPubResources(){
      var table = document.forms[0].table;
	  if (__isQuoteIn(table.value) ){
	    alert("���ı������ܺ��������ַ���");
	    table.value="";
	    table.select();
	    table.focus();
	    return false;
	  }
	  if (trim(table.value)==""){
	    alert("��������Ҫ���ı�����");    
	    return false;
	  }
      table.value = trim(table.value) ;

	  var idName = document.forms[0].idName;
	  if (trim(idName.value)==""){
	    alert("����������ֶΣ�");    
	    return false;
	  }
      idName.value = trim(idName.value) ;
 if (__isQuoteIn(idName.value) ){
	    alert("���ı������ܺ��������ַ���");
	    idName.value="";
	    idName.select();
	    idName.focus();
	    return false;
	  }

	  var foreignTable = document.forms[0].foreignTable;	
      if (trim(foreignTable.value)==""){
	    alert("�����������������ı�����");    
	    return false;
	  }
      foreignTable.value = trim(foreignTable.value) ;
	   if (__isQuoteIn(foreignTable.value) ){
	    alert("������������ı������ܺ��������ַ���");
	    foreignTable.value="";
	    foreignTable.select();
	    foreignTable.focus();
	    return false;
	  }
	  
	  var foreignKeyName = document.forms[0].foreignKeyName;
	  if (trim(foreignKeyName.value)==""){
	    alert("����������ֶ����ƣ�");    
	    return false;
	  }
      foreignKeyName.value = trim(foreignKeyName.value) ;
        
	   if ( __isQuoteIn(foreignKeyName.value) ){
	    alert("����ֶ����Ʋ��ܺ��������ַ���");
	    foreignKeyName.value="";
	    foreignKeyName.select();
	    foreignKeyName.focus();
	    return false;
	  }

      if(!stringLengthCheck(table,60,"���ı������ܳ���60���ַ�!")){
        table.value="";
        table.select();
        table.focus();
        return false;
      }
      if(!stringLengthCheck(idName,60,"�����ֶβ��ܳ���60���ַ�!")){
        idName.value="";
        idName.select();
        idName.focus();
        return false;
      }
      if(!stringLengthCheck(foreignTable,60,"������������ı������ܳ���60���ַ�!")){
        foreignTable.value="";
        foreignTable.select();
        foreignTable.focus();
        return false;
      }
      if(!stringLengthCheck(foreignKeyName,60,"����ֶ����Ʋ��ܳ���60���ַ�!")){
        foreignKeyName.value="";
        foreignKeyName.select();
        foreignKeyName.focus();
        return false;
      }    
	  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��������ļ��" >

<div align="center">
  <table width="100%" cellpadding="0" class="tblContent"> 
  
		    <html:hidden name="checkMethod" value="" write="true"/>
		    <tr>
                    <td class="tdTitle">���ı�����</td>
                    <td class="tdRight"><html:text name="table"  size="40" maxlength="60" value=""/><FONT COLOR=#ff0000>*<BR>�������鹤���ص��PUB_WORKPLACE ��</FONT></td>
                    </tr>     
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>               
		    
		    <tr>
                    <td class="tdTitle">�����ֶΣ�</td>
                    <td class="tdRight"><html:text name="idName"  size="40" maxlength="60" value="" /><FONT COLOR=#ff0000>*<BR>�������鹤���ص��CANT_CODE�ֶΣ�CANT_CODE��</FONT></td>
                    </tr>  
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>                   
		    
		    <tr>
                    <td class="tdTitle">������������ı�����</td>
                    <td class="tdRight"><html:text name="foreignTable"  size="40" maxlength="60" value=""/><FONT COLOR=#ff0000>*<BR>����PUB_CANT���еģ�PUB_CANT��</FONT></td>
                    </tr>        
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>             
		    
		    <tr>
                    <td class="tdTitle">����ֶ����ƣ�</td>
                    <td class="tdRight"><html:text name="foreignKeyName" size="40" maxlength="60" value=""/><FONT COLOR=#ff0000>*<BR>��CANT_CODE�ֶ��Ƿ��в����ڵļ�¼��CANT_CODE��</FONT></td>
                    </tr>         
   <tr>
                    <td class="tdTitle">˵����</td>
                    <td class="tdRight">���������������������Ϊ�����PUB_WORKPLACE���е�CANT_CODE�ֶ��Ƿ��������ֶεļ�¼����һ����������ı�PUB_CANT����û�е�CANT_CODE�ļ�¼��
					<BR>���仰˵�����Ľ����ΪPUB_WORKPLACE�����PUB_CANT����û�е�CANT_CODE��¼����������¼����Щ��¼������������ݡ�</td>
                    </tr>
  </table>

  <table width="100%" cellpadding="0" class="tblContent"> 
  <tr>
  <td align="center" >
  <html:button name="button" onclick="forSave()" value="�Զ�����ִ��"></html:button>
  <html:button name="button" onclick="forReset()" value=" �� �� "></html:button>
</td></tr>
  </table>
<table width="100%" cellpadding="0" class="tblContent"> 
    <tr><td>
    &nbsp;
	</td></tr>
   <tr>
   <td class="tdTitle">���õ�ϵͳ��飺</td>
    <td class="tdTitle">&nbsp;</td>
   </tr>
  <tr> 
   <td align="right">
  <html:button name="button" onclick="checkOrgenaztion()" value="��֯�ṹ��������ļ��"></html:button>
  </td>
  <td align="Left">
  <html:button name="button" onclick="checkUser()" value="�û���������ȵļ��    "></html:button>
</td>
</tr>
   <tr>
   <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
  <tr> 
 <tr> 
   <td align="right">
  <html:button name="button" onclick="checkRole()" value="��ɫ��������ȵļ��  "></html:button>
  </td>
  <td align="Left">
 <html:button name="button" onclick="checkResources()" value="������Դ��������ȵļ��"></html:button>
 </td>
 </tr>



 
  </table>
</div>
<table width="100%" cellpadding="0" class="tblContent"> 
    <tr><td>
    &nbsp;
	</td></tr>
	  </table>

</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubResources()) return;	
  
  document.forms[0].action ="checkDataCmd.cmd?method=userDefineCheck";
  document.forms[0].submit();

}

function forReset(){  
  document.forms[0].reset();	
}

function checkOrgenaztion(){  
  document.all("checkMethod").value="checkOrgenaztion";

	//document.forms[0].action ="check.jsp";
	document.forms[0].action ="checkDataCmd.cmd?method=check";
  document.forms[0].submit();
}

function checkUser(){  
  document.all("checkMethod").value="checkUser";	

  //document.forms[0].action ="check.jsp";
  document.forms[0].action ="checkDataCmd.cmd?method=check";
  document.forms[0].submit();
}

function checkRole(){  
 document.all("checkMethod").value="checkRole";
 
 // document.forms[0].action ="check.jsp";
  document.forms[0].action ="checkDataCmd.cmd?method=check";
  document.forms[0].submit();
}

function checkResources(){  
  document.all("checkMethod").value="checkResources";	

 // document.forms[0].action ="check.jsp";
  document.forms[0].action ="checkDataCmd.cmd?method=check";
  document.forms[0].submit();
}

</script>