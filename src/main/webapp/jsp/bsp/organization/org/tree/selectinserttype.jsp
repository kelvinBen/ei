<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%
    String primaryKey=(String)request.getAttribute("primaryKey");	
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</SCRIPT>
</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<html:form action="">
<widgets:container title="请选择需要增加的下级类型" >
<table width="100%" height="100%">
    
       <tr>
        <td align="right">类型:</td>
        <td align="left"><html:select name="organType" property="organType" >
        	<html:options collection="organTypeList" labelProperty="targetName" property="targetRef"/>
    		</html:select><FONT COLOR=#ff0000>*</FONT></td>
      </tr> 
      <input type="hidden" name="primaryKey" value="<%=primaryKey%>">
        
    <tr>    
    <td colspan="2" align="center">
   <html:button name="btn.add" value="确定" onclick="showcheckdata()"></html:button>
   <html:button name="btn.del" value="关闭" onclick="forCancel()"></html:button>
 
    </td>
    </tr>
    </table>
</widgets:container>
</html:form>
</BODY>
<SCRIPT LANGUAGE="JavaScript">

function showcheckdata(){
	var key=document.all("organType").value;
	if(key==""){
	alert("请选择需要增加的下级类型.");
	return  ;
	}
	var returnV=new Array(1);
	 returnV[0]="stru.cmd?method=forInsertProxy&primaryKey="+document.all("primaryKey").value+"&organType="+document.all("organType").value;
    window.returnValue=returnV;
    parent.close();
}
function forCancel(){
	parent.close();
}
</SCRIPT>
</html>