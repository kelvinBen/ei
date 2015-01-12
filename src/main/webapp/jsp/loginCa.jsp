<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import ="net.mast.bsp.util.*"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.security.*"%>
<%@ page import ="java.security.cert.*"%>
<%
//1����ȡ�����
//2����ȡ������Կ���ļ�
//3����ȡ˽Կ
//4����˽Կ�����������ǩ��
//5����ȡ֤��
//6����ֵ��Html�ж�Ӧ�ı�   
//7���ύ��
    String data = (String)session.getAttribute("data");
	String j_auth_action=request.getContextPath()+"/j_bsp_security_check/ca";
    String s_sig = null;
    String s_cert = null;  
    try{
    FileInputStream fileIn = new FileInputStream("c:\\ca\\hq.jks");
        KeyStore keyStore = KeyStore.getInstance("JKS");
        char[] password = {'1'};
        keyStore.load(fileIn,password);
        PrivateKey priKey = (PrivateKey)keyStore.getKey("hq",password);
        X509Certificate cert = (X509Certificate)keyStore.getCertificate("hq");             
        Signature  signature = Signature.getInstance("SHA1withRSA");
        signature.initSign(priKey);
        signature.update(data.getBytes());
        byte[] sig = signature.sign();
        s_sig = new String(Base64.encode(sig));
        byte[] cer = cert.getEncoded();
        s_cert = new String(Base64.encode(cer));    
    }catch(Exception e){
      e.printStackTrace();
    }    
%>
<html>
<head>
</head>
<body>
	<form   action="<%=j_auth_action%>" method="post" isSubmit="true">
		<input  type="hidden" name="signature" value="<%=s_sig%>">
		<input  type="hidden" name="cert" value="<%=s_cert%>">
	</form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
function submit(){
	document.forms[0].action ="<%=j_auth_action%>";
    document.forms[0].submit();	
}
submit();
</SCRIPT>


