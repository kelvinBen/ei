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
		<td width='30%' align="right"><a
			href="javascript:fordafu()"
			 style="font-size: 14px;color: blue;">�Ѵ��᰸</a></td>
		<td width='20%' align='left'><a
			 style="font-size: 14px">��<html:value property="yidafu"/>��</a></td>
<td width='30%' align="right"><a
			href="javascript:mylist()" 
			 style="font-size: 14px;color: blue;">�ѷ����᰸</a></td>
		<td width='20%' align='left' style="font-size: 14px;">��<html:value property="yifankui"/>��</td>

	</tr>
	<tr>
		<td width='30%' align="right"><a
			href="javascript:forjieshou()" 
			 style="font-size: 14px;color: blue;">�������᰸</a></td>
		<td width='20%' align='left' style="font-size: 14px;">��<html:value property="daijiaoban"/>��</td>
		<td width='30%' align="right"><a href="javascript:foraudit()" 
			 style="font-size: 14px;color: blue;">�ѽ����᰸</a></td>
		<td width='20%' align='left' style="font-size: 14px;">��<html:value property="yijiaoban"/>��</td>
	</tr>
	<tr>
		<td width='30%' align="right"><a 
			href="javascript:fortuihui()"
			 style="font-size: 14px;color: blue;">�����˻ص��᰸</a></td>
		<td width='20%' align="left"><a
			 style="font-size: 14px">��<html:value property="tuihui"/>��</a></td>
		<td width='30%' align="right"><a 
			href="javascript:forchongxinjiaoban()"
			 style="font-size: 14px;color: blue;">���ν�����᰸</a></td>
		<td width='20%' align="left"><a
			 style="font-size: 14px">��<html:value property="chongxinjiaoban"/>��</a></td>			 
	</tr>
	<tr>
<td width='25%' align="right"><a
			 style="font-size: 14px;color: blue;">���轻���᰸</a></td>
		<td width='25%' align='left' style="font-size: 14px;">��<html:value property="total"/>��</td>

	</tr>
		
</table>
<form action="" >
<table id="tblSearch" style="display: none;">
<flex:search>
	<tr>
    <td><flex:searchText name="STATE" searchName="BILL_BUZI.CASENO" dataType="java.lang.String" operSymbol="=" value="" size="12">
	</flex:searchText>
	<flex:searchText name="ISREGISTER" searchName="BILL_BUZI.CASENO" dataType="java.lang.String" operSymbol="=" value="" size="12">
	</flex:searchText>
	</td>
	</tr>
</flex:search>
<input type="hidden" name="clear" value="true">
<input type="hidden" name="assigType" id="assigType" value="0">

</table>
</form>
</BODY>
</HTML>
<script language="javascript">

//�鿴����
function mylist(){
	document.forms[0].STATE.value="7";
	document.forms[0].assigType.value="2";
	document.forms[0].target="_parent";
	document.forms[0].action="proposalassignQueryPage.cmd?assigType=2&clear=true";
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
 	document.forms[0].STATE.value="9";
	document.forms[0].assigType.value="2";
	document.forms[0].target="_parent";
	document.forms[0].action="proposalassignQueryPage.cmd?assigType=2&clear=true";
	document.forms[0].submit();
}

function foraudit(){
var url="proposalassignQueryPage.cmd?assigType=2&clear=true"; //�ѽ���
 	//document.forms[0].STATE.value="2";
	document.forms[0].assigType.value="2";
	document.forms[0].target="_parent";
	document.forms[0].action=url;
	document.forms[0].submit();
}
function forjieshou(){
var url="proposalassignQueryPage.cmd?assigType=1&clear=true"; //������
 	document.forms[0].STATE.value="1";
	document.forms[0].assigType.value="1";
	document.forms[0].target="_parent";
	document.forms[0].action=url;
	document.forms[0].submit();
}
function fordafu(){
	document.forms[0].STATE.value="6";
	document.forms[0].assigType.value="2";
	document.forms[0].target="_parent";
	document.forms[0].action="proposalassignQueryPage.cmd?assigType=2&clear=true";
	document.forms[0].submit();
}

</script>
