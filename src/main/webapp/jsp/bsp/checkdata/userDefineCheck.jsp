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

//�����б�
//List checklist=new ArrayList();
List checklist=(List)request.getAttribute("checklist");
/*
//�ж���Ҫ�����б�
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
	throw new RuntimeException("�Ƿ�����ҳ�棡�밴����;������ҳ�棡");

%>
<html>
<head>
<title>��������ļ��</title>
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
<bsp:container title="��������ļ��" >

<html:hidden name="table" value="<%=table%>" />
<html:hidden name="idName" value="<%=idName%>" />
<html:hidden name="foreignTable" value="<%=foreignTable%>" />
<html:hidden name="foreignKeyName" value="<%=foreignKeyName%>" />

<bsp:containbutton text="ɾ����������" action="checkDataCmd.cmd?method=userDefineClear" onclick="forClear()" ></bsp:containbutton>
<bsp:containbutton text="����" onclick="javascript:window.history.go(-1)"></bsp:containbutton>

<div align="center" >

		<TABLE align="CENTER" cellpadding="1" border=1 class="tdCss" style="border:1 solid #000000" width="100%" >
		<TR align="CENTER" >
			<Td width="25%" style="font-size:20"><b>�����</b></Td>
			<Td width="75%"  style="font-size:20"><b>��������</b></Td>

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
   if (!confirm("����������ָܻ��������������ǰ���ñ��ݣ���Ϊ��Щ���������������������Ҫ�����ݣ�")) {
   	     return false;
   	     }  

  document.forms[0].action ="checkDataCmd.cmd?method=userDefineClear";
  document.forms[0].submit();	
}



</script>