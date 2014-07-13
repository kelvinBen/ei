<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>我的邮件-已发送邮箱</TITLE>
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
%>
<span id="message"><html:messages/></span>
<bsp:container title="已发送邮件" >
<html:form name="frmList" action="">

	<bsp:containbutton onclick="forAllSelect()" name="btn_all_select" text="全部选择" ></bsp:containbutton>
	<bsp:containbutton onclick="forDelete()" name="btn_detail" text="删除" ></bsp:containbutton>
	<bsp:containbutton onclick="forThoroughDelete()" name="btn_delete" text="彻底删除" ></bsp:containbutton>
<html:hidden name="mailType" value="<%=mailType%>"/>
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
	<flex:checkboxCol caption="选择" width="50" property="resourceId"  name="primaryKey" canSort="false" sortName="PUB_MAIL_RESOURCE.RESOURCE_ID"></flex:checkboxCol>
	<flex:flexCol caption='<%=url%>' width="50" property="imageUrl" canSort="false" showTitle="false" sortName="PUB_MAIL_RESOURCE.STATUS"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_TO")%>'  width="160" property="sendTo2" canSort="false" sortName="PUB_MAIL_RESOURCE.SEND_TO"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SUBJECT")%>' width="200" property="subject" style="text-decoration:underline;cursor:hand" onclick="forDetail()" sortName="PUB_MAIL_RESOURCE.SUBJECT"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_TIME")%>' width="120" property="sendTime" sortName="PUB_MAIL_RESOURCE.SEND_TIME"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SIZE")%>' width="80" property="size" sortName="PUB_MAIL_RESOURCE.MAIL_SIZE"></flex:flexCol>
 </flex:flexgrid>
<flex:pagePolit action="alreadysendmailquery.cmd?mailType=2" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(4,"center");

function forThoroughDelete(){
  if(!getThoroughDelete()) return;
  document.forms[0].action ="mailresource.cmd?method=thoroughDelete&mailType=2";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mailresource.cmd?method=delete&mailType=2";    
  document.forms[0].submit();	
}
function forDetail()
{
	var rowIndex=grid.getCurrentLine();
	window.location.href="mailresource.cmd?method=detail&primaryKey="+grid.getCellValue(rowIndex,1);
}
function getDetail()
{
 var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要查看的邮件!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一封邮件!");
    return false;
  }  
  return true;
}
function getDelete(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要删除的邮件!");
    return false;
  }
  if (!confirm("将要删除选中的邮件，要继续吗？")) {
   	     return false;
   	     }  
  return true;
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
</script>