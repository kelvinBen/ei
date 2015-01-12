<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE>属性域批量明细</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='editgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='date.css'/>">
<script language="javascript" src="<sotower:ui js='calendar.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript" src="<sotower:ui js='grid.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="属性域批量明细">
<html:messages></html:messages>
<html:form  name="frmList" action="">
<div>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="tabList" type="edit" headHeight="22"  sumHeight="22" width="100%" height="200">		       	
			<grid:hideCol property="categoryId" caption="编号" width="90" index="2" xml="categoryId"  name="categoryId" style="width:100%" styleClass="default" ></grid:hideCol >		
			<grid:textCol property="name" caption="名称" width="90" index="3" xml="name"  name="name" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
			<grid:textCol property="desc" caption="描述" width="90" index="4" xml="desc"  name="desc" style="width:100%" styleClass="default" readonly="true"></grid:textCol>			
			<grid:textCol property="index" caption="序号" width="90" index="5" xml="index"  name="index" style="width:100%" styleClass="default" readonly="true"></grid:textCol>	
			<grid:labelCol  property="isMain" name="isMain" caption="是否主tab" width="60" index="6" style="width:100%" readonly="true" collection="SOATAB_ISMAIN_COLLECTION" labelProperty="value" labelKey="key"/>
			<grid:labelCol  property="isDetail" name="isDetail" caption="是否明细" width="60" index="7" style="width:100%" readonly="true" collection="SOATAB_ISDETAIL_COLLECTION" labelProperty="value" labelKey="key"/>
			<grid:labelCol  property="isSameTab" name="isSameTab" caption="是否同一tab" width="60" index="8" style="width:100%" readonly="true" collection="SOATAB_ISSAMETAB_COLLECTION" labelProperty="value" labelKey="key"/>
		</grid:grid>
</div>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
grid.show();
</script>