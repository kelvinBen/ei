<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>复杂消息明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="复杂消息明细" >
<bsp:containbutton action="mpcmpmessag.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="mpcmpmessagquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$id" write="false"/>
	<tr>	                   
<!-- 主键 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_CMP_MESSAG.ID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="id" property="id" write="true"/></td>
     
<!-- 消息内容 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_CMP_MESSAG.Contents")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="contents" property="contents" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 消息格式 -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_CMP_MESSAG.MSG_TYPE")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="msgType" property="msgType" collection="MPCMPMESSAG_MSGTYPE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
<!-- 消息外键 -->
  	 
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_CMP_MESSAG.MSG_ID")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="msgId" property="msgId" collection="MPCMPMESSAG_MSGID_COLLECTION" labelProperty="$fk.showCol" labelKey="ID" />
      </td>
     
		</tr>
	<tr>	                   
<!-- NOTE -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_CMP_MESSAG.NOTE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
<!-- NOTE2 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("MP_CMP_MESSAG.NOTE2")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
     
		</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="mpcmpmessag.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpcmpmessagquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>