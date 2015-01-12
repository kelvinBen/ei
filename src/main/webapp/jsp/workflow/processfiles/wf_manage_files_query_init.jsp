<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@page import="net.mast.util.RequestUtil"%>
<HTML>
<HEAD>
<TITLE>流程定义文件查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<% 
//保存查询条件
    String process_type = RequestUtil.getPara2String(request,"PROCESS_TYPE");
    String file_name = RequestUtil.getPara2String(request,"FILE_NAME");
    String file_content = RequestUtil.getPara2String(request,"FILE_CONTENT");
%>
<bsp:container title="流程定义文件查询" >
<bsp:containbutton action="wfmanagefiles.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="wfmanagefiles.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="wfmanagefiles.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="wfmanagefiles.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="wfmanagefilesquery_page_init.cmd">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    流程定义ID：<flex:searchText name="PROCESS_TYPE" searchName="WF_MANAGE_FILES.PROCESS_TYPE" dataType="java.lang.String" operSymbol="=" value="<%=process_type%>" size="12"/>
    </td>
    <td>
    文件类型：<flex:searchText name="FILE_NAME" searchName="WF_MANAGE_FILES.FILE_NAME" dataType="java.lang.String" operSymbol="=" value="<%=file_name%>" size="12"/>
    </td>
    <td>
    文件内容：<flex:searchText name="FILE_CONTENT" searchName="WF_MANAGE_FILES.FILE_CONTENT" dataType="java.lang.String" operSymbol="=" value="<%=file_content%>" size="12"/>
    </td>
	<td><flex:searchImg name="chaxun" action="wfmanagefilesquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>

<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- 流程定义ID --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_MANAGE_FILES.PROCESS_TYPE")%>' width="100" property="processType" sortName="WF_MANAGE_FILES.PROCESS_TYPE" style="display:none"/>
<!-- 文件类型 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_MANAGE_FILES.FILE_NAME")%>' width="100" property="fileName" sortName="WF_MANAGE_FILES.FILE_NAME" style="display:none"/>
<!-- 文件内容 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_MANAGE_FILES.FILE_CONTENT")%>' width="100" property="fileContent" sortName="WF_MANAGE_FILES.FILE_CONTENT" style="display:none"/>
</flex:flexgrid>
<flex:pagePolit action="wfmanagefilesquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
//设置查看链接
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var primaryKey=grid.getCellValue(i, 1);
		var title=grid.getCellValue(i, 2);
		var forlook='<a href="javascript:forDetail(\''+primaryKey+'\')" >'+title+'</a>';
		grid.getCell(i, 2).innerHTML =forlook;
	}

function forInsert(){
  document.forms[0].action ="wfmanagefiles.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
var url="wfmanagefiles.cmd?method=forupdate";    
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"流程定义文件修改",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDetail(primaryKey){
var url="wfmanagefiles.cmd?method=detail"; 
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"流程定义文件查看",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="wfmanagefiles.cmd?method=delete";    
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
  if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
</script>