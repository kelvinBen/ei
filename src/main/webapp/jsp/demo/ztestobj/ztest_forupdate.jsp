<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@include file="common/javacode.jsp"%>
<HTML>
<HEAD>
<TITLE>测试行修改</TITLE>
<%@include file="common/js.htm"%>
</HEAD>
<BODY topmargin="10px">
	<bsp:container title="测试行修改">





		<!--下面的按纽可以手工添加;如果按纽跟业务中的某字段的值有关[根据该值来是否显示该按纽];采用dhbsp:dhbspbutton标签-->

		<bsp:containbutton action="" text="保存" onclick="forSave()" />
		<bsp:containbutton text="恢复" onclick="forReset()" />
		<bsp:containbutton action="URL" text="返回" onclick="forReturn()" />

		<%@include file="common/body.jsp"%>
	</bsp:container>

</BODY>
</HTML>

<!-- 在此添加自定义JS方法和当前页面中操作的按纽所触发的JS方法 [也可以将该JS代码段封张为自己的JS文件；在该页面引入]-->
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
