<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>邮件地址分组卡片关联表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<% 
    String id = request.getParameter("idSearch");
	if (id==null){
	  id="";
	}
%>
<bsp:container title="邮件地址分组卡片关联表查询" >
	<bsp:containbutton onclick="forInsert()" name="btn_insert" text="增加" ></bsp:containbutton>
	<bsp:containbutton onclick="forUpdate()" name="btn_update" text="修改" ></bsp:containbutton>
	<bsp:containbutton onclick="forDetail()" name="btn_detail" text="明细" ></bsp:containbutton>
	<bsp:containbutton onclick="forDelete()" name="btn_delete" text="删除" ></bsp:containbutton>

<html:form name="frmList" action="mailgroupcardrefquery.cmd">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>ID：<flex:searchText name="idSearch" searchName="MAIL_GROUP_CARD_REF.ID" dataType="java.lang.String" operSymbol="=" value="<%=id%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="mailgroupcardrefquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
<flex:flexgrid name="grid" height="350" action="" isSubmit="true">
                          <flex:checkboxCol caption="选择" width="50" property="ID"  name="primaryKey" sortName="PUB_MAIL_GROUP_CARD_REF.ID"></flex:checkboxCol>
                                  <flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_GROUP_CARD_REF.GROUP_ID")%>' width="100" property="GROUP_ID" sortName="PUB_MAIL_GROUP_CARD_REF.GROUP_ID"></flex:flexCol>
                              <flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_GROUP_CARD_REF.GROUP_ID")%>' width="100" property="GROUP_ID" sortName="PUB_MAIL_GROUP_CARD_REF.GROUP_ID"></flex:flexCol>
                              <flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_GROUP_CARD_REF.CARD_ID")%>' width="100" property="CARD_ID" sortName="PUB_MAIL_GROUP_CARD_REF.CARD_ID"></flex:flexCol>
                              <flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_GROUP_CARD_REF.CARD_ID")%>' width="100" property="CARD_ID" sortName="PUB_MAIL_GROUP_CARD_REF.CARD_ID"></flex:flexCol>
    </flex:flexgrid>
<flex:pagePolit action="mailgroupcardrefquery.cmd" pageSize="5">
</flex:pagePolit>
</bsp:container>
</html:form>
<script language="javascript">
grid.show();
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="mailgroupcardref.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mailgroupcardref.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mailgroupcardref.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mailgroupcardref.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条纪录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条纪录!");
    return false;
  }  
  return true;
}
function getDelete(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要删除的纪录!");
    return false;
  }
  if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
</script>