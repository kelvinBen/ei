<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>	
<%@include file="common/javacode.jsp"%>
<HTML>
<HEAD>
<TITLE>��������ϸ</TITLE> 
<%@include file="common/js.htm"%>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="��������ϸ">	
 <!--����İ�Ŧ�����ֹ����;�����Ŧ��ҵ���е�ĳ�ֶε�ֵ�й�[���ݸ�ֵ���Ƿ���ʾ�ð�Ŧ];����dhbsp:dhbspbutton��ǩ--> 
 <bsp:containbutton text="��ӡ" onclick="forPrint()" action="URL"></bsp:containbutton>
 <bsp:containbutton text="����" onclick="forReturn()"></bsp:containbutton> 
 					<%@include file="detail/body.jsp"%>
</bsp:container> 
</BODY>
<!-- �ڴ�����Զ���JS�����͵�ǰҳ���в����İ�Ŧ��������JS���� [Ҳ���Խ���JS����η���Ϊ�Լ���JS�ļ����ڸ�ҳ������]-->
<script language="javascript"> 


var baseUrl = "ztest.cmd";
function forReturn(){
	document.forms[0].action ="ztestquery_page_init.cmd?return=true";
  	document.forms[0].submit();
}
function forUpdate(){ 
    document.forms[0].action ="ztest.cmd?method=forupdate";
    document.forms[0].submit();	 
}
function forPrint(){
	document.forms[0].action ="URL";
    document.forms[0].submit();
} 
</script>