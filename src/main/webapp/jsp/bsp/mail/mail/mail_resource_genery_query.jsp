<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="java.util.*"%>
<HTML>
<HEAD>
<TITLE>邮件信息表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<%
	String mailType=request.getParameter("mailType");
	if (mailType==null){
		mailType="";
	}
	String serverType=(String)request.getAttribute("serverType");
	if (serverType==null){
		serverType="";
	}
	String mailType2=(String)request.getAttribute("mailType1");
	if (mailType2==null){
		mailType2="";
	}
	
	String url="<img src=\""+SkinUtils.getImage(request, "322.gif")+"\">";
	
	String priority = "";
	String subject = "";
	String mailType1 = "";
	String sendName = "";
	String sendTimeS = "";
	String sendTimeE = "";
	String count = "";
	String sendFrom="";
	if(request.getAttribute("priority")!=null)
	{
		priority = (String)request.getAttribute("priority");
	}
	if(request.getAttribute("subject")!=null)
	{
		subject = (String)request.getAttribute("subject");
	}
	if(request.getAttribute("mailType1")!=null)
	{
		mailType1 = (String)request.getAttribute("mailType1");
	}
	if(request.getAttribute("sendName")!=null)
	{
		sendName = (String)request.getAttribute("sendName");
	}
	if(request.getAttribute("sendTimeS")!=null)
	{
		sendTimeS = (String)request.getAttribute("sendTimeS");
	}
	if(request.getAttribute("sendTimeE")!=null)
	{
		sendTimeE = (String)request.getAttribute("sendTimeE");
	}
	if(request.getAttribute("count")!=null)
	{
		count = (String)request.getAttribute("count");
	}
	if(request.getAttribute("sendFrom")!=null)
	{
		sendFrom = (String)request.getAttribute("sendFrom");
	}
%>
<bsp:container title="查询邮件" >
<html:form name="frmList" action="" onsubmit="return search()">
<html:hidden name="mailType" value="<%=mailType%>"/>
<table id="tblSearch" >
	<tr>
		<%if(serverType.trim().equals("1")){ %>
			<td align="left" nowrap>邮件类型：</td>
			<td>
			<html:select name="mailType1" value="<%=mailType1%>">
			<html:options collection="MAILRESOURCE_MAILTYPE_ALL_COLLECTION" labelProperty="value" property="key"/>
			</html:select>
			</td>
		<%} else if(serverType.trim().equals("2")) {%>
			<td align="left" nowrap>请选择检索的文件夹：</td>
			<td>
			<html:select name="mailType1" value="<%=mailType1%>">
			<html:options collection="tree" labelProperty="label" property="value"/>
			</html:select>
			</td>
		<% } %>
		<td align="left" nowrap>邮件级别：</td>
		<td>
		<html:select name="priority" value="<%=priority%>">
		<html:options collection="MAILRESOURCE_PRIORITY_ALL_COLLECTION" labelProperty="value" property="key"/>
		</html:select>
		</td>
		<td align="left" nowrap>主题：</td>
		<td><html:text name="subject"  size="15" maxlength="20" value="<%=subject%>"/></td>
		<td align="left" nowrap>发件人地址：</td>
        <td><html:text name="sendFrom" size="10" maxlength="80" value="<%=sendFrom%>" /></td>  
		
     </tr>  
     <tr>  
		<td align="left" nowrap>是否带有附件：</td>
		<td>
		<html:select name="count" value="<%=count%>">
		<html:options collection="MAILRESOURCE.ISATTACHMENT_COLLECTION" labelProperty="value" property="key"/>
		</html:select>
		</td>
		<td align="left" nowrap>发件人：</td>
		<td><html:text name="sendName" size="15" maxlength="10" value="<%=sendName%>" /></td>
			<td align="left" nowrap>收取时间段：</td>
		<td valign=top style="height:25" >
		<date:date name="sendTimeS" divname="sendTimeSS" sourceFormat="yyyyMMdd"  targetFormat="yyyyMMdd" value="<%=sendTimeS%>" readonly="true" style="width:65">
		</date:date>&nbsp;-</td>
		<td  style="border-bottom:1 solid"><date:date name="sendTimeE" divname="sendTimeEE" sourceFormat="yyyyMMdd"  targetFormat="yyyyMMdd" value="<%=sendTimeE%>" readonly="true" style="width:65">
		</date:date>&nbsp;</td><td><flex:searchImg name="chaxun" action="" image="search.gif"/></td>
     </tr>
  
