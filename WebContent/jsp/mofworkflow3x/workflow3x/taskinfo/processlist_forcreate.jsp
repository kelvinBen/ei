<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>

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
	<td bgcolor=#CCDBEE align=center>��������</td>
	<td bgcolor=#CCDBEE align=center>��������</td>
	<td bgcolor=#CCDBEE align=center>״̬</td>
	
	</tr>
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>	
  <%
List typeList=(List)request.getAttribute("typeList");
for(int i=0;i<typeList.size();i++){
	Map typeMap=(Map)typeList.get(i);
	String physicalname=(String)typeMap.get("physicalname");
	String name=(String)typeMap.get("name");
	List processList=(List)typeMap.get("processlist");
	if(processList.size()==0)continue;
	%>
	  <tr>
    <td colspan=4 bgcolor=#CCDBEE><img src="<%=SkinUtils.getImagePath(request)%>/dot-2.gif">&nbsp;<%=name%></td></tr>
   	 
	<%
	
	for(int j=0;j<processList.size();j++){
		Map processMap =(Map)processList.get(j);
		String procDefId=(String)processMap.get("procDefId");
		String formid=(String)processMap.get("formId");
		String processType=(String)processMap.get("procType");
		String procDefName=(String)processMap.get("procDefName");
		String mgrState=(String)processMap.get("mgrState");
		String mgrStateName= mgrState.equals("0") ? "<font color=green>����</font>" : "<font color=red>ͣ��</font>";
		String pkgVersion=(String)processMap.get("pkgVersion");
		%>
		<tr>
		<td>&nbsp;</td>
		
		<td>
			<%
			  if(mgrState.equals("0")){
			  
			%>
				<a href="javascript:doLink('<%=formid%>','<%=physicalname%>','<%=procDefId%>','<%=mgrState%>')"><%=procDefName%></a>
			<%}else{%>
				<%=procDefName%>
			<%}%>	
		</td>
				
		<td align="center"><%=mgrStateName%></td>
		
		</tr>
		<%
	}
	%>
	
	<%
}
%>
       </table>
<input type="hidden" name="EXT_RETURN_URL" value=""/>

</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("�������̣���������½�����");
function doLink(formId,processType,processId,mgrState){   
	if(mgrState!="0"){
		alert("������û�����ã��������½���");
		return;
	} 
  document.forms[0].action ="moftaskinfo.cmd?method=forcreate&procDefId="+processId+"&formId="+formId+"&processType="+processType;    
  document.forms[0].EXT_RETURN_URL.value=window.location.href;
  document.forms[0].submit();	
}
</script>