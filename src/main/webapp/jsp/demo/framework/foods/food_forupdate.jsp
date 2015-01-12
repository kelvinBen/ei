<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<html>
<head>
<title><%=ResourcesFactory.getString("FOOD.MAINTAINANCE")%></title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<web:js src="grid.js"/>
<web:js src="tab.js"/>
<web:js src="calendar.js"/>
<web:js src="mastfunction.js"/>
<web:js src="louquery.js"/>
<script language="javascript">
function forSave(){
  if(!checkFood()) return;	
  document.forms[0].action ="food.cmd?method=update";
  document.forms[0].submit();	
  alert('<%=ResourcesFactory.getString("FOOD.SAVESUCCESS")%>');
}
function forReturn(){
  document.forms[0].action ="foodquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function forQuery(){
  document.forms[0].action ="food.cmd?method=querySearch&forward=forupdate";
  document.forms[0].submit();	
}
function checkXubiao(){
var xbId=document.forms[0].xbId;
if(__isQuoteIn(xbId.value)){
   alert('<%=ResourcesFactory.getString("FOOD.PRIMARYFORMAT")%>');
   xbId.select();
   xbId.focus();
   return false;
}

if(!checkFood()){
	return false;
}
return true;
}
function checkFood(){
	var rows=foodGrid.returnRowCount();	
	for(var i=1;i<=rows;i++){
		if(!checkFoodLine(i)){
			return false;
		}
	}
	return true;
}
function checkFoodLine(row){
	if(foodGrid.getCellValue(row,2)==""){
		alert('<%=ResourcesFactory.getString("FOOD.INPUTNAME")%>'); 
		return false;		
	}
	if(foodGrid.getCellValue(row,3)==""){
		alert('<%=ResourcesFactory.getString("FOOD.INPUTORGIN")%>'); 
		return false;		
	}
	if(foodGrid.getCellValue(row,4)==""){
		alert('<%=ResourcesFactory.getString("FOOD.FOODNUMBER")%>'); 
		return false;		
	}
	if(foodGrid.getCellValue(row,5)==""){
		alert('<%=ResourcesFactory.getString("FOOD.INPUTPRICE")%>'); 
		return false;		
	}
	if(foodGrid.getCellValue(row,6)==""){
		alert('<%=ResourcesFactory.getString("FOOD.INPUTXBID")%>'); 
		return false;		
	}	
	return true;
}
$(document).ready(function(){
   
	$("Img[@name=hide]").click(function () {
      $("div[@name=hide]").slideToggle("fast");
       var index=$("Img[@name=hide]").attr("src").lastIndexOf("up.png");
      if(index!=-1)
        $("Img[@name=hide]").attr("src","<mast:ui img='down.png'/>");
      else
        $("Img[@name=hide]").attr("src","<mast:ui img='up.png'/>");
    });  
  });
</script>
</head>
<body>
<html:form  name="foodForm"  action="">
<%--
<html:hidden name="primaryKey" property="xbId" write="false"/>
--%>  
<bsp:container title='<%=ResourcesFactory.getString("FOOD.MAINTAINANCE")%>'>
<bsp:containbutton action="food.cmd?method=update" text='<%=ResourcesFactory.getString("COMMON.SAVE")%>' onclick="forSave()"></bsp:containbutton>

   <table>
<tr>
<td><img name='hide' src="<mast:ui img='up.png'/>"></img></td>
<td>
<div name="hide" >

<table id="tblSearch"> 
	 <tr>
  <td><%=ResourcesFactory.getString("FOOD.FOOD_NAME")%>:<input name="FOOD_NAME_SEARCH" value="<%=request.getParameter("FOOD_NAME_SEARCH")==null?"":request.getParameter("FOOD_NAME_SEARCH") %>" type="text"  size="12"></td> 
  <td><%=ResourcesFactory.getString("FOOD.FOOD_NUM")%>:<input name="FOOD_NUM_SEARCH" value="<%=request.getParameter("FOOD_NUM_SEARCH")==null?"":request.getParameter("FOOD_NUM_SEARCH") %>" type="text" size="12"></td>  
  <td><input type="button" value='<%=ResourcesFactory.getString("COMMON.SEARCH")%>' onclick="forQuery();" /></td>   
    </tr>    
	</table>
