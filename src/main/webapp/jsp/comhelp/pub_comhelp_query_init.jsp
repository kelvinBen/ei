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
<TITLE>通用选择查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
//保存查询条件
    String help_id = RequestUtil.getPara2String(request,"HELP_ID");
    String help_title = RequestUtil.getPara2String(request,"HELP_TITLE");
    String help_sql = RequestUtil.getPara2String(request,"HELP_SQL");
    String id_field = RequestUtil.getPara2String(request,"ID_FIELD");
    String show_field = RequestUtil.getPara2String(request,"SHOW_FIELD");
    String return_field = RequestUtil.getPara2String(request,"RETURN_FIELD");
    String shearch_field = RequestUtil.getPara2String(request,"SHEARCH_FIELD");
    String show_name = RequestUtil.getPara2String(request,"SHOW_NAME");
    String help_note = RequestUtil.getPara2String(request,"HELP_NOTE");
    String datasource = RequestUtil.getPara2String(request,"DATASOURCE");
    String note = RequestUtil.getPara2String(request,"NOTE");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
    String note3 = RequestUtil.getPara2String(request,"NOTE3");
%>
<bsp:container title="通用选择查询" >
<bsp:containbutton action="pubcomhelp.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="pubcomhelp.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="pubcomhelp.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="pubcomhelp.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<bsp:containbutton   onclick="forTest(0)" text="单选测试选择"></bsp:containbutton>
<bsp:containbutton   onclick="forTest(1)" text="多选测试选择"></bsp:containbutton>


<html:messages></html:messages>
<html:form name="frmList" action="pubcomhelpquery_page_init.cmd">
<table id="tblSearch" width="90%">
<flex:search>
	<tr >
    <td>
    帮助编号：<flex:searchText name="HELP_ID" searchName="PUB_COMHELP.HELP_ID" dataType="java.lang.String" operSymbol="=" value="<%=help_id%>" size="12"/>
    </td>
    <td>
    帮助标题：<flex:searchText name="HELP_TITLE" searchName="PUB_COMHELP.HELP_TITLE" dataType="java.lang.String" operSymbol="=" value="<%=help_title%>" size="12"/>
    </td>
<!--   <td>
    显示选择的SQL：<flex:searchText name="HELP_SQL" searchName="PUB_COMHELP.HELP_SQL" dataType="java.lang.String" operSymbol="=" value="<%=help_sql%>" size="12"/>
    </td>
    <td>
    唯一标示字段：<flex:searchText name="ID_FIELD" searchName="PUB_COMHELP.ID_FIELD" dataType="java.lang.String" operSymbol="=" value="<%=id_field%>" size="12"/>
    </td>
    <td>
    显示字段：<flex:searchText name="SHOW_FIELD" searchName="PUB_COMHELP.SHOW_FIELD" dataType="java.lang.String" operSymbol="=" value="<%=show_field%>" size="12"/>
    </td>
    <td>
    返回字段：<flex:searchText name="RETURN_FIELD" searchName="PUB_COMHELP.RETURN_FIELD" dataType="java.lang.String" operSymbol="=" value="<%=return_field%>" size="12"/>
    </td>
    <td>
    查询条件字段：<flex:searchText name="SHEARCH_FIELD" searchName="PUB_COMHELP.SHEARCH_FIELD" dataType="java.lang.String" operSymbol="=" value="<%=shearch_field%>" size="12"/>
    </td>
    <td>
    帮助字段显示名称：<flex:searchText name="SHOW_NAME" searchName="PUB_COMHELP.SHOW_NAME" dataType="java.lang.String" operSymbol="=" value="<%=show_name%>" size="12"/>
    </td>
    <td>
    说明：<flex:searchText name="HELP_NOTE" searchName="PUB_COMHELP.HELP_NOTE" dataType="java.lang.String" operSymbol="=" value="<%=help_note%>" size="12"/>
    </td>
    <td>
    数据源：<flex:searchText name="DATASOURCE" searchName="PUB_COMHELP.DATASOURCE" dataType="java.lang.String" operSymbol="=" value="<%=datasource%>" size="12"/>
    </td>
    <td>
    备注：<flex:searchText name="NOTE" searchName="PUB_COMHELP.NOTE" dataType="java.lang.String" operSymbol="=" value="<%=note%>" size="12"/>
    </td>
    <td>
    NOTE2：<flex:searchText name="NOTE2" searchName="PUB_COMHELP.NOTE2" dataType="java.lang.String" operSymbol="=" value="<%=note2%>" size="12"/>
    </td>
    <td>
    NOTE3：<flex:searchText name="NOTE3" searchName="PUB_COMHELP.NOTE3" dataType="java.lang.String" operSymbol="=" value="<%=note3%>" size="12"/>
    </td>
 -->  	<td><flex:searchImg name="chaxun" action="pubcomhelpquery_page_init.cmd" image="search.gif"/></td>

    <td align="right" colspan="4"> 测试所需的参数：<html:text name="param" value=""></html:text>(输入格式：参数1=值1&参数2=值2...)	</td></tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- 帮助编号 --><flex:checkboxCol caption="全选" width="35" property="helpId" name="primaryKey" sortName="PUB_COMHELP.HELP_ID"></flex:checkboxCol>
