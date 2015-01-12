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
<TITLE>我的邮件-垃圾邮箱</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
	String mailType=request.getParameter("mailType");
	if (mailType==null){
		mailType="";
	}
	String url="<img src=\""+SkinUtils.getImage(request, "mail/folder.gif")+"\">";
	String fullName = (String)request.getAttribute("fullName");
	String url2="garbagemailquery.cmd?mailType=4&fullName="+fullName;
	String serverType = (String)request.getAttribute("serverType");
	
	TitleServerMapMail titleServer = new TitleServerMapMail();
	String trashTitle = titleServer.getTrashTitle();
%>
<span id="message"><html:messages/></span>
<html:form name="frmList" action="<%=url2%>">
<bsp:container title="垃圾邮箱" >
	<bsp:containbutton onclick="forAllSelect()" name="btn_all_select" text="全部选择" ></bsp:containbutton>
	<bsp:containbutton onclick="forThoroughDelete()" name="btn_delete" text="彻底删除" ></bsp:containbutton>
	<%if(serverType.trim().equals("2")){%>
	<bsp:containbutton onclick="moveTo()" name="btn_move" text="移动" action=""></bsp:containbutton>
	<%}%>

<html:hidden name="mailType" value="<%=mailType%>"/>
<html:hidden name="fullName" value="<%=fullName%>"/>
<html:hidden name="serverType" value="<%=serverType%>"/>
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
	<flex:checkboxCol caption="选择" width="50" property="resourceId"  name="primaryKey" canSort="false" sortName="PUB_MAIL_RESOURCE.RESOURCE_ID"></flex:checkboxCol>
	<flex:flexCol caption='<%=url%>' width="50" property="imageUrl" canSort="false" showTitle="false" sortName="PUB_MAIL_RESOURCE.STATUS"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_FROM")%>'  width="160" property="sendFrom" sortName="PUB_MAIL_RESOURCE.SEND_FROM"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SUBJECT")%>'  width="200" property="subject" style="text-decoration:underline;cursor:hand" onclick="forDetail()" sortName="PUB_MAIL_RESOURCE.SUBJECT"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_TIME")%>'  width="120" property="sendTime" sortName="PUB_MAIL_RESOURCE.SEND_TIME"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SIZE")%>'  width="80" property="size" sortName="PUB_MAIL_RESOURCE.MAIL_SIZE"></flex:flexCol>
        </flex:flexgrid>
<flex:pagePolit action="<%=url2%>" pageSize="15">
</flex:pagePolit>
</bsp:container>
</html:form>
<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(4,"center");
function forThoroughDelete(){
  if(!getThoroughDelete()) return;
  document.forms[0].action ="mailresource.cmd?method=thoroughDelete&mailType=4";    
  document.forms[0].submit();	
}
function forDetail()
{
	var fullName = document.all("fullName").value;
	var rowIndex=grid.getCurrentLine();
	window.location.href="mailresource.cmd?method=detail&primaryKey="+grid.getCellValue(rowIndex,1)+"&fullName="+fullName;
}
function getThoroughDelete(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要彻底删除的邮件!");
    return false;
  }
  if (!confirm("将要彻底删除选中的邮件，此操作不可恢复，要继续吗？")) {
   	     return false;
   	     }  
  return true;
}
var flag=true;
function forAllSelect(){
	var btn_all_select=event.srcElement;
  	if(flag==true){
  		btn_all_select.value="取消全选";
  		grid.doCheckAllLine(true);
  		flag=false;
  	}else{
  		btn_all_select.value="全部选择";
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
	document.forms[0].action ="mailresource.cmd?method=copyToFolder&mailType=4&folderFullName="+folderFullName;   
	document.forms[0].submit();
}
function getMove(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要移动的邮件!");
    return false;
  }
  return true;
}
</script>