<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>


<html>
<head>
<title>�쳣��Ϣ����</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body topmargin="10px">
<html:form action="">
<widgets:container title="��Ϣ��ʾ">
<widgets:containbutton text="����" onclick="forReturn()"></widgets:containbutton>
   <div>
     <center><font color='red'>�쳣��Ϣ�Ѿ����·�����Ϣ�����У�����ա�</font></center>
   </div>
</widgets:container>

</html:form>
</body>
</html>
<script language="javascript">
function forReturn(){
  document.forms[0].action="mpmessagehospitalquery_page_init.cmd";
  document.forms[0].submit();
}
</script>