<!-- 帮助标题 --><flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMHELP.HELP_ID")%>' width="100" property="helpId" sortName="PUB_COMHELP.HELP_ID"/>

<!-- 帮助标题 --><flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMHELP.HELP_TITLE")%>' width="100" property="helpTitle" sortName="PUB_COMHELP.HELP_TITLE"/>
<!-- 显示选择的SQL --><flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMHELP.HELP_SQL")%>' width="100" property="helpSql" sortName="PUB_COMHELP.HELP_SQL"/>
<!-- 唯一标示字段 --><flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMHELP.ID_FIELD")%>' width="100" property="idField" sortName="PUB_COMHELP.ID_FIELD"/>
<!-- 显示字段 --><flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMHELP.SHOW_FIELD")%>' width="100" property="showField" sortName="PUB_COMHELP.SHOW_FIELD"/>
<!-- 返回字段 --><flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMHELP.RETURN_FIELD")%>' width="100" property="returnField" sortName="PUB_COMHELP.RETURN_FIELD"/>
<!-- 查询条件字段 --><flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMHELP.SHEARCH_FIELD")%>' width="100" property="shearchField" sortName="PUB_COMHELP.SHEARCH_FIELD"/>
<!-- 帮助字段显示名称 --><flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMHELP.SHOW_NAME")%>' width="100" property="showName" sortName="PUB_COMHELP.SHOW_NAME" style="display:none"/>
<!-- 说明 --><flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMHELP.HELP_NOTE")%>' width="100" property="helpNote" sortName="PUB_COMHELP.HELP_NOTE"/>
<!-- 数据源 --><flex:flexCol caption='<%=ResourcesFactory.getString("PUB_COMHELP.DATASOURCE")%>' width="100" property="datasource" sortName="PUB_COMHELP.DATASOURCE"/>


</flex:flexgrid>
<flex:pagePolit action="pubcomhelpquery_page_init.cmd" pageSize="15">
</flex:pagePolit>


</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="pubcomhelp.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="pubcomhelp.cmd?method=forupdate";    
  document.forms[0].submit();	
}

function forTest(isCheckBox){
  if(!getSelect()) return;
  var s= grid.getCheckLine();
   alert(s);
  var cmdUrl="helpgridquery.cmd&clear=true&HELP_ID="+s+"&isCheckBox="+isCheckBox;
  // alert(cmdUrl);
 var url ="jsp/help.jsp?url="+cmdUrl;     
 var param=document.forms[0].param.value;
 if(param!="")
   url+="&"+param;
    // window.open(url);
 var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:700px;dialogHeight:520px"); 
 
  if(win!=null){
  	for(var i=0;i<win.length;i++){
  		var ret=win[i];
  		alert("第"+i+"组数据开始");
  		for(var j=0;j<ret.length;j++){
  		   alert(ret[j]);	
  		}
  		alert("第"+i+"组数据结束");
  	}
  }

}

function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="pubcomhelp.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="pubcomhelp.cmd?method=delete";    
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