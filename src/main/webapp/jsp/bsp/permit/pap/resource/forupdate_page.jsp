<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.permit.pap.domain.support.ResType"%>
<HTML>
<HEAD>
<TITLE>��Դ�޸�</TITLE>
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='css-xp4.css'/>">
<%
	String functionId = (String) request.getAttribute("functionId");
	String isIdUpdate = (String) request.getParameter("isIdUpdate");
	List resTypeList = (List) request.getAttribute("resTypeList");
%>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript"
	src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubResources(){
      var resourceId = document.forms[0].resourceId;
	  if ( __isQuoteIn(resourceId.value) ){
	    alert("�������벻�ܺ��������ַ���");
	    resourceId.value="";
	    resourceId.select();
	    resourceId.focus();
	    return false;
	  }
	  if (trim(resourceId.value)==""){
	    alert("������������룡");    
	    return false;
	  }
      resourceId.value = trim(resourceId.value) ;
	  var resourceName = document.forms[0].resourceName;
	  if (trim(resourceName.value)==""){
	    alert("������������ƣ�");    
	    return false;
	  }
      resourceName.value = trim(resourceName.value) ;
	  var resourceAlias = document.forms[0].resourceAlias;	
      if (trim(resourceAlias.value)==""){
	    alert("���������ҵ���壡");    
	    return false;
	  }
      resourceAlias.value = trim(resourceAlias.value) ;
	  var urlNames = document.forms[0].urlNames;
	  if (trim(urlNames.value)==""){
	    alert("������URL��");    
	    return false;
	  }
      urlNames.value = trim(urlNames.value) ;
     
      if(!stringLengthCheck(resourceId,30,"�������벻�ܳ���30���ַ�!")){
        resourceId.value="";
        resourceId.select();
        resourceId.focus();
        return false;
      }
      if(!stringLengthCheck(resourceName,30,"�������Ʋ��ܳ���30���ַ�!")){
        resourceName.value="";
        resourceName.select();
        resourceName.focus();
        return false;
      }
      if(!stringLengthCheck(resourceAlias,60,"ҵ���岻�ܳ���60���ַ�!")){
        resourceAlias.value="";
        resourceAlias.select();
        resourceAlias.focus();
        return false;
      }   
	  return true
}

</script>

</HEAD>
<BODY topmargin="10px">
<form name="frmList" action=""><bsp:container title="�����޸�">

	<div align="center">
	<table width="100%" cellpadding="0" class="tblContent">
		<INPUT TYPE="hidden" name="functionId">


		<tr id="tr1">
			<td class="tdTitle">�������룺</td>
			<td class="tdRight"><INPUT TYPE="text" NAME="resourceId"
				size="30" maxlength="30"><FONT COLOR=#ff0000>*</FONT></td>
		</tr>

		<tr>
			<td class="tdRight">&nbsp</td>
		</tr>

		<tr>
			<td class="tdTitle">�������ƣ�</td>
			<td class="tdRight"><INPUT TYPE="text" NAME="resourceName"
				size="30" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
		</tr>

		<tr>
			<td class="tdRight">&nbsp</td>
		</tr>

		<tr>
			<td class="tdTitle">ҵ���壺</td>
			<td class="tdRight"><INPUT TYPE="text" NAME="resourceAlias"
				size="40" maxlength="60" /><FONT COLOR=#ff0000>*</FONT></td>
		</tr>

		<tr>
			<td class="tdRight">&nbsp</td>
		</tr>
		<tr>
			<td class="tdTitle">�������ͣ�</td>
			<td class="tdRight">
			<select name="resTypeId" property="resTypeId">
				<%
						for (int i = 0; i < resTypeList.size(); i++) {
						ResType resType = (ResType) resTypeList.get(i);
				%>
				<option value="i"><%=resType.getResTypeName()%></option>
				<%
				}
				%>

			</select>
			</td>
		</tr>

		<tr>
			<td class="tdRight">&nbsp</td>
		</tr>
		<tr>
			<td class="tdTitle">URL��</td>
			<td class="tdRight"><textarea NAME="urlNames" cols="40"></textarea><FONT
				COLOR=#ff0000>*</FONT></td>
		</tr>

		<tr>
			<td class="tdRight">&nbsp</td>
		</tr>

		<tr>
			<td class="tdTitle">��ȫ����</td>
			<td class="tdRight"><select name="securityLevel">
				<option value="0">�����ܼ�</option>
				<option value="1">���ܼ�-</option>
				<option value="2">���ܼ�</option>
				<option value="3">���ܼ�+</option>
				<option value="4">���ܼ�-</option>
				<option value="5">���ܼ�</option>
				<option value="6">���ܼ�+</option>
				<option value="7">���ܼ�-</option>
				<option value="8">���ܼ�</option>
				<option value="9">���ܼ�+</option>

			</select></td>
		</tr>

		<tr>
			<td class="tdRight">&nbsp</td>
		</tr>

		<tr>
			<td class="tdTitle">ȱʡ������</td>
			<td class="tdRight"><INPUT TYPE="checkbox" NAME="isDefault" /></td>
		</tr>

		<tr>
			<td class="tdRight">&nbsp</td>
		</tr>

		<tr>
			<td class="tdTitle">��Ҫ��ƣ�</td>
			<td class="tdRight"><INPUT TYPE="checkbox" NAME="isAudit" /></td>
		</tr>

	</table>
	<center><html:button name="button" onclick="forSave()"
		value="ȷ��"></html:button> <html:button name="button"
		onclick="forCancel()" value="ȡ��"></html:button></center>
	</div>
</bsp:container></form>
</BODY>
</HTML>

<script language="javascript">
var select = document.getElementById("resTypeId");		
	alert("id="+document.all("resTypeId").value);
	alert("name="+document.all("resTypeName").value);
	
var arr=window.dialogArguments;
document.all("resourceId").value=arr[0];
document.all("resourceName").value=arr[1];
document.all("resourceAlias").value=arr[2];
document.all("resTypeId").value=arr[3];
document.all("resTypeName").value = select.options[select.selectedIndex].innerText;

document.all("urlNames").value=arr[4];
document.all("securityLevel").value=arr[5];
if(arr[6]==1)
document.all("isDefault").checked=true;
if(arr[7]==1)
document.all("isAudit").checked=true;
document.all("functionId").value=arr[8];

var isIdUpdate="<%=isIdUpdate%>"

if(isIdUpdate=="0")
document.all("tr1").style.display="none";
else if(isIdUpdate=="1")
document.all("tr1").style.display="block";

function forSave(){
  if(!checkPubResources()) return;	
  var returnV=new Array(9);
  returnV[0]=document.all("resourceId").value;
  returnV[1]=document.all("resourceName").value;
  returnV[2]=document.all("resourceAlias").value;
  returnV[3]=document.all("resTypeId").value;
  returnV[4]=document.all("resTypeName").value;
  returnV[5]=document.all("urlNames").value;
  returnV[6]=document.all("securityLevel").value;
  if(document.all("isDefault").checked==true)
     returnV[7]=1;
  else 
     returnV[7]=0;
  if(document.all("isAudit").checked==true) 
     returnV[8]=1;
  else
     returnV[8]=0;
  returnV[9]=document.all("functionId").value;
  window.returnValue=returnV;
  parent.close();
}
function forCancel(){
	parent.close();
}
</script>
