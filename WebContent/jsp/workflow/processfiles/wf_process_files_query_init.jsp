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
<TITLE>流程文件列表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<% 
//保存查询条件
    String process_id = RequestUtil.getPara2String(request,"PROCESS_ID");
    String name = RequestUtil.getPara2String(request,"NAME");
    String type_id = RequestUtil.getPara2String(request,"TYPE_ID");
    String type_name = RequestUtil.getPara2String(request,"TYPE_NAME");
    String organ_id = RequestUtil.getPara2String(request,"ORGAN_ID");
    String organ_name = RequestUtil.getPara2String(request,"ORGAN_NAME");
    String isallsub = RequestUtil.getPara2String(request,"ISALLSUB");
    String formid = RequestUtil.getPara2String(request,"FORMID");
    String formname = RequestUtil.getPara2String(request,"FORMNAME");
    String reservetype = RequestUtil.getPara2String(request,"RESERVETYPE");
    String authpr = RequestUtil.getPara2String(request,"AUTHPR");
    String create_time = RequestUtil.getPara2String(request,"CREATE_TIME");
    String saveimport = RequestUtil.getPara2String(request,"SAVEIMPORT");
    String versionid = RequestUtil.getPara2String(request,"VERSIONID");
    String istemplet = RequestUtil.getPara2String(request,"ISTEMPLET");
    String description = RequestUtil.getPara2String(request,"DESCRIPTION");
%>
<bsp:container title="流程文件列表查询" >
<bsp:containbutton action="wfprocessfiles.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="wfprocessfiles.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="wfprocessfiles.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="wfprocessfiles.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="wfprocessfilesquery_page_init.cmd">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    流程定义ID：<flex:searchText name="PROCESS_ID" searchName="WF_PROCESS_FILES.PROCESS_ID" dataType="java.lang.String" operSymbol="=" value="<%=process_id%>" size="12"/>
    </td>
    <td>
    流程名称：<flex:searchText name="NAME" searchName="WF_PROCESS_FILES.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>
    <td>
    类型编号：<flex:searchText name="TYPE_ID" searchName="WF_PROCESS_FILES.TYPE_ID" dataType="java.lang.String" operSymbol="=" value="<%=type_id%>" size="12"/>
    </td>
    <td>
    类型名称：<flex:searchText name="TYPE_NAME" searchName="WF_PROCESS_FILES.TYPE_NAME" dataType="java.lang.String" operSymbol="=" value="<%=type_name%>" size="12"/>
    </td>
    <td>
    所属机构：<flex:searchText name="ORGAN_ID" searchName="WF_PROCESS_FILES.ORGAN_ID" dataType="java.lang.String" operSymbol="=" value="<%=organ_id%>" size="12"/>
    </td>
    <td>
    所属机构名称：<flex:searchText name="ORGAN_NAME" searchName="WF_PROCESS_FILES.ORGAN_NAME" dataType="java.lang.String" operSymbol="=" value="<%=organ_name%>" size="12"/>
    </td>
  <td>是否在所有下级机构中使用：
           <flex:searchSelect name="ISALLSUB" searchName="WF_PROCESS_FILES.ISALLSUB" dataType="java.lang.String" operSymbol="=" value="<%=isallsub%>" >
	         <option value="">全部</option>
	         <html:options collection="WFPROCESSFILES_ISALLSUB_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
    <td>
    表单ID：<flex:searchText name="FORMID" searchName="WF_PROCESS_FILES.FORMID" dataType="java.lang.String" operSymbol="=" value="<%=formid%>" size="12"/>
    </td>
    <td>
    表单名称：<flex:searchText name="FORMNAME" searchName="WF_PROCESS_FILES.FORMNAME" dataType="java.lang.String" operSymbol="=" value="<%=formname%>" size="12"/>
    </td>
    <td>
    保留域类型：<flex:searchText name="RESERVETYPE" searchName="WF_PROCESS_FILES.RESERVETYPE" dataType="java.lang.String" operSymbol="=" value="<%=reservetype%>" size="12"/>
    </td>
    <td>
    作者：<flex:searchText name="AUTHPR" searchName="WF_PROCESS_FILES.AUTHPR" dataType="java.lang.String" operSymbol="=" value="<%=authpr%>" size="12"/>
    </td>
    <td>
    创建时间：<flex:searchText name="CREATE_TIME" searchName="WF_PROCESS_FILES.CREATE_TIME" dataType="java.lang.String" operSymbol="=" value="<%=create_time%>" size="12"/>
    </td>
    <td>
    是否导入：<flex:searchText name="SAVEIMPORT" searchName="WF_PROCESS_FILES.SAVEIMPORT" dataType="java.lang.String" operSymbol="=" value="<%=saveimport%>" size="12"/>
    </td>
    <td>
    版本号：<flex:searchText name="VERSIONID" searchName="WF_PROCESS_FILES.VERSIONID" dataType="java.lang.String" operSymbol="=" value="<%=versionid%>" size="12"/>
    </td>
  <td>是否模板：
           <flex:searchSelect name="ISTEMPLET" searchName="WF_PROCESS_FILES.ISTEMPLET" dataType="java.lang.Integer" operSymbol="=" value="<%=istemplet%>" >
	         <option value="">全部</option>
	         <html:options collection="WFPROCESSFILES_ISTEMPLET_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
    <td>
    描述：<flex:searchText name="DESCRIPTION" searchName="WF_PROCESS_FILES.DESCRIPTION" dataType="java.lang.String" operSymbol="=" value="<%=description%>" size="12"/>
    </td>
	<td><flex:searchImg name="chaxun" action="wfprocessfilesquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>

