<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%
	
	String roleId = (String) request.getParameter("roleId");
	if (roleId == null) {
		roleId = "";
	}
	String moduleId = request.getParameter("moduleIdForUpdate");
	if (moduleId == null) {
		moduleId = "";
	}
%>

<html>
<head>
<title>��Դ�޸ĳɹ�ҳ��</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body topmargin="10px">
<html:form action="">
<widgets:container title="��Ϣ��ʾ">
<widgets:containbutton text="����" onclick="forReturn()"></widgets:containbutton>
   <div>
     <center><font color='red'>��Դ�޸ĳɹ�</font></center>
   </div>
</widgets:container>

</html:form>
</body>
</html>
<script language="javascript">
function forReturn(){
  document.forms[0].action="function.cmd?method=query&moduleId=<%=moduleId%>&roleId=<%=roleId%>";
  document.forms[0].submit();
}
</script>
