<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="java.util.Enumeration"%>
<HTML>
<HEAD><TITLE>อจำรักิ๑</TITLE> 
</HEAD>
<body>
<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor=white>
  <tr>    
  </tr>  
</table>

<%
Enumeration pname = request.getParameterNames();
 String para = "";
 String cmd = "";
 while(pname.hasMoreElements()){
  String temp = (String)pname.nextElement();
  if(!temp.equals("url")){
   if(para.equals("")){
    para = temp + "=";
   }
   else{
    para = para + "&" + temp + "=";
   }
   para += request.getParameter(temp);
  }
  else
      cmd = request.getParameter(temp);
 }
%>

<iframe style="width:100%;height:expression(document.body.clientHeight);"  FRAMEBORDER=0 SCROLLING=yes  src="<%=request.getContextPath()%>/<%=cmd+'?'+para%>"></IFRAME>
</body>
</HTML>