<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- 流程定义ID --><flex:checkboxCol caption="全选" width="35" property="processId" name="primaryKey" sortName="WF_PROCESS_FILES.PROCESS_ID"></flex:checkboxCol>
<!-- 流程名称 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.NAME")%>' width="100" property="name" sortName="WF_PROCESS_FILES.NAME"/>
<!-- 类型编号 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.TYPE_ID")%>' width="100" property="typeId" sortName="WF_PROCESS_FILES.TYPE_ID"/>
<!-- 类型名称 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.TYPE_NAME")%>' width="100" property="typeName" sortName="WF_PROCESS_FILES.TYPE_NAME"/>
<!-- 所属机构 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.ORGAN_ID")%>' width="100" property="organId" sortName="WF_PROCESS_FILES.ORGAN_ID"/>
<!-- 所属机构名称 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.ORGAN_NAME")%>' width="100" property="organName" sortName="WF_PROCESS_FILES.ORGAN_NAME"/>
<!-- 是否在所有下级机构中使用 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.ISALLSUB")%>' width="100" property="isallsub" type="enum" enumCollection="WFPROCESSFILES_ISALLSUB_COLLECTION" enumKey ="key" enumValue="value" sortName="WF_PROCESS_FILES.ISALLSUB"/>
<!-- 表单ID --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.FORMID")%>' width="100" property="formid" sortName="WF_PROCESS_FILES.FORMID"/>
<!-- 表单名称 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.FORMNAME")%>' width="100" property="formname" sortName="WF_PROCESS_FILES.FORMNAME"/>
<!-- 保留域类型 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.RESERVETYPE")%>' width="100" property="reservetype" sortName="WF_PROCESS_FILES.RESERVETYPE"/>
<!-- 作者 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.AUTHPR")%>' width="100" property="authpr" sortName="WF_PROCESS_FILES.AUTHPR"/>
<!-- 创建时间 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.CREATE_TIME")%>' width="100" property="createTime" sortName="WF_PROCESS_FILES.CREATE_TIME"/>
<!-- 是否导入 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.SAVEIMPORT")%>' width="100" property="saveimport" sortName="WF_PROCESS_FILES.SAVEIMPORT"/>
<!-- 版本号 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.VERSIONID")%>' width="100" property="versionid" sortName="WF_PROCESS_FILES.VERSIONID"/>
<!-- 是否模板 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.ISTEMPLET")%>' width="100" property="istemplet" sortName="WF_PROCESS_FILES.ISTEMPLET" style="display:none"/>
<!-- 描述 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.DESCRIPTION")%>' width="100" property="description" sortName="WF_PROCESS_FILES.DESCRIPTION"/>
<!-- 备注 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE")%>' width="100" property="note" sortName="WF_PROCESS_FILES.NOTE" style="display:none"/>
<!-- NOTE2 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE2")%>' width="100" property="note2" sortName="WF_PROCESS_FILES.NOTE2" style="display:none"/>
<!-- NOTE3 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE3")%>' width="100" property="note3" sortName="WF_PROCESS_FILES.NOTE3" style="display:none"/>
</flex:flexgrid>
<flex:pagePolit action="wfprocessfilesquery_page_init.cmd" pageSize="15">
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
  document.forms[0].action ="wfprocessfiles.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
var url="wfprocessfiles.cmd?method=forupdate";    
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"流程文件列表修改",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDetail(primaryKey){
var url="wfprocessfiles.cmd?method=detail"; 
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"流程文件列表查看",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="wfprocessfiles.cmd?method=delete";    
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