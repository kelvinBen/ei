<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%
	String title=(String)request.getParameter("title");
	if(title==null)
	{
		title="请输入信息";
	}
	String promptName=(String)request.getParameter("promptName");
	if(promptName==null)
	{
		promptName="";
	}
%>
<HTML>
<HEAD>
<TITLE><%=title%></TITLE>

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">

<fieldset class="FieldsetCss"><legend><%=title%></legend>
  <table width="100%" cellpadding="0" cellspacing="0" class="tblContent">  
                                 
                     <tr>
                    <td class="tdRight"><html:text  name="promptName" value="<%=promptName%>" size="60" maxlength="60" />
                    </td>
                    </tr>                    
   </table>
</fieldset>
<div align=center>
<table width=150>
<tr></tr>
<tr></tr>
<tr></tr>
    <tr><td><p align="center">
	<button name="alldata" onclick="forSave()" class="advbutton">确定</button>
	<button name="alldata" onclick="forCancel()" class="advbutton">取消</button>
	</p>
   </td></tr>
</table>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){	 
  var promptName=document.forms[0].promptName;
	promptName.value=trim(promptName.value);
  if(promptName.value=="")
	{
	  alert("请输入信息！");
	  return false;
  }
  window.returnValue=promptName.value;
  parent.close();
}
function forCancel(){
 parent.close();
}
</script>