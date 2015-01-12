<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>数据资源类型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="数据资源类型明细" >
<bsp:containbutton text="修改" onclick="forUpdate()" action ="datarestype.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action ="datarestypequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.DATA_RES_TYPE")%>：</td>
      <td class="tdRight"><html:hidden name="dataResType" property="dataResType" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.TYPE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="typeName" property="typeName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.IS_STRU")%>：</td>
      <td class="tdRight"><html:hidden name="isStru" property="isStru" write="false"/><html:hidden name="isStruName" property="isStruName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.RES_TABLE")%>：</td>
      <td class="tdRight"><html:hidden name="resTable" property="resTable" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.RES_TABLE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="resTableName" property="resTableName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.VALUE_COL")%>：</td>
      <td class="tdRight"><html:hidden name="valueCol" property="valueCol" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.VALUE_COL_DES")%>：</td>
      <td class="tdRight"><html:hidden name="valueColDes" property="valueColDes" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.NAME_COL")%>：</td>
      <td class="tdRight"><html:hidden name="nameCol" property="nameCol" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.NAME_COL_DES")%>：</td>
      <td class="tdRight"><html:hidden name="nameColDes" property="nameColDes" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.IS_WHERE")%>：</td>
      <td class="tdRight"><html:hidden name="isWhere" property="isWhere" write="false"/><html:hidden name="isWhereName" property="isWhereName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.FILTER_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="filterField" property="filterField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.MEMO")%>：</td>
      <td class="tdRight"><html:hidden name="memo" property="memo" write="true"/></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("dataResType").value;
  document.forms[0].action ="datarestype.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="datarestypequery.cmd";
  document.forms[0].submit();	
}
</script>