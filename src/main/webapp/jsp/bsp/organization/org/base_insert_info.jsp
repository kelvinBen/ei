<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.bsp.organization.view.StruView"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%
String refresh_id=(String)request.getAttribute("REFRESHID");
String primaryKey = (String)request.getAttribute("primaryKey");
String parentStruId=(String)request.getAttribute("parentStruId");
String organType=(String)request.getAttribute("organType");
//---------�Ƶ�Ӿ 2005-11-14 ��ȡ����use_prefix �Ƿ������Զ����ϼ���֯�ı�����Ϊ���������ǰ׺
//String use_prefix=(String)request.getAttribute("use_prefix");
//out.print("use_prefix="+use_prefix+"<BR>");

String use_prefix =Global.getString("net.mast.bsp.use_prefix");
if(use_prefix!=null)
	use_prefix=use_prefix.toLowerCase().trim();
else
use_prefix="false";
//----------
String depName = "";
String depId ="";
if(organType==null || !organType.startsWith("1")){
	List list =  (ArrayList)request.getAttribute("departmentCollection");
	Map  depColl =  (HashMap)list.get(0);
	depName = (String) depColl.get("departmentName");
	depId = (String) depColl.get("departmentId");

}
//----------
boolean flag=true;
if(refresh_id==null || refresh_id.equals("")){
flag=false;
}
String style="";

if(organType!=null && organType.startsWith("1"))
  style="display:none";
else 
  style="display:block";


