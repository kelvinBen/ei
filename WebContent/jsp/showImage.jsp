<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.io.*"%>

<%	 
 	try{   
	    out.clearBuffer();      
        response.setContentType("image/jpg");       
        byte[] photo=(byte[])session.getAttribute("imgByte");//Ϊ�����ݿ���ȡ����ͼƬ���ֽ�����       
        ByteArrayOutputStream imageStream = new ByteArrayOutputStream();           
        if(photo!=null){ 
             imageStream.write(photo);           
        }       
        OutputStream streamOut=response.getOutputStream();       
        imageStream.writeTo(streamOut);       
        streamOut.close();
		session.removeAttribute("imgByte");
	}
	catch(Exception e){
		System.out.println(e.toString());
	}	
%>
