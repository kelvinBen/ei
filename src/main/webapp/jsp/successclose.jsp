<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<html>
<%	
String alertmessage=(String)request.getAttribute("ALERTMESSAGE");
if(alertmessage==null){
	alertmessage="����ɹ���";
}
String isrefesh=(String)request.getAttribute("isrefesh");//�Ƿ�ˢ�¸�ҳ��
%>
<script type="text/javascript">
alert("<%=alertmessage%>");
<%if(!"0".equals(isrefesh)){%>
if(window.opener){
	window.opener.location.reload();
}
<%}%>
window.close();
</script>
<body>

</body>
</html>

