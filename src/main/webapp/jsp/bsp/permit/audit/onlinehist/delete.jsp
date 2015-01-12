<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>删除某一时间段内的用户在线历史记录</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css_xp4.css'/>">
</HEAD>
<%
      String begindate=(String)request.getAttribute("begindate");
      if(begindate==null)
          begindate="";
      String enddate=(String)request.getAttribute("enddate");
      if(enddate==null)
          enddate="";
%>
<BODY topmargin="10px">
<script language="javascript"   src="<mast:ui js='calendar.js'/>"></script>

<bsp:container height="100" title="删除某一时间段内的用户在线历史记录" >
<bsp:containbutton onclick="forDeleteDay()" text="当日删除" action="onlinehist.cmd?method=fordeleteday"></bsp:containbutton>
<bsp:containbutton onclick="forDeleteWeek()" text="当周删除" action="onlinehist.cmd?method=fordeleteweek"></bsp:containbutton>
<bsp:containbutton onclick="forDeleteMonth()" text="当月删除" action="onlinehist.cmd?method=fordeletemonth"></bsp:containbutton>
<bsp:containbutton text="指定时间段删除" onclick="forDelete()" action="onlinehist.cmd?method=deleteBetween"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()"></bsp:containbutton>
<html:form  name="frmList"  action="">
<div align="center">
  <table width="100%" cellspacing="0" class="tblContent">
                    <tr>
                     <td  class="tdTitle">开始时间：
                     </td>
                     <td class="tdRight">
                      <date:date name="begindate" value="" divname="divDate1" hastime="true" value="<%=begindate%>" readonly="true" zindex="12" sourceFormat="yyyyMMdd hh:mm" targetFormat="yyyyMMdd hh:mm"/>
                     <input style="visibility:hidden">
                     </td>
                     </tr>
                     <tr>
                     <td  class="tdTitle">截止时间：
                     </td>
                     <td class="tdRight">
                      <date:date name="enddate" value="" divname="divDate2" hastime="true" value="<%=enddate%>" readonly="true" zindex="11" sourceFormat="yyyyMMdd hh:mm" targetFormat="yyyyMMdd hh:mm"/>
                     <input style="visibility:hidden">
                     </td>
                    </tr>                 
                    
   </table>
</div>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
function forDeleteDay(){
    if (!confirm("您确认要删除当日的历史记录吗?")) {
   	  return false;
    }  
  document.forms[0].action ="onlinehist.cmd?method=fordeleteday";    
  document.forms[0].submit();	
}
function forDeleteWeek(){
    if (!confirm("您确认要删除当周的历史记录吗?")) {
   	  return false;
    }  
  document.forms[0].action ="onlinehist.cmd?method=fordeleteweek";    
  document.forms[0].submit();	
}
function forDeleteMonth(){
    if (!confirm("您确认要删除当月的历史记录吗?")) {
   	  return false;
    }  
  document.forms[0].action ="onlinehist.cmd?method=fordeletemonth";    
  document.forms[0].submit();	
}
function forDelete(){
  var begin=document.all("begindate").value;
  var end=document.all("enddate").value;
  if(begin ==""){
    alert("开始时间不能为空！");
    return false;
  }
    if(end ==""){
    alert("截止时间不能为空！");
    return false;
  }
  if(begin>=end){
    alert("开始时间不可以晚于截止时间！");
    return false;
  }
    if (!confirm("您确认要删除历史记录吗?")) {
   	  return false;
   	 }  
   	 
  document.forms[0].action ="onlinehist.cmd?method=deleteBetween&begindate="+begin+"&enddate="+end;
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="onlinehistquery.cmd";
  document.forms[0].submit();	
}

</script>