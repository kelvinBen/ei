<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>


<html>
<head>
<title>组织同步成功页面</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body topmargin="10px">
<html:form action="">
<widgets:container title="信息提示">
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
   <div>
     <center><font color='red'>组织同步成功，请放心使用！</font></center>
   </div>
</widgets:container>

</html:form>
</body>
</html>
<script language="javascript">
function forReturn(){
  document.forms[0].action="adStruSyn.cmd?method=foradSynchronization";
  document.forms[0].submit();
}
</script>
