<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%
%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("GOODS.QUERY.TITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<web:js src="flexgrid.js"/>
<web:js src="calendar.js"/>
</HEAD>
<BODY topmargin="10px">
<bsp:container title='<%=ResourcesFactory.getString("GOODS.QUERY.TITLE")%>' >
<bsp:containbutton action="goods.cmd?method=forinsert" onclick="forInsert()" text='<%=ResourcesFactory.getString("COMMON.ADD")%>'></bsp:containbutton>
<bsp:containbutton action ="goods.cmd?method=forupdate" onclick="forUpdate()" text='<%=ResourcesFactory.getString("COMMON.MODIFY")%>'></bsp:containbutton>
<bsp:containbutton action ="goods.cmd?method=detail" onclick="forDetail()" text='<%=ResourcesFactory.getString("COMMON.DETAIL")%>'></bsp:containbutton>
<bsp:containbutton action ="goods.cmd?method=delete" onclick="forDelete()" text='<%=ResourcesFactory.getString("COMMON.DELETE")%>'></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="goodsquery_page_init.cmd">

<flex:flexgrid name="goodsGrid" height="250" action="" isSubmit="true">
   <flex:checkboxCol caption='<%=ResourcesFactory.getString("COMMON.CHOOSE")%>' width="80" property="goodsId" name="primaryKey"  sortName="goods.GOODS_ID"/>
   <flex:flexCol property="goodsName" caption='<%=ResourcesFactory.getString("GOODS.GOODS_NAME")%>' width="160"   sortName="goods.GOODS_NAME"/>
   <flex:flexCol property="goodsPrice" caption='<%=ResourcesFactory.getString("GOODS.GOODS_PRICE")%>' width="160"   sortName="goods.GOODS_PRICE"/>
</flex:flexgrid>
<flex:pagePolit action="goodsquery_page_init.cmd">
</flex:pagePolit>
</html:form>
</bsp:container>
</body>
<script language="javascript">
goodsGrid.show();
function forInsert(){
  document.forms[0].action ="goods.cmd?method=forinsert"; 
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="goods.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="goods.cmd?method=detail";
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="goods.cmd?method=delete"; 
  document.forms[0].submit();
}
function getSelect(){
  var sel=goodsGrid.getCheckLine();
  if(sel==""){
    alert('<%=ResourcesFactory.getString("COMMON.SELECT_A_RECORD")%>');
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert('<%=ResourcesFactory.getString("COMMON.SELECT_A_RECORD")%>');
    return false;
  }
  return true;
}
function getDelete(){
  var sel=goodsGrid.getCheckLine();
  if(sel==""){
    alert('<%=ResourcesFactory.getString("COMMON.SELECT_DELETE_RECORD")%>');
    return false;
  }
  if (!confirm('<%=ResourcesFactory.getString("COMMON.DELETE_CONFIRM")%>')) {
   	     return false;
  }
  return true;
}
function comhelp(cmdUrl,textObj,idObj){
   var url ="jsp/help.jsp?url="+cmdUrl;
   var win = showModalDialog(url,window,"scroll:auto;status:no;dialogWidth:600px;dialogHeight:400px");
   if (win == null){
      return;
   }else{
      idObj.value=win[0];    
      textObj.value=win[1];
   }
}
function searchclean(idObj,textObj){
idObj.value="";
textObj.value="";
}
</script>
</html>