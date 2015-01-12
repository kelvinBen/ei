<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.TREETITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkMailAddress()
{
  var addressName = document.forms[0].addressName;
  
  if (trim(addressName.value)=="")
  {
    alert("��������ϵ��������");
    addressName.focus();
    return false;
  }
  if(byteLength(trim(addressName.value))>80)
  {
	alert("�������������������������д��");
	addressName.focus();   
	return false;
  }
  //Ч�������ַ
  var addressEmail = document.forms[0].addressEmail;
  if(!__checkEmail(trim(addressEmail.value))){
	alert("�����ַ��ʽ�������������룡");
	addressEmail.focus();
	return false;
  }
  addressName.value = trim(addressName.value) ;
  
  var categoryId = document.forms[0].categoryId;
  if (trim(categoryId.value)=="")
  {
    alert("���ڵ�ַ����ѡ���ַ�����ַ���飡");
    //categoryId.focus();
    return false;
  }
  categoryId.value = trim(categoryId.value) ;
  return true;
}
</script>
</HEAD>

<BODY  topmargin="2" leftmargin="5" style="padding:0px;" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<html:form name="form1" action="">
<table width="100%" align="center">
<tr>
<td  align="center">

<fieldset class="FieldsetCss" style="width:180px;height:330px"><legend>��ַ��</legend>
<table width="100%"  align="center">
<tr>
<td>
		<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="href"
	 hasRoot="true" rootText='<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.TREEROOTTEXT")%>' style="width:100%;height:100%;white-space:nowrap;" isDataAsync="false">
	    <tree:selNode title="categoryName" nodeId="categoryId" nodeValue="addressType" collection="tree"
	     perImgSrc="mailAddressCategoryNodeImgSrc" nodeXmlSrc="mailAddressCategoryNodeXmlSrc"  caption="">
	    </tree:selNode>
	</tree:selTree>
</td>
</tr>
</table>
</fieldset>

</td>

<td >



  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">               
		<tr>
		<td class="TdLeft"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_CARD")%>��</td>
		<td class="tdRight" nowrap>
		<html:text name="addressName" value="" size="27" maxlength="80" /><span id="addressName_span" class="xinghaoCss">*</span>
		</td>
		</tr>                    
		<tr>
		<td class="TdLeft"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_EMAIL")%>��</td>
		<td class="tdRight">
		<html:text name="addressEmail" value="" size="27" maxlength="80" />
		</td>
		</tr>
		<tr>
		<td class="TdLeft"><span id="addtypetext">����Ŀ�ĵأ�</span></td>
		<td class="tdRight">
		<html:text name="categoryName" value="" size="27" maxlength="80" readonly="true"/><span id="categoryName_span" class="xinghaoCss">*</span>
		<html:hidden name="categoryId" value="" />
		</td>
		</tr>            
   </table>



</td>
</tr>
<tr><td colspan="2" align="center">
	<html:button onclick="forSave()" name="btn_insert" value="����"></html:button>
	<html:button onclick="forReset()" name="btn_detail" value="ȡ��"></html:button>&nbsp;&nbsp;&nbsp;
</td></tr>
</table>
</html:form>

</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
var addtype="";
//����ڵ����ı����¼�
seltree.clickText=function(node)
{
	var nodeId = node.NodeId;
	var nodeValue = node.NodeValue;
	if(nodeValue==undefined){
	return false;
	}
	var gtype = nodeValue.substring(0,nodeValue.indexOf(";"));
	if(nodeId!=0)//������Ǹ��ڵ�
	{
		seltree.xmlsrc="mailaddress.cmd?method=gettreebranch_category_card2&categoryId="+nodeId;
	}
	if( gtype==0)
	{
		document.all.categoryName.value = nodeValue.substring(nodeValue.indexOf(";")+1,nodeValue.lastIndexOf(";"));
		document.all.categoryId.value = nodeId;
		addtype="��ַ����";
		document.getElementById("addtypetext").firstChild.nodeValue="��ַ����";
	}
        if( gtype=="")
	{
	        document.all.categoryName.value =node.firstChild.innerHTML;
		document.all.categoryId.value = nodeId;
		addtype="��ַ���";
		document.getElementById("addtypetext").firstChild.nodeValue="��ַ���";
		
	}
}
//����ڵ��ϵ�ͼƬ���¼�
seltree.clickImg=function(node)
{
	var nodeId = node.NodeId;
	var nodeValue = node.NodeValue;
	if(nodeId!=0)//������Ǹ��ڵ�
	{
		seltree.xmlsrc="mailaddress.cmd?method=gettreebranch_category_card2&categoryId="+nodeId;
	}
	else//����Ǹ��ڵ�
	{
		seltree.xmlsrc="mailaddress.cmd?method=gettreeroot_category_card";
	}
}
//ȷ��
function forSave()
{
  if(!checkMailAddress()) return;	
  document.forms[0].action ="mailaddress.cmd?method=inboxCardInsert&addtype="+addtype;
  document.forms[0].submit();	

}

//ȡ��
function forReset()
{
	window.close();
}

//��һ�ν��뱾ҳ�棬�����ڵ��µĵ�ַ�����ʾ������
//seltree.refreshNodeByIdOnce('0');
seltree.openNodeById('0');
init();
function init()
{
	//var parentWinObject = window.dialogArguments;
	var cardInfoObj = opener.grid.getCheckAll();
	//var rowIndex=opener.grid.getCurrentLine();
	var cardInfoArr = cardInfoObj.split( "," );
	var senderName = cardInfoArr[2];
	var sendFrom = cardInfoArr[3];
	document.all.addressName.value = senderName;
	document.all.addressEmail.value = sendFrom;
}

</SCRIPT>

