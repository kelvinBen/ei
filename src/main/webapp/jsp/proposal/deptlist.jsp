<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@page import="net.mast.bsp.permit.context.BspInfo"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%
BspInfo user=GetBspInfo.getBspInfo();
String dept=user.getCorporation().getOrganAlias();
%>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<HTML>
<HEAD>
<BODY topmargin="10px"  style="font-size: 14px;">
<br/>
<table width=100% border=0 cellspacing="3">
	<tr>
		<td width='25%' align="right"><a
			href="javascript:fordafu()"
			 style="font-size: 14px;color: blue;">已答复提案</a></td>
		<td width='25%' align='left'><a
			 style="font-size: 14px">有<html:value property="yidafu"/>件</a></td>
<td width='25%' align="right"><a
			href="javascript:mylist()" 
			 style="font-size: 14px;color: blue;">已反馈提案</a></td>
		<td width='25%' align='left' style="font-size: 14px;">有<html:value property="yifankui"/>件</td>

	</tr>
	<tr>
		<td width='25%' align="right"><a
			href="javascript:fordaiban()" 
			 style="font-size: 14px;color: blue;">待办提案</a></td>
		<td width='25%' align='left' style="font-size: 14px;">有<html:value property="daiban"/>件</td>
		<td width='25%' align="right"><a href="javascript:forzaiban()" 
			 style="font-size: 14px;color: blue;">在办提案</a></td>
		<td width='25%' align='left' style="font-size: 14px;">有<html:value property="zaiban"/>件</td>
	</tr>

	<tr>

<td width='35%' align="right"><a
			 style="font-size: 14px;color: blue;">共收到需办理提案</a></td>
		<td width='15%' align='left' style="font-size: 14px;">有<html:value property="total"/>件</td>

	</tr>
		
</table>
<form action="" method="get">
<table id="tblSearch" style="display: none;">
<flex:search>
	<tr>
    <td><flex:searchText name="STATE" searchName="BILL_BUZI.CASENO" dataType="java.lang.String" operSymbol="=" value="" size="12">
	</flex:searchText>
<flex:searchText name="PROCESSDEPT" searchName="PROPOSAL_REPLY.PROCESSDEPT" dataType="java.lang.String" operSymbol="=" value="" size="16"/>
<input type="hidden" name="clear" value="true">
<input type="hidden" name="flag" id="flag" value="0">
	</td>
	</tr>
</flex:search>
</table>
</form>
</BODY>
</HTML>
<script language="javascript">

//查看复文
function mylist(){
	document.forms[0].STATE.value="7";
	document.forms[0].PROCESSDEPT.value="<%=dept%>";
	document.forms[0].flag.value="PROCESSDEPT";
	document.forms[0].target="_parent";
	document.forms[0].action="smproppsalQueryAction.cmd?flag=PROCESSDEPT&clear=true";
	document.forms[0].submit();
}
function forchongxinjiaoban(){
var url="proposalbuziquery_page_init.cmd?clear=true";
	document.forms[0].ISREGISTER.value="3";
	
	document.forms[0].target="_parent";
	document.forms[0].action=url;
	document.forms[0].submit();
}

function fortuihui(){
 	document.forms[0].STATE.value="2";
	document.forms[0].flag.value="1";
	document.forms[0].target="_parent";
	document.forms[0].action="proposalreplyquery_page_init.cmd?flag=1&clear=true";
	document.forms[0].submit();
}

function forzaiban(){
var url="proposalreplyquery_page_init.cmd?flag=0&clear=true"; //
 	document.forms[0].STATE.value="1";
 	document.forms[0].flag.value="0";
	document.forms[0].target="_parent";
	document.forms[0].action=url;
	document.forms[0].submit();
}
function fordaiban(){
var url="proposalreplyquery_page_init.cmd?flag=0&clear=true"; 
 	document.forms[0].STATE.value="0";
	document.forms[0].flag.value="0";
	document.forms[0].target="_parent";
	document.forms[0].action=url;
	document.forms[0].submit();
}
function fordafu(){
	document.forms[0].STATE.value="3";
	document.forms[0].flag.value="1";
	document.forms[0].target="_parent";
	document.forms[0].action="proposalreplyquery_page_init.cmd?flag=2&clear=true";
	document.forms[0].submit();
}

</script>
