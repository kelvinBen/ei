<%@ page contentType="text/html;charset=GBK" %> 
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
	String mofTableId = request.getParameter("mofTableId");
	if (mofTableId==null){
	mofTableId="";
	}
	String mofTableName = request.getParameter("mofTableName");
	if (mofTableName==null){
	mofTableName="";
	}
%>
<%
String refreshId=(String)request.getAttribute("refreshId");
if (refreshId==null||refreshId.equals("")){
    refreshId="";
}else{
    refreshId=refreshId+"@O";
}
%>
<HTML>
<HEAD>
<TITLE>列明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="列明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	<html:hidden name="mofColumnId" property="mofColumnId"/>
	<html:hidden name="mofTableId" value="<%=mofTableId%>"/>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.MOF_TABLE_ID")%>：</td>
	<td class="tdRight"><html:hidden name="mofTableName" value="<%=mofTableName%>" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.NAME")%>：</td>
	<td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.DESCRIPTION")%>：</td>
	<td class="tdRight"><html:hidden name="description" property="description" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISCOLUMN")%>：</td>
	<td class="tdRight">
	<html:label name="iscolumn" property="iscolumn" collection="MOFCOLUMN_ISCOLUMN_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.COLUMNNAME")%>：</td>
	<td class="tdRight"><html:hidden name="columnname" property="columnname" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISMANDATORY")%>：</td>
	<td class="tdRight">
	<html:label name="ismandatory" property="ismandatory" collection="MOFCOLUMN_ISMANDATORY_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISPARENT")%>：</td>
	<td class="tdRight">
	<html:label name="isparent" property="isparent" collection="MOFCOLUMN_ISPARENT_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.DEFAULTVALUE")%>：</td>
	<td class="tdRight"><html:hidden name="defaultvalue" property="defaultvalue" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISUPDATEABLE")%>：</td>
	<td class="tdRight">
	<html:label name="isupdateable" property="isupdateable" collection="MOFCOLUMN_ISUPDATEABLE_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>                          
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISTREE")%>：</td>
	<td class="tdRight"  colspan="3">
	<html:label name="tree" property="tree" collection="MOFCOLUMN_ISTREE_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>  
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISKEY")%>：</td>
	<td class="tdRight">
	<html:label name="iskey" property="iskey" collection="MOFCOLUMN_ISKEY_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.READONLYLOGIC")%>：</td>
	<td class="tdRight"><html:hidden name="readonlylogic" property="readonlylogic" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.ISACTIVE")%>：</td>
	<td class="tdRight">
	<html:label name="isactive" property="isactive" collection="MOFCOLUMN_ISACTIVE_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.LENGTH")%>：</td>
	<td class="tdRight"><html:hidden name="length" property="length" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.VFORMAT")%>：</td>
	<td class="tdRight"><html:hidden name="vformat" property="vformat" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.VALUEMIN")%>：</td>
	<td class="tdRight"><html:hidden name="valuemin" property="valuemin" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.VALUEMAX")%>：</td>
	<td class="tdRight"><html:hidden name="valuemax" property="valuemax" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.VALIDATIONMSG")%>：</td>
	<td class="tdRight"><html:hidden name="validationMsg" property="validationMsg" write="true"/></td>
	</tr>   
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.MOF_REFERENCE_ID")%>：</td>
	<td class="tdRight"><html:label name="mofReferenceId" property="mofReferenceId" collection="MOFREFERENCE_IDNAME_COLLECTION1" labelKey="MOF_REFERENCE_ID" labelProperty="NAME"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_COLUMN.MOF_REFERENCE_VALUE")%>：</td>
	<td class="tdRight"><html:label name="mofReferenceValue" property="mofReferenceValue" collection="MOFREFERENCE_IDNAME_COLLECTION2" labelKey="MOF_REFERENCE_ID" labelProperty="NAME"/></td>
	</tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.forms[0].action ="mofcolumn.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofcolumnquery.cmd";
  document.forms[0].submit();	
}
function init(){
    var refreshId ="<%=refreshId%>";
    if (refreshId!=null&&refreshId!=""&&refreshId!=undefined){
        if(getTreeFrame().seltree)
            getTreeFrame().seltree.refreshNodeById(refreshId); 
    }
 }
 init();
</script>