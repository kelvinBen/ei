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
      alert("编码不能含有引号或单引号！");
      organCode.select();
      organCode.focus();
      return false;
    }
  if (trim(organCode.value)=="")
  {
    alert("请输入编码！");    
    return false;
  }
  organCode.value = trim(organCode.value) ;
 var organName = document.forms[0].organName;
   if ( __isQuoteIn(organName.value) )
    {
      alert("姓名/名称不能含有引号或单引号！");
      organName.select();
      organName.focus();
      return false;
    }
  if (trim(organName.value)=="")
  {
    alert("请输入名称！");    
    return false;
  }
  organName.value = trim(organName.value) ;

 var workplaceId = document.forms[0].workplaceId;
  if (trim(workplaceId.value)=="")
  {
    alert("请输入工作地点！");    
    return false;
  }
  workplaceId.value = trim(workplaceId.value) ;
  
  var shortName=document.forms[0].shortName;
   var organAlias=document.forms[0].organAlias;
  
  if(!stringLengthCheck(organCode,30,"编码不能超过30个字符！")){
  return false;
  }
  
   if(!stringLengthCheck(organName,80,"姓名/名称不能超过80个字符！")){
  return false;
  }
  
   if(!stringLengthCheck(shortName,40,"简称不能超过40个字符！")){
  return false;
  }
  
  if(!stringLengthCheck(organAlias,80,"称呼/别名不能超过80个字符！")){
  return false;
  }
  return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<html:form action="">
<bsp:container title="组织结构修改" >
<bsp:containbutton text="保存" onclick="forSave()" action ="stru.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()" action=""></bsp:containbutton>
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
				<td class="tdRight"><html:hidden name="principalId" property="principalId" write="false"/><input type="text" name="principalName" maxlength="60" size="20" value="请选择负责人" readonly="readonly"> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectPrincipalId()"></td>
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