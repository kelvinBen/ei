
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<% 
    String stru_type = request.getParameter("stru_typeSearch");
	if (stru_type==null){
	  stru_type="";
	}
%>
<bsp:container title="组织结构类型查询" >
<html:form name="frmList" action="strutypequery.cmd" onsubmit="check();">
        <bsp:containbutton onclick="forManage()" text="管理" ></bsp:containbutton>
        <bsp:containbutton onclick="forInsert()" text="增加" action="strutype.cmd?method=forinsert"></bsp:containbutton>
        <bsp:containbutton onclick="forUpdate()" text="修改" action="strutype.cmd?method=forupdate"></bsp:containbutton>
        <bsp:containbutton onclick="forDetail()" text="明细" action="strutype.cmd?method=detail"></bsp:containbutton>
        <bsp:containbutton onclick="forDelete()" text="删除" action="strutype.cmd?method=fordelete"></bsp:containbutton>

<table id="tblSearch">
<flex:search>
	<tr>
    <td nowrap>组织结构类型代码：<flex:searchHidden name="stru_typeSearch" searchName="PUB_STRU_TYPE.STRU_TYPE" dataType="java.lang.String" operSymbol=" like " value="<%=stru_type%>">
	</flex:searchHidden><input type="text" size="12" name="temp"></td>
	<td><flex:searchImg name="chaxun" action="strutypequery.cmd" image="search.gif" imgClick=" " /></td>
	</tr>
</flex:search>
</table>
<support:flexgrid name="grid" height="340" action="" isSubmit="true">
      <flex:radioCol caption="选择" width="40" property="STRU_TYPE"  name="primaryKey" sortName="PUB_STRU_TYPE.STRU_TYPE"></flex:radioCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_TYPE.STRU_TYPE")%>' width="100" property="STRU_TYPE" style="text-align:left" sortName="PUB_STRU_TYPE.STRU_TYPE"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_TYPE.TYPE_NAME")%>' width="200" property="TYPE_NAME" style="text-align:left" sortName="PUB_STRU_TYPE.TYPE_NAME"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_TYPE.NOTE")%>' width="100" property="NOTE" style="text-align:left" sortName="PUB_STRU_TYPE.NOTE"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="strutypequery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>

<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="strutype.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
function forInsert(){
  document.forms[0].action ="strutype.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="strutype.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="strutype.cmd?method=detail";    
  document.forms[0].submit();	
}
function forManage(){
 if(!getSelect()) return;
  //top.contents.tree.src="struversion.cmd?method=detail&primaryKey="+grid.getCheckLine();
  <% String app=request.getContextPath();%>
  	//界面采用v3版本的利用下面的这段代码展示树
	//getMainFrame().location.href="jsp/content.jsp";
	//getTreeFrame().location.href="<%=app%>"+"/stru.cmd?method=getSubRoot&primaryKey="+grid.getCheckLine();
	//界面采用bsp主版本的利用下面的这段代码展示树
	var url=top.contents.document.all("new_date").src.index
	top.contents.document.all("new_date").src="<%=app%>"+"/stru.cmd?method=getSubRoot&primaryKey="+grid.getCheckLine();
	top.contents.document.all("new_menu").style.display="none";
	top.contents.document.all("new_date").style.display="block";
	//top.contents.menu.background="<mast:ui img='menu1.gif'/>";
	//top.contents.tree.background="<mast:ui img='tree1_h.gif'/>";
}
function forDelete(){
  if(!getDelete()) return;
  var struType = grid.getCheckLine();
  document.forms[0].action ="strutype.cmd?method=delete&struType="+struType;    
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
  var stru_typeSearch=document.all("temp").value;
  stru_typeSearch=trim(stru_typeSearch);
   if(stru_typeSearch.indexOf("%")==-1){
     stru_typeSearch="%"+stru_typeSearch+"%";
     document.all("stru_typeSearch").value=stru_typeSearch;
  } 
  return true  
}
</script>