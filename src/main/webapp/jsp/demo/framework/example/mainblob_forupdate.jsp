<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAINBLOB.UPDATE.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<web:js src="calendar.js"/>
<web:js src="mastfunction.js"/>
<web:js src="grid.js"/>
<script language="javascript">
function checkMainblob(){
	var mainId = document.forms[0].mainId;
      if ( __isQuoteIn(mainId.value) )
    {
      alert('<%=ResourcesFactory.getString("MAINBLOB.CODEFORMAT")%>');  
      mainId.focus();    
      return false;
    }
  	if (trim(mainId.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAINBLOB.INPUTCODE")%>');    
	  mainId.focus();
	  return false;
	}
    mainId.value = trim(mainId.value) ;
  	var mainOperatorcode = document.forms[0].mainOperatorcode;
  	if (trim(mainOperatorcode.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAINBLOB.INPUTOPERATOR")%>');    
	  mainOperatorcode.focus();
	  return false;
	}
    mainOperatorcode.value = trim(mainOperatorcode.value) ;
  	var mainOperatedate = document.forms[0].mainOperatedate;
  	if (trim(mainOperatedate.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAINBLOB.INPUTOPERATETIME")%>');    
	  mainOperatedate.focus();
	  return false;
	}
    mainOperatedate.value = trim(mainOperatedate.value) ;
      if ( !__checkStdDate(mainOperatedate ) )
    {
      alert('<%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATEDATE")%>'+sError);
      mainOperatedate.focus();
      return false;
    }   
	return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title='<%=ResourcesFactory.getString("MAINBLOB.UPDATE.TITLE")%>' >
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.ADD_ROW")%>' onclick="doAddRow()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.DELETE_ROW")%>' onclick="doDeleteRow()"></bsp:containbutton>
<bsp:containbutton action="mainblob.cmd?method=update" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.RESET")%>' onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="mainblobquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<html:form  name="frmList" method="post" action="" enctype="multipart/form-data">
<div style="background-color:#D5EAFD">
  <table style="background-color:#D5EAFD"> 
				
				
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAINBLOB.MAIN_ID")%>:</td>
                    <td class="tdRight"><html:hidden name="mainId" property="mainId"  write="true"/></td>
                                 
			
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATORCODE")%>:</td>
                    <td class="tdRight"><html:text name="mainOperatorcode" property="mainOperatorcode" size="30" maxlength="30" /></td>
                                
					
				
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATEDATE")%>:</td>
                    <td class="tdRight" valign=top>
						<date:date name="mainOperatedate" divname="mainOperatedatedd" property="mainOperatedate" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">
						</date:date>
					</td>					
					<td>&nbsp;</td>
				
  </table>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="listBlobitem" type="edit" headHeight="22"  sumHeight="22" width="100%" height="200">		       	
			<grid:primaryKeyCol property="fileId" caption='<%=ResourcesFactory.getString("MAINBLOB.MAIN_ID")%>' width="90" index="0" xml="mainId"  name="tt" style="width:100%" styleClass="default"readonly="true" ></grid:primaryKeyCol>	
			<grid:hideCol property="fileId"   caption='<%=ResourcesFactory.getString("MAINBLOB.FILECODE")%>' width="90" index="1" xml="fileId"  name="fileId" style="width:100%" styleClass="default" readonly="true"></grid:hideCol>	
		    <grid:textCol property="fileType" caption='<%=ResourcesFactory.getString("MAINBLOB.FILETYPE")%>' width="90" index="2" xml="fileType"  name="fileType" style="width:100%"  styleClass="default" readonly="true"></grid:textCol>		
			<grid:textCol property="fileName" caption='<%=ResourcesFactory.getString("MAINBLOB.FILENAME")%>' width="90" index="3" xml="fileName"  name="fileName" style="width:100%" styleClass="default" readonly="true"></grid:textCol>		
		    <grid:fileCol property="fileName" caption='<%=ResourcesFactory.getString("MAINBLOB.FILE")%>' width="150" index="4" xml="Content"  name="uploadFile" style="width:100%"   styleClass="default"  selectSql="select FILE_CONTENT from BLOBITEM where FILE_ID=?" ></grid:fileCol>  
		</grid:grid>
</div>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMainblob()) return;	
  document.forms[0].action ="mainblob.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mainblobquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function doAddRow()
{
    grid.addRow();
}
function doDeleteRow()
{
    grid.delRow();
}
grid.show();
</script>