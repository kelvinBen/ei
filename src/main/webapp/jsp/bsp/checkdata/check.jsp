<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.util.database.*"%>
<% 

//CheckData checkData=(CheckData)ComponentFactory.getBean("checkDataUtil");
String checkMethod=request.getParameter("checkMethod");

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


if(checklist==null)
	throw new RuntimeException("�Ƿ�����ҳ�棡�밴����;������ҳ�棡");
/**/
%>
<html>
<head>
<title>�������ݼ��</title>
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
<bsp:container title="�������ݼ��" >

<html:hidden name="checkMethod" value="<%=checkMethod%>" />

<bsp:containbutton text="ɾ����������" action="checkDataCmd.cmd?method=clear" onclick="forClear()" ></bsp:containbutton>
<bsp:containbutton text="����" onclick="javascript:window.history.go(-1)"></bsp:containbutton>

<div align="center" >

		<TABLE align="CENTER" cellpadding="1" border=1 class="tdCss" style="border:1 solid #000000" width="100%" >
		<TR align="CENTER" >
			<Td width="25%" style="font-size:20"><b>�����</b></Td>
			<Td width="75%"  style="font-size:20"><b>��������</b></Td>

		</TR>
<%

for(int t=0;t<checklist.size();t++){
	List outlist=(List)checklist.get(t);
out.println("<tr><td class=\"tdRight\">"+outlist.get(0));
if(outlist.size()>1){
	
	out.println("</td><td class=\"tdRight\"><ul>");
	for(int i=0;i<outlist.size();i++) {
		WasteData temp=(WasteData)outlist.get(i);	
		out.println("<LI>"+temp.getWastedata());
	}
	out.println("</ul></td>");
}
else
	out.println("<td class=\"tdTitle\"><BR></td>");
	out.println("</tr>");

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
   if (!confirm("����������ָܻ��������������ǰ���ñ��ݣ���Ϊ��Щ���������������������Ҫ�����ݣ�")) {
   	     return false;
   	     }  

  document.forms[0].action ="checkDataCmd.cmd?method=clear";
  document.forms[0].submit();	
}



</script>