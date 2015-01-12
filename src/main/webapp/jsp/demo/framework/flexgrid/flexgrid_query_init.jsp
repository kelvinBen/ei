<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("FLEXGRID.QUERY.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<web:js src="MultiSelect.js"/>
<web:js src="flexgrid.js"/>
<web:js src="calendar.js"/>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<bsp:container title='<%=ResourcesFactory.getString("FLEXGRID.QUERY.TITLE")%>' >
<bsp:containbutton action="flexgrid.cmd?method=forinsert" onclick="forInsert()" text='<%=ResourcesFactory.getString("COMMON.ADD")%>'></bsp:containbutton>
<bsp:containbutton action="flexgrid.cmd?method=forupdate" onclick="forUpdate()" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>'></bsp:containbutton>
<bsp:containbutton action="flexgrid.cmd?method=detail" onclick="forDetail()" text='<%=ResourcesFactory.getString("COMMON.DETAIL")%>'></bsp:containbutton>
<bsp:containbutton action="flexgrid.cmd?method=delete" onclick="forDelete()" text='<%=ResourcesFactory.getString("COMMON.DELETE")%>'></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList"  action="flexgridquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td><%=ResourcesFactory.getString("FLEXGRID.FLEX_ID")%>:<flex:searchText name="flex_idSearch" property="flex_idSearch" searchName="FLEXGRID.FLEX_ID" dataType="java.lang.String" operSymbol="=" size="16">
	  </flex:searchText></td>
    <td><%=ResourcesFactory.getString("FLEXGRID.FLEX_TEXT")%>:<flex:searchText name="flex_textSearch" property="flex_textSearch" searchName="FLEXGRID.FLEX_TEXT" dataType="java.lang.String" operSymbol="=" size="12">
	  </flex:searchText></td>
    <td><%=ResourcesFactory.getString("FLEXGRID.FLEX_ENUM")%>:<flex:searchSelect size="1" name="flex_enumSearch" searchName="FLEXGRID.FLEX_ENUM" dataType="java.lang.String" property="flex_enumSearch" operSymbol="=" >
	    <option value=""><%=ResourcesFactory.getString("COMMON.SELECT")%></option><%--
	    <html:options collection="FLEXGRID_FLEXENUM_COLLECTION" labelProperty="value" property="key"/>
	  --%></flex:searchSelect></td>
	</tr>
	<tr>
	  <td><%=ResourcesFactory.getString("FLEXGRID.FLEX_DATE")%>:<flex:searchDate name="flex_dateSearch" divname="flex_dateSearchdd" searchName="FLEXGRID.FLEX_DATE" dataType="java.lang.String" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"  operSymbol="=">
	  </flex:searchDate></td>
	  <td><%=ResourcesFactory.getString("FLEXGRID.FLEX_NUMERIC")%>:<flex:searchText name="flex_numericSearch" property="flex_numericSearch" searchName="FLEXGRID.FLEX_NUMERIC" dataType="java.lang.String" operSymbol="=" size="12">
	  </flex:searchText></td>
    <td><%=ResourcesFactory.getString("FLEXGRID.FLEX_LISTENUM")%>:<flex:searchSelect size="1" name="flex_listenumSearch" property="flex_listenumSearch" searchName="FLEXGRID.FLEX_LISTENUM" dataType="java.lang.String" operSymbol="=" >
	   <option value=""><%=ResourcesFactory.getString("COMMON.SELECT")%></option><%--
	    <html:options collection="FLEXGRID_FLEXLISTENUM_COLLECTION" labelProperty="value" property="key"/>
	  --%></flex:searchSelect></td>
	  <td><flex:searchImg name="chaxun" action="flexgridquery_page_init.cmd" image="search.gif"/></td>
	</tr>
	<tr>
	  <td><%=ResourcesFactory.getString("FLEXGRID.COUNTRY")%>:<flex:searchMultiSelect size="1" name="flex_countrySearch" property="flex_countrySearch" searchName="FLEXGRID.flex_COUNTRY" dataType="java.lang.String" operSymbol="=" onchange="getProvinces()">
	    <html:multiOption value=""><%=ResourcesFactory.getString("COMMON.SELECT")%></html:multiOption>
	    <html:multiOption value="cn"><%=ResourcesFactory.getString("FLEXGRID.CHINA")%></html:multiOption>
        <html:multiOption value="us"><%=ResourcesFactory.getString("FLEXGRID.AMERICE")%></html:multiOption>
        <html:multiOption value="es"><%=ResourcesFactory.getString("FLEXGRID.ENGLAND")%></html:multiOption>
	  </flex:searchMultiSelect></td>
	  <td><%=ResourcesFactory.getString("FLEXGRID.PROVINCE")%>:<flex:searchMultiSelect size="1" name="flex_provinceSearch" property="flex_provinceSearch" searchName="FLEXGRID.flex_PROVINCE" dataType="java.lang.String" operSymbol="=" onchange="getCitys()">
	   <html:multiOptions collection="provinces" property="id" labelProperty="name" filterKey="countryId"></html:multiOptions>
	  </flex:searchMultiSelect></td>
	  <td><%=ResourcesFactory.getString("FLEXGRID.CITY")%>:<flex:searchMultiSelect size="1" name="flex_citySearch" property="flex_citySearch" searchName="FLEXGRID.flex_CITY" dataType="java.lang.String" operSymbol="=">
	   <html:multiOptions collection="citys" property="id" labelProperty="name" filterKey="provinceId"></html:multiOptions>
	  </flex:searchMultiSelect></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true"  export="true">
                <flex:radioCol caption='<%=ResourcesFactory.getString("COMMON.CHOOSE")%>' isCheckedProperty="flexId" width="50" property="flexId" name="primaryKey" sortName="FLEXGRID.FLEX_ID"></flex:radioCol>
				<flex:multiHead caption='<%=ResourcesFactory.getString("FLEXGRID.MULTICOLUMN")%>'>
				<flex:flexCol caption='<%=ResourcesFactory.getString("FLEXGRID.FLEX_TEXT")%>' width="100" property="flexText" sortName="FLEXGRID.FLEX_TEXT"></flex:flexCol>
				<flex:multiHead caption="Code 1">
				<flex:flexCol caption='<%=ResourcesFactory.getString("FLEXGRID.FLEX_CURRENCY")%>' width="100" property="flexCurrency" style="background-color:yellow;text-align:left;" type="currency" sortName="FLEXGRID.FLEX_CURRENCY" isSum="true"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("FLEXGRID.FLEX_DATE")%>' width="100" property="flexDate" sortName="FLEXGRID.FLEX_DATE" type="date" format="yyyyMMdd#yyyyMMdd" isSum="false"></flex:flexCol>
				</flex:multiHead>
				<flex:multiHead caption="Code 2">
				<flex:flexCol caption='<%=ResourcesFactory.getString("FLEXGRID.FLEX_NUMERIC")%>' width="100" property="flexNumeric" type="double" format="6#,###.##" sortName="FLEXGRID.FLEX_NUMERIC" isSum="true"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("FLEXGRID.FLEX_ENUM")%>' width="100" property="flexEnum" type="enum" enumCollection="FLEXGRID_FLEXENUM_COLLECTION" enumKey ="key" enumValue="value" sortName="FLEXGRID.FLEX_ENUM"></flex:flexCol>
				</flex:multiHead>
				<flex:multiHead caption="Code 3">
				<flex:flexCol caption='<%=ResourcesFactory.getString("FLEXGRID.FLEX_LISTENUM")%>' width="100" property="flexListenum" type="enum" enumCollection="FLEXGRID_FLEXLISTENUM_COLLECTION" enumKey ="key" enumValue="value" hasDelimiter="true" sortName="FLEXGRID.FLEX_LISTENUM"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("FLEXGRID.FLEX_SQL")%>' width="100" property="flexSql" sortName="FLEXGRID.FLEX_SQL"></flex:flexCol>
                </flex:multiHead>
                </flex:multiHead>
</flex:flexgrid>
<flex:pagePolit action="flexgridquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">   
grid.show();
var ss=new MultiSelect("ss");
document.all('flex_countrySearch').onchange();
document.all('flex_provinceSearch').onchange();
function getProvinces(){
   ss.fillData('flex_countrySearch','flex_provinceSearch');
   document.all('flex_provinceSearch').onchange();
}
function getCitys(){  
  ss.fillData('flex_provinceSearch','flex_citySearch'); 
  
}
function redColor(){
  var gridrows = grid.returnRowCount();
  for(var i=1;i<gridrows+1;i++){
     var num = grid.getCellValue(i,5);
     if(eval(num)+0<0){
     grid.getCell(i,5).style.color="red";
     }
  }
}
redColor();
function forInsert(){
  document.forms[0].action ="flexgrid.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="flexgrid.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="flexgrid.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="flexgrid.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert('<%=ResourcesFactory.getString("COMMON.SELECT_A_RECORD")%>');
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert('<%=ResourcesFactory.getString("COMMON.SELECT_A_RECORD")%>');
    return false;
  }  
  return true;
}
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert('<%=ResourcesFactory.getString("COMMON.SELECT_DELETE_RECORD")%>');
    return false;
  }
  if (!confirm('<%=ResourcesFactory.getString("COMMON.DELETE_CONFIRM")%>')) {
   	     return false;
   	     }  
  return true;
}
</script>