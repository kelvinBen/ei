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
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>

<BODY  topmargin="2" leftmargin="5" style="padding:0px;" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<html:form name="form1" action="">
<table width="100%" align="center">
<tr>
<td  align="center">
<!-- 加上层以控制页面高度 -->

<fieldset class="FieldsetCss" style="width:180px;height:330px"><legend>地址本</legend>
<table width="100%"  align="center">
<tr>
<td>
<div align="left" style="overflow:hidden;width:170; height:320;">
<div style="overflow:auto;width:100%; height:100%;position:absolute;">
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="href"
	 hasRoot="true" rootText='<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.TREEROOTTEXT")%>' style="width:100%;height:100%;white-space:nowrap;" isDataAsync="false">
	    <tree:selNode title="categoryName" nodeId="categoryId" nodeValue="addressType" collection="tree"
	     perImgSrc="mailAddressCategoryNodeImgSrc" nodeXmlSrc="mailAddressCategoryNodeXmlSrc"  caption="">
	    </tree:selNode>
	</tree:selTree>
</div>
</div>
</td>
</tr>
</table>
</fieldset>

</td>
<td align="center">

<table width="100%" align="center">
<tr>
<td valign="center">
	<img src="skins/default/images/moveright.gif" onclick='selectCardToList(document.all.cardList)'><br>
	<img src="skins/default/images/moveleft.gif" onclick='moveCardFromList(document.all.cardList)'><br>
</td>
</tr>
</table>

</td>

<td  align="center">
<fieldset class="FieldsetCss" style="width:180px;height:330px"><legend>联系人列表</legend> 
<table width="100%" align="center">
<tr>
<td>
	<select name="cardList" multiple="multiple" size="18" style="width:160px;">

	</select>
</td>
</tr>
</table>
</fieldset>
</td>
</tr>
<tr><td colspan="3" align="center">
	<html:button onclick="forSave()" name="btn_insert" value="确定"></html:button>
	<html:button onclick="forReset()" name="btn_detail" value="取消"></html:button>&nbsp;&nbsp;&nbsp;
</td></tr>
</table>
</html:form>

</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
//刷新指定节点下的内容
function refreshTreeNodeById(nodeId)
{
	seltree.refreshNodeById(nodeId);
}
//点击节点上的图片的事件
seltree.clickImg=function(node)
{
	var nodeId = node.NodeId;
	var nodeValue = node.NodeValue;
	if(nodeId!=0)//如果不是根节点
	{
		seltree.xmlsrc="mailaddress.cmd?method=gettreebranch_category_card&categoryId="+nodeId;
	}
	else//如果是根节点
	{
		seltree.xmlsrc="mailaddress.cmd?method=gettreeroot_category_card";
	}
}

//点击节点上文本的事件
seltree.clickText=function(node)
{
	var nodeId = node.NodeId;
	var nodeValue = node.NodeValue;
	if( nodeValue == "3" )
	{
		seltree.xmlsrc="mailaddress.cmd?method=gettreebranch_category_card&categoryId="+nodeId;
	}
	else if( nodeId == "0" )
	{
		seltree.xmlsrc="mailaddress.cmd?method=gettreeroot_category_card";
	}
	else
		seltree.xmlsrc="";
}
//判断联系人是否重复
function existCardInList( listObj , cardId )
{
	var optionArr = listObj.options;
	if( optionArr == null || optionArr.length == 0 )
		return false;
	for( var i = 0 ; i < optionArr.length ; i ++ )
	{
		var cardInfo = optionArr[ i ].value;
		var _cardId = cardInfo.split( ";" )[0];
		if( _cardId == cardId )
		{
			return true;
		}
	}
	return false;
}
//添加一个无重复的联系人到List列表中
function appendCardToList( listObj , textValue , keyValue )
{
	var cardOption = new Option();
	cardOption.text = textValue;
	cardOption.value = keyValue;
	listObj.options.add( cardOption );
}
//选择一个联系人到List列表中
function selectCardToList( listObj )
{
	var nodeId = seltree.getValue("NodeId");
	if( nodeId == "" )
		return ;
	var nodeValue = seltree.getValue("NodeValue");
	if( nodeId == "0" || nodeValue == "" || nodeValue == "3" )//如果是地址类别
	{
		alert( "请选择一个联系人！" );
		return ;
	}
	
	var infoArr = nodeValue.split( ";" );
	//根据nodeId判断List中是否已经存在
	if( existCardInList( listObj , nodeId ) )
	{
		alert( "联系人 "+infoArr[ 1 ]+" 已经存在！" );
		return ;
	}	
	//联系人ID-联系人姓名 映射对 -->list中
	appendCardToList( listObj , infoArr[ 1 ] , nodeId+";"+nodeValue );
	//联系人id,联系人姓名,邮箱地址 -->Array中
	putListToArray( listObj );
}

//删除一个联系人到List列表中
function moveCardFromList( listObj )
{
	var optionArr = listObj.options;
	if( optionArr == null || optionArr.length == 0 )
	{
		alert( "请选择一个联系人！" );
		return "";
	}
	var flag = false;
	for( var i = optionArr.length - 1 ; i >= 0 ; i -- )
	{
		if( optionArr[ i ].selected == true )
		{
			optionArr.remove( i );
			flag = true;
		}
	}
	if( flag )
		putListToArray( listObj );
	else
		alert( "请选择一个联系人！" );
}

var arrObj = new Array();
//将list中的值存入Array中
function putListToArray( listObj )
{
	arrObj = new Array();
	if( listObj == null )
		return null;
	var optionArr = listObj.options;
	for( var i = 0 ; i < optionArr.length ; i ++ )
	{
		arrObj.push( optionArr[ i ].value );
	}
}

function forSave()
{
	window.returnValue = arrObj;
	window.close();
}

function forReset()
{
	window.returnValue = new Array( "" );
	window.close();
}
//初始化列表
initList(document.all.cardList);
//初始化列表方法
function initList( listObj )
{
	var parentWinObject = window.dialogArguments;
	if( parentWinObject == null )
		return;
	//0
	var idArr = parentWinObject.document.getElementsByName( "mailGroupCardRefList.cardId" );
	//1:地址分组类型0
	//2
	var nameArr = parentWinObject.document.getElementsByName( "mailGroupCardRefList.cardName" );
	//3
	var emailArr = parentWinObject.document.getElementsByName("mailGroupCardRefList.cardEmail");
	//数组的第一行是个虚行，从第2行开始循环
	if( idArr.length > 1 )
	{
		for( var i = 1 ; i < idArr.length ; i ++ )
		{
			appendCardToList( listObj , nameArr[ i ].value , idArr[i].value+";0;"+nameArr[i].value+";"+emailArr[i].value );
		}
		putListToArray( listObj );
	}
}

</SCRIPT>

