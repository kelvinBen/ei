<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>�����޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMofWindow(){
	var name = document.forms[0].name;
	if (trim(name.value)=="")
	{
	alert("���������ƣ�");    
	return false;
	}
	name.value = trim(name.value) ;
	var description = document.forms[0].description;
	if (trim(description.value)=="")
	{
	alert("������������");    
	return false;
	}
	description.value = trim(description.value) ;
	var isactive = document.forms[0].isactive;
	if ((isactive[0].checked==false)&&(isactive[1].checked==false))
	{
	alert("�������Ƿ���");    
	return false;
	}
	isactive.value = trim(isactive.value) ;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="�����޸�" >
<widgets:containbutton onclick="tabQuery()" text="Tabά��"></widgets:containbutton>
<widgets:containbutton text="����" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="�ָ�" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="����" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	<html:hidden name="mofWindowId" property="mofWindowId"/>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.NAME")%>��</td>
	<td class="tdRight"><html:text name="name" property="name" size="40" maxlength="40" /><font color="#FF0000">*(������Ӣ������)</font></td>
	</tr>                    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.DESCRIPTION")%>��</td>
	<td class="tdRight"><html:textarea name="description" property="description" cols="80" rows="2"/></td>
	</tr>                    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.ISACTIVE")%>��</td>
	<td class="tdRight">
	<html:radio name="isactive" property="isactive" value="0">��</html:radio>
	<html:radio name="isactive" property="isactive" value="1">��</html:radio>
	</td>
	</tr>  
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.FILTER")%>��</td>
	<td class="tdRight"><html:textarea name="filter" property="filter" cols="80" rows="6"/></td>
	</tr> 
  </table>
</div>
</widgets:container>
<html:hidden name="categoryId" property="categoryId"/>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function tabQuery(){
  forReset();
  window.location.href ="moftabquery.cmd?mofWindowId="+document.forms[0].mofWindowId.value+"&mofWindowName=" + document.forms[0].name.value;
}
function forSave(){
  if(!checkMofWindow()) return;	
  document.forms[0].action ="mofwindow.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofwindowquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>