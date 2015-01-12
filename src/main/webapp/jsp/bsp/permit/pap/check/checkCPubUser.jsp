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
List checklist=(List)request.getAttribute("checkresultlist");
%>
<html>
<head>
<title>数据冗余的检查</title>
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
<bsp:container title="数据冗余的检查" >

<bsp:containbutton text="修复公司公用帐号" action="checkuserCmd.cmd?method=repair" onclick="forClear()" ></bsp:containbutton>
<bsp:containbutton text="返回" onclick="javascript:window.history.go(-1)"></bsp:containbutton>
<html:messages></html:messages>
<div align="center" >

		<TABLE align="CENTER" cellpadding="1" border=1 class="tdCss" style="border:1 solid #000000" width="100%" >
		<TR align="CENTER" >
			<Td width="30%" style="font-size:20"><b>公司</b></Td>
			<Td width="30%"  style="font-size:20"><b>公用帐号</b></Td>
			<Td width="40%"  style="font-size:20"><b>检查结果</b></Td>
		</TR>
<%

for(int t=0;t<checklist.size();t++){
	Map map=(Map)checklist.get(t);
	out.println("<tr><td class=\"tdRight\">"+(String)map.get("CORPORATION_NAME"));
	out.println("<input type='hidden' name='corId' value="+ (String)map.get("CORPORATION_ID") +">");
	out.println("<input type='hidden' name='flag' value="+ (Integer)map.get("FLAG") +">");
	out.println("</td><td class=\"tdRight\">");
	out.println((String)map.get("CPUB_USERS"));
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

function forClear(){
   if (!confirm("您确定要执行修复操作吗？")) {
   	     return false;
   	     }  
  document.forms[0].action ="checkuserCmd.cmd?method=repair";
  document.forms[0].submit();	
}



</script>