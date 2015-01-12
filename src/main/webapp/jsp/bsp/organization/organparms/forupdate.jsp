<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%> 

<%
    String organId = (String)request.getParameter("organId");
    String dataRes = (String)request.getAttribute("dataRes"); 
%>
<HTML>
<HEAD>
<TITLE>�����������޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function __isQuoteIn1(s)
{ 
	var re = /\"|\'|\��|\��|\��|\��|\%|\&|\��|\����|\��|\��|\����|\!|\��|\#|\@|\~|\^|\*|\��|\?|\��|\;|\��|\:|\��|\{|\}|\\|\[|\]|\(|\)|\+|\��|\||\<|\>/;
	return re.test(s);
}
function checkPubOrganParms(){  
  var dateResTemp =document.all("dataRes").value;
 
  var parmsValue=""; 
  if(dateResTemp=="1"){
  	parmsValue=document.forms[0].parmsValueEnum.value;
  }else if(dateResTemp=="0"){
  	parmsValue=document.forms[0].parmsValueText.value;
  } if(dateResTemp=="2"){
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
<input type="hidden" name="dataRes" value="<%=dataRes%>">
<bsp:container title="�����������޸�" >
<bsp:containbutton text="����" onclick="forSave()" action="organparms.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action="organparmsquery.cmd?method=query"></bsp:containbutton>
<div align="center">
  <table width="100%" id="organParms" cellpadding="0" class="tblContent">
 	       <html:hidden name="organId" property="organId" write="false"/>             
               <tr>
                    <td class="tdTitle">�������ƣ�</td>
                    <td class="tdRight">
                    	<html:hidden name="parmsName" property="parmsName" write="true"/> 
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
                    <td class="tdRight"><html:text name="note" property="note" size="50" maxlength="250" ondblclick="clean()"/></td>
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
	  if(dataResValue == "0"){ 
	  		document.forms[0].parmsValueText.value= document.all("parmsValue")[0].value; 
			document.all("organParms").rows[1].style.display="block";
	 		document.all("organParms").rows[2].style.display="none";
			document.all("organParms").rows[3].style.display="none";  

	  } else if (dataResValue == "1"){
			document.all("organParms").rows[1].style.display="none";
	 		document.all("organParms").rows[2].style.display="block";
			document.all("organParms").rows[3].style.display="none";
			document.forms[0].parmsValueEnum.value=document.all("parmsValue")[0].value;
			
			var url = "organparmst.cmd?method=enumValueQuery&parmsName="+document.forms[0].parmsName.value;
			var f = document.getElementById("dataFrame");
		    f.src = url;
			  
	  } else if (dataResValue == "2"){ 
	  		document.forms[0].parmsValueData.value= document.all("parmsValue")[0].value;
			document.all("organParms").rows[1].style.display="none";
	 		document.all("organParms").rows[2].style.display="none";
			document.all("organParms").rows[3].style.display="block";  
	  }
}
function clean(){
	document.forms[0].parmsValue.value="";
	document.forms[0].note.value="";
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
function selectDataRes(){
  var name = document.all("parmsName").value;
  var cmdUrl ="dataresquery.cmd&method=query&parmsName="+name;  
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
function insertEnumValue(val){
	document.all("divparms").innerHTML=val;
}
function forSave(){	 
	if(document.all("dataRes").value=="1"){
		document.all("parmsValue").value=document.all("enumParmsValue").value;
		document.all("parmsValueEnum").value=document.all("enumParmsValue").value; 
	}
	if(!checkPubOrganParms()) return;	
	document.forms[0].action ="organparms.cmd?method=update&organId="+"<%=organId%>";
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