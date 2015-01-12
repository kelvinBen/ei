<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="java.util.Enumeration"%>
<HTML>
<HEAD><TITLE>通用帮助</TITLE>
</HEAD>
<body  topmargin="0" leftmargin="0" >
<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor=white>
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
 //传递的参数长度过大时，转入help_post.jsp页，用post方式进行提交
  String frameSrc = request.getContextPath()+ "/" + cmd + "?" + para ;
  if(request.getParameter("helpLongString")!=null && !request.getParameter("helpLongString").equals(""))
	   frameSrc = request.getContextPath() +"/jsp/mof/help/help_post.jsp?url=" + cmd + "&" + para ;
  frameSrc=frameSrc.replaceAll("#","%23");
 // out.print(frameSrc);
//  String ul= request.getQueryString();
 // out.print("<br>"+ul);
%>
 
<!--  -->
<iframe style="width:100%;height:expression(document.body.clientHeight);"  FRAMEBORDER=0 SCROLLING=auto  src="<%=frameSrc%>"></IFRAME>

</body>
</HTML>