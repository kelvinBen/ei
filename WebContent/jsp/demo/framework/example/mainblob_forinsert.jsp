<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAINBLOB.INSERT.TITLE")%></TITLE>
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
	    mainId.select();
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
<bsp:container title='<%=ResourcesFactory.getString("MAINBLOB.INSERT.TITLE")%>' >
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.ADD_ROW")%>' onclick="doAddRow()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.DELETE_ROW")%>' onclick="doDeleteRow()"></bsp:containbutton>
<bsp:containbutton action="mainblob.cmd?method=insert" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="mainblob.cmd?method=insertContinue" text='<%=ResourcesFactory.getString("COMMON.SAVECON")%>' onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.RESET")%>' onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="mainblobquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<html:form  name="frmList" method="post" action="" enctype="multipart/form-data" repeatSubmit="true">

<div style="background-color:#D5EAFD">
  <table style="background-color:#D5EAFD"> 
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAINBLOB.MAIN_ID")%>:</td>
                    <td class="tdRight"><html:text name="mainId" property="mainId" size="8" maxlength="8" /></td>                                       
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATORCODE")%>:</td>
                    <td class="tdRight"><html:text name="mainOperatorcode" property="mainOperatorcode" size="30" maxlength="30" /></td>                                       
					</tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAINBLOB.MAIN_OPERATEDATE")%>:</td>
                    <td class="tdRight" valign=top>
						<date:date name="mainOperatedate" divname="mainOperatedatedd" targetFormat="yyyyMMdd">
						</date:date>
					</td>					
					<td>&nbsp;</td>
					</tr>
  </table>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="listBlobitem" type="input" headHeight="22"  sumHeight="22" width="100%" height="200">		       	
			<grid:primaryKeyCol property="mainId" caption='<%=ResourcesFactory.getString("MAINBLOB.MAIN_ID")%>' width="90" index="0" xml="fileId"  name="tt" style="width:100%" styleClass="default" ></grid:primaryKeyCol>	
			<grid:fileCol property="uploadFile" caption='<%=ResourcesFactory.getString("MAINBLOB.FILE")%>' width="150" index="2" xml="content"  name="uploadFile" style="width:100%" styleClass="default" ></grid:fileCol>
		</grid:grid>
</div>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMainblob()) return;	
  document.forms[0].action ="mainblob.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMainblob()) return;
  document.forms[0].action ="mainblob.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mainblobquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){ 
  var rows = grid.returnRowCount();
  for(var i=0;i<rows;i++)
	  grid.delLine();
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