<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>�����¼���������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<%
String organTypeParent=(String)request.getAttribute("organTypeParent");
%>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubHrEventType(){
	  var eventType = document.forms[0].eventType;
	  var organType = document.forms[0].organType.value;
	  if ( __isQuoteIn(eventType.value) )
	  {
	    alert("�����¼����Ͳ��ܺ��������ַ���");
	    eventType.value=organType;
	    eventType.select();
	    eventType.focus();
	    return false;
	  }
	if (trim(eventType.value)=="")
	{
	   alert("�����������¼����ͣ�");  
	   eventType.select();
	   eventType.focus(); 
	   return false;
	}
	if(!__isNum(trim(eventType.value))){
	    alert("�����¼����ͱ���������!");
	    eventType.value=organType;
	    eventType.select();
	    eventType.focus();
	    return false;
	}
    eventType.value = trim(eventType.value) ;
   // var organType = document.forms[0].organType.value;
    if(!(eventType.value.indexOf(organType)==0&&eventType.value!=organType)){
        alert("�����¼����ͱ�������������֯���Ϳ�ͷ�����Ҳ��ܵ�����������֯���ͣ�");
        eventType.value=organType;
	    eventType.select();
	    eventType.focus();
        return false;
    }
	  var typeName = document.forms[0].typeName;
	if (trim(typeName.value)=="")
	{
	    alert("�����������¼��������ƣ�");   
	    typeName.select();
	    typeName.focus(); 
	    return false;
	}
    typeName.value = trim(typeName.value) ;
	  var isSys = document.forms[0].isSys;
	if (trim(isSys.value)=="")
	{
	  alert("�������Ƿ�ϵͳԤ���¼����ͣ�");    
	  return false;
	}
    isSys.value = trim(isSys.value) ;
    
  if(!stringLengthCheck(eventType,10,"�����¼����ͳ��Ȳ��ܳ���10���ַ���")){
  	  eventType.value="";
	  eventType.select();
	  eventType.focus();
      return false;
  }
  if(!stringLengthCheck(typeName,60,"�����¼��������Ƴ��Ȳ��ܳ���60���ַ���")){
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
<html:form  name="frmList"  action="">
<bsp:container title="�����¼���������" >
<bsp:containbutton text="����" onclick="forSave()" action="hreventtype.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action="hrEventTypeQuery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.EVENT_TYPE")%>��</td>
                    <td class="tdRight"><html:text name="eventType" property="eventType" size="10" maxlength="10" /><FONT COLOR=#ff0000>(�ô����������������֯����Ϊ��ͷ)*</FONT></td>
                    </tr>                   
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.TYPE_NAME")%>��</td>
                    <td class="tdRight"><html:text name="typeName" property="typeName" size="60" maxlength="60" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>  
                    <tr>
                     <td class="tdTitle">��֯���ʹ��룺</td>
      				 <td class="tdRight"><html:hidden name="organType" property="organType" write="true"/></td>
    				</tr>                   
                    <tr>
      					<html:hidden name="isSys" property="isSys" write="false"/>
    				</tr>                  
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubHrEventType()) return;	
  document.forms[0].action ="hreventtype.cmd?method=insert&organTypeParent=<%=organTypeParent%>";
  document.forms[0].submit();	
}
function forReturn(){
   document.forms[0].action ="hrEventTypeQuery.cmd?organType="+document.all("organType").value;
  document.forms[0].submit();	
}

</script>