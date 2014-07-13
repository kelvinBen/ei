<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>国家(地区)查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
	String country_code = request.getParameter("country_codeSearch");
	if (country_code==null){
	  country_code="";
	}else{
	  if(country_code.indexOf("%")!=-1){
	   country_code=country_code.replaceAll("%"," ");
	  }
	}
	country_code=country_code.trim();
%>
<bsp:container title="国家(地区)代码查询" >
<bsp:containbutton onclick="forInsert()" text="增加" action="country.cmd?method=forinsert"></bsp:containbutton>
<bsp:containbutton onclick="forUpdate()" text="修改" action="country.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()" text="明细" action="country.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()" text="删除" action="country.cmd?method=delete"></bsp:containbutton>
<html:form name="frmList" action="countryquery.cmd" onsubmit="check();">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>国家(地区)代码：<flex:searchHidden name="country_codeSearch" searchName="PUB_COUNTRY.COUNTRY_CODE" dataType="java.lang.String" operSymbol=" like " value="<%=country_code%>">
	</flex:searchHidden><input type="text" size="12" name="temp"></td>
	<td><flex:searchImg name="chaxun" action="countryquery.cmd" image="search.gif" imgClick=""/></td>
	</tr>
</flex:search>
</table>


<support:flexgrid name="grid" height="340" action="" isSubmit="true">
      <flex:checkboxCol caption="选择" width="40" property="COUNTRY_CODE"  name="primaryKey" sortName="PUB_COUNTRY.COUNTRY_CODE"></flex:checkboxCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COUNTRY.COUNTRY_CODE")%>' width="100" property="COUNTRY_CODE" style="text-align:left" sortName="PUB_COUNTRY.COUNTRY_CODE"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COUNTRY.COUNTRY_NAME")%>' width="150" property="COUNTRY_NAME" style="text-align:left" sortName="PUB_COUNTRY.COUNTRY_NAME"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COUNTRY.SHORT_NAME")%>' width="100" property="SHORT_NAME"  style="text-align:left" sortName="PUB_COUNTRY.SHORT_NAME"></flex:flexCol>
</support:flexgrid>  
      
                
<flex:pagePolit action="countryquery.cmd" nextPageClick="check()" previusPageClick="check()" turnPageClick="check()" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="country.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
function forInsert(){
  document.forms[0].action ="country.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="country.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="country.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="country.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}
function getDelete(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要删除的记录!");
    return false;
  }
  if (!confirm("真的要删除选中的记录吗？此操作不能恢复！")) {
   	     return false;
   	 }  
    return true;
}
function check(){
   var country_codeSearch=document.all("temp").value;
   country_codeSearch=trim(country_codeSearch);
   if(country_codeSearch.indexOf("%")==-1){
     country_codeSearch="%"+country_codeSearch+"%";
     document.all("country_codeSearch").value=country_codeSearch;
  } 
  return true

}

</script>