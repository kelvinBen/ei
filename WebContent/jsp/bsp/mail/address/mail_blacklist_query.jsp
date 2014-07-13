<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>我的邮件-黑名单</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>

<html:form name="frmList" action="mailblacklistquery.cmd">
<bsp:container title="黑名单" >
	<bsp:containbutton onclick="forAllSelect()" name="btn_all_select" text="全部选择" ></bsp:containbutton>
	<bsp:containbutton onclick="forInsert()" name="btn_insert" text="添加" ></bsp:containbutton>
	<bsp:containbutton onclick="forDelete()" name="btn_detail" text="删除" ></bsp:containbutton>
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
	<flex:checkboxCol caption="选择" width="50" property="blacklistId"  name="primaryKey" canSort="false" sortName="PUB_MAIL_BLACKLIST.BLACKLIST_ID"></flex:checkboxCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_BLACKLIST.BLACKLIST_NAME")%>' width="100" property="blacklistName" sortName="PUB_MAIL_BLACKLIST.BLACKLIST_NAME"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("MAIL_BLACKLIST.BLACKLIST_EMAIL")%>' width="160" property="blacklistEmail" sortName="PUB_MAIL_BLACKLIST.BLACKLIST_EMAIL"></flex:flexCol>
        </flex:flexgrid>
<flex:pagePolit action="mailblacklistquery.cmd" pageSize="15">
</flex:pagePolit>
</bsp:container>
</html:form>
<script language="javascript">
grid.show();
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="mailblacklist.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mailblacklist.cmd?method=delete";    
  document.forms[0].submit();	
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
var flag=true;
function forAllSelect(){
	var btn_all_select=event.srcElement;
  	if(flag==true){
  		btn_all_select.value="取消全选";
  		grid.doCheckAllLine(true);
  		flag=false;
  	}else{
  		btn_all_select.value="全部选择";
  		grid.doCheckAllLine(false);
  		flag=true;
  	}
}
</script>