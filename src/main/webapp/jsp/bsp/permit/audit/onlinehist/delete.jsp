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
<TITLE>ɾ��ĳһʱ����ڵ��û�������ʷ��¼</TITLE>
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

<bsp:container height="100" title="ɾ��ĳһʱ����ڵ��û�������ʷ��¼" >
<bsp:containbutton onclick="forDeleteDay()" text="����ɾ��" action="onlinehist.cmd?method=fordeleteday"></bsp:containbutton>
<bsp:containbutton onclick="forDeleteWeek()" text="����ɾ��" action="onlinehist.cmd?method=fordeleteweek"></bsp:containbutton>
<bsp:containbutton onclick="forDeleteMonth()" text="����ɾ��" action="onlinehist.cmd?method=fordeletemonth"></bsp:containbutton>
<bsp:containbutton text="ָ��ʱ���ɾ��" onclick="forDelete()" action="onlinehist.cmd?method=deleteBetween"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()"></bsp:containbutton>
<html:form  name="frmList"  action="">
<div align="center">
  <table width="100%" cellspacing="0" class="tblContent">
                    <tr>
                     <td  class="tdTitle">��ʼʱ�䣺
                     </td>
                     <td class="tdRight">
                      <date:date name="begindate" value="" divname="divDate1" hastime="true" value="<%=begindate%>" readonly="true" zindex="12" sourceFormat="yyyyMMdd hh:mm" targetFormat="yyyyMMdd hh:mm"/>
                     <input style="visibility:hidden">
                     </td>
                     </tr>
                     <tr>
                     <td  class="tdTitle">��ֹʱ�䣺
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
    if (!confirm("��ȷ��Ҫɾ�����յ���ʷ��¼��?")) {
   	  return false;
    }  
  document.forms[0].action ="onlinehist.cmd?method=fordeleteday";    
  document.forms[0].submit();	
}
function forDeleteWeek(){
    if (!confirm("��ȷ��Ҫɾ�����ܵ���ʷ��¼��?")) {
   	  return false;
    }  
  document.forms[0].action ="onlinehist.cmd?method=fordeleteweek";    
  document.forms[0].submit();	
}
function forDeleteMonth(){
    if (!confirm("��ȷ��Ҫɾ�����µ���ʷ��¼��?")) {
   	  return false;
    }  
  document.forms[0].action ="onlinehist.cmd?method=fordeletemonth";    
  document.forms[0].submit();	
}
function forDelete(){
  var begin=document.all("begindate").value;
  var end=document.all("enddate").value;
  if(begin ==""){
    alert("��ʼʱ�䲻��Ϊ�գ�");
    return false;
  }
    if(end ==""){
    alert("��ֹʱ�䲻��Ϊ�գ�");
    return false;
  }
  if(begin>=end){
    alert("��ʼʱ�䲻�������ڽ�ֹʱ�䣡");
    return false;
  }
    if (!confirm("��ȷ��Ҫɾ����ʷ��¼��?")) {
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