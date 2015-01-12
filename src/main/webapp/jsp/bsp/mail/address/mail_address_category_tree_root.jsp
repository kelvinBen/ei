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
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"bsp.js")%>"></script>
</HEAD>

<BODY  topmargin="2" leftmargin="5" style="padding:0px;" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<html:form name="form1" action="">
<table width=100%>
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
</html:form>

</BODY>
</HTML>
<SCRIPT LANGUAGE="JavaScript">
init();
//初始化导航条内容
function init()
{
	getMainFrame().location.href = "jsp/content.jsp";
}
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
		if( nodeValue == "3" )//如果是地址类别
			seltree.xmlsrc="mailaddress.cmd?method=gettreebranch&categoryId="+nodeId;
		else//如果是地址分组或者是联系人
			seltree.xmlsrc = "";
	}
	else//如果是根节点
	{
		seltree.xmlsrc="mailaddresscategory.cmd?method=gettreeparent";
	}
}
//点击节点上文本的事件
seltree.clickText=function(node)
{
	var nodeId = node.NodeId;
	var nodeValue = node.NodeValue;
	var mainHref = "";
	var xmlSrc = "";

	if( nodeValue == "3" )//noRefresh=1禁止刷新树
		mainHref="mailaddresscategory.cmd?method=detail&primaryKey="+nodeId+"&noRefresh=1";
	else if ( nodeValue == "0" || nodeValue == "1")
		mainHref = "mailaddress.cmd?method=detail&primaryKey="+nodeId+"&noRefresh=1";

	if(nodeId!=0)
	{
		getMainFrame().location.href=mainHref;
		seltree.xmlsrc="mailaddress.cmd?method=gettreebranch&categoryId="+nodeId+"&noRefresh=1";
	}
	else
	{
		getMainFrame().location.href = "jsp/content.jsp";
	}
}
//加载右键菜单
seltree.loadRightMouseMenu()
{
	var paramArr1 = new Array('<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.INSERTADDRESSCATEGORY")%>',//增加地址类别
							  '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.INSERTADDRESSGROUP")%>',//增加地址分组
							  '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.INSERTADDRESS")%>',//增加联系人
							  '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.UPDATEADDRESS")%>',//修改
							  '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.DELETEADDRESS")%>',//删除
							  '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.IMPORTADDRESSFROMORGAN")%>');//从组织机构中导入组
	var paramArr2 = new Array('insertAddressCategory()',//增加地址类别
							'insertAddressGroup()',//增加地址分组
							'insertAddress()',//增加联系人
							'updateAddress()',//修改
							'deleteAddress()',//删除
							'importAddressFromOrgan()');//从组织机构中导入组
	var paramArr3 = new Array('','','','','','');
	seltree.insertNodeMenu(paramArr1,paramArr2,paramArr3);
	seltree.insertLeafMenu(paramArr1,paramArr2,paramArr3);
}
//增加地址类别
function insertAddressCategory()
{
	getMainFrame().location.href = "mailaddresscategory.cmd?method=forinsert";
}
//增加地址分组
function insertAddressGroup()
{
	var nodeId = seltree.getValue("NodeId");
	var nodeValue = seltree.getValue("NodeValue");
	if( nodeValue != "3" )
	{
		alert( '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.ALERTMSG_ADDGROUP")%>' );
		return;
	}
	getMainFrame().location.href = "mailaddress.cmd?method=forinsert&addressType=0&categoryId="+nodeId;
}
//增加联系人
function insertAddress()
{
	var nodeId = seltree.getValue("NodeId");
	var nodeValue = seltree.getValue("NodeValue");
	if( nodeValue != "0" && nodeValue != "3" )
	{
		alert( '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.ALERTMSG_ADDCARD")%>' );
		return;
	}
	if( nodeValue == "3" )
		getMainFrame().location.href = "mailaddress.cmd?method=forinsert&addressType=1&categoryId="+nodeId;
	else if( nodeValue == "0" )
		getMainFrame().location.href = "mailaddress.cmd?method=forInsertCardInGroup&groupId="+nodeId;
}
//修改
function updateAddress()
{
	var nodeId = seltree.getValue("NodeId");
	var nodeValue = seltree.getValue("NodeValue");
	if( nodeId == "0" )
	{
		alert( '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.ALERTMSG_ROOT")%>' );
		return;
	}
	if( nodeValue == "3" )//地址类别修改
	{
		getMainFrame().location.href = "mailaddresscategory.cmd?method=forupdate&primaryKey="+nodeId;
	}
	else//地址分组或者联系人修改
	{
		getMainFrame().location.href = "mailaddress.cmd?method=forupdate&primaryKey="+nodeId;
	}
}
//删除
function deleteAddress()
{
	var nodeId = seltree.getValue("NodeId");
	var nodeValue = seltree.getValue("NodeValue");
	if( nodeId == "0" )
	{
		alert( '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.ALERTMSG_ROOT")%>' );
		return;
	}
	
	if( nodeValue == "3" )//地址类别删除
	{
		if( confirm('<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.ALERTMSG_CATEGORY_DEL")%>') )
		{
			getMainFrame().location.href = "mailaddresscategory.cmd?method=delete&primaryKey="+nodeId;			
			return;
		}
	}
	else//地址分组或者联系人删除
	{
		if( confirm('<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.ALERTMSG_DEL")%>') )
		{
			getMainFrame().location.href = "mailaddress.cmd?method=delete&primaryKey="+nodeId;	
			return;
		}
		
	}

}
//从组织机构中导入组
function importAddressFromOrgan()
{
	var nodeId = seltree.getValue("NodeId");
	var nodeValue = seltree.getValue("NodeValue");
	if( nodeValue != "0" )
	{
		alert( '请选择分组后再导入！' );
		return;
	}
	getMainFrame().location.href = "mailaddress.cmd?method=impOrgToTeamRoot&primaryKey="+nodeId;
}
//第一次进入本页面，将根节点下的地址类别显示出来。
seltree.refreshNodeByIdOnce('0');
</SCRIPT>

