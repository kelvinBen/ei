<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>最大号表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="最大号表明细" >
<bsp:containbutton text="修改" onclick="forUpdate()" action ="pubidtable.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action ="pubidtablequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_ID")%>：</td>
      <td class="tdRight"><html:hidden name="id" property="id" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_VALUE")%>：</td>
      <td class="tdRight"><html:hidden name="value" property="value" write="true"/></td>
    </tr>   
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.CACHE_SIZE")%>：</td>
      <td class="tdRight"><html:hidden name="cacheSize" property="cacheSize" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.IS_PREFIX")%>：</td>
      <td class="tdRight">
      		<html:label name="isPrefix" property="isPrefix" collection="PUBIDTABLE_ISPREFIX_COLLECTION" labelProperty="value" labelKey="key" />
	  </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_PREFIX")%>：</td>
      <td class="tdRight"><html:hidden name="prefix" property="prefix" write="true"/></td>
    </tr>
    
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_LENGTH")%>：</td>
      <td class="tdRight"><html:hidden name="idLength" property="idLength" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.IS_SUFFIX")%>：</td>
      <td class="tdRight">
      		<html:label name="isSuffix" property="isSuffix" collection="PUBIDTABLE_ISSUFFIX_COLLECTION" labelProperty="value" labelKey="key" />
	  </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ID_SUFFIX")%>：</td>
      <td class="tdRight"><html:hidden name="suffix" property="suffix" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.IS_GLOBAL")%>：</td>
      <td class="tdRight">
      		<html:label name="isGlobal" property="isGlobal" collection="PUBIDTABLE_ISGLOBAL_COLLECTION" labelProperty="value" labelKey="key" />
	  </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_IDTABLE.ORGANID")%>：</td>
      <td class="tdRight"><html:hidden name="organId" property="organId" write="true"/></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("id").value;
  document.forms[0].action ="pubidtable.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="pubidtablequery.cmd";
  document.forms[0].submit();	
}
</script>