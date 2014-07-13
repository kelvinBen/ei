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
<bsp:containbutton action="permanence.cmd?method=save"  text="����" onclick="forSave()"></bsp:containbutton>
<html:messages></html:messages>
<html:form  name="frmList" action="">
<div>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="columnList" type="edit" headHeight="22"  sumHeight="22" width="100%" height="400">		       	
			<grid:hideCol property="categoryId" caption="���" width="90" index="2" xml="categoryId"  name="categoryId" style="width:100%" styleClass="default" ></grid:hideCol >		
			<grid:textCol property="name" caption="����" width="90" index="3" xml="name"  name="name" style="width:100%" styleClass="default"></grid:textCol>		
			<grid:textCol property="desc" caption="����" width="90" index="4" xml="desc"  name="desc" style="width:100%" styleClass="default"></grid:textCol>			
			<grid:textCol property="columnType" caption="�ֶ�����" width="60" index="5" xml="columnType"  name="columnType" style="width:100%" styleClass="default"></grid:textCol>
			<grid:selectCol  property="isNotNull" name="isNotNull" caption="�Ƿ����" width="60" index="6" style="width:100%">
				<grid:options collection="SOACOLUMN_ISNOTNULL_COLLECTION" labelProperty="value" property="key"/>
			</grid:selectCol>
			<grid:textCol property="javaName" caption="java������" width="90" index="7" xml="javaName"  name="javaName" style="width:100%" styleClass="default"></grid:textCol>									
			<grid:textCol property="javaType" caption="java����" width="230" index="8" xml="javaType"  name="javaType" style="width:100%" styleClass="default"></grid:textCol>
			<grid:textCol property="columnSize" caption="�ֶδ�С" width="50" index="9" xml="columnSize"  name="columnSize" style="width:100%" styleClass="default"></grid:textCol>				
		</grid:grid>
</div>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  document.forms[0].action ="permanence.cmd?method=save";
  document.forms[0].submit();	
}
grid.show();
</script>