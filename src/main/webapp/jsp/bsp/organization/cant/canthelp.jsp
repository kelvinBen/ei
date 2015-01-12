<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE>ѡ����������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String superCode = (String)request.getAttribute("superCode");
    String country = (String)request.getAttribute("country");	
    String parentCode = (String)request.getAttribute("parentCode");
    if(superCode==null || superCode.equals("")){
			superCode="CN";
	}
	
	if(country==null || country.equals("")){
			country="CN";
	}
	if(parentCode==null || parentCode.equals("")){
			parentCode="CN";
	}
%>  
<widgets:container title="��������" >
<html:form name="frmList" action="">

<widgets:containbutton onclick="clickOk()" text="ȷ��"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="�ر�"></widgets:containbutton>
<widgets:containbutton onclick="clickCancel()" text="���"></widgets:containbutton>
<widgets:containbutton onclick="forReturn()" text="����"></widgets:containbutton>

<table id="tblSearch">
<flex:search>
	<tr>
    <td>���ң�  <html:select name="country" property="COUNTRY_CODE" value="<%=country%>" onchange="selectCountry(this)">
	 <html:options collection="countryCodeCollection" labelProperty="COUNTRY_NAME" property="COUNTRY_CODE"/>
	 </html:select>
	</td>
	</tr>
</flex:search>
</table>

<support:flexgrid name="grid" height="240"  action="" isSubmit="true">

   <flex:radioCol caption="ѡ��" width="40" property="cantCode"  name="primaryKey" sortName="PUB_CANT.CANT_CODE"></flex:radioCol>
   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_CANT.CANT_CODE")%>' width="80" property="cantCode" sortName="PUB_CANT.CANT_CODE" onclick="clickCant(this)" style="cursor:hand;color: #000000; text-decoration: underline"></flex:flexCol>
   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_CANT.CANT_NAME")%>' width="220" property="cantName" sortName="PUB_CANT.CANT_NAME" style="text-align:left"></flex:flexCol>                          
</support:flexgrid>


</html:form>
</widgets:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	grid.getCell(grid.getCurrentLine(),1).children[0].checked=true;
	clickOk();
}
grid.show();
grid.setSumText("");
var key;

function forReturn(){
  document.forms[0].action ="canthelp.cmd?method=query&country=<%=country%>&superCode="+"<%=parentCode%>";     
  document.forms[0].submit();
}
function forForward(){
  if(!getSelect()) return;
  document.forms[0].action ="cantquery.cmd?method=query&country=<%=country%>&superCode="+key;     
  document.forms[0].submit();
}

function clickOk(){
	if(!getSelect()) return;
	var returnV=new Array(2);
	returnV[0]=key[0];
	returnV[1]=key[2];
	window.returnValue=returnV;
	parent.close();
}

function clickCancel(){
    var returnV=new Array(2);
	returnV[0]="";
	returnV[1]="";
	window.returnValue=returnV;
	parent.close();
}
function forClose(){
   parent.close();
}

function selectCountry(obj){ 
  var mycountry=obj.value; 
  document.forms[0].action ="canthelp.cmd?method=query&country="+mycountry+"&superCode="+mycountry;     
  document.forms[0].submit();

}


function clickCant(row){
  key=row.parentElement.children[1].children[0].value;
  document.forms[0].action ="canthelp.cmd?method=query&superCode="+key+"&parentCode="+"<%=superCode%>";     
  document.forms[0].submit();
}


function getSelect(){
  var sel=grid.getCheckLine();
  var myall=grid.getCheckAll();
  var ob=myall.split(",");
  key=ob;
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("��ѡ��һ����¼!");
    return false;
  }  
  return true;
}

</script>