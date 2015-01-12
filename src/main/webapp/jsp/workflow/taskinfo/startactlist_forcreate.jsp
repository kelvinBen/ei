<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>
<BODY style="margin:10px;">
<div class="btnareaCss">
<html:button name="返回" value="返回" onclick="forReturn()"></html:button>
</div>	
<html:form  name="frmList"  action="">
<div align=center>
<br>
<table width="50%"  borderColor=#3784c9 cellpadding="5" border=1 cellspacing="0" >  
<tr><td bgcolor=#CCDBEE align=left>请选择开始环节:</td></tr>
<%
	String EXT_RETURN_URL=request.getParameter("EXT_RETURN_URL");
	if(EXT_RETURN_URL==null){
		EXT_RETURN_URL="";
	}
	String procDefId=(String)request.getAttribute("procDefId");
	List startActList=(List)request.getAttribute("startActList");
	if(startActList!=null){
		for(int i=0;i<startActList.size();i++){
		Map map=(Map)startActList.get(i);
		String actDefId=(String)map.get("actDefId");
		String actDefName=(String)map.get("actDefName");
		String pluginType =(String)map.get("pluginType");
	%>
		<tr><td align=center><a href="javascript:doLink('<%=actDefId %>','<%=actDefName %>','<%=pluginType %>')"><%=actDefName %></a></td></tr>
	<%}}
%>

</table>
</div>
<input type="hidden" name="EXT_RETURN_URL" value="<%=EXT_RETURN_URL %>"/>
<input type="hidden" name="procDefId" value="<%=procDefId %>" />
</html:form>
</BODY>
</HTML>
<script language="javascript">

function doLink(actDefId,actDefName,pluginType){   
  var procDefId=document.all("procDefId").value;
  if(pluginType.indexOf("JspForm")>=0)
  {
       document.forms[0].action ="jspformtaskdeal.cmd?method=forcreate&procDefId="+procDefId+"&actDefId="+actDefId+"&fromActListPage=true";    
      
  }else {
  document.forms[0].action ="taskinfo.cmd?method=forcreate&procDefId="+procDefId+"&actDefId="+actDefId+"&actDefName="+actDefName+"&fromActListPage=true";    
  }
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action=document.forms[0].EXT_RETURN_URL.value;
  document.forms[0].submit();	
  }
</script>
