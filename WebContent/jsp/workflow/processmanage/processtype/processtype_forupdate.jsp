<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
function selectNewDeptIdTree(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>&showOrganType=1,2";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("organize").value="";
	  document.all("organizeName").value="";
  }else{
	  document.all("organize").value=win[0];
	  document.all("organizeName").value=win[1];
  }
  checkinputNullInDcWork ('organize','organize_span');
}
function checkProcessType()
{
	var name = document.forms[0].name;
	if (trim(name.value)=="")
	{
		alert('"��������"����Ϊ��');
	    name.focus();
		return false;
	}
	name.value = trim(name.value) ;
	var organize = document.forms[0].organize;
	if (trim(organize.value)=="")
	{
		alert('"��֯����"����Ϊ�գ�');
		return false;
	}
	organize.value = trim(organize.value) ;

	var order = document.forms[0].order;
	if ( trim(order.value)!="" && ! isInteger(order) )
	{
		alert('"��ʾ˳��"ӦΪ������');
		order.focus();
		return false;
	}
	return true;
}
</script>
</head>
<%
	    String typeName = (String)request.getAttribute("typeName");
%>
<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="btnSave" value="����" onclick="forSave()"></html:button>&nbsp;<html:button name="btnReturn" value="����" onclick="forReturn()"></html:button>
</div>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" cellspacing="0" class="tblContent">                                         
	<html:hidden name="processtype" property="processtype"/>
		<tr>
			<td class="TdLeft">�������ƣ�</td>
			<td class="TdRight"><html:text name="name" property="name" size="30" maxlength="30" onchange="checkinputNullInDcWork ('name','name_span')"/><span id="name_span" class="xinghaoCss">*</span></td>
		</tr>
		<tr>
			<td class="tdLeft">��֯������</td>
			<td class="TdRight"><html:hidden name="organize" property="organize"/><html:text name="organizeName" property="organizeName" size="30" maxlength="30" readonly="true"/><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selectNewDeptIdTree()"><span id="organize_span" class="xinghaoCss">*</span></td>
		</tr> 
		<tr>
			<td class="TdLeft">����������</td>
			<td class="TdRight"><html:text name="description" property="description" size="50" maxlength="50"/></td>
		</tr> 				                  
		<tr>
			<td class="TdLeft">��ʾ˳��</td>
			<td class="TdRight"><html:text name="order" property="order" size="20" maxlength="8"/></td>
		</tr> 				                  
	</table>
</fieldset>
	<input type="hidden" name="oldTypeName"  value="<%=typeName%>">
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("�������̣����̹����޸���������");
function forSave(){
  if(!checkProcessType()) return;	
  document.forms[0].action ="processtype.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="processtypequery.cmd?clear=true";
  document.forms[0].submit();	
}
</script>