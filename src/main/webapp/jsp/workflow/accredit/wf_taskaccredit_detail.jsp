<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>出差代理明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<div class="btnareaCss">
<!--//<html:button onclick="forUpdate()" name="btn_update"  value="修改"></html:button>-->
<html:button onclick="forReturn()" name="btn_return"  value="返回"></html:button>
</div>
<html:messages></html:messages>
<fieldset class="FieldsetCss"><legend>出差代理明细</legend>

<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$id" write="false"/>
  		<html:hidden name="id" property="id" />
  		<html:hidden name="oldorganid" property="oldorganid" />
  		
  		
  	 <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.OLDORGANID")%>：</td>
      <td class="tdRight">
      <html:label name="oldorganid" property="oldorganid" labelKey="ORGAN_ID" labelProperty="ORGAN_NAME" collection="PROCESS_ORGANIZE_COLLECTION" /></td>
    </tr>	
  		
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.AGENTORGANID")%>：</td>
      <td class="tdRight">
      <html:label name="agentorganid" property="agentorganid" labelKey="ORGAN_ID" labelProperty="ORGAN_NAME" collection="PROCESS_ORGANIZE_COLLECTION" /></td>
    </tr>
     <!-- //
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.TYPE")%>：</td>
      <td class="tdRight">
      <html:label name="type" property="type" labelKey="key" labelProperty="value" collection="taskaccredit_collection" />
      </td>
    </tr>
   
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.DATANAME")%>：</td>
      <td class="tdRight">
      <html:hidden name="dataid" property="dataid" write="false"/>
      <html:hidden name="dataname" property="dataname" write="true"/>
      </td>
    </tr>
     -->
     <html:hidden name="dataid" property="dataid" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.TIME")%>：</td>
      <td class="tdRight"><html:hidden name="time" property="time" write="true"/></td>
    </tr>
    
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.ENDTIME")%>：</td>
      <td class="tdRight"><html:hidden name="endtime" property="endtime" write="true"/></td>
    </tr>
    
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.DESCRIPTION")%>：</td>
      <td class="tdRight"><html:hidden name="description" property="description" write="true"/></td>
    </tr>
  </table>
</div>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="wftaskaccredit.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
var dataid= document.all('dataid').value;
var url ="";
if(dataid=="Package_d710071985_Wor1"){
	url ="localTaskInfo.cmd?method=queryProxy";
}else if(dataid=="Package_78a048534f0_Wor1"){
	url ="headTaskInfo.cmd?method=queryProxy";
}
//   document.forms[0].action ="wftaskaccreditquery.cmd";
 document.forms[0].action=url;
  document.forms[0].submit();	
}
</script>