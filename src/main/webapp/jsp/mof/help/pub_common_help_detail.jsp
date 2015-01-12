
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>通用帮助明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<widgets:container title="通用帮助明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_ID")%>：</td>
      <td class="tdRight"><html:hidden name="helpId" property="helpId" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_TABLE")%>：</td>
      <td class="tdRight"><html:hidden name="helpTable" property="helpTable" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_TITLE")%>：</td>
      <td class="tdRight"><html:hidden name="helpTitle" property="helpTitle" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.ROOT_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="rootName" property="rootName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.LEVEL_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="levelField" property="levelField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.CODE_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="codeField" property="codeField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.IS_EQUAL_LEN")%>：</td>
      <td class="tdRight"><html:hidden name="isEqualLen" property="isEqualLen" write="true"/></td>
    </tr>    
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.DETAIL_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="detailField" property="detailField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.FILIATION_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="filiationField" property="filiationField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.CODE_STRU")%>：</td>
      <td class="tdRight"><html:hidden name="codeStru" property="codeStru" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.ID_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="idField" property="idField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.SHORT_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="shortField" property="shortField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.NAME_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="nameField" property="nameField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.SHOW_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="showField" property="showField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.RETURN_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="returnField" property="returnField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_WHERE")%>：</td>
      <td class="tdRight"><html:hidden name="helpWhere" property="helpWhere" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.IS_DETAILSEL")%>：</td>
      <td class="tdRight"><html:hidden name="isDetailsel" property="isDetailsel" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.IS_MULTSEL")%>：</td>
      <td class="tdRight"><html:hidden name="isMultsel" property="isMultsel" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.IS_INDVL")%>：</td>
      <td class="tdRight"><html:hidden name="isIndvl" property="isIndvl" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.SHOW_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="showName" property="showName" write="true"/></td>
    </tr>
    <tr>
    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_STYLE")%>：</td>
    <td class="tdRight"><html:hidden name="helpStyle" property="helpStyle" write="true" /></td>
    </tr>  
    <tr>
    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.DATASOURCE")%>：</td>
    <td class="tdRight"><html:hidden name="dataSource" property="dataSource" write="true" /></td>
    </tr> 
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMMON_HELP.HELP_NOTE")%>：</td>
      <td class="tdRight"><html:hidden name="helpNote" property="helpNote" write="true"/></td>
    </tr>         
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("helpId").value;
  document.forms[0].action ="pubcommonhelp.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="pubcommonhelpquery.cmd";
  document.forms[0].submit();	
}
</script>