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


//CheckData checkData=(CheckData)ComponentFactory.getBean("checkDataUtil");

WasteData outdata =(WasteData)request.getAttribute("wasteData");


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
<bsp:container title="数据冗余的清除" >

<bsp:containbutton text="返回" onclick="forReturn()"></bsp:containbutton>

<div align="center" >

		<TABLE align="CENTER" cellpadding="1" border=1 class="tdCss" style="border:1 solid #000000" width="100%" >
		<TR align="CENTER" >
			<Td width="100%" style="font-size:20"><b>清除检查结果</b></Td>
			
		</TR>
<%

	out.println("<tr><td class=\"tdTitle\">"+outdata);
	out.println("</td><tr>");
%>
					<tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>

				

</table>
</div>

</bsp:container>
</html:form>

</body>

<script language="javascript">

function forReturn(){
	
  document.forms[0].action ="checkDataCmd.cmd?method=main";     
  document.forms[0].submit();
}


</script>