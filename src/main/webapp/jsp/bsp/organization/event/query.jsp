<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>�����¼���ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<bsp:container title="�����¼���ѯ" >
<html:messages></html:messages>
<html:form name="frmList" action="" >
<bsp:containbutton onclick="forDetail()" text="�鿴��֯��Ϣ" action="stru.cmd?method=eventDetail"></bsp:containbutton>
<table id="tblSearch">
</table>


<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
  				<flex:radioCol caption='ѡ��' width="40" name="primaryKey" property="eventId" sortName="PUB_HR_EVENT.EVENT_ID" ></flex:radioCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_HR_EVENT.EVENT_TYPE")%>' width="100" property="eventTypeName" style="text-align:left" sortName="PUB_HR_EVENT.EVENT_TYPE"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_HR_EVENT.EVENT_DATE")%>' width="100" property="eventDate" style="text-align:left" sortName="PUB_HR_EVENT.EVENT_DATE" ></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_HR_EVENT.EVENT_MEMO")%>' width="100" property="eventMemo" style="text-align:left" sortName="PUB_HR_EVENT.EVENT_MEMO" ></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="stru.cmd?method=eventDetail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="stru.cmd?method=eventDetail";    
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