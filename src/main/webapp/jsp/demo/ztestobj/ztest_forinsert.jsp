<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@include file="common/javacode.jsp"%>
<HTML>
<HEAD>
<TITLE>�����д���</TITLE>

<%@include file="common/js.htm"%>

</HEAD>
<body topmargin="10px">
	<bsp:container title="�����д���">



		<!--����İ�Ŧ�����ֹ����;�����Ŧ��ҵ���е�ĳ�ֶε�ֵ�й�[���ݸ�ֵ���Ƿ���ʾ�ð�Ŧ];����dhbsp:dhbspbutton��ǩ-->

		<bsp:containbutton action="" text="����" onclick="forSave()"></bsp:containbutton>
		<bsp:containbutton action="URL" text="���沢����"
			onclick="forSaveContinue()"></bsp:containbutton>
		<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
		<bsp:containbutton action="URL" text="����" onclick="forReturn()"></bsp:containbutton>




		<%@include file="common/body.jsp"%>

	</bsp:container>
</BODY>
</HTML>
<!-- �ڴ�����Զ���JS�����͵�ǰҳ���в����İ�Ŧ��������JS���� [Ҳ���Խ���JS����η���Ϊ�Լ���JS�ļ����ڸ�ҳ������]-->
<script language="javascript"> 

var baseUrl = "ztest.cmd";


function init(){

}
function getSaveFromData(){ 
	 var idcode = document.forms[0].salseid.value;
	 return new Array(idcode);
}
function forSaveContinue(){
  if(!is_NonullPro_Vilidate()){return;}
  savehistoryfieldval();
  document.forms[0].action =baseUrl+"?method=insertContinue";
  document.forms[0].submit();	 
}
function forReturn(){
  document.forms[0].action ="URL";
  document.forms[0].submit();	
}

function forSave(){
   document.forms[0].action =baseUrl+"?method=insert";
   document.forms[0].submit();
} 

 
</script>
<script type="text/javascript" src="js/sp/overrideFunctions.js"></script>
<script type="text/javascript" src="jsp/oa/ztestobj/ztest.js"></script>



