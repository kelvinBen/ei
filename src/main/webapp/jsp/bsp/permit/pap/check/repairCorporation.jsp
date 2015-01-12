<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%@ page import="net.mast.waf.ComponentFactory" %>

<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.util.database.*"%>


<% 

//检查的列表
//List checklist=new ArrayList();
List checklist=(List)request.getAttribute("repairList");
%>
<html>
<head>
<title>组织所属法人修复结果</title>
</head>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<body>
<style>
.tdCss td
{
border:1 solid #000000;
}
</style>
<html:form  name="frmList"  action="">
<bsp:container title="组织所属法人修复结果" >

<bsp:containbutton text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center" >

		<TABLE align="CENTER" cellpadding="1" border=1 class="tdCss" style="border:1 solid #000000" width="100%" >
		<TR align="CENTER" >
			<Td width="30%" style="font-size:20"><b>组织</b></Td>
			<Td width="30%"  style="font-size:20"><b>所属法人</b></Td>
			<Td width="40%"  style="font-size:20"><b>修复结果</b></Td>
		</TR>
<%

for(int t=0;t<checklist.size();t++){
	Map map=(Map)checklist.get(t);
	out.println("<tr><td class=\"tdRight\">"+(String)map.get("STRU_NAME"));
	out.println("<input type='hidden' name='corId' value="+ (String)map.get("STRU_ID") +">");
	out.println("<input type='hidden' name='flag' value="+ (String)map.get("CROPROATION_ID") +">");
	out.println("</td><td class=\"tdRight\">");
	out.println((String)map.get("CROPROATION_NAME"));
	out.println("</td><td class=\"tdRight\">");
	out.println((String)map.get("DESCRIBE"));
	out.println("</td><tr>");
}
%>

</table>
</div>

</bsp:container>
</html:form>

</body>
</html>
<script language="javascript">

function forReturn(){
  document.forms[0].action ="checkuserCmd.cmd?method=checkUserInit";
  document.forms[0].submit();	
}



</script>