</table>

<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
                          <flex:flexCol caption="选择" width="50" property="resourceId"  name="primaryKey" sortName="PUB_MAIL_RESOURCE.RESOURCE_ID" canSort="false"  style="display:none"></flex:flexCol>
                          <flex:flexCol caption='<%=url%>' width="50" property="imageUrl" canSort="false"  showTitle="false" sortName="PUB_MAIL_RESOURCE.STATUS"></flex:flexCol>
                          <flex:flexCol caption='发件人邮箱' width="160" property="sendFrom" sortName="PUB_MAIL_RESOURCE.SEND_FROM" ></flex:flexCol>
                          <flex:flexCol caption='主题' width="200" property="subject"  style="text-decoration:underline;cursor:hand;text-align:left" onclick="forDetail()" sortName="PUB_MAIL_RESOURCE.SUBJECT" ></flex:flexCol>
                          <flex:flexCol caption='日期' width="120" property="sendTime"  sortName="PUB_MAIL_RESOURCE.SEND_TIME"></flex:flexCol>
                          <flex:flexCol caption='大小' width="80" property="size" sortName="PUB_MAIL_RESOURCE.MAIL_SIZE" ></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mailresourcegeneryquery.cmd?mailType=-1" pageSize="15" >
</flex:pagePolit>


<input type="hidden" name="sql" value=""/>  
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(4,"center");
function checkResourceMail()
{
	var sendTime1 = document.forms[0].sendTimeS;
	var sendTime2 = document.forms[0].sendTimeE;
	if(sendTime1.value!="" && sendTime2.value!="")
	{
		var arr1 = sendTime1.value.split("-");
		var arr2 = sendTime2.value.split("-");
		if(parseInt(arr1[0]+arr1[1]+arr1[2])>parseInt(arr2[0]+arr2[1]+arr2[2]))
		{
			alert("开始日期不能大于结束日期！");
		    sendTime1.select();
	    	sendTime1.focus();
	    	return false;
		}
	}
    return true;
    
}
function search()
{	if(!checkResourceMail()) return false ;
	document.forms[0].action ="mailresourcegeneryquery.cmd?mailType=-1";    
	document.forms[0].submit();	
}

function forDetail()
{   <%if(serverType.trim().equals("1")){ %>
		var condtion = document.forms[0].mailType1.value+","+document.forms[0].priority.value+","+document.forms[0].subject.value+","+document.forms[0].sendName.value+","+document.forms[0].sendTimeS.value+","+document.forms[0].sendTimeE.value+","+document.forms[0].count.value;
		var rowIndex=grid.getCurrentLine();
		window.location.href="mailresource.cmd?method=detail&primaryKey="+grid.getCellValue(rowIndex,1)+"&mailType1=<%=mailType%>&condtion="+condtion;
	<%} else if(serverType.trim().equals("2")) {%>
		var rowIndex=grid.getCurrentLine();
		var condtion = document.forms[0].mailType1.value+","+document.forms[0].priority.value+","+document.forms[0].subject.value+","+document.forms[0].sendName.value+","+document.forms[0].sendTimeS.value+","+document.forms[0].sendTimeE.value+","+document.forms[0].sendFrom.value+","+document.forms[0].count.value;
		window.location.href="mailresource.cmd?method=detail&mailType=6&primaryKey="+grid.getCellValue(rowIndex,1)+"&condtion="+condtion;
	<% } %>
	
}

</script>