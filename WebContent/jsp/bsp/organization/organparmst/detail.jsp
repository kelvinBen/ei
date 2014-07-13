<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>组织参数类型表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="组织参数类型表明细" >
<bsp:containbutton action="organparmst.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="organparmstquery.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$parmsName" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.PARMS_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="parmsName" property="parmsName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.PARMS_VALUE")%>：</td>
      <td class="tdRight"><html:hidden name="parmsValue" property="parmsValue" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.DATA_RES")%>：</td>
      <td class="tdRight">
      	<html:label name="dataRes" property="dataRes" collection="ORGANPARMST_DATARES_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.ENUM_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="enumName" property="enumName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.ENUM_VAULE")%>：</td>
      <td class="tdRight"><html:hidden name="enumVaule" property="enumVaule" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.RES_TABLE")%>：</td>
      <td class="tdRight"><html:hidden name="resTable" property="resTable" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.RES_TABLE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="resTableName" property="resTableName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.VALUE_COL")%>：</td>
      <td class="tdRight"><html:hidden name="valueCol" property="valueCol" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.VALUE_COL_DES")%>：</td>
      <td class="tdRight"><html:hidden name="valueColDes" property="valueColDes" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.NAME_COL")%>：</td>
      <td class="tdRight"><html:hidden name="nameCol" property="nameCol" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.NAME_COL_DES")%>：</td>
      <td class="tdRight"><html:hidden name="nameColDes" property="nameColDes" write="true"/></td>
    </tr>
  	<tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.IS_WHERE")%>：</td>
      <td class="tdRight">
      	<html:label name="isWhere" property="isWhere" collection="ORGANPARMST_ISWHERE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.FILTER_FIELD")%>：</td>
      <td class="tdRight"><html:hidden name="filterField" property="filterField" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.NOTE")%>：</td>
      <td class="tdRight"><html:hidden name="note" property="note" write="true"/></td>
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
  document.forms[0].action ="organparmst.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="organparmstquery.cmd";
  document.forms[0].submit();	
}
</script>