<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE>属性域批量修改</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='editgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='date.css'/>">
<script language="javascript" src="<sotower:ui js='calendar.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript" src="<sotower:ui js='grid.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="属性域批量修改" >
<bsp:containbutton action="soatab.cmd?method=batchUpdate" text="批量修改" onclick="batchUpdate()"></bsp:containbutton>
<html:messages></html:messages>
<html:form  name="frmList" action="">
<input type="hidden" name="primaryKey" value='<%=request.getParameter("primaryKey")%>'>
<div>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="fd" type="edit" headHeight="22"  sumHeight="22" width="100%" height="400">		       	
			<grid:hideCol property="categoryId" caption="编号" width="90" index="2" xml="categoryId"  name="categoryId" style="width:100%" styleClass="default"></grid:hideCol >		
			<grid:textCol property="name" caption="名称" width="120" index="3" xml="name"  name="name" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
			<grid:textCol property="desc" caption="描述" width="120" index="4" xml="desc"  name="desc" style="width:100%" styleClass="default" readonly="true"></grid:textCol>			
			<grid:hideCol property="fieldType" name="fieldType" caption="域类型" width="60" index="5" style="width:100%"></grid:hideCol>
			<grid:hideCol property="isNotNull" name="isNotNull" caption="是否必须" width="60" index="8" style="width:100%"></grid:hideCol>
			<grid:textCol property="fieldIndex" caption="序号" width="60" index="6" xml="fieldIndex"  name="fieldIndex" style="width:100%" styleClass="default" readonly="true"></grid:textCol>									
			<grid:textCol property="fieldLength" caption="域长" width="60" index="7" xml="fieldLength"  name="fieldLength" style="width:100%" styleClass="default" readonly="true"></grid:textCol>
			<grid:labelCol property="isSameLine" name="isSameLine" caption="是否同一行" width="80" index="9" style="width:100%" readonly="true" collection="SOAFIELD_ISSAMELINE_COLLECTION" labelProperty="value" labelKey="key"></grid:labelCol>
			<grid:hideCol property="rowSpan" name="rowSpan" caption="页面跨行数" width="80" index="10" style="width:100%" styleClass="default" readonly="true"></grid:hideCol>	
			<grid:labelCol property="isSearch" name="isSearch" caption="是否查询" width="80" index="11" style="width:100%" readonly="true" collection="SOAFIELD_ISSEARCH_COLLECTION" labelProperty="value" labelKey="key"></grid:labelCol>
		</grid:grid>
</div>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
function batchUpdate(){
  document.forms[0].action ="soatab.cmd?method=batchUpdate";
  document.forms[0].submit();	
}
grid.show();
</script>