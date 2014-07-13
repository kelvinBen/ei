<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>��Ϣ��ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String msg_type_code = request.getParameter("msg_type_codeSearch");
	if (msg_type_code==null){
	  msg_type_code="";
	}
    String subject = request.getParameter("subjectSearch");
	if (subject==null){
	  subject="";
	}
    String creater = request.getParameter("createrSearch");
	if (creater==null){
	  creater="";
	}
    String status = request.getParameter("statusSearch");
	if (status==null){
	  status="";
	}
%>
<bsp:container title="��Ϣ��ѯ" >
<bsp:containbutton action="mpmessage.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="mpmessage.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="mpmessage.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="mpmessage.cmd?method=forConfirm" onclick="forConfirm()" text="ȷ��"></bsp:containbutton>
<bsp:containbutton action="mpmessage.cmd?method=multiConfirm" onclick="forMultiConfirm()" text="����ȷ��"></bsp:containbutton>
<bsp:containbutton action="mpmessage.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpmessagequery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>��Ϣ���ͣ�<flex:searchSelect name="msg_type_codeSearch" searchName="MP_MESSAGE.MSG_TYPE_CODE" dataType="java.lang.String" operSymbol="=" value="<%=msg_type_code%>">
    	<html:option value="-1">ȫ��</html:option>
		<html:options collection="mpMessageType" labelProperty="MSG_TYPE_NAME" property="MSG_TYPE_CODE"/>
	</flex:searchSelect></td>
    <td>��Ϣ���⣺<flex:searchText name="subjectSearch" searchName="MP_MESSAGE.SUBJECT" dataType="java.lang.String" operSymbol="=" value="<%=subject%>" size="12">
	</flex:searchText></td>
	<!--
    <td>��Ϣ״̬��<flex:searchText name="statusSearch" searchName="MP_MESSAGE.STATUS" dataType="java.lang.String" operSymbol="=" value="<%=status%>" size="12">
	</flex:searchText></td>
	-->
	<td><flex:searchImg name="chaxun" action="mpmessagequery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
  				<flex:checkboxCol caption='ѡ��' width="60" property="msgId" name="primaryKey" sortName="MP_MESSAGE.MSG_ID" ></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE.MSG_TYPE_CODE")%>' width="100" property="msgTypeCode" type="enum" enumCollection="mpMessageType" enumKey="MSG_TYPE_CODE" enumValue="MSG_TYPE_NAME" sortName="MP_MESSAGE.MSG_TYPE_CODE" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE.OBJECTID")%>' width="100" property="objectid" sortName="MP_MESSAGE.OBJECTID" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE.SUBJECT")%>' width="100" property="subject" sortName="MP_MESSAGE.SUBJECT" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE.SCHEDULE")%>' width="100" property="schedule" sortName="MP_MESSAGE.SCHEDULE" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE.USEFUL_TIME")%>' width="100" property="usefulTime" sortName="MP_MESSAGE.USEFUL_TIME" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE.CREATER")%>' width="100" property="createrName" sortName="MP_MESSAGE.CREATER" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE.CREATE_TIME")%>' width="120" property="createTime" sortName="MP_MESSAGE.CREATE_TIME" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE.RECEIVE_ADDRESS")%>' width="100" property="receiveAddress" sortName="MP_MESSAGE.RECEIVE_ADDRESS" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE.RECEIVE_MANNER_CODE")%>' width="100" property="receiveMannerCode" sortName="MP_MESSAGE.RECEIVE_MANNER_CODE"  type="enum" enumCollection="mpInceptManner" enumKey="RECEIVE_MANNER_CODE" enumValue="RECEIVE_MANNER_NAME" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE.STATUS")%>' width="100" property="status" type="enum" enumCollection="MP_MESSAGE_STATUS" enumKey="key" enumValue="value" sortName="MP_MESSAGE.STATUS" style="text-align:left"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mpmessagequery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="mpmessage.cmd?method=detail&primaryKey="+id;

}
grid.show();
function forConfirm(){
  if(!getConfirm()) return;
  document.forms[0].action ="mpmessage.cmd?method=forConfirm";    
  document.forms[0].submit();	
}
function forMultiConfirm(){
  if(!getMultiConfirm()) return;
  document.forms[0].action ="mpmessage.cmd?method=multiConfirm";    
  document.forms[0].submit();	
}
function forInsert(){
  document.forms[0].action ="mpmessage.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mpmessage.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mpmessage.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpmessage.cmd?method=delete";    
  document.forms[0].submit();	
}
function getMultiConfirm(){
  var sel=grid.getCheckLineNo();
  if(sel==""){
    alert("��ѡ���¼!");
    return false;
  }
  var obj=sel.split(",");
  for(i=0;i<obj.length;i++){
  	  var data = grid.getCellValue(obj[i],11);
	  if(trim(data)!="�½�"){
	  	alert("����Ϊ"+grid.getCellValue(sel,4)+"��Ϣ״̬�Ѿ�Ϊ:"+data+"�������ظ�ȷ�ϡ�");
	  	return false;
	  } 
  } 
  if (!confirm("���Ҫȷ������ѡ�еļ�¼��")) {
   	    return false;
  }  
  return true;
}
function getConfirm(){
  var sel=grid.getCheckLineNo();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("��ѡ��һ����¼!");
    return false;
  } 
  var data = grid.getCellValue(sel,11);
  if(trim(data)!="�½�"){
  	alert("��Ϣ״̬�Ѿ�Ϊ:"+data+"�������ظ�ȷ�ϡ�");
  	return false;
  } 
  return true;
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