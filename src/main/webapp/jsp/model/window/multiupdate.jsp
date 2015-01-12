<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE>�����������޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='editgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='date.css'/>">
<script language="javascript" src="<sotower:ui js='calendar.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript" src="<sotower:ui js='grid.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="�����������޸�" >
<bsp:containbutton action="soawindow.cmd?method=save"  text="����" onclick="forSave()"></bsp:containbutton>
<html:messages></html:messages>
<html:form  name="frmList" action="">
<div>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="tabList" type="edit" headHeight="22"  sumHeight="22" width="100%" height="200">		       	
			<grid:hideCol property="categoryId" caption="���" width="90" index="2" xml="categoryId"  name="categoryId" style="width:100%" styleClass="default" ></grid:hideCol >		
			<grid:textCol property="name" caption="����" width="90" index="3" xml="name"  name="name" style="width:100%" styleClass="default"></grid:textCol>		
			<grid:textCol property="desc" caption="����" width="90" index="4" xml="desc"  name="desc" style="width:100%" styleClass="default"></grid:textCol>			
			<grid:textCol property="index" caption="���" width="90" index="5" xml="index"  name="index" style="width:100%" styleClass="default"></grid:textCol>	
			<grid:selectCol  property="isMain" name="isMain" caption="�Ƿ���tab" width="60" index="6" style="width:100%">
				<grid:options collection="SOATAB_ISMAIN_COLLECTION" labelProperty="value" property="key"/>
			</grid:selectCol>
			<grid:selectCol  property="isDetail" name="isDetail" caption="�Ƿ���ϸ" width="60" index="7" style="width:100%">
				<grid:options collection="SOATAB_ISDETAIL_COLLECTION" labelProperty="value" property="key"/>
			</grid:selectCol>
			<grid:selectCol  property="isSameTab" name="isSameTab" caption="�Ƿ�ͬһtab" width="60" index="8" style="width:100%">
				<grid:options collection="SOATAB_ISSAMETAB_COLLECTION" labelProperty="value" property="key"/>
			</grid:selectCol>
		</grid:grid>
</div>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  document.forms[0].action ="soawindow.cmd?method=save";
  document.forms[0].submit();	
}
grid.show();
</script>