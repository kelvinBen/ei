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
<TITLE>�����Ȳ�ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<bsp:container title="�����Ȳ�ѯ" >
<bsp:containbutton onclick="forInsert()"  text="����" action="financialyear.cmd?method=forinsert" ></bsp:containbutton>
<bsp:containbutton onclick="forUpdate()"   text="�޸�" action="financialyear.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()"   text="��ϸ" action="financialyear.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()"   text="ɾ��" action="financialyear.cmd?method=delete"></bsp:containbutton>
<html:form name="frmList" action="financialyearquery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
          		  <flex:radioCol caption="ѡ��" width="40" property="id"  name="primaryKey" sortName="year.id"></flex:radioCol>                 
                  <flex:flexCol caption='������' width="100" property="finYear" style="text-align:left" sortName="year.finYear"></flex:flexCol>
                  <flex:flexCol caption='��ʼ��' width="100" property="beginDate" style="text-align:left" sortName="year.beginDate"></flex:flexCol>
                  <flex:flexCol caption='��ֹ��' width="100" property="endDate" style="text-align:left" sortName="year.endDate"></flex:flexCol>
                  <flex:flexCol caption='�����ڼ����' width="100" property="periodNum" style="text-align:right" sortName="year.periodNum"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="financialyearquery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="financialyear.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
function forInsert(){
  document.forms[0].action ="financialyear.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="financialyear.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="financialyear.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="financialyear.cmd?method=delete";    
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