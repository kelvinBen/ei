<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%
    String organId = (String)request.getParameter("organId"); 
 %>
<HTML>
<HEAD>
<TITLE>��������������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function __isQuoteIn1(s)
{ 
	var re = /\"|\'|\��|\��|\��|\��|\%|\&|\��|\����|\��|\��|\����|\!|\��|\#|\@|\~|\^|\*|\��|\?|\��|\;|\��|\:|\��|\{|\}|\\|\[|\]|\(|\)|\+|\��|\||\<|\>/;
	return re.test(s);
}
function checkPubOrganParms(){

  var parmsName = document.all("parmsNameTemp").value;
  //if ( __isQuoteIn(parmsName) )
  //  {
  //		alert("�������Ʋ��ܺ��������ַ���");  
  //		return false;
  //  }
  if (parmsName.trim()=="")
  {
		alert("������������ƣ�"); 
		return false;
  }
  var dateResTemp =document.all("dataRes").value;
  var parmsValue=""; 
  if(dateResTemp=="ö������"){
  	parmsValue=document.forms[0].parmsValueEnum.value;
  }else if(dateResTemp=="�ı���"){
  	parmsValue=document.forms[0].parmsValueText.value;
  } if(dateResTemp=="���ݱ�"){
  	parmsValue=document.forms[0].parmsValueData.value; 
  } 
  if(dateResTemp==""){
  	parmsValue=document.forms[0].parmsValueText.value;
  }
  //V3Ҫ������������ַ� / �� -  
  if ( __isQuoteIn1(parmsValue) )
    {
      alert("����ֵ���ܺ��������ַ���");
      return false;
    }   	
  if (parmsValue.trim()=="")
  {
    alert("���������ֵ��");
    return false;
  } 

  if(!stringLengthCheck(parmsName,30,"�������Ƴ��Ȳ��ܳ���30���ַ�!")){

    return false;
  }
  if(!stringLengthCheck(parmsValue,250,"����ֵ���Ȳ��ܳ���250���ַ�!")){
    return false;
  }
   var note = document.forms[0].note;
   note.value=trim(note.value);
    if(!stringLengthCheck(note,250,"�������Ȳ��ܳ���250�����ַ�!")){
    note.value="";
  	note.select();
  	note.focus();
    return false;
  }
   return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action=""> 
<html:hidden name="dataRes" value=""></html:hidden>
<bsp:container title="��������������" >
<bsp:containbutton text="����" onclick="forSave()" action="organparms.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action="organparmsquery.cmd?method=query"></bsp:containbutton>
<div align="center">
  <table width="100%" id="organParms" cellpadding="0" class="tblContent">
 			        <html:hidden name="organId" property="organId" write="false"/>           
                    <tr>
                    	<td class="tdTitle">�������ƣ�</td>
	                    <td class="tdRight">
	                    	<html:hidden name="parmsName" property="parmsName" write="false"/>
                        	<input type="text" name="parmsNameTemp" readonly value="" size="20">
                        	<input type="hidden" name="dataType" value="">
	                        <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectOrganParms()"><FONT COLOR=#ff0000>*</FONT>
	                    </td>                  
                    </tr>                
                    <tr>
                    	<td class="tdTitle">����ֵ(�ı���)��</td> 
	                    <td class="tdRight">
	                    	<html:hidden name="parmsValue" property="parmsValue" write="false"/>
                        	<input type="text" size="50" name="parmsValueText" value="">
                        	<img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectStru()"><FONT COLOR=#ff0000>*(ѡ�������Ϊ����)</FONT>
                    </td>    
                    </tr>
                    <tr>
                    	<td class="tdTitle" >����ֵ(ö������)��</td> 
	                    <td class="tdRight">
	                    	<html:hidden name="parmsValue" property="parmsValue" write="false"/>
                        	<input type="hidden" name="parmsValueEnum" value="">
	                    	<span id="divparms">
						    </span><FONT COLOR=#ff0000>*</FONT>
						</td>
                    </tr> 
                    <tr>
                    	<td class="tdTitle">����ֵ(���ݱ�)��</td>    
	                    <td class="tdRight">
	                    	<html:hidden name="parmsValue" property="parmsValue" write="false"/>
	                    	<input type="text" size="50" name="parmsValueData" readonly value="">
                        	<img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectDataRes()"><FONT COLOR=#ff0000>*</FONT>
                    	</td>   
                    </tr>        
                    <tr>
	                    <td class="tdTitle">������</td>
	                    <td class="tdRight">
	                    	<html:text name="note" property="note" size="50" maxlength="250" ondblclick="clean()"/>
	                    </td>
                    </tr>      
   </table>
</div>
</bsp:container>
<iframe style="display:none" id="dataFrame"></iframe>
</html:form>
</BODY>
</HTML>
<script language="javascript">
initSelect();
function initSelect(){
	var dataResValue = document.forms[0].dataRes.value; 
	 if(dataResValue == ""){
			document.all("organParms").rows[1].style.display="block";
	 		document.all("organParms").rows[2].style.display="none";
			document.all("organParms").rows[3].style.display="none"; 
	  }
}
function selectOrganParms(){
  var cmdUrl ="organparmsthelp.cmd&clear=true";      
  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("parmsName").value=win[0];  
  document.all("parmsNameTemp").value=win[0];
  document.all("dataRes").value=win[2];
  var flag = win[2];
	  if(flag == "�ı���"){
			document.all("organParms").rows[1].style.display="block";
	 		document.all("organParms").rows[2].style.display="none";
			document.all("organParms").rows[3].style.display="none"; 

	  } else if (flag == "ö������"){
			document.all("organParms").rows[1].style.display="none";
	 		document.all("organParms").rows[2].style.display="block";
			document.all("organParms").rows[3].style.display="none"; 
			document.forms[0].parmsValueEnum.value="";
			  var url = "organparmst.cmd?method=enumValueQuery&parmsName="+win[0];
			  var f = document.getElementById("dataFrame");
			  f.src = url;
  			
	  } else if (flag == "���ݱ�"){
			document.all("organParms").rows[1].style.display="none";
	 		document.all("organParms").rows[2].style.display="none";
			document.all("organParms").rows[3].style.display="block"; 
	  }
  }
}
function selectStru(){
  var url ="stru.cmd?method=getSelectRoot&organType=0&isCheckBox=0&isIncludeSelf=1&isTree=1";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{  
	  document.all("parmsValue").value=win[0];
	  document.all("parmsValueText").value=win[0];
	  document.all("note").value=win[1];
  }
}
function insertEnumValue(val){
	document.all("divparms").innerHTML=val;

	document.all("parmsValue").value=document.all("enumParmsValue").value;
	document.all("parmsValueEnum").value=document.all("enumParmsValue").value; 
}
function selectDataRes(){
  var name = document.all("parmsNameTemp").value;
  var cmdUrl ="dataresquery.cmd&method=query&parmsName="+name+"&clear=true";
  var url ="jsp/help.jsp?url="+cmdUrl;  

  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
	  document.all("parmsValue").value=win[0];
	  document.all("parmsValueData").value=win[0];
	  document.all("note").value=win[1];
  }  
}
function clean(){
	document.forms[0].parmsValue.value="";
	document.forms[0].note.value="";
}
function forSave(){	

	if(!checkPubOrganParms()) return;	
	document.forms[0].action ="organparms.cmd?method=insert&organId="+"<%=organId%>";
	document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkPubOrganParms()) return;
  document.forms[0].action ="organparms.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="organparmsquery.cmd?method=query&organId="+"<%=organId%>";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>