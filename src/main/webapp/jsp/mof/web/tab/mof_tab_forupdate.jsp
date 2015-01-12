<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
    String mofWindowId = request.getParameter("mofWindowId");
	if (mofWindowId==null){
	  mofWindowId="";
	}
   String mofWindowName = request.getParameter("mofWindowName");
	if (mofWindowName==null){
	  mofWindowName="";
	}
%>
<HTML>
<HEAD>
<TITLE>Tab修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMofTab(){	
	var name = document.forms[0].name;
	if (trim(name.value)=="")
	{
	alert("请输入名称！");    
	return false;
	}
	name.value = trim(name.value) ;
	var description = document.forms[0].description;
	if (trim(description.value)=="")
	{
	alert("请输入描述！");    
	return false;
	}
	description.value = trim(description.value) ;
	var mofTableId = document.forms[0].mofTableId;
	if (trim(mofTableId.value)=="")
	{
	alert("请输入表内码！");    
	return false;
	}
	mofTableId.value = trim(mofTableId.value) ;
	var seqno = document.forms[0].seqno;
	if (trim(seqno.value)=="")
	{
	alert("请输入序号！");    
	return false;
	}
	seqno.value = trim(seqno.value) ;
	var ismain = document.forms[0].ismain;
	if ((ismain[0].checked==false)&&(ismain[1].checked==false))
	{
	alert("请输入是否主Tab！");    
	return false;
	}
	ismain.value = trim(ismain.value) ;
	var issametab = document.forms[0].issametab;
	if ((issametab[0].checked==false)&&(issametab[1].checked==false))
	{
	alert("请输入是否相同Tab！");    
	return false;
	}
	issametab.value = trim(issametab.value) ;
	var isdetail = document.forms[0].isdetail;
	if ((isdetail[0].checked==false)&&(isdetail[1].checked==false))
	{
	alert("请输入是否明细！");    
	return false;
	}
	isdetail.value = trim(isdetail.value) ;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="Tab修改" >
<widgets:containbutton onclick="fieldQuery()" text="域维护"></widgets:containbutton>
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="恢复" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	<html:hidden name="mofWindowId" property="mofWindowId"/>
	<html:hidden name="mofTabId" property="mofTabId"/>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.MOF_WINDOW_ID")%>：</td>
	<td class="tdRight"><html:hidden name="mofWindowName" value="<%=mofWindowName%>" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.NAME")%>：</td>
	<td class="tdRight"><html:text name="name" property="name" size="40" maxlength="40" /><font color="#FF0000">*(请输入英文名称)</font></td>
	</tr>                    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.DESCRIPTION")%>：</td>
	<td class="tdRight"><html:textarea name="description" property="description" rows="4" cols="80"/></td>
	</tr>                     
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.MOF_TABLE_ID")%>：</td>
	<td class="tdRight">
	<html:select name="mofTableId" property="mofTableId" >
	<html:options collection="MOFTABLE_IDNAME_COLLECTION" labelProperty="NAME" property="MOF_TABLE_ID" />
	</html:select>
	</td>
	</tr>                   
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.SEQNO")%>：</td>
	<td class="tdRight"><html:text name="seqno" property="seqno" size="8" maxlength="8" /></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.INTERCEPTOR")%>：</td>
	<td class="tdRight"><html:text name="interceptor" property="interceptor" size="40" maxlength="255" /></td>
	</tr>       
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.ISSAMETAB")%>：</td>
	<td class="tdRight">
	<html:radio name="issametab" property="issametab" value="0">否</html:radio>
	<html:radio name="issametab" property="issametab" value="1">是</html:radio>
	</td>
	</tr>
	                    
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.ISUPDATE")%>：</td>
	<td class="tdRight">
	<html:radio name="isupdate" property="isupdate" value="0">否</html:radio>
	<html:radio name="isupdate" property="isupdate" value="1">是</html:radio>
	</td>
	</tr>  
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.ISMAIN")%>：</td>
	<td class="tdRight">
	<html:radio name="ismain" property="ismain" value="0">否</html:radio>
	<html:radio name="ismain" property="ismain" value="1">是</html:radio>
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.HASTREE")%>：</td>
	<td class="tdRight">
	<html:radio name="hasTree" property="hasTree" value="0">否</html:radio>
	<html:radio name="hasTree" property="hasTree" value="1">是</html:radio>
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.ISDETAIL")%>：</td>
	<td class="tdRight">
	<html:radio name="isdetail" property="isdetail" value="0">否</html:radio>
	<html:radio name="isdetail" property="isdetail" value="1">是</html:radio>
	</td>
	</tr>
	
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_TAB.BUTTONSTYLE")%>：</td>
	<td class="tdRight">
	  <html:select name="buttonStyle" property="buttonStyle"  >
	  <html:options  collection="ButtonStyle_Collection" labelProperty="value" property="key"  /> 
     </html:select>
	</td>
	</tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function fieldQuery(){
  forReset();
  var link = "moffieldquery.cmd?mofTabId="+document.forms[0].mofTabId.value+"&mofTabName="+document.forms[0].name.value;
  link = link + "&mofWindowId="+document.forms[0].mofWindowId.value+"&mofWindowName=" + document.forms[0].mofWindowName.value
  
  window.location.href = link;
}
function forSave(){
  if(!checkMofTab()) return;	
  document.forms[0].action ="moftab.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="moftabquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>