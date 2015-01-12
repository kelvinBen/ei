<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>


<html>
<head>
<title>数据导入页面</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<%
   String refreshId = (String) request.getAttribute("refreshId");
%>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body topmargin="10px">
<html:form action="">

<widgets:container title="信息提示">
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
   <div>
     <center><font color='red'>功能资源XML文件导入成功！</font></center>
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
