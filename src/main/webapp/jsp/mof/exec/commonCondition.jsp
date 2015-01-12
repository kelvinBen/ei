<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.util.Page,java.util.*"%>

<%

%>
<HEAD>
<TITLE>通用查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>
<body topmargin="0px">
<widgets:container title="通用查询" >
<html:form name="frmList" action="mofcommonquery.cmd?method=query">
<html:hidden name="window_name" property="window_name"/>

<table id="tblSearch" >
	<tr><td><IMG src="<mast:ui img='search.gif'/>" name="chaxun" onclick="document.forms[0].submit()" style="cursor: hand;"/></td>
	</tr>
</table>
	<grid:grid name="condition" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="condition" type="edit" headHeight="22"  sumHeight="22" width="100%" height="200">
			<grid:primaryKeyCol index="1" name="ID" property="ID" caption="选择"  xml="ID" width="30" style="width:100%;" styleClass="default"  />
			<grid:textCol index="2"  name="left_bracket" property="left_bracket" caption="左括号" xml="left_bracket" width="40" style="width:100%;" styleClass="default"  />
			<grid:selectCol index="3" name="field" property="field" caption="域"  xml="field" width="150"  ><grid:options collection="field.Collection" labelProperty="Name" property="ID"  /></grid:selectCol>
			<grid:selectCol index="4" name="compare" property="compare" caption="比较符" xml="compare" width="60" size="1" ><grid:options collection="compare.Collection" labelProperty="Name" property="ID"  /></grid:selectCol>
			<grid:textCol  index="5" name="value" property="value" caption="值" xml="value" width="150" style="width:100%;" styleClass="default"  />			
			<grid:textCol  index="6" name="right_bracket" property="right_bracket" caption="右括号" xml="right_bracket" width="40" style="width:100%;" styleClass="default"  />
			<grid:selectCol index="7" name="link" property="link" caption="连接符" width="70" size="1" ><grid:options collection="link.Collection" labelProperty="Name" property="ID"  /></grid:selectCol>
	</grid:grid>
		
	<table width="100%" cellpadding="0" class="tblContent" style="border:0px solid #000000">
	 <tr><td align="center">
			<html:button name="add_Row" value="增加一行" onclick="addRow()"/>
			<html:button name="delete_Row" value="删除一行" onclick="deleteRow()"/>
		</td>
	 </tr>
	</table>
<script language="javascript">
function addRow(){
	condition.addRow();
}
function deleteRow(){
	condition.delRow();
}
</script>

</html:form>
</widgets:container>
</body>
<script language="javascript">
condition.show();
condition.setSumText("");
function query(){
}
</script>