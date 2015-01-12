<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.bsp.mail.TitleServerMapMail"%>
<HTML>
<HEAD>
<TITLE>�ҵ��ʼ�-�ݸ�����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:messages/>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<% 
	String mailType=request.getParameter("mailType");
	if (mailType==null){
		mailType="";
	}
	String url="<img src=\""+SkinUtils.getImage(request, "mail/folder.gif")+"\">";
	String fullName = (String)request.getAttribute("fullName");
	String url2="draftmailquery.cmd?mailType=3&fullName="+fullName;
	String serverType = (String)request.getAttribute("serverType");
	
	TitleServerMapMail titleServer = new TitleServerMapMail();
	String draftTitle = titleServer.getDraftTitle();
%>
<html:form name="frmList" action="<%=url2%>">
<bsp:container title="�ݸ�����" >
	<bsp:containbutton onclick="forAllSelect()" name="btn_all_select" text="ȫ��ѡ��" ></bsp:containbutton>	
	<bsp:containbutton onclick="forDelete()" name="btn_delete" text="ɾ��" ></bsp:containbutton>
	<bsp:containbutton onclick="forThoroughDelete()" name="btn_delete" text="����ɾ��" ></bsp:containbutton>
	<%if(serverType.trim().equals("2")){%>
	<bsp:containbutton onclick="moveTo()" name="btn_move" text="�ƶ�" ></bsp:containbutton>
	<%}%>

<html:hidden name="mailType" value="<%=mailType%>"/>
<html:hidden name="fullName" value="<%=fullName%>"/>
<html:hidden name="serverType" value="<%=serverType%>"/>
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
	<flex:checkboxCol caption="ѡ��" width="50" property="resourceId"  name="primaryKey" sortName="PUB_MAIL_RESOURCE.RESOURCE_ID"></flex:checkboxCol>
	<flex:flexCol caption='<%=url%>' width="50" property="imageUrl" canSort="false" showTitle="false" sortName="PUB_MAIL_RESOURCE.STATUS"></flex:flexCol>
	<%if(serverType.trim().equals("1")){%>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_TO")%>' width="160" property="sendTo2" canSort="false" sortName="PUB_MAIL_RESOURCE.SEND_TO"></flex:flexCol>
	<%} else {%>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_TO")%>' width="160" property="sendTo2" sortName="PUB_MAIL_RESOURCE.SEND_TO"></flex:flexCol>
	<%}%>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SUBJECT")%>' width="200" property="subject" style="text-decoration:underline;cursor:hand" onclick="doUpdate()" sortName="PUB_MAIL_RESOURCE.SUBJECT"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_TIME")%>' width="120" property="sendTime" sortName="PUB_MAIL_RESOURCE.SEND_TIME"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SIZE")%>' width="80" property="size" sortName="PUB_MAIL_RESOURCE.MAIL_SIZE"></flex:flexCol>
        </flex:flexgrid>
<flex:pagePolit action="<%=url2%>">
</flex:pagePolit>
</bsp:container>
</html:form>
<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(4,"center");
function doUpdate(){
	var serverType = document.all("serverType").value;
	var fullName = document.all("fullName").value;
	var rowIndex=grid.getCurrentLine();
	window.location.href="mailresource.cmd?method=forupdate&resourceId="+grid.getCellValue(rowIndex,1)+"&fullName="+fullName+"&serverType="+serverType;
}
function forDetail()
{
	if(!getDetail()) return;
	document.forms[0].action="mailresource.cmd?method=detail";
	document.forms[0].submit();
}
function forThoroughDelete(){
	if(!getThoroughDelete()) return;
	document.forms[0].action ="mailresource.cmd?method=thoroughDelete&mailType=3";    
	document.forms[0].submit();	
}
function forDelete(){
	if(!getDelete()) return;
	document.forms[0].action ="mailresource.cmd?method=delete&mailType=3";    
	document.forms[0].submit();	
}
function getDetail()
{
	var sel=grid.getCheckLine();
	if(sel==""){
		alert("��ѡ��Ҫ�鿴���ʼ�!");
		return false;
	}
	var obj=sel.split(",");  
	if(obj.length*1>1){
		alert("��ѡ��һ���ʼ�!");
		return false;
	}  
	return true;
}
function getDelete(){
	var sel=grid.getCheckLine();
	if(sel==""){
		alert("��ѡ��Ҫɾ�����ʼ�!");
		return false;
	}
	if (!confirm("��Ҫɾ��ѡ�е��ʼ���Ҫ������")) {
		return false;
	}  
	return true;
}

function getThoroughDelete(){
	var sel=grid.getCheckLine();
	if(sel==""){
		alert("��ѡ��Ҫ����ɾ�����ʼ�!");
		return false;
	}
	if (!confirm("��Ҫ����ɾ��ѡ�е��ʼ����˲������ɻָ���Ҫ������")) {
		return false;
	}  
	return true;
}
var flag=true;
function forAllSelect(){
	var btn_all_select=event.srcElement;
  	if(flag==true){
  		btn_all_select.value="ȡ��ȫѡ";
  		grid.doCheckAllLine(true);
  		flag=false;
  	}else{
  		btn_all_select.value="ȫ��ѡ��";
  		grid.doCheckAllLine(false);
  		flag=true;
  	}
}
function moveTo(){
	if(!getMove())return;
	var fullName = document.all("fullName").value;
	var url = "jsp/help.jsp?url=mailresource.cmd&method=mailFolderList&fullName="+fullName;
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	if(win==null)return;
	var folderFullName = win[0];
	document.forms[0].action ="mailresource.cmd?method=copyToFolder&mailType=3&folderFullName="+folderFullName;   
	document.forms[0].submit();
}
function getMove(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��Ҫ�ƶ����ʼ�!");
    return false;
  }
  return true;
}
</script>