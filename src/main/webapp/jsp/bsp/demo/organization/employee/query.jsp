<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE>Ա����չʾ�����ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<bsp:container title="Ա����չʾ�����ѯ" >
<bsp:containbutton onclick="forInsert()" text="����" action ="employee.cmd?method=forinsert"></bsp:containbutton>
<bsp:containbutton onclick="forUpdate()" text="�޸�" action ="employee.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()" text="��ϸ" action ="employee.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()" text="ɾ��" action ="employee.cmd?method=delete"></bsp:containbutton>
<html:form name="frmList" action="employeequery.cmd" >
<table id="tblSearch">
<flex:search>
</flex:search>
</table>
<support:flexgrid name="grid" height="240" action="" isSubmit="true">
      <flex:checkboxCol caption="ѡ��" width="100" property="ORGAN_ID"  name="primaryKey" sortName="PUB_EXAMPLE_ORGAN.ORGAN_ID"></flex:checkboxCol>   
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_EXAMPLE_ORGAN.ORGAN_ID")%>' width="100" property="ORGAN_ID" sortName="PUB_EXAMPLE_ORGAN.ORGAN_ID"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_EXAMPLE_ORGAN.TEL")%>' width="100" property="TEL" sortName="PUB_EXAMPLE_ORGAN.TEL"></flex:flexCol>
</support:flexgrid>  

<flex:pagePolit action="employeequery.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show(); 
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="employee.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="employee.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="employee.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="employee.cmd?method=delete";    
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