<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>


<%@page import="net.mast.workflow.wfclient.processmanage.processType.data.WfProcessType"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">


<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>

</HEAD>
<BODY style="margin:20px;">
<html:form  name="frmList"  action="">
  <table width="100%"  borderColor=#3784c9 cellpadding="5" border=1 cellspacing="0" >  

	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>	
<%
List typeList=(List)request.getAttribute("typeList");
for(int i=0;i<typeList.size();i++){
	WfProcessType typeMap=(WfProcessType)typeList.get(i);
	String name= typeMap.getName();
	List processList=(List)typeMap.getProcesslist();
	if(processList.size()==0)continue;
	%>
	  <tr>
    <td colspan=4 bgcolor=#CCDBEE><img src="<%=SkinUtils.getImagePath(request)%>/dot-2.gif">&nbsp;<%=name%></td></tr>
   	 
	<%
	for(int j=0;j<processList.size();j++){
		Map processMap =(Map)processList.get(j);
		String procDefId=(String)processMap.get("procDefId");
		String procDefName=(String)processMap.get("procDefName");
		String mgrState=(String)processMap.get("mgrState");
		String formplugin =(String)processMap.get("formPlugin"); // 这个字段有什么作用??
		String mgrStateName= mgrState.equals("0") ? "<font color=green>启动</font>" : "<font color=red>停用</font>";
    %>
		<tr>
		<td>&nbsp;</td>
		<td>
		<%if(mgrState.equals("0")){%>
			<a href="javascript:doLink('<%=procDefId%>','<%=mgrState%>','<%=formplugin %>')"><%=procDefName%></a>
		<%}else{ %>
			<%=procDefName%>
		<%}%>	
		</td>
		<td align="center"><%=mgrStateName%></td>
		</tr>
	<%}%>
<%}%>
</table>
<input type="hidden" name="EXT_RETURN_URL" value=""/>

</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("工作流程－任务管理－新建任务");
function doLink(processId,mgrState,formplugin){  
  if(mgrState!="0"){
		alert("该流程没有启用，不允许新建！");
		return;
	} 
  //document.forms[0].action ="taskinfo.cmd?method=forcreate&procDefId="+processId+"&formId="+formId+"&processType="+processType;    
  if(formplugin.indexOf("Jsp_NoneField")>=0){
  	document.forms[0].action="wftaskdeal.cmd?method=forcreate&procDefId="+processId;
  }else if(formplugin.indexOf("Jsp_Field")>=0){
  	document.forms[0].action="jspfield.cmd?method=forcreate&procDefId="+processId;
  }else if(formplugin.indexOf("MdaForm")>=0){
    document.forms[0].action="moftaskinfo.cmd?method=forcreate&procDefId="+processId;;
  }else if(formplugin.indexOf("JspForm")>=0){
    document.forms[0].action="jspformtaskdeal.cmd?method=forcreate&procDefId="+processId;
  }
  else{
    document.forms[0].action ="taskinfo.cmd?method=forcreate&procDefId="+processId;   
  } 
  document.forms[0].EXT_RETURN_URL.value=window.location.href;
  document.forms[0].submit();	
}
//function linkNoneForm(url){
//  document.forms[0].action=url;
//  document.forms[0].submit();	
// }
</script>
