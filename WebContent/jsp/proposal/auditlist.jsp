<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%
 
%>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<HTML>
<HEAD>
<BODY topmargin="10px"  style="font-size: 14px;">
<br/>
<table width=100% border=0 cellspacing="3">
	<tr>
		<td width='35%' align="right"><a
			href="javascript:fordafu()"
			 style="font-size: 14px;color: blue;">已答复提案</a></td>
		<td width='15%' align='left'><a
			 style="font-size: 14px">有<html:value property="yidafu"/>件</a></td>
		<td width='35%' align="right"><a 
			href="javascript:fortuihui()"
			 style="font-size: 14px;color: blue;">退回的提案</a></td>
		<td width='15%' align="left"><a
			 style="font-size: 14px">有<html:value property="tuihui"/>件</a></td>
	</tr>
	<tr>
		<td width='35%' align="right"><a
			href="javascript:forjieshou()" 
			 style="font-size: 14px;color: blue;">待接收提案</a></td>
		<td width='15%' align='left' style="font-size: 14px;">有<html:value property="daijieshou"/>件</td>
		<td width='35%' align="right"><a href="javascript:foraudit()" 
			 style="font-size: 14px;color: blue;">待审查提案</a></td>
		<td width='15%' align='left' style="font-size: 14px;">有<html:value property="daishencha"/>件</td>
	</tr>
	<tr>
<td width='35%' align="right"><a
			href="javascript:mylist()" 
			 style="font-size: 14px;color: blue;">已反馈提案</a></td>
		<td width='15%' align='left' style="font-size: 14px;">有<html:value property="yifankui"/>件</td>

	</tr>
<td width='35%' align="right"><a
			 style="font-size: 14px;color: blue;">共收到提案</a></td>
		<td width='15%' align='left' style="font-size: 14px;">有<html:value property="total"/>件</td>
		<td width='35%' align="right"><a href="javascript:yishenca()" 
			 style="font-size: 14px;color: blue;">其中已审查提案</a></td>
		<td width='15%' align='left' style="font-size: 14px;">有<html:value property="yishencha"/>件</td>

	</tr>
		
</table>
<form action="" method="get">
<table id="tblSearch" style="display: none;">
<flex:search>
	<tr>
    <td><flex:searchText name="STATE" searchName="BILL_BUZI.CASENO" dataType="java.lang.String" operSymbol="=" value="" size="12">
	</flex:searchText></td>
	</tr>
</flex:search>
</table>
<input type="hidden" name="clear" value="true">
<input type="hidden" name="auditType" id="auditType" value="0">

</form>
</BODY>
</HTML>
<script language="javascript">

//查看复文
function mylist(){
	document.forms[0].STATE.value="7";
	document.forms[0].auditType.value="2";
	document.forms[0].target="_parent";
	document.forms[0].action="proposalauditQueryPage.cmd?auditType=2&clear=true";
	document.forms[0].submit();
}
function yishenca(){
var url="proposalauditQueryPage.cmd?auditType=2&clear=true"; //yi审查
 	document.forms[0].STATE.value="";
	document.forms[0].auditType.value="2";
	document.forms[0].target="_parent";
	document.forms[0].action=url;
	document.forms[0].submit();
}


function fortuihui(){
 	document.forms[0].STATE.value="8";
	document.forms[0].auditType.value="2";
	document.forms[0].target="_parent";
	document.forms[0].action="proposalauditQueryPage.cmd?auditType=2&clear=true";
	document.forms[0].submit();
}

function foraudit(){
var url="proposalauditQueryPage.cmd?auditType=1&clear=true"; //待审查
 	document.forms[0].STATE.value="2";
	document.forms[0].auditType.value="1";
	document.forms[0].target="_parent";
	document.forms[0].action=url;
	document.forms[0].submit();
}
function forjieshou(){
var url="proposalauditQueryPage.cmd?auditType=1&clear=true"; //待接收
 	document.forms[0].STATE.value="1";
	document.forms[0].auditType.value="1";
	document.forms[0].target="_parent";
	document.forms[0].action=url;
	document.forms[0].submit();
}
function fordafu(){
	document.forms[0].STATE.value="6";
	document.forms[0].auditType.value="2";
	document.forms[0].target="_parent";
	document.forms[0].action="proposalauditQueryPage.cmd?auditType=2&clear=true";
	document.forms[0].submit();
}

</script>
