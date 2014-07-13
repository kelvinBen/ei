<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
	String rootId=(String)request.getAttribute("rootStruId");
	String organId = (String)request.getAttribute("rootOrganId");
	String organName =(String)request.getAttribute("rootOrganName");
%>
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
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=<%=rootId%>&showOrganType=1,2";      
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
		alert('"类型名称"不能为空！');
	    name.focus();
		return false;
	}
	name.value = trim(name.value) ;
	var organize = document.forms[0].organize;
	if (trim(organize.value)=="")
	{
		alert('"组织机构"不能为空！');
		return false;
	}
	organize.value = trim(organize.value) ;
	var order = document.forms[0].order;
	if ( trim(order.value)!="" && ! isInteger(order) )
	{
		alert('"显示顺序"应为整数！');
		order.focus();
		return false;
	}

	var physicalname = document.forms[0].physicalname;
	var res = /^[A-Za-z0-9]+$/;
	if ( trim(physicalname.value)!="" && ! res.test(physicalname.value) )
	{
		alert('"类型ID"应为英文字母和数字组成！');
		physicalname.focus();
		return false;
	}
	return true;
}
</script>
</head>

<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="btnSave" value="保存"	onclick="forSave()"></html:button>&nbsp;<html:button name="btnReturn" value="返回" onclick="forReturn()"></html:button>
</div>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" cellspacing="0" class="tblContent">                                         
		<tr>
			<td class="TdLeft">类型名称：</td>
			<td class="TdRight"><html:text name="name" property="name" size="30" maxlength="30" onchange="checkinputNullInDcWork ('name','name_span')"/><span id="name_span" class="xinghaoCss">*</span></td>
		</tr>
		<tr>
			<td class="TdLeft">组织机构：</td>
			<td class="TdRight"><html:hidden name="organize" value="<%=organId%>"/><html:text name="organizeName" value="<%=organName%>" size="30" maxlength="30" readonly="true"/><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selectNewDeptIdTree()"><span id="organize_span" class="xinghaoCss">*</span></td>
		</tr>
		<tr>
			<td class="TdLeft">类型描述：</td>
			<td class="TdRight"><html:text name="description" property="description" size="50" maxlength="50"/></td>
		</tr> 				                  
		<tr>
			<td class="TdLeft">显示顺序：</td>
			<td class="TdRight"><html:text name="order" property="order" size="20" maxlength="8"/></td>
		</tr> 
		<tr>
			<td class="TdLeft">类型ID：</td>
			<td class="TdRight"><html:text name="physicalname" property="physicalname" size="20" maxlength="20"/></td>
		</tr> 
	</table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("工作流程－流程管理－增加流程类型");
function forSave(){
  if(!checkProcessType()) return;	
  document.forms[0].action ="processtype.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkProcessType()) return;
  document.forms[0].action ="processtype.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="processtypequery.cmd?clear=true";
  document.forms[0].submit();	
}
</script>