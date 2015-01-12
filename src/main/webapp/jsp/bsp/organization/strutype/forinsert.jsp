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
function checkStruType(){
var struType = document.forms[0].struType;
    if ( __isQuoteIn(struType.value) )
    {
      alert("���ʹ��벻�ܺ��������ַ�!");
      struType.select();
      struType.focus();
      return false;
    }
  if (trim(struType.value)=="")
  {
    alert("���������ʹ��룡");
    struType.focus();
    return false;
  }
  struType.value = trim(struType.value) ;
  if(!__isNum(struType.value )){
     alert("���ʹ���������֣�");
     struType.value="";
     struType.focus();
     return false;
  }
 var typeName = document.forms[0].typeName;
 if ( __isQuoteIn(typeName.value) )
    {
      alert("�������Ʋ��ܺ��������ַ�!");
      typeName.select();
      typeName.focus();
      return false;
    }
  if (trim(typeName.value)=="")
  {
    alert("�������������ƣ�");
    typeName.focus();
    return false;
  }
  typeName.value = trim(typeName.value) ;
 var rootId = document.forms[0].rootId;
  if (trim(rootId.value)=="")
  {
    alert("��ѡ�������֯��λ��");
    return false;
  }
  rootId.value = trim(rootId.value) ;
  var note=document.forms[0].note;
  if(!stringLengthCheck(struType,10,"���ʹ��볤�Ȳ��ܳ���10���ַ�!"))
  {	
     struType.value="";
  	 struType.select();
  	 struType.focus();
  	 return false;
  }
  if(!stringLengthCheck(typeName,60,"�������Ƴ��Ȳ��ܳ���60���ַ�!")){
      typeName.value="";
  	  typeName.select();
  	  typeName.focus();
      return false;
  }
  if(!stringLengthCheck(note,250,"˵�����Ȳ��ܳ���250���ַ�!")){
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
<html:form action="">
<bsp:container title="��֯�ṹ��������" >
<bsp:containbutton text="����" onclick="forSave()" action="strutype.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="���沢����" onclick="forSaveContinue()" action="strutype.cmd?method=insertContinue"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()" ></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action="strutypequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.STRU_TYPE")%>��</td>
                    <td class="tdRight"><html:text name="struType" property="struType" size="10" maxlength="10" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.TYPE_NAME")%>��</td>
                    <td class="tdRight"><html:text name="typeName" property="typeName" size="30" maxlength="60" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.ROOT_ID")%>��</td>
                    <td class="tdRight">
                    <html:hidden name="rootId" property="rootId" write="false"/><html:text name="rootName" property="rootName" value="��ѡ�������֯��λ" size="20" maxlength="60"  readonly="true" ondblclick="clean()"/><FONT COLOR=#ff0000>*</FONT> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectRootId()"></td>
                    </tr> 
                    <html:hidden name="isDefault" property="isDefault" write="false"/>    
                                       
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.NOTE")%>��</td>
                    <td class="tdRight"><html:text name="note" property="note" size="40" maxlength="250" /></td>
                    </tr>                    
                    <html:hidden name="inUse" property="inUse" write="false"/> 
                    
                    <tr>
                    <td class="tdTitle">ʵʩ��֯�ṹ����Լ����</td>
                    <td class="tdRight"><html:checkbox name="isApplyRule" property="isApplyRule" value="1" /></td>
                    </tr> 
                    
                    <tr>
                    <td class="tdTitle">֧�־����ƣ�</td>
                    <td class="tdRight"><html:checkbox name="isMatrix" property="isMatrix" value="1" /></td>
                    </tr> 
                    
                    <tr>
                    <td class="tdTitle">������ʷ��¼��</td>
                    <td class="tdRight"><html:checkbox name="isKeepRecord" property="isKeepRecord" value="1" /></td>
                    </tr>            
   </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function clean(){
	document.forms[0].rootId.value="";
	document.forms[0].rootName.value="";
}
function forSave(){
  if(!checkStruType()) return;	
  document.forms[0].action ="strutype.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkStruType()) return;
  document.forms[0].action ="strutype.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="strutypequery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function selectRootId(){
  var url ="stru.cmd?method=getStruTypeRoot";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("rootId").value=win[0];
  document.all("rootName").value=win[1];
  }
}
</script>