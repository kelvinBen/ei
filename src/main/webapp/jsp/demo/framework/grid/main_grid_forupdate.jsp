<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIN_GRID.UPDATE.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<web:js src="calendar.js"/>
<web:js src="mastfunction.js"/>
<web:js src="grid.js"/>
<script language="javascript">
function checkMainGrid(){
	  var mainGridId = document.forms[0].mainGridId;
  	  if ( __isQuoteIn(mainGridId.value) )
	  {
	    alert('<%=ResourcesFactory.getString("MAIN_GRID.MAINTABLECODEFORMAT")%>');
	    mainGridId.select();
	    mainGridId.focus();
	    return false;
	  }
  	if (trim(mainGridId.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAIN_GRID.INPUTMAINCODE")%>'); 
	  mainGridId.focus();   
	  return false;
	}
    mainGridId.value = trim(mainGridId.value) ;
   	  var operatorCode = document.forms[0].operatorCode;
  	if (trim(operatorCode.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAIN_GRID.INPUTOPERATORCODE")%>'); 
	  operatorCode.focus();   
	  return false;
	}
    operatorCode.value = trim(operatorCode.value) ;
   	  var operateName = document.forms[0].operateName;
  	if (trim(operateName.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAIN_GRID.INPUTOPERATORNAME")%>'); 
	  operateName.focus();   
	  return false;
	}
    operateName.value = trim(operateName.value) ;
   	  var operateCooperate = document.forms[0].operateCooperate;
  	if (trim(operateCooperate.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAIN_GRID.INPUTBUSINESSDEP")%>'); 
	  operateCooperate.focus();   
	  return false;
	}
    operateCooperate.value = trim(operateCooperate.value) ;
   	  var operateDept = document.forms[0].operateDept;
  	if (trim(operateDept.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAIN_GRID.INPUTCUSTOMERMANAGER")%>'); 
	  operateDept.focus();   
	  return false;
	}
    operateDept.value = trim(operateDept.value) ;
   	  var operateDate = document.forms[0].operateDate;
  	if (trim(operateDate.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAIN_GRID.INPUTOPERATEDATE")%>'); 
	  operateDate.focus();   
	  return false;
	}
    operateDate.value = trim(operateDate.value) ;
      if ( !__checkStdDate(operateDate ) )
   {
      alert('<%=ResourcesFactory.getString("MAIN_GRID.OPERATE_DATE")%>'+sError);
      operateDate.focus();
      return false;
    }  
	  var operateEffdate = document.forms[0].operateEffdate;
  	if (trim(operateEffdate.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAIN_GRID.INPUTEFFECTIVEDATE")%>'); 
	  operateEffdate.focus();   
	  return false;
	}
    operateEffdate.value = trim(operateEffdate.value) ;
      if ( !__checkStdDate(operateEffdate ) )
   {
      alert('<%=ResourcesFactory.getString("MAIN_GRID.OPERATE_EFFDATE")%>'+sError);
      operateEffdate.focus();
      return false;
    }  
	  var operatorStatus = document.forms[0].operatorStatus;
  	if (trim(operatorStatus.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAIN_GRID.INPUTORDERSTATE")%>'); 
	  operatorStatus.focus();   
	  return false;
	}
    operatorStatus.value = trim(operatorStatus.value) ;
   	  var operatorDepot = document.forms[0].operatorDepot;
  	if (trim(operatorDepot.value)=="")
	{
	  alert('<%=ResourcesFactory.getString("MAIN_GRID.INPUTWAREHOUSENAME")%>'); 
	  operatorDepot.focus();   
	  return false;
	}
    operatorDepot.value = trim(operatorDepot.value) ;
   return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title='<%=ResourcesFactory.getString("MAIN_GRID.UPDATE.TITLE")%>' >
<bsp:containbutton text='<%=ResourcesFactory.getString("MAIN_GRID.IFBLANKCOLUMN")%>' onclick="isEmpty()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.ADD_ROW")%>' onclick="doAddRow()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.DELETE_ROW")%>' onclick="doDeleteRow()"></bsp:containbutton>
<bsp:containbutton action="maingrid.cmd?method=update" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text='<%=ResourcesFactory.getString("COMMON.RESET")%>' onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="maingridquery_page_init.cmd" text='<%=ResourcesFactory.getString("COMMON.BACK")%>' onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<html:form  name="frmList"  action="">
<div style="background-color:#D5EAFD">
  <table style="background-color:#D5EAFD"> 
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.MAIN_GRID_ID")%>:</td>
                    <td class="tdRight"><html:text name="mainGridId" readonly="true" property="mainGridId" size="15" maxlength="30"/>
                    </td>                    
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_CODE")%>:</td>
                    <td class="tdRight"><html:text name="operatorCode" property="operatorCode" size="15" maxlength="30"/>
                    </td>                                   
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_NAME")%>:</td>
                    <td class="tdRight"><html:text name="operateName" property="operateName" size="15" maxlength="30"/>
                    </td>
                    </tr>               
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_COOPERATE")%>:</td>
                    <td class="tdRight"><html:text name="operateCooperate" property="operateCooperate" size="15" maxlength="30"/>
                    </td>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_DEPT")%>:</td>
                    <td class="tdRight"><html:text name="operateDept" property="operateDept" size="15" maxlength="30"/>
                    </td>               
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_DATE")%>:</td>
                    <td class="tdRight" valign=top>
						<date:date name="operateDate" divname="operateDatedd" property="operateDate" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">
						</date:date>
					</td>					
					</tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATE_EFFDATE")%>:</td>
                    <td class="tdRight" valign=top>
						<date:date name="operateEffdate" divname="operateEffdatedd" property="operateEffdate" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">
						</date:date>
					</td>					
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_STATUS")%>:</td>
                    <td class="tdRight">
	                    <html:select name="operatorStatus" property="operatorStatus" >
	                        <html:options collection="MAINGRID_OPERATORSTATUS_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
                    </td>                    
                    <td class="tdTitle"><%=ResourcesFactory.getString("MAIN_GRID.OPERATOR_DEPOT")%>:</td>
                    <td class="tdRight">
	                    <html:select name="operatorDepot" property="operatorDepot" >
	                        <html:options collection="MAINGRID_OPERATORDEPOT_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
                    </td>                    
					</tr>
  </table>
		<grid:grid name="grid" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" property="listGridItem" type="edit" headHeight="22"  sumHeight="22" width="100%" height="200">		       	
			<grid:imageTextCol property="itemProductname" caption='<%=ResourcesFactory.getString("MAIN_GRID.PRODUCTNAME")%>'  readonly="true" defaultValue='<%=ResourcesFactory.getString("MAIN_GRID.DEFAULTVALUE")%>' index="1" xml="itemProductname"  name="itemProductname" width="100" imageUrl="skins/default/images/liulan.gif" imageClick="doimgclick()" style="width:70%" ></grid:imageTextCol>		
			<grid:hideCol property="itemProductid" caption='<%=ResourcesFactory.getString("MAIN_GRID.PRODUCTCODE")%>'width="0" index="2" xml="itemProductid"  name="itemProductid" style="width:100%" styleClass="default" ></grid:hideCol>		
			<grid:textCol property="itemUnitprice" caption='<%=ResourcesFactory.getString("MAIN_GRID.PRODUCTPRICE")%>' width="90" onchange="amount()"index="3" xml="itemUnitprice"  name="itemUnitprice" style="width:100%" styleClass="default"></grid:textCol>		
			<grid:checkboxCol property="itemDiscount" caption='<%=ResourcesFactory.getString("MAIN_GRID.PREFERENTIAL")%>' width="90" index="4" xml="itemDiscount"  name="itemDiscount" style="width:100%" styleClass="default" ></grid:checkboxCol>		
			<grid:textCol property="itemQuantity" caption='<%=ResourcesFactory.getString("MAIN_GRID.PRODUCTNUMBER")%>' width="90" onchange="amount()"index="5" xml="itemQuantity"  name="itemQuantity" style="width:100%" styleClass="default"></grid:textCol>		
			<grid:textCol property="itemAmount" caption='<%=ResourcesFactory.getString("MAIN_GRID.TATALAMOUNT")%>' width="90"index="6" xml="itemAmount"  name="itemAmount" style="width:100%" styleClass="default"></grid:textCol>		
			<grid:dateCol property="itemDate" caption='<%=ResourcesFactory.getString("MAIN_GRID.OPERATEDATE")%>' width="90" index="7" xml="itemDate"  name="itemDate" hastime="false"  sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd" ></grid:dateCol>		
			<grid:dateCol property="itemDatetime" caption='<%=ResourcesFactory.getString("MAIN_GRID.SPECIFICTIME")%>' width="170" index="8" xml="itemDatetime"  name="itemDatetime" hastime="true" hasecond="true" sourceFormat="yyyyMMdd HH:mm:ss" targetFormat="yyyyMMdd HH:mm:ss"></grid:dateCol>		
			<grid:selectCol  property="itemLevel" name="itemLevel" size="1" caption='<%=ResourcesFactory.getString("MAIN_GRID.PRODUCTLEVEL")%>'  index="9" width="100" value="">
		 		<grid:options collection="GRIDITEM_ITEMLEVEL_COLLECTION" labelProperty="value" property="key"/>
			</grid:selectCol>
			<grid:textCol property="itemNote" caption='<%=ResourcesFactory.getString("MAIN_GRID.REMARK")%>' width="90" index="10" xml="itemNote"  name="itemNote" style="width:100%" styleClass="default" ></grid:textCol>		
		<grid:primaryKeyCol property="itemDetailid" caption="primary key column" name="itemDetailid" index="11" width="0"></grid:primaryKeyCol>	
		</grid:grid>
</div>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
function doimgclick(){
 var url ="jsp/help.jsp?url=productquery_page_init.cmd&clear=true&clearsearch=true";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:680px;dialogHeight:400px"); 
  if (win == null) {  
  	return;
  }else{
  grid.setCellValue(grid.getCurrentLine(),2,win[0]);
  grid.setCellValue(grid.getCurrentLine(),1,win[1]);
  grid.setCellValue(grid.getCurrentLine(),3,trim(win[2]));
  grid.setCellValue(grid.getCurrentLine(),5,trim(win[3]));
  grid.setCellValue(grid.getCurrentLine(),6,trim(win[4]));
  grid.setCellValue(grid.getCurrentLine(),9,trim(win[5]));
  }
}
function amount(){
   var col3=grid.getCellValue(grid.getCurrentLine(),3)
   var col5=grid.getCellValue(grid.getCurrentLine(),5);
   if(col3!="")
   if(col5!="")
   grid.setCellValue(grid.getCurrentLine(),6,parseFloat(col3)*parseFloat(col5));
}
function isEmpty(){
  var rows=grid.returnRowCount();
  if(rows!=""){
     for(var i=0;i<rows;i++){
       for(var y=1;y<11;y++){
          if(grid.checkHaveEmpty(y)){
            alert('<%=ResourcesFactory.getString("MAIN_GRID.NUMBER")%>'+' '+(parseInt(y)-1)+' '+'<%=ResourcesFactory.getString("MAIN_GRID.NULLVALUE")%>');
            return;
          }
       }
     }
  }
  alert('<%=ResourcesFactory.getString("MAIN_GRID.NOBLANKCOLUMN")%>');
}
function forSave(){
  if(!checkMainGrid()) return;
  if(grid.checkHaveRepeat(2)){
    alert('<%=ResourcesFactory.getString("MAIN_GRID.DUPLICATEPRODUCT")%>');
    return;
  }
  var rows=grid.returnRowCount();
  if(rows!=""){
     for(var i=0;i<rows;i++){
       for(var y=1;y<11;y++){
          if(grid.checkHaveEmpty(y)){
           alert('<%=ResourcesFactory.getString("MAIN_GRID.NUMBER")%>'+' '+(parseInt(y)-1)+' '+'<%=ResourcesFactory.getString("MAIN_GRID.BLANKVALUENOSAVE")%>');
            return;
          }
       }
     }
  }
  document.forms[0].action ="maingrid.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="maingridquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function doAddRow()
{
    grid.addRow();
    grid.setCellValue(grid.getCurrentLine(),4,0);
}
function doDeleteRow()
{
    grid.delRow();
}
grid.show();
</script>