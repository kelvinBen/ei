<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<script language="javascript" src="<%=SkinUtils.getJS(request,"flexgrid.js")%>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String workplace_name = request.getParameter("workplace_name");
	if (workplace_name==null){
	  workplace_name="";
	}else{
	  if(workplace_name.indexOf("%")!=-1){
	   workplace_name=workplace_name.replaceAll("%"," ");
	  }
	}
	workplace_name=workplace_name.trim();
	
	String cant_name = request.getParameter("cant_name");
	if (cant_name==null){
	  cant_name="";
	}else{
	  if(cant_name.indexOf("%")!=-1){
	   cant_name=cant_name.replaceAll("%"," ");
	  }
	}
	cant_name=cant_name.trim();
	
   String short_name = request.getParameter("short_name");
	if (short_name==null){
	  short_name="";
	}else{
	  if(short_name.indexOf("%")!=-1){
	   short_name=short_name.replaceAll("%"," ");
	  }
	}
	short_name=short_name.trim();
%>
<bsp:container title="工作地点查询" >
<bsp:containbutton onclick="forInsert()" text="增加" action="workplace.cmd?method=forinsert"></bsp:containbutton>
<bsp:containbutton onclick="forUpdate()" text="修改" action="workplace.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()" text="明细" action="workplace.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()" text="删除" action="workplace.cmd?method=delete"></bsp:containbutton>
<html:form name="frmList" action="workplacequery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td nowrap>工作地点名称：<flex:searchHidden name="workplace_name" searchName="V_WORKPLACE.WORKPLACE_NAME" dataType="java.lang.String" operSymbol=" like " value="<%=workplace_name%>" >
	</flex:searchHidden><input type="text" size="12" name="temp1"></td>
	<td nowrap>工作地点简称：<flex:searchHidden name="short_name" searchName="V_WORKPLACE.SHORT_NAME" dataType="java.lang.String" operSymbol=" like " value="<%=short_name%>" >
	</flex:searchHidden><input type="text" size="12" name="temp2"></td>
	<td nowrap>所在行政区划名称：<flex:searchHidden name="cant_name" searchName="V_WORKPLACE.CANT_NAME" dataType="java.lang.String" operSymbol=" like " value="<%=cant_name%>" >
	</flex:searchHidden><input type="text" size="12" name="temp3"></td>
	
	<td><flex:searchImg name="chaxun" action="workplacequery.cmd"  imgClick="if (!check()) return false;" image="search.gif"/></td>
	</tr>
</flex:search>
</table>

<support:flexgrid name="grid" height="340" action="" isSubmit="true">
      <flex:radioCol caption="选择" width="40" property="WORKPLACE_ID"  name="primaryKey" sortName="V_WORKPLACE.WORKPLACE_ID"></flex:radioCol>
     <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_WORKPLACE.WORKPLACE_NAME")%>' width="150" property="WORKPLACE_NAME" style="text-align:left" sortName="V_WORKPLACE.WORKPLACE_NAME"></flex:flexCol>
     <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_WORKPLACE.SHORT_NAME")%>' width="150" property="SHORT_NAME" style="text-align:left" sortName="V_WORKPLACE.SHORT_NAME"></flex:flexCol>
     <flex:flexCol caption='所在行政区划名称' width="300" property="CANT_NAME" style="text-align:left" sortName="V_WORKPLACE.CANT_NAME"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="workplacequery.cmd" nextPageClick="check()" previusPageClick="check()" turnPageClick="check()"  pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="workplace.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
function forInsert(){
  document.forms[0].action ="workplace.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="workplace.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="workplace.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="workplace.cmd?method=delete";    
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
 var workplace_name = document.all("temp1").value;
  workplace_name=trim(workplace_name);
  if(workplace_name.indexOf("%")==-1){
    workplace_name="%"+workplace_name+"%";
    document.all("workplace_name").value=workplace_name;
  }
	
 var short_name = document.all("temp2").value;
  short_name=trim(short_name);
  if(short_name.indexOf("%")==-1){
    short_name="%"+short_name+"%";
    document.all("short_name").value=short_name;
   }

 var cant_name = document.all("temp3").value;
  cant_name=trim(cant_name);
  if(cant_name.indexOf("%")==-1){
    cant_name="%"+cant_name+"%";
    document.all("cant_name").value=cant_name;
  }
 
 return true;
     
}
</script>