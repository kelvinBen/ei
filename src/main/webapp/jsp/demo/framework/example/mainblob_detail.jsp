<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAINBLOB.DETAIL.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<web:js src="calendar.js"/>
<web:js src="mastfunction.js"/>
<web:js src="grid.js"/>
<bsp:container title='<%=ResourcesFactory.getString("MAINBLOB.DETAIL.TITLE")%>' >
<bsp:containbutton action="mainblob.cmd?method=forupdate" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>' onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="mainblobquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<html:form  name="frmList"  action="" method="post" enctype="multipart/form-data">
<html:hidden name="primaryKey" value=""/>
<div style="background-color:#D5EAFD">
  <table style="background-color:#D5EAFD"> 
  		<html:hidden name="pk" property="$mainId" write="false"/>
		
      <td class="tdTitle"><%=ResourcesFactory.getString("MAINBLOB.MAIN_ID")%>:</td>
      <td class="tdRight"><html:hidden name="mainId" property="mainId" write="true"/></td>
      <td class="tdTitle"><%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATORCODE")%>:</td>
      <td class="tdRight"><html:hidden name="mainOperatorcode" property="mainOperatorcode" write="true"/></td>
      <td class="tdTitle"><%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATEDATE")%>:</td>
      <td class="tdRight"><html:hidden name="mainOperatedate"  property="mainOperatedate"   write="true"/></td>
	
  </table>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="listBlobitem" type="edit" headHeight="22"  sumHeight="22" width="100%" height="200">		       	
			<grid:primaryKeyCol property="fileId" caption='<%=ResourcesFactory.getString("MAINBLOB.FILECODE")%>' width="90" index="0" xml="fileId"  name="fileId" style="width:100%" styleClass="default" readonly="true"></grid:primaryKeyCol>	
			<grid:hideCol property="fileId" caption='<%=ResourcesFactory.getString("MAINBLOB.FILECODE")%>' width="90" index="1" xml="fileId"  name="fileId" style="width:100%" styleClass="default" ></grid:hideCol>					
			<grid:textCol property="fileType" caption='<%=ResourcesFactory.getString("MAINBLOB.FILETYPE")%>' width="90" index="2" xml="fileType"  name="fileType" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
			<grid:textCol property="fileName" caption='<%=ResourcesFactory.getString("MAINBLOB.FILENAME")%>' width="90" index="3" xml="fileName"  name="fileName" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
			<grid:fileCol property="fileName" caption='<%=ResourcesFactory.getString("MAINBLOB.FILE")%>' width="150" index="4" fileType="Image" xml="Content"  name="uploadFile" style="width:100%"   styleClass="default" readonly="true"  selectSql="select FILE_CONTENT from BLOBITEM where FILE_ID=?" ></grid:fileCol>		
		</grid:grid>
</div>
</html:form>
</bsp:container>


</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="mainblob.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mainblobquery_page_init.cmd";
  document.forms[0].submit();	
}
grid.show();
</script>