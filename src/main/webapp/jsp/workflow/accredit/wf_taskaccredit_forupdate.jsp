<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<HTML>
<HEAD>
<TITLE>出差代理修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
<%
	String agentOrganName=(String)request.getAttribute("agentOrganName");
	if(agentOrganName==null) agentOrganName="";
	String imgHelp = SkinUtils.getImage(request,"liulan.gif");
%>

function checkWfTaskaccredit(){
 	
 	var agentorganid = document.forms[0].agentorganid;
	if (trim(agentorganid.value)=="")
	{
	  alert("请选择代理用户！");    
	  return false;
	}
    agentorganid.value = trim(agentorganid.value) ;
 	var type = document.forms[0].type;
	if (trim(type.value)=="")
	{
	  alert("请选择代理类型！");    
	  return false;
	}
    type.value = trim(type.value) ;
 	var dataid = document.forms[0].dataid;
	if (trim(dataid.value)=="")
	{
	  alert("请选择代理任务！");    
	  return false;
	}
    dataid.value = trim(dataid.value) ;
    
 	var dataname = document.forms[0].dataname;
    dataname.value = trim(dataname.value) ;
 	
 	var description = document.forms[0].description;
    description.value = trim(description.value) ;
    
 	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<div class="btnareaCss">
<html:button onclick="forSave()" name="btn_save" value="保存"></html:button>
<html:button onclick="forReturn()" name="btn_return" value="返回"></html:button>
</div>
<html:messages></html:messages>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss"><legend>出差代理修改</legend>
<html:hidden name="id" property="id"  />
<html:hidden name="oldorganid" property="oldorganid"  />
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
                             
		<tr>
                 <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.AGENTORGANID")%>：</td>
                 <td class="tdRight">
                 <html:hidden name="agentorganid" property="agentorganid"  />
                 <html:text name="agentorganname" value="<%=agentOrganName%>" size="12" />
                 <img src="<%=imgHelp%>" onclick="selectAgentOrgan()" style="cursor:hand;" border="0" >
                    <span id="agentorganSpan2" class="xinghaoCss">*</span>
                 </td>
                 </tr>                    
		<tr>
                 <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.TYPE")%>：</td>
                 <td class="tdRight">
                 <html:label name="type" property="type" labelKey="key" labelProperty="value" collection="taskaccredit_collection" /></td>
    	</tr>                    
		<tr>
                 <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.DATANAME")%>：</td>
                 <td class="tdRight">
                 <html:hidden name="dataid" property="dataid"  />
                 <html:hidden name="dataname" property="dataname" write="true"/>
                 </td>
                 </tr>                    
		<tr>
                 <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.TIME")%>：</td>
                 <td class="tdRight"><html:hidden name="time" property="time" write="true" /></td>
                 </tr>                    
		<tr>
                 <td class="tdTitle"><%=ResourcesFactory.getString("WF_TASKACCREDIT.DESCRIPTION")%>：</td>
                 <td class="tdRight"><html:textarea name="description" property="description" rows="4" cols="30" /></td>
                 </tr>                    
  </table>
</div>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkWfTaskaccredit()) return;	
  document.forms[0].action ="wftaskaccredit.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="wftaskaccreditquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
/*
选择代理用户 
*/
function selectAgentOrgan(){
	//var url ="jsp/help.jsp?url=struhelp.cmd&method=getEmpRoot";
	var url ="jsp/help.jsp?url=struhelp.cmd&method=getSelectRoot&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	var ret;
	if(win==null){
		return false;
	}else if(typeof(win)=="string" && win==""){
		ret=new Array();
		ret[0]="";
		ret[1]="";
	}else{
		ret = win;
	}
	if(ret[0] == document.forms[0].agentorganid.value){
		return false;
	}
	document.forms[0].agentorganid.value = ret[0];
	document.forms[0].agentorganname.value = ret[1];
}
</script>