<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>消息订阅列表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="消息订阅列表明细" >
<bsp:containbutton action="mpsubscrlist.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="mpsubscrlistquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$subscrId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.SUBSCR_ID")%>：</td>
      <td class="tdRight"><html:hidden name="subscrId" property="subscrId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.MSG_TYPE_CODE")%>：</td>
      <td class="tdRight">
      <html:label name="msgTypeCode" property="msgTypeCode" collection="mpMessageType" labelProperty="MSG_TYPE_NAME" labelKey="MSG_TYPE_CODE" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.SUBSCRIBERID")%>：</td>
      <td class="tdRight"><html:hidden name="subscriberid" property="subscriberid"/>
      <html:hidden name="subscriberName" property="subscriberName" write="true"/>
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.SUBSCR_TYPE_CODE")%>：</td>
      <td class="tdRight">
      <html:label name="subscrTypeCode" property="subscrTypeCode" collection="mpSubscriberType" labelProperty="SUBSCR_TYPE_NAME" labelKey="SUBSCR_TYPE_CODE" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.RECEIVE_MANNER_CODE")%>：</td>
      <td class="tdRight">
      <html:label name="receiveMannerCode" property="receiveMannerCode" collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" labelKey="RECEIVE_MANNER_CODE" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.RECEIVE_ADDRESS")%>：</td>
      <td class="tdRight"><html:hidden name="receiveAddress" property="receiveAddress" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCR_LIST.FILTER")%>：</td>
      <td class="tdRight"><html:hidden name="filter" property="filter" write="true"/></td>
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
  document.forms[0].action ="mpsubscrlist.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpsubscrlistquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>