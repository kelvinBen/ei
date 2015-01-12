<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.bsp.mail.TitleServerMapMail"%>

<HTML>
<%
	TitleServerMapMail titleServer = new TitleServerMapMail();
		String sendServer = titleServer.getSendServer();
		String draftServer = titleServer.getDraftServer();
		String trashServer = titleServer.getTrashServer();
		String serverId = titleServer.getServerId();
		String contextPath = request.getContextPath();
%>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">

<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>

<BODY  topmargin="2" leftmargin="5" style="padding:0px;" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<html:form name="form1" action="">
<table width=100%>
     <tr>
     <td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="href" 
	 hasRoot="true" rootText='文件夹' style="width:100%;height:100%;white-space:nowrap;" isDataAsync="false">
	    <tree:selNode title="name" nodeId="fullName" nodeValue="nodeValue" collection="tree" perImgSrc="perImgSrc" nodeXmlSrc="nodeXmlSrc"  caption="name">
	    </tree:selNode>
	</tree:selTree>
    </td>
    </tr>
</table>
</html:form>
<iframe style="display:none"  id="hideframe"></iframe>
<html:messages/>
</BODY>
</HTML>
<script language="JavaScript">
init();
function init(){
	getMainFrame().location.href = "jsp/content.jsp";
	seltree.openNodeById("0");
}
function refreshTreeNodeById(nodeId)
{
	seltree.refreshNodeById(nodeId);
}
seltree.clickImg=function(node){
	var nodeId = node.NodeId;
	seltree.xmlsrc="mailfoldertree.cmd?method=getTreeBranch&fullName="+nodeId;
}
seltree.clickText=function(node){

	var nodeId = node.NodeId;
	if(nodeId=="0"){
		return false;
	}
	var serverType = node.NodeValue;
	if(nodeId=="INBOX"){
		getMainFrame().location.href="inboxmailquery.cmd?mailType=0&fullName="+nodeId+"&serverType="+serverType;
	}
	else if(nodeId=="<%=sendServer%>"){
		getMainFrame().location.href="sendmailquery.cmd?mailType=1&fullName="+nodeId+"&serverType="+serverType;
	}
	else if(nodeId=="<%=draftServer%>"){
		getMainFrame().location.href="draftmailquery.cmd?mailType=3&fullName="+nodeId+"&serverType="+serverType;
	}
	else if(nodeId=="<%=trashServer%>"){
		getMainFrame().location.href="garbagemailquery.cmd?mailType=4&fullName="+nodeId+"&serverType="+serverType;
	}
	else {
		getMainFrame().location.href="custommailquery.cmd?mailType=5&fullName="+nodeId+"&serverType="+serverType;
	}
	seltree.xmlsrc="mailfoldertree.cmd?method=getTreeBranch&fullName="+nodeId;
}
seltree.loadRightMouseMenu()
{
	seltree.insertNodeMenu(new Array('新建文件夹','重命名','删除'),
		new Array("insert();","reName();","delete1();"),new Array("","",""));
	seltree.insertLeafMenu(new Array('新建文件夹','重命名','删除'),
		new Array("insert();","reName();","delete1();"),new Array("","",""));
}
function insert()
{
	var fullName = seltree.getValue("NodeId");
	var serverId = <%=serverId%>;
	if(serverId==1){
		if(fullName=="INBOX"){
		alert("收件邮箱下只能存放邮件，不能包含子文件夹");
		return false;
		}
	} else {
		if(fullName=="0" || fullName=="<%=sendServer%>" || fullName=="<%=draftServer%>" || fullName=="<%=trashServer%>"){
		alert("此目录下不能创建子文件夹！");
		return false;
		}
	}
	var title = "请输入要新建的文件夹名称：";
	var url = "<%=contextPath%>/jsp/bsp/mail/mail/pub_prompt.jsp?title="+title;
	var win = showModalDialog(url, window, "scroll:yes;status:no;dialogWidth:500px;dialogHeight:200px");
	if(win==undefined){
		return false;
	}
	if(__isQuoteIn(win)){
		alert("名称中不能含有特殊字符，请重新输入！");
		return false;
	}
	getMainFrame().location.href="mailfoldertree.cmd?method=insertFolder&fullName="+fullName+"&newName="+win;
}
function reName()
{
	var nodeName = seltree.getValue("caption");
	var fullName = seltree.getValue("NodeId");
	if(fullName==0){
		alert('<%=ResourcesFactory.getString("MAIL_FOLDER.TREEMSGRENAMEFORROOT")%>');
		return false;
	}
	if(fullName=="INBOX" || fullName=="<%=sendServer%>" || fullName=="<%=draftServer%>" || fullName=="<%=trashServer%>"){
		alert("此文件夹不能重命名！");
		return false;
	}
	var title = '请输入文件夹名：';
	var url = "<%=contextPath%>/jsp/bsp/mail/mail/pub_prompt.jsp?title="+title+"&promptName="+nodeName;
	var win = showModalDialog(url, window, "scroll:yes;status:no;dialogWidth:500px;dialogHeight:200px");
	if(win==undefined){
		return false;
	}
	if(__isQuoteIn(win)){
		alert("名称中不能含有特殊字符，请重新输入！");
		return false;
	}
	if(win==nodeName){
		alert("输入的名称与原名相同，请重新输入！");
		reName();
		return false;
	}
	getMainFrame().location.href="mailfoldertree.cmd?method=reNameFolder&folderName="+nodeName+"&fullName="+fullName+"&newName="+win;
}
function delete1()
{
	var nodeName = seltree.getValue("caption");
	var fullName = seltree.getValue("NodeId");
	if(fullName==0){
		alert('<%=ResourcesFactory.getString("MAIL_FOLDER.TREEMSGDELETEFORROOT")%>');
		return false;
	}
	if(fullName=="INBOX" || fullName=="<%=sendServer%>" || fullName=="<%=draftServer%>" || fullName=="<%=trashServer%>"){
		alert("此文件夹不能删除！");
		return false;
	}
	var children = seltree.getChildrenNodes(seltree.TreeConfig.TreeCurrentNode.children[0].NodeId);
	if(children.length != 0)
		var aler = '此目录下包含子文件夹！\n您确定要删除当前选中的目录吗？';
	else
		var aler = '<%=ResourcesFactory.getString("MAIL_FOLDER.TREEMSGDELETECONFIRM")%>';
	if(!confirm(aler))
		return false;
	getMainFrame().location.href="mailfoldertree.cmd?method=deleteFolder&folderName="+nodeName+"&fullName="+fullName;
}

</script>