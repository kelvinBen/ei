<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>


<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="增加业务流水号结果页面" >
<bsp:containbutton text="返回" onclick="forReturn()" action ="pubidtablequery.cmd"></bsp:containbutton>
<html:messages/>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
  
  function forReturn(){
      document.forms[0].action ="pubidtablequery.cmd";
      document.forms[0].submit();	
  }
</script>