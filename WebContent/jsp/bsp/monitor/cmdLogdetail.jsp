<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>CMD��־��ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="CMD��־��ϸ" >
<bsp:containbutton onclick="forDetail()" text="��Ӧ��ȫ��־��ϸ" style="display:none"></bsp:containbutton>
<bsp:containbutton text="����" onclick="history.go(-1)" />
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    
      
       <tr style="display:none">
      <td class="tdTitle">CMD��־ID��</td>
      <td class="tdRight"><html:hidden name="logId" property="logId" write="true"/></td>
    </tr>
	  <tr>
      <td class="tdTitle">����ҵ����</td>
      <td class="tdRight"><html:hidden name="resourceAlias" property="resourceAlias" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">CMD���ƣ�</td>
      <td class="tdRight"><html:hidden name="beanId" property="beanId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">�������ƣ�</td>
      <td class="tdRight"><html:hidden name="method" property="method" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">��ʼʱ�䣺</td>
      <td class="tdRight"><html:hidden name="startTime" property="startTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">����ʱ�䣺</td>
      <td class="tdRight"><html:hidden name="endTime" property="endTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">����ʱ��(��λ������)��</td>
      <td class="tdRight"><html:hidden name="runTime" property="runTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">������</td>
      <td class="tdRight"><html:hidden name="beanClass" property="beanClass" write="true"/></td>
    </tr>
    <tr style="display:none">
      <td class="tdTitle">��Ӧ��ȫ��־ID��</td>
      <td class="tdRight"><html:hidden name="securityLogId" property="securityLogId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">�������Ӵ�����</td>
      <td class="tdRight"><html:hidden name="connNumber" property="connNumber" write="true"/></td>
    </tr>

  </table>
 <div style="display:none">
 <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle" align="CENTER"><b>�����Ƕ�ӦCMD��ͳ����Ϣ</b></td>
    </tr>
  </table>
 
 <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle">�����д�����</td>
      <td class="tdRight"><html:hidden name="excuteTimes" property="excuteTimes" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">�����ʱ�䣺</td>
      <td class="tdRight"><html:hidden name="maxTime" property="maxTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">�������ʱ�䣺</td>
      <td class="tdRight"><html:hidden name="minTime" property="minTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">��Ӧ�����ݿ�ƽ�����Ӵ�����</td>
      <td class="tdRight"><html:hidden name="avgConnNumber" property="avgConnNumber" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">������ʱ�䣺</td>
      <td class="tdRight"><html:hidden name="totalTime" property="totalTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">ƽ������ʱ�䣺</td>
      <td class="tdRight"><html:hidden name="avgTime" property="avgTime" write="true"/></td>
    </tr>

  </table>
  </div>
</div>
</bsp:container>
</html:form>
</BODY>
<script language="javascript">
function forDetail(){
  
  var securityLogId = document.all("securityLogId").value;
  if(securityLogId==""){
	  alert("��ǰCMD��־û�ж�Ӧ�İ�ȫ��־��");
	  return;
	  }
  document.forms[0].action ="securityLog.cmd?method=detail&logTime=%%&primaryKey="+securityLogId;     
  document.forms[0].submit();	
}

</script>
</HTML>
