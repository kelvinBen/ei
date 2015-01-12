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

		String table = request.getParameter("table");
		String idName = request.getParameter("idName");
		String foreignTable = request.getParameter("foreignTable");
		String foreignKeyName = request.getParameter("foreignKeyName"); 

//检查的列表
//List checklist=new ArrayList();
List checklist=(List)request.getAttribute("checklist");
/*
//判断需要检查的列表
if(("checkOrgenaztion").equals(checkMethod))
	checklist=checkData.checkOrgenaztion();
else if(("checkUser").equals(checkMethod))
	checklist=checkData.checkUser();
else if(("checkRole").equals(checkMethod))
	checklist=checkData.checkRole();
else if(("checkResources").equals(checkMethod))
	checklist=checkData.checkResources();
*/

if(checklist==null)
	throw new RuntimeException("非法访问页面！请按正常途径访问页面！");

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

<html:hidden name="table" value="<%=table%>" />
<html:hidden name="idName" value="<%=idName%>" />
<html:hidden name="foreignTable" value="<%=foreignTable%>" />
<html:hidden name="foreignKeyName" value="<%=foreignKeyName%>" />

<bsp:containbutton text="删除垃圾数据" action="checkDataCmd.cmd?method=userDefineClear" onclick="forClear()" ></bsp:containbutton>
<bsp:containbutton text="返回" onclick="javascript:window.history.go(-1)"></bsp:containbutton>

<div align="center" >

		<TABLE align="CENTER" cellpadding="1" border=1 class="tdCss" style="border:1 solid #000000" width="100%" >
		<TR align="CENTER" >
			<Td width="25%" style="font-size:20"><b>检查结果</b></Td>
			<Td width="75%"  style="font-size:20"><b>垃圾数据</b></Td>

		</TR>
<%

	WasteData outdata=(WasteData)checklist.get(0);
	out.println("<tr><td class=\"tdRight\">"+outdata);

if(checklist.size()>1){

	out.println("</td><td class=\"tdRight\"><ul>");
	for(int i=0;i<checklist.size();i++) {
		WasteData temp=(WasteData)checklist.get(i);	
		out.println("<LI>"+temp.getWastedata());
	}
	out.println("</ul></td>");
}
else
	out.println("</td><td class=\"tdTitle\"><BR></td>");
	out.println("</tr>");


%>


</tr>
</table>
</div>

</bsp:container>
</html:form>

</body>
</html>
<script language="javascript">

function forClear(){
   if (!confirm("清除操作不能恢复，请在清除数据前做好备份，因为这些垃圾数据里面可能有您需要的数据！")) {
   	     return false;
   	     }  

  document.forms[0].action ="checkDataCmd.cmd?method=userDefineClear";
  document.forms[0].submit();	
}



</script>