
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>


<%
String refresh_id=(String)request.getAttribute("REFRESHID");
boolean flag=true;
if(refresh_id==null || refresh_id.equals("")){
flag=false;
}
%>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkOrg(){
 var organCode = document.forms[0].organCode;
    if ( __isQuoteIn(organCode.value) )
    {
      alert("���벻�ܺ������Ż�����!");
      organCode.select();
      organCode.focus();
      return false;
    }
  if (trim(organCode.value)=="")
  {
    alert("��������룡");
    organCode.focus();
    return false;
  }
  organCode.value = trim(organCode.value) ;
 var organName = document.forms[0].organName;
     if ( __isQuoteIn(organName.value) )
    {
      alert("����/���Ʋ��ܺ������Ż�����!");
      organName.select();
      organName.focus();
      return false;
    }
  if (trim(organName.value)=="")
  {
    alert("����������/���ƣ�");
    organName.focus();
    return false;
  }
  organName.value = trim(organName.value) ;
   var organType = document.forms[0].organType;
  if (trim(organType.value)=="")
  {
    alert("���������ͣ�");
    organType.focus();
    return false;
  }
  organType.value = trim(organType.value) ;
 var workplaceId = document.forms[0].workplaceId;
  if (trim(workplaceId.value)=="")
  {
    alert("�����빤���ص㣡");    
    return false;
  }
  workplaceId.value = trim(workplaceId.value) ;
  
   var cPublicUserId = document.forms[0].cPublicUserId;
  if (trim(cPublicUserId.value)=="")
  {
    alert("�����빫���˺ţ�");    
    return false;
  }
  cPublicUserId.value = trim(cPublicUserId.value) ;
  
   var securityTemplate = document.forms[0].securityTemplate;
  if (trim(securityTemplate.value)=="")
  {
    alert("��������֯ʹ�õ�Ȩ�޹���ģ�壡");    
    return false;
  }
  securityTemplate.value = trim(securityTemplate.value) ;
  
  var shortName=document.forms[0].shortName;
   var organAlias=document.forms[0].organAlias;
  
  if(!stringLengthCheck(organCode,30,"���벻�ܳ���30���ַ�!")){
  return false;
  }
  
   if(!stringLengthCheck(organName,80,"����/���Ʋ��ܳ���80���ַ�!")){
  return false;
  }
  
   if(!stringLengthCheck(shortName,40,"��Ʋ��ܳ���40���ַ�!")){
  return false;
  }
  
  if(!stringLengthCheck(organAlias,80,"�ƺ�/�������ܳ���80���ַ�!")){
  return false;
  }
  
    if(!stringLengthCheck(cPublicUserId,30,"�����˺Ų��ܳ���30���ַ�!")){
  return false;
  }
  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form action="">
<bsp:container title="������֯" >
<bsp:containbutton text="����" onclick="forSave()" action ="corpstru.cmd?method=insert"></bsp:containbutton>
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
         <html:hidden name="corporationId" property="parentId" write="false"/>
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
		<td class="tdRight"><html:hidden name="principalId" property="principalId" write="false"/><html:text name="principalName" property="principalName" value="��ѡ������" size="20" maxlength="60"  readonly="true" /> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectPrincipalId()"></td>
		</tr> 
        
        <tr>
        <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_TYPE")%>:</td>
        <td><html:select name="organType" property="organType" >
        	<html:options collection="organTypeOptions" labelProperty="targetName" property="targetRef"/>
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
		<td class="tdRight" valign="top"><date:date name="beginDate" divname="ddd" property="beginDate" readonly="true" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date></td>
		</tr> 
		
		       <tr>
		<td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.END_DATE")%>:</td>
		<td class="tdRight" valign="top"><date:date name="endDate" divname="ddv" property="endDate" readonly="true" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date></td>
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
   
   
   <tab:card id="card1" text="��ȫ" >
           <tr>
		        <td class="tdTitle">�����˺�:</td>
		        <td class="tdRight"><html:text name="cPublicUserId" property="cPublicUserId" size="20" maxlength="30"/><FONT COLOR=#ff0000>(�˺���������֯�����󽫲����޸�)*</FONT></td>
       	 </tr>
   		     <tr>
                <td class="tdTitle">��ȫ����ģ��:</td>
                <td><html:select name="securityTemplate" property="securityTemplate" >
	            	<html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_ID"/>
	        		</html:select><FONT COLOR=#ff0000>*</FONT>
	        	</td>
              </tr>   
   
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
  document.forms[0].action ="corpstru.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkOrg()) return;
  document.forms[0].action ="corpstru.cmd?method=insertContinue";
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
function init(){
<%

if(flag){
%>
        var parent_id = "<%=refresh_id%>";
        getTreeFrame().seltree.refreshNodeById(parent_id);        
	<%
	}
	%>
}
init();
</script>