<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_RESOURCE.INBOXMAIL_TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>


</HEAD>
<BODY topmargin="10px">
<% 
	String mailType=request.getParameter("mailType");
	if (mailType==null)
	{
		mailType="";
	}

	String totalNumber = "0";
	String otherNumber = "0";

	totalNumber = "" + request.getAttribute("totalNumber");
	otherNumber = "" + request.getAttribute("otherNumber");

	String url="<img src=\""+SkinUtils.getImage(request, "mail/folder.gif")+"\">";
%>


<bsp:container title="�ռ�����" >
<html:form name="frmList" action="inboxmailquery.cmd?mailType=0">
	<bsp:containbutton onclick="forAllSelect()" name="btn_all_select" text="ȫ��ѡ��" ></bsp:containbutton>
	<bsp:containbutton onclick="forReceive()" name="btn_receive"  text="��ȡ" ></bsp:containbutton>
	<bsp:containbutton onclick="forBack()" name="btn_back" text="�ظ�" ></bsp:containbutton>
	<bsp:containbutton onclick="forBackAll()"  name="btn_backAll" text="ȫ���ظ�" ></bsp:containbutton>
	<bsp:containbutton onclick="forForward()"  name="btn_forward" text="ת��" ></bsp:containbutton>
	<bsp:containbutton onclick="forInsertAddress()"  name="btn_address" text="�����ַ��" ></bsp:containbutton>
	<bsp:containbutton onclick="forInsert()"  name="btn_insert" text="���������" ></bsp:containbutton>

	<bsp:containbutton onclick="forDelete()" name="btn_delete" text="ɾ��"></bsp:containbutton>
	<bsp:containbutton onclick="forThoroughDelete()" name="btn_clear" text="����ɾ��" ></bsp:containbutton>
<table width="100%">
	<tr><td >�ʼ�����<%=totalNumber%>�⣬δ���ʼ���<%=otherNumber%>��&nbsp;&nbsp;&nbsp;&nbsp;<span id="message"><html:messages/></span></td></tr>
</table>

<html:hidden name="mailType" value="<%=mailType%>"/>
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
	<flex:checkboxCol caption="ѡ��" width="50" property="resourceId"  name="primaryKey" sortName="PUB_MAIL_RESOURCE.RESOURCE_ID" canSort="false"></flex:checkboxCol>
	<flex:flexCol caption='<%=url%>' width="50" property="imageUrl" sortName="PUB_MAIL_RESOURCE.STATUS" canSort="false" showTitle="false" ></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SENDER_NAME")%>' canSort="false" width="100" property="senderName" sortName="PUB_MAIL_RESOURCE.SENDER_NAME" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_FROM")%>' width="160" property="sendFrom" sortName="PUB_MAIL_RESOURCE.SEND_FROM"  canSort="true"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SUBJECT")%>' width="200" property="subject" style="text-decoration:underline;cursor:hand" onclick="forDetail()" sortName="PUB_MAIL_RESOURCE.SUBJECT"  canSort="true"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SEND_TIME")%>' width="120" property="sendTime" sortName="PUB_MAIL_RESOURCE.SEND_TIME"  canSort="true"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_RESOURCE.SIZE")%>' width="80" property="size" sortName="PUB_MAIL_RESOURCE.MAIL_SIZE"  canSort="true"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="inboxmailquery.cmd?mailType=0" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>

<!-- loading...ͼƬ -->
<img  id="loading" src='<%=SkinUtils.getImage(request, "loading.gif")%>' width="200" height="50" style="position:absolute;top:100;left:200;display:none">

