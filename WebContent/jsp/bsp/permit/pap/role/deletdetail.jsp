<%@ page contentType="text/html;charset=GBK" %>
<%
// ��ҳ���ڶ���ط���ʹ�ã����Ҫ�Ա�ҳ���޸ģ���ע�⣡
//ʹ�ñ�ҳ��ĵط����У���ɫ�б�-ɾ�����û��б�-ɾ��������ģ���б�-ɾ����ǰģ��/ɾ�����ܡ�
//��ɫģ��-ɾ������������-ɾ����
String flag = (String)request.getAttribute("FLAG");
if(flag == null){
	flag = "OK";
}
out.println(flag);
%>