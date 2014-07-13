<%@ page language="java" import="java.util.*" pageEncoding="GBk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html;" />
<title>无标题文档</title>
<script language="javascript" src="js/jquery/jquery.js"></script>
<script language="javascript" src="js/sp/BubbleMsg.js"></script>

<script language="javascript">

var bMsg = new BubbleMsg();
function alertWin(title, msg, w, h)
{ 
	//alert(supports_html5_storage());
	bMsg.getInstance("bMsg"," 内容 ",300,200);
	bMsg.show();
} 

function supports_html5_storage() {  
  try {  
    return 'localStorage' in window && window['localStorage'] !== null;  
  } catch (e) {  
    return false;  
  }  
}  
</script>
</head>

<body>
<input type="button" value="点这里" onclick="alertWin('标题','这里是内容',300,200);" />
</body>
</html>
