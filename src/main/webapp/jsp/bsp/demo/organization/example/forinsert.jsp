
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
      alert("编码不能含有引号或单引号!");
      organCode.select();
      organCode.focus();
      return false;
    }
  if (trim(organCode.value)=="")
  {
    alert("请输入编码！");
    organCode.focus();
    return false;
  }
  organCode.value = trim(organCode.value) ;
 var organName = document.forms[0].organName;
     if ( __isQuoteIn(organName.value) )
    {
      alert("姓名/名称不能含有引号或单引号!");
      organName.select();
      organName.focus();
      return false;
    }
  if (trim(organName.value)=="")
  {
    alert("请输入姓名/名称！");
    organName.focus();
    return false;
  }
  organName.value = trim(organName.value) ;
   var organType = document.forms[0].organType;
  if (trim(organType.value)=="")
  {
    alert("请输入类型！");
    organType.focus();
    return false;
  }
  organType.value = trim(organType.value) ;
 var workplaceId = document.forms[0].workplaceId;
  if (trim(workplaceId.value)=="")
  {
    alert("请输入工作地点！");    
    return false;
  }
  workplaceId.value = trim(workplaceId.value) ;
  
   var cPublicUserId = document.forms[0].cPublicUserId;
  if (trim(cPublicUserId.value)=="")
  {
    alert("请输入公用账号！");    
    return false;
  }
  cPublicUserId.value = trim(cPublicUserId.value) ;
  
   var securityTemplate = document.forms[0].securityTemplate;
  if (trim(securityTemplate.value)=="")
  {
    alert("请输入组织使用的权限管理模板！");    
    return false;
  }
  securityTemplate.value = trim(securityTemplate.value) ;
  
  var shortName=document.forms[0].shortName;
   var organAlias=document.forms[0].organAlias;
  
  if(!stringLengthCheck(organCode,30,"编码不能超过30个字符!")){
  return false;
  }
  
   if(!stringLengthCheck(organName,80,"姓名/名称不能超过80个字符!")){
  return false;
  }
  
   if(!stringLengthCheck(shortName,40,"简称不能超过40个字符!")){
  return false;
  }
  
  if(!stringLengthCheck(organAlias,80,"称呼/别名不能超过80个字符!")){
  return false;
  }
  
    if(!stringLengthCheck(cPublicUserId,30,"公用账号不能超过30个字符!")){
  return false;
  }
  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form action="">
<bsp:container title="创建组织" >
<bsp:containbutton text="保存" onclick="forSave()" action ="corpstru.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="javascript:window.history.go(-1)" action=""></bsp:containbutton>
<div align="center">
<tab:tab  id="tab1" type="table">

<tab:card id="card0" text="一般信息">
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
		<td class="tdRight"><html:hidden name="principalId" property="principalId" write="false"/><html:text name="principalName" property="principalName" value="请选择负责人" size="20" maxlength="60"  readonly="true" /> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectPrincipalId()"></td>
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
        <td class="tdTitle">人事事件类型:</td>
        <td><html:select name="hrEventType" property="hrEventType" >
        	<html:options collection="hrEventTypeOptions" labelProperty="typeName" property="eventType"/>
    		</html:select><FONT COLOR=#ff0000>*</FONT></td>
      </tr> 
      
              <tr>
        <td class="tdTitle">人事事件备注:</td>
        <td class="tdRight"><html:text name="hrEventMemo" property="hrEventMemo" size="40" maxlength="250"/></td>
        </tr> 
  
                                   
   </table>
   </tab:card>
   
   
   <tab:card id="card1" text="安全" >
           <tr>
		        <td class="tdTitle">公用账号:</td>
		        <td class="tdRight"><html:text name="cPublicUserId" property="cPublicUserId" size="20" maxlength="30"/><FONT COLOR=#ff0000>(账号名称在组织创建后将不能修改)*</FONT></td>
       	 </tr>
   		     <tr>
                <td class="tdTitle">安全管理模板:</td>
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