</div>
</td>
</tr>
</table>		
	<table width="100%"><tr><td>
   <grid:grid name="foodGrid" hasPage="10" action="food.cmd?method=saveandupdate"  property="foodList" sumRow="true" headCss="divToucss" detailCss="divTiSkin" sumCss="divSumcss" complexHead="false" type="edit" headHeight="22" sumHeight="22" width="100%" height="240">		
   <grid:primaryKeyCol property="foodId" name="foodId" caption='<%=ResourcesFactory.getString("FOOD.FOOD_ID")%>' width="0" index="1" ></grid:primaryKeyCol>		
      <%--<grid:checkboxCol property="foodId" index="7" caption='<%=ResourcesFactory.getString("FOOD.FOOD_ID")%>' name="foodId"></grid:checkboxCol>--%>
      <grid:textCol property="foodName" name="foodName" caption='<%=ResourcesFactory.getString("FOOD.FOOD_NAME")%>' width="100" index="2"  styleClass="default"  ></grid:textCol>					
	     
     <grid:selectCol property="foodOrigin" name="foodOrigin" caption='<%=ResourcesFactory.getString("FOOD.FOOD_ORIGIN")%>' index="3" width="100" value="" >
		 <grid:options collection="FOOD_FOOD_ORIGIN_COLLECTION" labelProperty="value" property="key"/>
      </grid:selectCol>	
     			
      <grid:textCol property="foodNum" name="foodNum" caption='<%=ResourcesFactory.getString("FOOD.FOOD_NUM")%>' width="100" index="4"  styleClass="default" ></grid:textCol>					
		
		
      <grid:textCol property="foodPrice" name="foodPrice" caption='<%=ResourcesFactory.getString("FOOD.FOOD_PRICE")%>' width="100" index="5"  styleClass="default" ></grid:textCol>					
		
   
   <grid:textCol property="xbId" name="xbId" caption='<%=ResourcesFactory.getString("FOOD.XB_ID")%>' width="100" index="6"  styleClass="default" styleClass="default" />	
   <html:text name="isupdate"  value=""/>	
  
    </grid:grid>
</td></tr>
<tr><td align="center">
<button onclick="foodGrid.addRow();"><%=ResourcesFactory.getString("COMMON.ADD_ROW")%></button>&nbsp;&nbsp;<button onclick="foodGrid.delRow();"><%=ResourcesFactory.getString("COMMON.DELETE_ROW")%></button>
</td></tr>
</table>
		
	<%-- 
	<table width="100%" cellpadding="0" class="tblContent">
   <tr>
   </tr>
   <tr>   
   <td class="tdTitle"><%=ResourcesFactory.getString("XUBIAO.XB_ID")%></td>
   <td class="tdRight" colspan="1"><html:text name="xbId" property="xbId" maxlength="32" size="32" readonly="false" /></td>    
   </tr>
   </table>--%>
	   
   
</bsp:container>
</html:form>
<script language="javascript">
   foodGrid.show();
function comhelp(cmdUrl,textObj,idObj){
   var url ="jsp/help.jsp?url="+cmdUrl;
   var win = showModalDialog(url,window,"scroll:auto;status:no;dialogWidth:600px;dialogHeight:400px");
   if (win == null){
      return;
   }else{
      idObj.value=win[0];    
      textObj.value=win[1];
   }
}
function gridcomhelp(cmdUrl,gridObj,idIndex,textIndex){
   var url ="jsp/help.jsp?url="+cmdUrl;
   var win = showModalDialog(url,window,"scroll:auto;status:no;dialogWidth:600px;dialogHeight:400px");
   if (win == null){
      return;
   }else{
   	  gridObj.setCellValue(gridObj.getCurrentLine(),idIndex,win[0]);
   	  gridObj.setCellValue(gridObj.getCurrentLine(),textIndex,win[1]);
   	}	
}
function clean(textObj,idObj){
textObj="";
idObj="";
}
</script>
</body>
</html>