%>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkBase(){
 var organCode = document.forms[0].organCode;
    if ( __isQuoteIn(organCode.value) )
    {
      alert("���벻�ܺ��������ַ�!");
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
     if ( __isQuoteIn(organName.value) )
    {
      alert("����/���Ʋ��ܺ��������ַ�!");
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
  //!!!!
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
 /**
  var beginDate=document.forms[0].beginDate;
  var endDate=document.forms[0].endDate;
   
   if (trim(beginDate.value)=="")
  {
    alert("��Ч���ڲ���Ϊ�գ�");  
      beginDate.select();
      beginDate.focus();
    return false;
  }
   if(!checkDateFormat("yyyyMMdd",beginDate.value)){
	alert("��Ч���ڸ�ʽӦ����'yyyyMMdd'����ʽ��");  
      beginDate.select();
      beginDate.focus();
    return false;
  }

  beginDate.value = trim(beginDate.value) ;
   if (trim(endDate.value)=="")
  {
    alert("ʧЧ���ڲ���Ϊ�գ�");  
      endDate.select();
      endDate.focus();
    return false;
  }
      if(!checkDateFormat("yyyyMMdd",endDate.value)){
	alert("ʧЧ���ڸ�ʽӦ����'yyyyMMdd'����ʽ��");  
      endDate.select();
      endDate.focus();
    return false;
  }

  
  endDate.value = trim(endDate.value) ;**/
  var shortName=document.forms[0].shortName;
  var organAlias=document.forms[0].organAlias;
  var hrEventMemo=document.forms[0].hrEventMemo;
  
  //---------huangdos 2005-11-14 ��־flag��ʾ�Ƿ��齨ǰ׺
var flag="<%=use_prefix%>";
var parentOrganCode = trim(document.forms[0].parentOrganCode.value);
var tempcode=organCode.value;
if(flag=="true") {
 organCode.value=parentOrganCode+organCode.value;
 if(!stringLengthCheck(organCode,30,"��������ϼ���֯�ı��볤�Ȳ��ܳ���30���ַ�!")){
	organCode.value=tempcode;
	organCode.focus();
  return false;
  }
 }
  else{
   if(!stringLengthCheck(organCode,30,"���벻�ܳ���30���ַ�!")){
    organCode.select();
	organCode.focus();
  return false;
  }
}


 // if(!stringLengthCheck(organCode,30,"���벻�ܳ���30���ַ�!")){
//	organCode.focus();
 // return false;
//  }
 //----------- 
  
  if(!stringLengthCheck(organName,80,"����/���Ʋ��ܳ���80���ַ�!")){
     organName.select();
     organName.focus();
     return false;
  }
  if(shortName == null || shortName == ""){
  	shortName = organName;
  }
  if(!stringLengthCheck(shortName,40,"��Ʋ��ܳ���40���ַ�!")){
    shortName.select();
    shortName.focus();
    return false;
  }
  
  if(!stringLengthCheck(organAlias,80,"�ƺ�/�������ܳ���80���ַ�!")){
    organAlias.select();
    organAlias.focus();
    return false;
  }
  
  if(!stringLengthCheck(hrEventMemo,250,"�����¼����ͱ�ע���ܳ���250���ַ�!")){
    hrEventMemo.select();
    hrEventMemo.focus();
    return false;
  }
  var primaryKey = '<%=primaryKey%>';
  var organType = '<%=organType%>';
  //alert(document.all("projects").value);
  //�첽����
   xmlhttp("prworganext.cmd?method=AnysInsert&organType="+organType+"&primaryKey="+primaryKey+"&projects="+document.all("projects").value);
  //alert(result);
  return true
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
function selectDepartmentId(){
  var url = "stru.cmd?method=getDepartmentRoot";
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("departmentId").value=win[0];
  document.all("departmentName").value=win[1];
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
<div align="left">
<tab:tab  id="tab1" type="table">
<tab:card id="card0" text="һ����Ϣ">
  <table width="100%" cellpadding="0" class="tblContent"> 	  
         <input type="hidden" name="primaryKey" value="<%=primaryKey%>" >              
         <html:hidden name="struType" property="struType" write="false"/> 
         <html:hidden name="parentId" property="parentId" write="false"/>
         <html:hidden name="parentStruId" property="parentStruId" value="<%=parentStruId%>" write="false"/>
         <html:hidden name="corporationId" property="parentId" write="false"/>
         <html:hidden name="struLevel" property="struLevel" write="false"/> 
         <html:hidden name="struPath" property="struPath" write="false"/>
         <html:hidden name="struOrder" property="struOrder" write="false"/>          
         <html:hidden name="globalOrder" property="globalOrder" write="false"/>            
  		
  		                <tr style="display:none">
                <td class="tdTitle">�ṹ����:</td>
                <td class="tdRight"><html:text name="struId" property="struId" size="30" maxlength="30"/><FONT COLOR=#ff0000>*</FONT></td>
                </tr>
                
                <tr style="display:none">
                <td class="tdTitle">��֯����:</td>
                <td class="tdRight"><html:text name="organId" property="organId" size="30" maxlength="30"/><FONT COLOR=#ff0000>*</FONT></td>
                </tr>
  		
  				<tr >
                <td class="tdTitle">�ϼ���֯����:</td>
                <td class="tdRight"><html:hidden name="parentOrganCode" property="parentOrganCode" write="true"/>
                </tr>
  		<%
		if("true".equalsIgnoreCase(use_prefix)) {
		//ֻ��ʾ������֯�Ƽ����룬�û�ֻ�����޸ı����ı���
		StruView stru=(StruView)request.getAttribute(Global.getString("html.data"));
		//�������󳤶�����
		String codeLength =stru.getOrganCode().length()+"";
		
			%>
		<tr>
        <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>:</td>
        <td class="tdRight"><html:text name="organCode" property="organCode" size="<%=codeLength%>" maxlength="<%=codeLength%>"/><FONT COLOR=#ff0000>*</FONT></td>
        </tr>
        <%}
			else{
		//���ϼ���֯�ı�����Ϊǰ׺���¼���֯һͬ��ʾ�������������û��޸���������
		%>
		<tr>
        <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>:</td>
        <td class="tdRight"><html:text name="organCode" property="$parentOrganCode+organCode" size="30" maxlength="30"/><FONT COLOR=#ff0000>*</FONT></td>
        </tr>
		<%
			}				
		%>
        
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
		<td class="tdRight"><html:hidden name="principalId" property="principalId" write="false"/><html:text name="principalName" property="principalName" value="��ѡ������" size="20" maxlength="60"  readonly="true" ondblclick="clean()"/> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectPrincipalId()"></td>
		</tr> 
		
		 <html:hidden name="organType" property="organType" value="<%=organType%>" write="false"/>
       
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
		<td class="tdRight" valign="top"><date:date name="beginDate" divname="ddd" zindex="12" property="beginDate" readonly="false" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date><FONT COLOR=#ff0000>*</FONT></td>
		</tr> 
		
		       <tr>
		<td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.END_DATE")%>:</td>
		<td class="tdRight" valign="top"><date:date name="endDate" divname="ddv" zindex="11" property="endDate" readonly="false" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date><FONT COLOR=#ff0000>*</FONT></td>
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
   </tab:card>  
   <tab:card id="card1" text=" ��չ��Ϣ  ">
  <table width="100%" cellpadding="0" class="tblContent">
      <tr>
        <td class="tdTitle">��Ŀ����:</td>
        <td class="tdRight">  <select name="projects">
    <option value="">--��ѡ��--</option>
    <option value="0">��Ӫҵ��</option>
    <option value="1">Ӫҵ��</option>
  </select></td>
      </tr>
  </table>
  </tab:card>
   </tab:tab>   
</div>   
    <script language="javascript">
 function clean(){
 	document.forms[0].principalId.value="";
 	document.forms[0].principalName.value="";
 }
 </script>