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
    alert("请输入联系人姓名！");
    addressName.focus();
    return false;
  }
  if(byteLength(trim(addressName.value))>80)
  {
	alert("您输入的姓名超长，请重新填写！");
	addressName.focus();   
	return false;
  }
  //效验邮箱地址
  var addressEmail = document.forms[0].addressEmail;
  if(!__checkEmail(trim(addressEmail.value))){
	alert("邮箱地址格式错误，请重新输入！");
	addressEmail.focus();
	return false;
  }
  addressName.value = trim(addressName.value) ;
  
  var categoryId = document.forms[0].categoryId;
  if (trim(categoryId.value)=="")
  {
    alert("请在地址本中选择地址类别或地址分组！");
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

<fieldset class="FieldsetCss" style="width:180px;height:330px"><legend>地址本</legend>
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
		<td class="TdLeft"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_CARD")%>：</td>
		<td class="tdRight" nowrap>
		<html:text name="addressName" value="" size="27" maxlength="80" /><span id="addressName_span" class="xinghaoCss">*</span>
		</td>
		</tr>                    
		<tr>
		<td class="TdLeft"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_EMAIL")%>：</td>
		<td class="tdRight">
		<html:text name="addressEmail" value="" size="27" maxlength="80" />
		</td>
		</tr>
		<tr>
		<td class="TdLeft"><span id="addtypetext">保存目的地：</span></td>
		<td class="tdRight">
		<html:text name="categoryName" value="" size="27" maxlength="80" readonly="true"/><span id="categoryName_span" class="xinghaoCss">*</span>
		<html:hidden name="categoryId" value="" />
		</td>
		</tr>            
   </table>



</td>
</tr>
<tr><td colspan="2" align="center">
	<html:button onclick="forSave()" name="btn_insert" value="保存"></html:button>
	<html:button onclick="forReset()" name="btn_detail" value="取消"></html:button>&nbsp;&nbsp;&nbsp;
</td></tr>
</table>
</html:form>

</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
var addtype="";
//点击节点上文本的事件
seltree.clickText=function(node)
{
	var nodeId = node.NodeId;
	var nodeValue = node.NodeValue;
	if(nodeValue==undefined){
	return false;
	}
	var gtype = nodeValue.substring(0,nodeValue.indexOf(";"));
	if(nodeId!=0)//如果不是根节点
	{
		seltree.xmlsrc="mailaddress.cmd?method=gettreebranch_category_card2&categoryId="+nodeId;
	}
	if( gtype==0)
	{
		document.all.categoryName.value = nodeValue.substring(nodeValue.indexOf(";")+1,nodeValue.lastIndexOf(";"));
		document.all.categoryId.value = nodeId;
		addtype="地址分组";
		document.getElementById("addtypetext").firstChild.nodeValue="地址分组";
	}
        if( gtype=="")
	{
	        document.all.categoryName.value =node.firstChild.innerHTML;
		document.all.categoryId.value = nodeId;
		addtype="地址类别";
		document.getElementById("addtypetext").firstChild.nodeValue="地址类别";
		
	}
}
//点击节点上的图片的事件
seltree.clickImg=function(node)
{
	var nodeId = node.NodeId;
	var nodeValue = node.NodeValue;
	if(nodeId!=0)//如果不是根节点
	{
		seltree.xmlsrc="mailaddress.cmd?method=gettreebranch_category_card2&categoryId="+nodeId;
	}
	else//如果是根节点
	{
		seltree.xmlsrc="mailaddress.cmd?method=gettreeroot_category_card";
	}
}
//确定
function forSave()
{
  if(!checkMailAddress()) return;	
  document.forms[0].action ="mailaddress.cmd?method=inboxCardInsert&addtype="+addtype;
  document.forms[0].submit();	

}

//取消
function forReset()
{
	window.close();
}

//第一次进入本页面，将根节点下的地址类别显示出来。
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

