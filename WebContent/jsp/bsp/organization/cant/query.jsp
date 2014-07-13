<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE>行政区划查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String superCode = (String)request.getAttribute("superCode");
    String country = (String)request.getAttribute("country");	
    String parentCode = (String)request.getAttribute("parentCode");
        if(country==null || country.equals("")){
		country="CN";
      }
      if(superCode==null || superCode.equals("")){
		superCode=country;
      }
	  if(parentCode==null || parentCode.equals("")){
			parentCode="CN";
	}
  
%>  
<bsp:container title="行政区划列表" >

<html:form name="frmList" action="cantquery.cmd">
<bsp:containbutton onclick="forForward()" text="浏览下级" action="cantquery.cmd?method=query"></bsp:containbutton>
<bsp:containbutton onclick="forInsert()" text="增加本级" action="cant.cmd?method=forinsert"></bsp:containbutton>
<bsp:containbutton onclick="forUpdate()" text="修改" action="cant.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()" text="明细" action="cant.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()" text="删除" action="cant.cmd?method=delete"></bsp:containbutton>
<table id="tblSearch">
  <flex:search>
    <tr>
    <td>国家：
         <html:select name="country" property="COUNTRY_CODE" value="<%=country%>" onchange="selectCountry(this)">
	 <html:options collection="countryCodeCollection" labelProperty="COUNTRY_NAME" property="COUNTRY_CODE"/>
	 </html:select>
    </td>
    </tr>
  </flex:search>
</table>

<support:flexgrid name="grid" height="340"  action="" isSubmit="true" export="true">
   <flex:radioCol caption="选择" width="40" property="cantCode"  name="primaryKey" sortName="PUB_CANT.CANT_CODE"></flex:radioCol>
   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_CANT.CANT_CODE")%>' width="100" property="cantCode" style="text-align:left;cursor:hand;color: #000000; text-decoration: underline" sortName="PUB_CANT.CANT_CODE" onclick="clickCant(this)"></flex:flexCol>
   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_CANT.CANT_NAME")%>' width="400" property="cantName" style="text-align:left" sortName="PUB_CANT.CANT_NAME"></flex:flexCol>                          
</support:flexgrid>

</html:form>
</bsp:container>

<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="cant.cmd?method=detail&country=<%=country%>&superCode=<%=superCode%>&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
var key;
function forReturn(){
  document.forms[0].action ="cantquery.cmd?method=query&country=<%=country%>&superCode="+"<%=parentCode%>";     
  document.forms[0].submit();
}
function forForward(){
  if(!getSelect()) return;
  document.forms[0].action ="cantquery.cmd?method=query&country=<%=country%>&superCode="+key+"&parentCode="+"<%=superCode%>";     
  document.forms[0].submit();
}
function forInsert(){
  document.forms[0].action ="cant.cmd?method=forinsert&country=<%=country%>&superCode=<%=superCode%>";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="cant.cmd?method=forupdate&country=<%=country%>&superCode=<%=superCode%>";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="cant.cmd?method=detail&country=<%=country%>&superCode=<%=superCode%>";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="cant.cmd?method=delete&country=<%=country%>&superCode=<%=superCode%>";    
  document.forms[0].submit();	
}

function selectCountry(obj){
   var mycountry=obj.value;
  document.forms[0].action ="cantquery.cmd?method=query&country="+mycountry+"&superCode="+mycountry;     
  document.forms[0].submit();

}


function clickCant(row){
  key=row.parentElement.children[1].children[0].value;
  document.forms[0].action ="cantquery.cmd?method=query&country=<%=country%>&superCode="+key;     
  document.forms[0].submit();
}

function getSelect(){
  var sel=grid.getCheckLine();
  key=sel;
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
</script>