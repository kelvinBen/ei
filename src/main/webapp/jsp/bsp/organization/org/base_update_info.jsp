<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>

<%

    String organType = (String)request.getAttribute("organType");
    String style="";
	if(organType!=null && organType.startsWith("1"))
		  style="display:none";
		else 
		style="display:block";

String depName = "";
String depId ="";
if(organType==null || !organType.startsWith("1")){
	List list =  (ArrayList)request.getAttribute("departmentCollection");
	Map  depColl =  (HashMap)list.get(0);
	depName = (String) depColl.get("departmentName");
	depId = (String) depColl.get("departmentId");	
	
}

%>

<script language="javascript">
function checkBase(){
 var organCode = document.forms[0].organCode;
  if ( __isQuoteIn(organCode.value) )
    {
      alert("���벻�ܺ��������ַ���");
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
  if(!__checkCode(organCode.value)){
    alert("���������Ӣ���ַ������֣�");
    organCode.focus();
    return false;
  }
 var organName = document.forms[0].organName;

  if (trim(organName.value)=="")
  {
    alert("���������ƣ�");    
    organName.focus();
    return false;
  }
  organName.value = trim(organName.value) ;
 
 //add by ë���� 20051108 ������ƺ�/���������ߡ���ơ�Ϊ�գ���ѡ�����/���ơ���ֵ������
 
  var organAlias = document.forms[0].organAlias;

  if (trim(organAlias.value)=="")
  {
 organAlias.value=organName.value;
  }
  organAlias.value = trim(organAlias.value) ;
  
  var shortName = document.forms[0].shortName;
   if (trim(shortName.value)=="")
	{
   shortName.value=organName.value;
   }
    shortName.value = trim(shortName.value) ;
  
  //!!!!!

 var workplaceId = document.forms[0].workplaceId;
  if (trim(workplaceId.value)=="")
  {
    alert("�����빤���ص㣡");  
    workplaceId.focus();  
    return false;
  }
  workplaceId.value = trim(workplaceId.value) ;
  
   var shortName=document.forms[0].shortName;
   var organAlias=document.forms[0].organAlias;
   var hrEventMemo=document.forms[0].hrEventMemo;
  
  if(!stringLengthCheck(organCode,30,"���벻�ܳ���30���ַ���")){
    organCode.select();
	organCode.focus();
    return false;
  }
  
   if(!stringLengthCheck(organName,80,"����/���Ʋ��ܳ���80���ַ���")){
     organName.select();
     organName.focus();
     return false;
  }
  if(shortName == null || shortName == ""){
  	shortName = organName;
  }  
   if(!stringLengthCheck(shortName,40,"��Ʋ��ܳ���40���ַ���")){
    shortName.select();
    shortName.focus();
    return false;
  }
  
  if(!stringLengthCheck(organAlias,80,"�ƺ�/�������ܳ���80���ַ���")){
    organAlias.select();
    organAlias.focus();
    return false;
  }
  
  if(!stringLengthCheck(hrEventMemo,250,"�����¼����ͱ�ע���ܳ���250���ַ�!")){
    hrEventMemo.select();
    hrEventMemo.focus();
    return false;
  }
  //����У��

	var organType1 = document.forms[0].organType; 
	var organType2= document.all("organTypeChange").value ;
	if(organType2.substring(0,1)=="1"){
		if(trim(organType1.value).substring(0,1)!="1"){
		  	if (!confirm("��֯�ṹ�����ɷ��˸�Ϊ�Ƿ���ʱ,����֯�ṹӵ�еĽ�ɫ��ת�Ƶ��ϼ�����!�Ƿ�Ҫ�����֯�ṹ����?")) {
	   	    	 return false;
	     	}  
	  		return true; 
		}
	}
  return true;
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
</script>


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
           		 <html:hidden name="organTypeChange" value=""/>      
                   

                   
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
				<td class="tdRight"><html:hidden name="principalId" property="principalId" write="false"/>
				<html:text name="principalName" property="principalName" size="12" readonly="true" ondblclick="clean()"/>
				<img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectPrincipalId()"></td>
				</tr> 
                
                <tr>
                <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_TYPE")%>:</td>
                <td class="tdRight"><html:select name="organType" property="organType" >
	            	<html:options collection="organTypeCollection" labelProperty="TYPE_NAME" property="ORGAN_TYPE"/>
	        		</html:select></td>
                </tr>  
                
                <tr style="<%=style%>">
                <td class="tdTitle">�������ţ�</td>
                <td class="tdRight">
				<html:hidden name="departmentId" property="departmentId" value="<%=depId%>" write="false"/>
				<html:hidden name="departmentName" property="departmentName" value="<%=depName%>" write="true"/>
                </td>
                </tr>
                
                <tr>
                <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.WORKPLACE_ID")%>:</td>
                <td class="tdRight"><html:select name="workplaceId" property="workplaceId" >
	            	<html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_ID"/>
	        		</html:select></td>
                </tr>  
 <!--                
                <tr>
		        <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.BEGIN_DATE")%>:</td>
	        	<td class="tdRight" valign="top"><date:date name="beginDate" divname="ddu1" zindex="12" property="beginDate" readonly="false" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date><FONT COLOR=#ff0000>*</FONT></td>
		        </tr> 
		
		        <tr>
		        <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.END_DATE")%>:</td>
		        <td class="tdRight" valign="top"><date:date name="endDate" divname="ddu2" zindex="11" property="endDate" readonly="false" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date><FONT COLOR=#ff0000>*</FONT></td>
		        </tr>     
--> 		
		       <tr>
               <td class="tdTitle">�����¼�����:</td>
               <td class="tdRight"><html:select name="hrEventType" property="hrEventType" >
        	        <html:options collection="eventTypeOptions" labelProperty="typeName" property="eventType"/>
    		        </html:select></td>
               </tr> 
      
               <tr>
               <td class="tdTitle">�����¼���ע:</td>
               <td class="tdRight"><html:text name="hrEventMemo" property="hrEventMemo" size="40" maxlength="250"/></td>
               </tr>   
	        
       </table>
       
       
<script language="javascript">
init();
function init(){
	var organTypeInit = document.forms[0].organType;	
	document.all("organTypeChange").value = document.forms[0].organType.value; 
}
 function clean(){
 	document.forms[0].principalId.value="";
 	document.forms[0].principalName.value="";
 }
 </script>