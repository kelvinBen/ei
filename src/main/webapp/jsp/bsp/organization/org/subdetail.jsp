<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<html:form action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="组织结构明细" >
<div align="center">
  <jsp:include page="base_detail_info.jsp" flush="true"/>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
  <script language="javascript">
function forInsert(){
  document.forms[0].action ="stru.cmd?method=forinsert&primaryKey="+document.all("struId").value;  
  document.forms[0].submit();	
}

function forSelect(){
 var url ="stru.cmd?method=getAddMemberRoot&primaryKey="+document.all("struId").value;       
 var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  window.location.href =win[0];
 }
}

function forMergeTo(){
 var url ="stru.cmd?method=getMergeRoot&primaryKey="+document.all("struId").value;       
 var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  window.location.href =win[0];
 }
}

function forUpdate(){
  document.forms[0].action ="stru.cmd?method=forupdate&primaryKey="+document.all("struId").value;    
  document.forms[0].submit();	
}

function forDelete(){
if (!confirm("真的要删除选中的记录吗？此操作不能恢复！")) {
 return flase;
 }  
  document.forms[0].action ="stru.cmd?method=delete&primaryKey="+document.all("struId").value;    
  document.forms[0].submit();	
}
function forOrder(){
var url ="stru.cmd?method=getChangeOrderRoot&primaryKey="+document.all("struId").value;          
 var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  window.location.href =win[0];
 }
}
</script>