<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript">
function checkOrg(){
 var organCode = document.forms[0].organCode;
  if ( __isQuoteIn(organCode.value) )
    {
      alert("���벻�ܺ������Ż����ţ�");
      organCode.select();
      organCode.focus();
      return false;
    }
  if (trim(organCode.value)=="")
  {
    alert("��������룡");    
    return false;
  }
  organCode.value = trim(organCode.value) ;
 var organName = document.forms[0].organName;
   if ( __isQuoteIn(organName.value) )
    {
      alert("����/���Ʋ��ܺ������Ż����ţ�");
      organName.select();
      organName.focus();
      return false;
    }
  if (trim(organName.value)=="")
  {
    alert("���������ƣ�");    
    return false;
  }
  organName.value = trim(organName.value) ;

 var workplaceId = document.forms[0].workplaceId;
  if (trim(workplaceId.value)=="")
  {
    alert("�����빤���ص㣡");    
    return false;
  }
  workplaceId.value = trim(workplaceId.value) ;
  
  var shortName=document.forms[0].shortName;
   var organAlias=document.forms[0].organAlias;
  
  if(!stringLengthCheck(organCode,30,"���벻�ܳ���30���ַ���")){
  return false;
  }
  
   if(!stringLengthCheck(organName,80,"����/���Ʋ��ܳ���80���ַ���")){
  return false;
  }
  
   if(!stringLengthCheck(shortName,40,"��Ʋ��ܳ���40���ַ���")){
  return false;
  }
  
  if(!stringLengthCheck(organAlias,80,"�ƺ�/�������ܳ���80���ַ���")){
  return false;
  }
  return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<html:form action="">
<bsp:container title="��֯�ṹ�޸�" >
<bsp:containbutton text="����" onclick="forSave()" action ="stru.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()" action=""></bsp:containbutton>
<bsp:containbutton text="����" onclick="javascript:window.history.go(-1)" action=""></bsp:containbutton>
<div align="center">
<tab:tab  id="tab1" type="table">

<tab:card id="card0" text="һ����Ϣ">
  <table width="100%" cellpadding="0" class="tblContent">
                 <html:hidden name="struId" property="struId" write="false"/>                 
                 <html:hidden name="struType" property="struType" write="false"/> 
                 <html:hidden name="organId" property="organId" write="false"/>
                 <html:hidden name="parentId" property="parentId" write="false"/>
                 <html:hidden name="parentStruId" property="parentStruId" write="false"/>
                 <html:hidden name="corporationId" property="corporationId" write="false"/> 
                 <html:hidden name="struLevel" property="struLevel" write="false"/> 
                 <html:hidden name="struPath" property="struPath" write="false"/>
                 <html:hidden name="struOrder" property="struOrder" write="false"/>          
                 <html:hidden name="globalOrder" property="globalOrder" write="false"/>            
                   
                <tr>
                <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>:</td>
                <td class="tdRight"><html:text name="organCode" property="organCode" size="30" maxlength="30"/><FONT COLOR=#ff0000>*</FONT></td>
                </tr>
                
                <tr>
                <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_NAME")%>:</td>
                <td class="tdRight"><html:text name="organName" property="organName" size="40" maxlength="80"/><FONT COLOR=#ff0000>*</FONT></td>
                </tr>
                
                <tr>
                <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.SHORT_NAME")%>:</td>
                <td class="tdRight"><html:text name="shortName" property="shortName" size="40" maxlength="40"/></td>
                </tr>
                
                 <tr>
                <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_ALIAS")%>:</td>
                <td class="tdRight"><html:text name="organAlias" property="organAlias" size="40" maxlength="80"/></td>
                </tr>
                
                         
		        <tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.PRINCIPAL_ID")%>:</td>
				<td class="tdRight"><html:hidden name="principalId" property="principalId" write="false"/><input type="text" name="principalName" maxlength="60" size="20" value="��ѡ������" readonly="readonly"> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectPrincipalId()"></td>
				</tr> 
                
                <tr>
                <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_TYPE")%>:</td>
                <td><html:select name="organType" property="organType" >
	            	<html:options collection="organTypeCollection" labelProperty="TYPE_NAME" property="ORGAN_TYPE"/>
	        		</html:select><FONT COLOR=#ff0000>*</FONT></td>
                </tr>  
                
                <tr>
                <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.WORKPLACE_ID")%>:</td>
                <td><html:select name="workplaceId" property="workplaceId" >
	            	<html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_ID"/>
	        		</html:select><FONT COLOR=#ff0000>*</FONT></td>
                </tr>  
                
          <tr>
		<td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.BEGIN_DATE")%>:</td>
		<td class="tdRight" valign="top"><date:date name="beginDate" divname="ddu1" property="beginDate" readonly="true" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date></td>
		</tr> 
		
		       <tr>
		<td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.END_DATE")%>:</td>
		<td class="tdRight" valign="top"><date:date name="endDate" divname="ddu2" property="endDate" readonly="true" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date></td>
		</tr>     
		
		       <tr>
        <td class="tdTitle">�����¼�����:</td>
        <td><html:select name="hrEventType" property="hrEventType" >
        	<html:options collection="hrEventTypeOptions" labelProperty="typeName" property="eventType"/>
    		</html:select><FONT COLOR=#ff0000>*</FONT></td>
      </tr> 
      
              <tr>
        <td class="tdTitle">�����¼���ע:</td>
        <td class="tdRight"><html:text name="hrEventMemo" property="hrEventMemo" size="40" maxlength="250"/></td>
        </tr>   
	        
       </table>
          </tab:card>  
   </tab:tab>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkOrg()) return;	
  document.forms[0].action ="stru.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="struquery.cmd";
  document.forms[0].submit();	
}
function selectPrincipalId(){
  var url ="stru.cmd?method=getEmpRoot";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("principalId").value=win[0];
  document.all("principalName").value=win[1];
  }
}
function forReset(){  
  document.forms[0].reset();	
}
</script>