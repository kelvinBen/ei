<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<BODY topmargin="10px" >
<div class="btnareaCss">

<html:button onclick="forReturn()" name="btn_return" value="����"></html:button>
</div>
<br>
<html:messages/>
<%
String processMgrId=(String)request.getAttribute("processMgrId");
if(processMgrId==null)processMgrId="";
String processId=(String)request.getAttribute("processId");
if(processId==null)processId="";
String activityId=(String)request.getAttribute("activityId");
if(activityId==null)activityId="";
%>
<html:form name="frmList" action="">

<input type="hidden" name="wfmgrname" value="<%=processMgrId%>">
<input type="hidden" name="processId" value="<%=processId%>">
<input type="hidden" name="wfactId" value="<%=activityId%>">
<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
						  <flex:checkboxCol caption="ѡ��" width="35" property="resKey"  name="primaryKey" sortName="a.b"></flex:checkboxCol>
                          <flex:flexCol caption='������' width="100" property="userName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='����' width="100" property="resType" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='����������' width="100" property="newTypeName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='��ʼʱ��' width="100" property="createTime" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='������' width="100" property="previousResName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='����������' width="100" property="oldType" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='����������' width="100" property="oldTypeName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='�Ƿ����' width="100" property="isAcceptName" sortName="a.b"></flex:flexCol>
                          

</flex:flexgrid>

</html:form>
<script language="javascript">
setTitleInTreeBar("��������-���̼��-�ѽ�������ί���б�");
grid.show();
grid.setSumText("");
//setGridHeight("grid",0.5);

function forReturn(){
	window.history.back();
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
</script>