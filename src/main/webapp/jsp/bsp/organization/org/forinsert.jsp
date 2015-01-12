
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript">
function checkOrg(){
    if (checkBase() )
    {
    
    }else{
    	return false;
    }
  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form action="">
<bsp:container title="组织结构增加" >
<bsp:containbutton text="保存" onclick="forSave()" action="stru.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="保存并继续" onclick="forSaveContinue()" action="stru.cmd?method=insertContinue"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="javascript:window.history.go(-1)" action="stru.cmd?method=detail"></bsp:containbutton>
<div align="center">
<jsp:include page="base_insert_info.jsp" flush="true"/>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkOrg()) return;
  document.forms[0].action ="stru.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkOrg()) return;
  document.forms[0].action ="stru.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  var id = document.forms[0].struId.value;
  document.forms[0].action ="stru.cmd?method=detail&primaryKey=" +id;
  document.forms[0].submit();		
}
function forReset(){  
  document.forms[0].reset();	
}
</script>