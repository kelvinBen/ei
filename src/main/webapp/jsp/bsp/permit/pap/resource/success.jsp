<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>


<html>
<head>
<title>���ݵ���ҳ��</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<%
   String refreshId = (String) request.getAttribute("refreshId");
%>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body topmargin="10px">
<html:form action="">

<widgets:container title="��Ϣ��ʾ">
<widgets:containbutton text="����" onclick="forReturn()"></widgets:containbutton>
   <div>
     <center><font color='red'>������ԴXML�ļ�����ɹ���</font></center>
   </div>
</widgets:container>

</html:form>
</body>
</html>
<script language="javascript">
function init(){
  var refreshId = "<%=refreshId%>"; 
  getTreeFrame().seltree.refreshNodeById(refreshId);
}
init();

function forReturn(){
  document.forms[0].action="expAndImp.cmd?method=forImport";
  document.forms[0].submit();
}

</script>
