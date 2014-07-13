<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkOrganType(){
var organType = document.forms[0].organType;

  if (trim(organType.value)=="")
  {
    alert("��������֯���ʹ��룡");
    organType.focus();
    return false;
  }
  if(!__isNum(organType.value)){
     alert("��֯���ʹ�����������֣�");
     organType.focus();
     return false;
  }
  organType.value = trim(organType.value) ;
  if(((organType.value).indexOf(document.forms[0].parentType.value))!=0){
     alert("�������֯���ʹ���������ϼ���֯���ʹ��뿪ͷ��");
     organType.value="";
     organType.select();
     organType.focus();
     return false;
  }
 var typeName = document.forms[0].typeName;
   if ( __isQuoteIn(typeName.value) )
    {
      alert("��֯�������Ʋ��ܺ��������ַ���");
      typeName.value="";
      typeName.select();
      typeName.focus();
      return false;
    }
  if (trim(typeName.value)=="")
  {
    alert("��������֯�������ƣ�");
    typeName.focus();
    return false;
  }
  typeName.value = trim(typeName.value) ;
  
  if(!stringLengthCheck(organType,4,"��֯���ʹ��볤�Ȳ��ܳ���4���ַ���")){
  return false;
  }
  if(!stringLengthCheck(typeName,60,"��֯�������Ƴ��Ȳ��ܳ���60���ַ���")){
     typeName.value="";
  	 typeName.select();
  	 typeName.focus();
     return false;
  }
  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form action="">
<bsp:container title="��֯��������" >
<bsp:containbutton text="����" onclick="forSave()" action="organtype.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="���沢����" onclick="forSaveContinue()" action="organtype.cmd?method=insertContinue"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()" ></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action="organtypequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_TYPE.ORGAN_TYPE")%>��</td>
                    <td class="tdRight"><html:text name="organType" property="organType" size="4" maxlength="4" /><FONT COLOR=#ff0000>*(��ֱ����������)</FONT></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_TYPE.TYPE_NAME")%>��</td>
                    <td class="tdRight"><html:text name="typeName" property="typeName" size="36" maxlength="60" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle">�ϼ���֯���ͣ�</td>
                    <td class="tdRight"><html:select name="parentType" property="parentType" onchange="select()">
	                <html:options collection="selectCollection" labelProperty="typeName" property="typeId"/>
	               </html:select></td>
                    </tr> 
                    <html:hidden name="inUse" property="inUse" write="false"/>                       
                                     
   </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function select(){
  var parentType = document.all("parentType");
  var prompt = "*"+"(��������"+parentType.value+"��ͷ������)";
  var organType = parentType.value+"*";
  if(parentType.value==""){
    prompt = "*(��ֱ����������)"
    organType = "";
  }
  parentType.parentNode.parentNode.parentNode.childNodes[0].childNodes[1].childNodes[1].innerText=prompt;
  //document.all("organType").value=organType;
}
function forSave(){
  if(!checkOrganType()) return;	
  document.forms[0].action ="organtype.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkOrganType()) return;
  document.forms[0].action ="organtype.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="organtypequery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>