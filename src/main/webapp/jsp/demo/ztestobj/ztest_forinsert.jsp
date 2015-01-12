<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@include file="common/javacode.jsp"%>
<HTML>
<HEAD>
<TITLE>测试行创建</TITLE>

<%@include file="common/js.htm"%>

</HEAD>
<body topmargin="10px">
	<bsp:container title="测试行创建">



		<!--下面的按纽可以手工添加;如果按纽跟业务中的某字段的值有关[根据该值来是否显示该按纽];采用dhbsp:dhbspbutton标签-->

		<bsp:containbutton action="" text="保存" onclick="forSave()"></bsp:containbutton>
		<bsp:containbutton action="URL" text="保存并继续"
			onclick="forSaveContinue()"></bsp:containbutton>
		<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
		<bsp:containbutton action="URL" text="返回" onclick="forReturn()"></bsp:containbutton>




		<%@include file="common/body.jsp"%>

	</bsp:container>
</BODY>
</HTML>
<!-- 在此添加自定义JS方法和当前页面中操作的按纽所触发的JS方法 [也可以将该JS代码段封张为自己的JS文件；在该页面引入]-->
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



