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

//检查的列表
List checklist=(List)request.getAttribute("clearlist");
//判断需要检查的列表
/*
if(("checkOrgenaztion").equals(checkMethod))
	checklist=checkData.clearOrgenaztion();
else if(("checkUser").equals(checkMethod))
	checklist=checkData.clearUser();
else if(("checkRole").equals(checkMethod))
	checklist=checkData.clearRole();
else if(("checkResources").equals(checkMethod))
	checklist=checkData.clearResources();

if(checklist==null)
	throw new RuntimeException("非法访问页面！请按正常途径访问页面！");
*/
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

for(int t=0;t<checklist.size();t++){
	WasteData outdata=(WasteData)checklist.get(t);
	out.println("<tr><td class=\"tdTitle\">"+outdata);
	out.println("</td><tr>");
%>
					<tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>
<%
}

%>
				

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