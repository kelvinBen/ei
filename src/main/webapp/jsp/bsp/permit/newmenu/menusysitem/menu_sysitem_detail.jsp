<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>ϵͳ�˵�����ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="ϵͳ�˵�����ϸ" >
<bsp:containbutton action="menusysitem.cmd?method=forupdate" text="�޸�" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="menusysitemquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  	<html:hidden name="menuId" property="menuId" write="false"/>  	
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TEXT")%>��</td>
      <td class="tdRight"><html:hidden name="text" property="text" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TITLE")%>��</td>
      <td class="tdRight"><html:hidden name="title" property="title" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TYPE")%>��</td>
      <td class="tdRight"><html:label name="type" property="type" collection="PUB_MENU_SYS_ITEM_COLLECTION" labelProperty="value" labelKey="key" /></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.VALUE")%>��</td>
      <td class="tdRight"><html:hidden name="value" property="value" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TARGET")%>��</td>
      <td class="tdRight"><html:hidden name="target" property="target" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.OPTIONS")%>��</td>
      <td class="tdRight"><html:hidden name="options" property="options" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.FUNCTION_ID")%>��</td>
      <td class="tdRight"><html:hidden name="functionId" property="functionId" write="true"/></td>
    </tr>
    <!--  gaochuanji��ӣ�����ʵ��Ӧ�����Ƶ���ʾ  -->
     <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.APP_ID")%>��</td>
      <td class="tdRight"><html:hidden name="appId" property="appId"/><html:hidden name="appName" property="appName" write="true"/></td>
    </tr>
	<!--over-->
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("menuId").value;
  document.forms[0].action ="menusysitem.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="menusysitemquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>