<%@ page contentType="text/html;charset=GBK" %>
<% 
String j_auth_action=request.getContextPath()+"/j_bsp_security_check";
%>
<HTML>
	<HEAD>
		<TITLE>ad登录</TITLE>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
	</HEAD>
	<BODY>
		<OBJECT id="AgentApp"  classid="CLSID:C4353596-C621-4A51-B8FA-BD1A328F9B12" codebase="AdLogon.CAB">
		</OBJECT>
         <form action="" method="post">
	<input type="hidden" name="j_username" value="">
	<input type="hidden" name="domain" value="">
	</form>
	</BODY>
	
</HTML>

<script language="javascript">
  function init(){
     var username = AgentApp.UserName;
     
     var dnsDomain = AgentApp.ComputerDNSDomain;
     var arr ;
     var domain;
     if(dnsDomain!=""){
         arr = dnsDomain.split("\\");
         domain = arr[0];
     }
     document.all("j_username").value= username;
     document.all("domain").value= domain;
     document.forms[0].action = "<%=j_auth_action%>";
     document.forms[0].submit();
     
  }
  init();
</script>