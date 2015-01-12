<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.bsp.mail.MailPropertiesTool"%>
<%@ page import="net.mast.bsp.mail.TitleServerMapMail"%>
<HTML>
<%
	TitleServerMapMail titleServer = new TitleServerMapMail();
		String sendServer = titleServer.getSendServer();
		String draftServer = titleServer.getDraftServer();
		String trashServer = titleServer.getTrashServer();
%>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_RESOURCE.INBOXMAIL_TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<html:form name="frmList" action="">
<div class="btnareaCss">
<table width="100%">
	<tr><td height="25"><span id="message"><html:messages/></span></td></tr>
</table>
</div>
<!-- 142 -->
<flex:flexgrid name="grid" height="250" action="" isSubmit="false">
	<flex:flexCol caption='文件夹' canSort="false" width="100" property="folderName" style="text-decoration:underline;cursor:hand" onclick="forQueryList()" sortName="PUB_MAIL_RESOURCE.mailType"></flex:flexCol>
	<flex:flexCol caption='邮件数' type="double" format="0#;" width="100" property="totalNum" sortName="PUB_MAIL_RESOURCE.totalNum" isSum="true" canSort="false" ></flex:flexCol>
	<flex:flexCol caption='未读邮件数' type="double" format="0#;"  width="100" property="unReadNum"  sortName="PUB_MAIL_RESOURCE.unReadNum" isSum="true" canSort="false" ></flex:flexCol>
	<flex:flexCol caption='新邮件数' type="double" format="0#;"  width="100" property="newNum"  sortName="PUB_MAIL_RESOURCE.newNum" isSum="true" canSort="false" ></flex:flexCol>
	<flex:flexCol caption='文件夹路径' canSort="false" width="100" property="folderFullName" sortName="PUB_MAIL_RESOURCE.mailType" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="" pageSize="10">
</flex:pagePolit>
</html:form>
</body>
</html>
<script language="javascript">
grid.show();
function forQueryList()
{
	var rowIndex=grid.getCurrentLine();
	var fullName = grid.getCellValue(rowIndex,5);
	if(fullName=="INBOX")
		{
			window.location.href="inboxmailquery.cmd?mailType=0&fullName="+fullName+"&serverType=2";
		}
	else 
	if(fullName=="<%=sendServer%>")
	{
		window.location.href="sendmailquery.cmd?mailType=1&fullName="+fullName+"&serverType=2";
	}
	
	else 
	if(fullName=="<%=trashServer%>")
	{
		window.location.href="garbagemailquery.cmd?mailType=4&fullName="+fullName+"&serverType=2";
	}
	
	
	else
	if(fullName=="<%=draftServer%>")
	{
		window.location.href="draftmailquery.cmd?mailType=3&fullName="+fullName+"&serverType=2";
	}
	
	else
	{
		window.location.href="custommailquery.cmd?mailType=5&fullName="+fullName+"&serverType=2";
	}

}
</script>