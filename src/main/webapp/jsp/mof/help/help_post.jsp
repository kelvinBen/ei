<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="java.util.Enumeration"%>
<HTML>
<HEAD><TITLE>Õ®”√∞Ô÷˙</TITLE>
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

%>


<form  method="post"  action="<%=request.getContextPath()%>/<%=cmd+'?'+para%>">
		  <div id="helpLongString">
		  </div>
</form>

</body>
<script> 
	  document.getElementById("helpLongString").innerHTML = window.dialogArguments.document.getElementById("helpLongString").innerText;
 	  document.forms[0].submit();
</script>
</HTML>