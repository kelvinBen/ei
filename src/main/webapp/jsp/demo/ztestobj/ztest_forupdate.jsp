<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@include file="common/javacode.jsp"%>
<HTML>
<HEAD>
<TITLE>�������޸�</TITLE>
<%@include file="common/js.htm"%>
</HEAD>
<BODY topmargin="10px">
	<bsp:container title="�������޸�">





		<!--����İ�Ŧ�����ֹ����;�����Ŧ��ҵ���е�ĳ�ֶε�ֵ�й�[���ݸ�ֵ���Ƿ���ʾ�ð�Ŧ];����dhbsp:dhbspbutton��ǩ-->

		<bsp:containbutton action="" text="����" onclick="forSave()" />
		<bsp:containbutton text="�ָ�" onclick="forReset()" />
		<bsp:containbutton action="URL" text="����" onclick="forReturn()" />

		<%@include file="common/body.jsp"%>
	</bsp:container>

</BODY>
</HTML>

<!-- �ڴ�����Զ���JS�����͵�ǰҳ���в����İ�Ŧ��������JS���� [Ҳ���Խ���JS����η���Ϊ�Լ���JS�ļ����ڸ�ҳ������]-->
<script language="javascript">


var baseUrl = "ztest.cmd";
function forSave(){  
  //if(!is_NonullPro_Vilidate()){return;}
  //uniquenessValidate();
  //if(uniqueness_signSubmit=="1"){return;}
 // savehistoryfieldval();
  document.forms[0].action =baseUrl+"?method=update";
  document.forms[0].submit();
}
function forReturn(){
  document.forms[0].action ="ztestquery_page_init.cmd?return=true";
  document.forms[0].submit();	
} 
</script>
<script type="text/javascript" src="js/sp/overrideFunctions.js"></script>
<script type="text/javascript" src="jsp/oa/ztestobj/ztest.js"></script>
