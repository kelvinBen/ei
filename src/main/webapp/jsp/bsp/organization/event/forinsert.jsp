<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>�����¼�����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubHrEvent(){
	  var eventId = document.forms[0].eventId;
    	eventId.value = trim(eventId.value) ;
	  var struId = document.forms[0].struId;
	if (trim(struId.value)=="")
	{
	  alert("������ṹ���룡");    
	  return false;
	}
   	 struId.value = trim(struId.value) ;
	  var scn = document.forms[0].scn;
	if (trim(scn.value)=="")
	{
	  alert("������ϵͳ���ĺţ�");    
	  return false;
	}
    	scn.value = trim(scn.value) ;
	  var eventType = document.forms[0].eventType;
	if (trim(eventType.value)=="")
	{
	  alert("�����������¼����ͣ�");    
	  return false;
	}
    	eventType.value = trim(eventType.value) ;
	  var eventDate = document.forms[0].eventDate;
	if (trim(eventDate.value)=="")
	{
	  alert("������������ڣ�");    
	  return false;
	}
   	 eventDate.value = trim(eventDate.value) ;
	  var eventMemo = document.forms[0].eventMemo;
    	eventMemo.value = trim(eventMemo.value) ;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="�����¼�����" >
<bsp:containbutton text="����" onclick="forSave()" action="hrevent.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action="hreventquery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
	<html:hidden name="eventId" property="eventId" write="false"/>            
				  	<tr>
				      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT.STRU_ID")%>��</td>
				      <td class="tdRight">
				      	<html:text name="struId" property="struId" size="30" maxlength="30" />
				      </td>
				    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT.SCN")%>��</td>
                    <td class="tdRight"><html:text name="scn" property="scn" size="8" maxlength="8" /></td>
                    </tr>                    
				  	<tr>
				      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT.EVENT_TYPE")%>��</td>
				      <td class="tdRight">
				      	 <html:text name="eventType" property="eventType" size="30" maxlength="30" />
				      </td>
				    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT.EVENT_DATE")%>��</td>
                    <td class="tdRight"><html:text name="eventDate" property="eventDate" size="8" maxlength="8" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT.EVENT_MEMO")%>��</td>
                    <td class="tdRight"><html:text name="eventMemo" property="eventMemo" size="50" maxlength="250" /></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubHrEvent()) return;	
  document.forms[0].action ="hrevent.cmd?method=insert";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="hreventquery.cmd";
  document.forms[0].submit();	
}

</script>