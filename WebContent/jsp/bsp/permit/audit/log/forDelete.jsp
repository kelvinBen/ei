<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.bsp.util.DateUtil"%>

<%
    String currentDay = DateUtil.GetToday();
%>

<HTML>
<HEAD>
<TITLE>��ȫ��־��ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css_xp4.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>

<bsp:container title="����ɾ����־" >
<bsp:containbutton onclick="doDelete()" text="ִ��" action="securityLog.cmd?method=delete"/>
<bsp:containbutton onclick="forReturn()" text="����"></bsp:containbutton>
<html:form name="frmList" action="securityLog.cmd">
<table width="100%" cellspacing="0" class="tblContent">
<tr>
<td  class="tdTitle">
��ʼ���ڣ�
</td>
<td class="tdRight">
<date:date name="fromDay" divname="date1" value="<%=currentDay%>" zindex="12" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd" />
<FONT COLOR=#ff0000>*</FONT><input style="visibility:hidden">
</td>

</tr>
<tr>
<td  class="tdTitle">
�������ڣ�
</td>
<td class="tdRight">
<date:date name="toDay" divname="date2" value="<%=currentDay%>" zindex="11" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd" />
<FONT COLOR=#ff0000>*</FONT><input style="visibility:hidden">
</td>

</tr>
</table>
</html:form>
</bsp:container>
</body>
<script language="javascript">
function doDelete(){
	var time1=document.forms[0].fromDay;
	var time2=document.forms[0].toDay;
	
	if(time1.value==""){
	alert("��ʼ���ڲ�����Ϊ�գ�");
	time1.focus();
	return false;
	}
	if(time2.value==""){
	alert("�������ڲ�����Ϊ�գ�");
	time2.focus();
	return false;
	}
	
 	if(!checkDateFormat("yyyyMMdd",time1.value)){
  	alert("��ʼ���ڸ�ʽӦ����'yyyyMMdd'����ʽ��");
  	document.all("fromDay").select();
    document.all("fromDay").focus();
    return false;
  }
  
  if(!checkDateFormat("yyyyMMdd",time2.value)){
  	alert("�������ڸ�ʽӦ����'yyyyMMdd'����ʽ��");
  	document.all("toDay").select();
    document.all("toDay").focus();
    return false;
  }
	if(time1.value>time2.value){
	alert("��ʼ���ڲ��ܱȽ���������");
	return false;
	}


  document.forms[0].action ="securityLog.cmd?method=delete";    
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="querySecurityLog.cmd";
  document.forms[0].submit();	
}


</script>
</html>
