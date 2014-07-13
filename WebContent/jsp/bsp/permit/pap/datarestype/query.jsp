<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>������Դ���Ͳ�ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String dataResType = (String)request.getParameter("dataResTypeSearch");
	if (dataResType==null){
	  dataResType="";
	}
%>
<bsp:container title="������Դ���Ͳ�ѯ" >
<bsp:containbutton onclick="forInsert()" text="����" action ="datarestype.cmd?method=forinsert"></bsp:containbutton>
<bsp:containbutton onclick="forUpdate()" text="�޸�" action ="datarestype.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()" text="��ϸ" action ="datarestype.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()" text="ɾ��" action ="datarestype.cmd?method=delete"></bsp:containbutton>
<html:form name="frmList" action="datarestypequery.cmd">
<table id="tblSearch">
<flex:search>
<tr>
	<td><flex:searchImg name="chaxun" action="datarestypequery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
       <support:flexgrid name="grid" height="340" action="" isSubmit="true">
             <flex:radioCol caption="ѡ��" width="40" property="DATA_RES_TYPE"  name="primaryKey" sortName="PUB_DATA_RES_TYPE.DATA_RES_TYPE"></flex:radioCol>
             <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.DATA_RES_TYPE")%>' width="100" property="DATA_RES_TYPE"  style="text-align:left" sortName="PUB_DATA_RES_TYPE.DATA_RES_TYPE"></flex:flexCol>
             <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.TYPE_NAME")%>' width="100" property="TYPE_NAME"  style="text-align:left" sortName="PUB_DATA_RES_TYPE.TYPE_NAME"></flex:flexCol>
            
       </support:flexgrid>
<flex:pagePolit action="datarestypequery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="datarestype.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
function forInsert(){
  document.forms[0].action ="datarestype.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="datarestype.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="datarestype.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="datarestype.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
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
function getDelete(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��Ҫɾ���ļ�¼!");
    return false;
  }
  if (!confirm("���Ҫɾ��ѡ�еļ�¼�𣿴˲������ָܻ���")) {
   	     return false;
   	     }  
  return true;
}
</script>