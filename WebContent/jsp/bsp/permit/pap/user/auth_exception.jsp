<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.bsp.permit.pep.ui.AbstractProcessingFilter" %>
<%@ page import="net.mast.bsp.permit.exception.AuthenticationException" %>
<%

	Throwable r=     (Throwable) session.getAttribute(AbstractProcessingFilter.BSP_SECURITY_LAST_EXCEPTION_KEY);
	String msg=r.getMessage();
	for(int i=0;i<r.getStackTrace().length;i++){
		msg=msg+"<br>"+r.getStackTrace()[i];
	}

%>
<script language="javascript">
function showMessage(){
	var message = document.getElementById("MESSAGE");
	if(message.style.display == "block")
		message.style.display = "none";
	else
		message.style.display = "block";
}

</script>
<html>
<head>
<title></title>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0">
<form>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
  <tr>
    <td width="100%" height="12">    
    </td>
  </tr>
  <tr>
    <td width="100%" height="12" bgcolor="#E8E8E8"><font size="1" color="#E8E8E8">1</font></td>
  </tr>
  <tr>
    <td width="100%" height="12">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3">
      <tr>
        <td width="5%">　</td>
        <td width="33%">　</td>
        <td width="5%">　</td>
      </tr>
      <tr>
        <td width="5%">　</td>
        <td width="33%">
        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber4">
          <tr>
            <td width="100%" bgcolor="#B3D7F5">
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber5">
              <tr>
                <td width="100%">　</td>
              </tr>
              <tr>
              <td width="100%">
              <div id="sqld" style="display:block">
              </div>
              </tr>                 
              <tr>
              <td width="100%">
              <div id="dd" style="display:block">
              <%
 
		out.print("<br>系统在处理用户认证过程中出现非预期错误，错误日志摘要："+r.getMessage());
	 %>
              
              </div>
              </tr>
           
              <tr>
                <td width="100%">
                <p align="right"><a href="javascript:showMessage();">详细内容</a></td>
              </tr>
              <tr>
              <td width="100%">
              <div id="MESSAGE" style="display:none;overflow:auto;height:150px">
               <%  
			out.print("<br>"+msg);
	 %>             
              </div>
              </tr>
            </table>
            </td>
          </tr>
          <tr>
            <td width="100%" bgcolor="#EBEBEB">　</td>
          </tr>
        </table>
        </td>
        <td width="5%">　</td>
      </tr>
      <tr>
        <td width="5%">　</td>
        <td width="33%">　</td>
        <td width="5%">　</td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="100%">
</td>
  </tr>
  <tr>
    <td width="100%">
                <p align="center">                 
                  <button name="B1" onclick="javascript:window.history.go(-1)">返回</button>
                </td>
  </tr>
</table>
<script language="javascript">
if(window.history.length==0){
	document.all("B1").innerText="关闭";
	document.all("B1").onclick=winclose;
}else{	
}
function winclose(){
	parent.close();
}

</script>
</body>
</form>
</html>


