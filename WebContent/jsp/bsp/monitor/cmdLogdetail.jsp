<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>CMD日志明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="CMD日志明细" >
<bsp:containbutton onclick="forDetail()" text="对应安全日志明细" style="display:none"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="history.go(-1)" />
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    
      
       <tr style="display:none">
      <td class="tdTitle">CMD日志ID：</td>
      <td class="tdRight"><html:hidden name="logId" property="logId" write="true"/></td>
    </tr>
	  <tr>
      <td class="tdTitle">操作业务含义</td>
      <td class="tdRight"><html:hidden name="resourceAlias" property="resourceAlias" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">CMD名称：</td>
      <td class="tdRight"><html:hidden name="beanId" property="beanId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">方法名称：</td>
      <td class="tdRight"><html:hidden name="method" property="method" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">开始时间：</td>
      <td class="tdRight"><html:hidden name="startTime" property="startTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">结束时间：</td>
      <td class="tdRight"><html:hidden name="endTime" property="endTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">运行时间(单位：毫秒)：</td>
      <td class="tdRight"><html:hidden name="runTime" property="runTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">类名：</td>
      <td class="tdRight"><html:hidden name="beanClass" property="beanClass" write="true"/></td>
    </tr>
    <tr style="display:none">
      <td class="tdTitle">对应安全日志ID：</td>
      <td class="tdRight"><html:hidden name="securityLogId" property="securityLogId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">数据连接次数：</td>
      <td class="tdRight"><html:hidden name="connNumber" property="connNumber" write="true"/></td>
    </tr>

  </table>
 <div style="display:none">
 <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle" align="CENTER"><b>下面是对应CMD的统计信息</b></td>
    </tr>
  </table>
 
 <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle">总运行次数：</td>
      <td class="tdRight"><html:hidden name="excuteTimes" property="excuteTimes" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">最长运行时间：</td>
      <td class="tdRight"><html:hidden name="maxTime" property="maxTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">最短运行时间：</td>
      <td class="tdRight"><html:hidden name="minTime" property="minTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">对应的数据库平均连接次数：</td>
      <td class="tdRight"><html:hidden name="avgConnNumber" property="avgConnNumber" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">总运行时间：</td>
      <td class="tdRight"><html:hidden name="totalTime" property="totalTime" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">平均运行时间：</td>
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
	  alert("当前CMD日志没有对应的安全日志！");
	  return;
	  }
  document.forms[0].action ="securityLog.cmd?method=detail&logTime=%%&primaryKey="+securityLogId;     
  document.forms[0].submit();	
}

</script>
</HTML>
