<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>机构参数类型表</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script> 
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>

<% 
	String parms_name = request.getParameter("parms_nameSearch");
	if (parms_name==null){
	  parms_name="";
	}else{
	  if(parms_name.indexOf("%")!=-1){
	   parms_name=parms_name.replaceAll("%"," ");
	  }
	}
	parms_name=parms_name.trim();
%>
<bsp:container title="机构参数类型表" >
<html:form name="frmList" action="organparmsthelp.cmd">
<bsp:containbutton  onclick="clickOk()" text="确定"></bsp:containbutton>
<bsp:containbutton  onclick="forClose()" text="关闭"></bsp:containbutton>
<bsp:containbutton  onclick="clickCancel()" text="清除"></bsp:containbutton>
<html:messages></html:messages>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>参数名称：<flex:searchHidden name="parms_nameSearch" searchName="PUB_ORGAN_PARMS_T.PARMS_NAME" dataType="java.lang.String" operSymbol=" like " value="<%=parms_name%>">
	</flex:searchHidden><input type="text" size="12" name="temp"></td>
	<td><flex:searchImg name="chaxun" action="organparmsthelp.cmd" image="search.gif" imgClick="return check();"/></td>
	</tr>
</flex:search>
</table>
<support:flexgrid name="grid" height="340" action="" isSubmit="true">
	<flex:radioCol caption="选择" width="40" property="PARMS_NAME"  name="primaryKey" style="text-align:left" sortName="PUB_ORGAN_PARMS_T.PARMS_NAME"></flex:radioCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.PARMS_NAME")%>' width="100" property="PARMS_NAME" sortName="PUB_ORGAN_PARMS_T.PARMS_NAME" style="text-align:left"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.PARMS_VALUE")%>' width="100" property="PARMS_VALUE" sortName="PUB_ORGAN_PARMS_T.PARMS_VALUE"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.DATA_RES")%>' width="100" type="enum" enumCollection="ORGANPARMST_DATARES_COLLECTION" property="DATA_RES" enumKey="key" enumValue="value" sortName="PUB_ORGAN_PARMS_T.DATA_RES"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="organparmsthelp.cmd" pageSize="10">
</flex:pagePolit>

</html:form>
</bsp:container>

<script language="javascript">
grid.show();
var key=new Array();
function clickOk(){
	if(!getSelect()) return;
	var returnV=new Array(5);
	returnV[0]=key[0];
	returnV[1]=key[2];
	returnV[2]=key[3];	
	window.returnValue=returnV;
	parent.close();
}
function forClose(){
 parent.close();
}
function clickCancel(){
    var returnV=new Array(2);
	returnV[0]="";
	returnV[1]="";
	window.returnValue=returnV;
	parent.close();
}

function getSelect(){
  var sel=grid.getCheckLine();
  var myall=grid.getCheckAll('α','β');
  var ob=myall.split('β');
 
  var b=0;
  var str=ob[0];  
  for(var i=0;i<5;i++){
    b=str.indexOf("α");
  	key[i]=str.substring(0,b);  
  	str = str.substring(b+1); 
  }
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  //var obj=sel.split(",");  
  //if(obj.length*1>1){
  //  alert("请选择一条记录!");
  //  return false;
  //}  
  return true;  
}
function check(){
   var parms_nameSearch=document.all("temp").value;
   parms_nameSearch=trim(parms_nameSearch);
   if(parms_nameSearch.indexOf("%")==-1){
     parms_nameSearch="%"+parms_nameSearch+"%";
     document.all("parms_nameSearch").value=parms_nameSearch;
  } 
  return true
}

</script>