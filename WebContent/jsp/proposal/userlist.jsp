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
<BODY topmargin="10px">
<br/>
<table width=100% border=0 cellspacing="3">
	<tr>
		<td width='35%' align='center'><a
			href="javascript:fordafu()"
			 style="font-size: 14px;color: blue;">已答复提案</a></td>
		<td width='15%' align='left'><a
			 style="font-size: 14px">有<html:value property="yidafu"/>件</a></td>
		<td width='35%' align='center'><a 
			href="javascript:fortuihui()"
			 style="font-size: 14px;color: blue;">审查退回提案</a></td>
		<td width='15%' align='left'><a
			 style="font-size: 14px">有<html:value property="tuihui"/>件</a></td>
	</tr>

	<tr>
<td width='35%' align='center'><a
			href="javascript:mylist()" 
			 style="font-size: 14px;color: blue;">我的提案</a></td>
		<td width='15%' align='left' style="font-size: 14px;">有<html:value property="mylist"/>件</td>
	</tr>
		<tr>
		<td width='35%' align='center'><a
			href="javascript:forupdateMyself()" 
			 style="font-size: 14px;color: blue;">完善委员资料</a></td>
		<td width='15%' align='left'> </td>
		<td width='35%' align='center'><a href="javascript:forinsert()" 
			 style="font-size: 14px;color: blue;">发起新的提案</a></td>
		<td width='15%' align='left'> </td>
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
</form>
</BODY>
</HTML>
<script language="javascript">

//查看复文
function mylist(){
	getMainFrame().location.href="myproposallist.cmd?clear=true";
}
function forinsert(){
	getMainFrame().location.href="proposalbuzi.cmd?method=forinsert";
}

function fortuihui(){
 	document.forms[0].STATE.value="8";
	//getMainFrame().location.href="myproposallist.cmd";
	document.forms[0].target="_parent";
	document.forms[0].action="myproposallist.cmd?clear=true";
	document.forms[0].submit();
}

function forupdateMyself(){
	getMainFrame().location.href="proposaluser.cmd?method=forupdateMyself";
}

function fordafu(){
	document.forms[0].STATE.value="6";
	//getMainFrame().location.href="myproposallist.cmd";
	document.forms[0].target="_parent";
	document.forms[0].action="myproposallist.cmd?clear=true";
	document.forms[0].submit();
}

</script>