<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(5,"center");
function forInsert(){
   var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��Ҫ����ļ�¼!");
    return false;
  }
  if(!confirm("����ȷҪ��ѡ�еĵ�ַ�������������"))
  {
  	return false;
  }
  else
  {
	  var dataAll=grid.getCheckAll();
	  	var senderName = "";
		var sendFrom = "";
		var arrTotle = dataAll.split("|");
		var arrTemp = new Array();
			for(var i=0;i<arrTotle.length;i++)
		{
			arrTemp = arrTotle[i].split(",");
		    senderName+=arrTemp[2]+",";
			sendFrom+=arrTemp[3]+",";
		}
		var name = senderName.substring(0,senderName.lastIndexOf(","));
		var mail = sendFrom.substring(0,sendFrom.lastIndexOf(","));
	  document.forms[0].action ="mailblacklist.cmd?method=insertForBlackList&name="+name+"&mail="+mail+"&mailType=0";  
	  document.forms[0].submit();
  }	
}
function forDetail()
{
	var rowIndex=grid.getCurrentLine();

	location.href="mailresource.cmd?method=detail&primaryKey="+grid.getCellValue(rowIndex,1);
}
function forThoroughDelete(){
  if(!getThoroughDelete()) return;
  document.forms[0].action ="mailresource.cmd?method=thoroughDelete&mailType=0";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mailresource.cmd?method=delete&mailType=0";    
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

//��ȡ�ʼ�
function forReceive()
{
  document.all("btn_receive").disabled=true;
  initMessage();
  document.forms[0].action ="inboxmailquery.cmd?mailType=0&receiveMail=1";  
  displayLoading("loading");
  document.forms[0].submit();	
}

//�����ַ��
function forInsertAddress()
{
	var sel=grid.getCheckLine();
	if(sel=="")
	{
		alert("��ѡ��һ��Ҫ����ļ�¼!");
		return false;
	}
	//����ֻ��ѡ��һ����ϵ��
	if( sel.indexOf(",") != -1 )
	{
		alert("��ѡ��һ��Ҫ����ļ�¼!");
		return false;
	}
	var topValue = ( screen.height - 400 ) / 2;
	var leftValue = ( screen.width - 560 ) / 2;
	if( topValue<0 ) topValue = 0;
	if( leftValue<0 ) leftValue = 0;
	var url ="mailaddress.cmd?method=forInboxCardInsert"; 
	window.open(url,"","height=400px, width=590px, top="+topValue+", left="+leftValue+", toolbar=no, menubar=no, scrollbars=yes, resizable=no,location=no, status=no") ;
}
//�ظ�
function forBack()
{
	var sel=grid.getCheckLine();
	if(sel=="")
	{
		alert("��ѡ��һ��Ҫ�ظ����ʼ�!");
		return false;
	}
	//����ֻ��ѡ��һ���ʼ�
	if( sel.indexOf(",") != -1 )
	{
		alert("��ѡ��һ��Ҫ�ظ����ʼ�!");
		return false;
	}

	var mailId = getMailId( grid.getCheckAll() );
	document.forms[0].action ="mailresource.cmd?method=forback&resourceId="+mailId;    
  	document.forms[0].submit();
}

//�ظ�
function forBackAll()
{
	var sel=grid.getCheckLine();
	if(sel=="")
	{
		alert("��ѡ��һ��Ҫȫ���ظ����ʼ�!");
		return false;
	}
	//����ֻ��ѡ��һ���ʼ�
	if( sel.indexOf(",") != -1 )
	{
		alert("��ѡ��һ��Ҫȫ���ظ����ʼ�!");
		return false;
	}
	var mailId = getMailId( grid.getCheckAll() );
	document.forms[0].action ="mailresource.cmd?method=forback&sign=1&resourceId="+mailId;    
  	document.forms[0].submit();	
}

//ת��
function forForward()
{
	var sel=grid.getCheckLine();
	if(sel=="")
	{
		alert("��ѡ��һ��Ҫת�����ʼ�!");
		return false;
	}
	//����ֻ��ѡ��һ���ʼ�
	if( sel.indexOf(",") != -1 )
	{
		alert("��ѡ��һ��Ҫת�����ʼ�!");
		return false;
	}
	var mailId = getMailId( grid.getCheckAll() );
	document.forms[0].action ="mailresource.cmd?method=fortransmit&resourceId="+mailId;    
  	document.forms[0].submit();	
}
//��ȡ�ʼ���ID
function getMailId( checkObj )
{
	var arrObj = checkObj.split( "," );
	return arrObj[0];
}
function initMessage(){
  if (document.getElementById("message").innerText!=""){
  	document.getElementById("message").innerText=" ";
  }
}
//ȫѡ
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
</script>