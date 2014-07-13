<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>ϵͳ������ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<bsp:container title="ϵͳ������ѯ">	
<bsp:containbutton onclick="forUpdate()" text="�޸�" action=""></bsp:containbutton> 
<bsp:containbutton onclick="forDetail()" text="��ϸ" action=""></bsp:containbutton>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<% 
    String parms_code = request.getParameter("parms_codeSearch");
	if (parms_code==null){
	  parms_code="";
	}
    String parms_name = request.getParameter("parms_nameSearch");
	if (parms_name==null){
	  parms_name="";
	}
    String parms_value = request.getParameter("parms_valueSearch");
	if (parms_value==null){
	  parms_value="";
	}
    String note = request.getParameter("noteSearch");
	if (note==null){
	  note="";
	}
%>
<html:messages/>
<html:form name="frmList" action="commonparmsquery.cmd">
<flex:search> 
</flex:search>
<support:flexgrid name="grid" height="200" action="" isSubmit="true">
				<flex:checkboxCol caption="ѡ��" width="50" property="PARMS_CODE" name="primaryKey" sortName="PUB_COMMON_PARMS.PARMS_CODE"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("COMMON_PARMS.PARMS_NAME")%>' width="200" property="PARMS_NAME" sortName="PUB_COMMON_PARMS.PARMS_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("COMMON_PARMS.PARMS_VALUE")%>' width="200" property="PARMS_VALUE" sortName="PUB_COMMON_PARMS.PARMS_VALUE"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="commonparmsquery.cmd">
</flex:pagePolit>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
//setTitleInTreeBar('��������-ϵͳ��������-ϵͳ������ѯ');
setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="commonparms.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="commonparms.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="commonparms.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="commonparms.cmd?method=delete";    
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