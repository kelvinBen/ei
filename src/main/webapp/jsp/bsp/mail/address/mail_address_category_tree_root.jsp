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
//��ʼ������������
function init()
{
	getMainFrame().location.href = "jsp/content.jsp";
}
//ˢ��ָ���ڵ��µ�����
function refreshTreeNodeById(nodeId)
{
	seltree.refreshNodeById(nodeId);
}
//����ڵ��ϵ�ͼƬ���¼�
seltree.clickImg=function(node)
{
	var nodeId = node.NodeId;
	var nodeValue = node.NodeValue;
	if(nodeId!=0)//������Ǹ��ڵ�
	{
		if( nodeValue == "3" )//����ǵ�ַ���
			seltree.xmlsrc="mailaddress.cmd?method=gettreebranch&categoryId="+nodeId;
		else//����ǵ�ַ�����������ϵ��
			seltree.xmlsrc = "";
	}
	else//����Ǹ��ڵ�
	{
		seltree.xmlsrc="mailaddresscategory.cmd?method=gettreeparent";
	}
}
//����ڵ����ı����¼�
seltree.clickText=function(node)
{
	var nodeId = node.NodeId;
	var nodeValue = node.NodeValue;
	var mainHref = "";
	var xmlSrc = "";

	if( nodeValue == "3" )//noRefresh=1��ֹˢ����
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
//�����Ҽ��˵�
seltree.loadRightMouseMenu()
{
	var paramArr1 = new Array('<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.INSERTADDRESSCATEGORY")%>',//���ӵ�ַ���
							  '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.INSERTADDRESSGROUP")%>',//���ӵ�ַ����
							  '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.INSERTADDRESS")%>',//������ϵ��
							  '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.UPDATEADDRESS")%>',//�޸�
							  '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.DELETEADDRESS")%>',//ɾ��
							  '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.IMPORTADDRESSFROMORGAN")%>');//����֯�����е�����
	var paramArr2 = new Array('insertAddressCategory()',//���ӵ�ַ���
							'insertAddressGroup()',//���ӵ�ַ����
							'insertAddress()',//������ϵ��
							'updateAddress()',//�޸�
							'deleteAddress()',//ɾ��
							'importAddressFromOrgan()');//����֯�����е�����
	var paramArr3 = new Array('','','','','','');
	seltree.insertNodeMenu(paramArr1,paramArr2,paramArr3);
	seltree.insertLeafMenu(paramArr1,paramArr2,paramArr3);
}
//���ӵ�ַ���
function insertAddressCategory()
{
	getMainFrame().location.href = "mailaddresscategory.cmd?method=forinsert";
}
//���ӵ�ַ����
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
//������ϵ��
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
//�޸�
function updateAddress()
{
	var nodeId = seltree.getValue("NodeId");
	var nodeValue = seltree.getValue("NodeValue");
	if( nodeId == "0" )
	{
		alert( '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.ALERTMSG_ROOT")%>' );
		return;
	}
	if( nodeValue == "3" )//��ַ����޸�
	{
		getMainFrame().location.href = "mailaddresscategory.cmd?method=forupdate&primaryKey="+nodeId;
	}
	else//��ַ���������ϵ���޸�
	{
		getMainFrame().location.href = "mailaddress.cmd?method=forupdate&primaryKey="+nodeId;
	}
}
//ɾ��
function deleteAddress()
{
	var nodeId = seltree.getValue("NodeId");
	var nodeValue = seltree.getValue("NodeValue");
	if( nodeId == "0" )
	{
		alert( '<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.ALERTMSG_ROOT")%>' );
		return;
	}
	
	if( nodeValue == "3" )//��ַ���ɾ��
	{
		if( confirm('<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.ALERTMSG_CATEGORY_DEL")%>') )
		{
			getMainFrame().location.href = "mailaddresscategory.cmd?method=delete&primaryKey="+nodeId;			
			return;
		}
	}
	else//��ַ���������ϵ��ɾ��
	{
		if( confirm('<%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.ALERTMSG_DEL")%>') )
		{
			getMainFrame().location.href = "mailaddress.cmd?method=delete&primaryKey="+nodeId;	
			return;
		}
		
	}

}
//����֯�����е�����
function importAddressFromOrgan()
{
	var nodeId = seltree.getValue("NodeId");
	var nodeValue = seltree.getValue("NodeValue");
	if( nodeValue != "0" )
	{
		alert( '��ѡ�������ٵ��룡' );
		return;
	}
	getMainFrame().location.href = "mailaddress.cmd?method=impOrgToTeamRoot&primaryKey="+nodeId;
}
//��һ�ν��뱾ҳ�棬�����ڵ��µĵ�ַ�����ʾ������
seltree.refreshNodeByIdOnce('0');
</SCRIPT>

