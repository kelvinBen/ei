<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>��Ϣ������ϲ�ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String receive_manner_code = request.getParameter("receive_manner_codeSearch");
	if (receive_manner_code==null){
	  receive_manner_code="";
	}
%>
<bsp:container title="��Ϣ������ϲ�ѯ" >
<bsp:containbutton action="mpmessagehospital.cmd?method=send" onclick="forSend()" text="��������"></bsp:containbutton>
<bsp:containbutton action="mpmessagehospital.cmd?method=forupdate" onclick="forUpdate()" text="����"></bsp:containbutton>
<bsp:containbutton action="mpmessagehospital.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="mpmessagehospital.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpmessagehospitalquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>��Ϣ���շ�ʽ��<flex:searchSelect name="receive_manner_codeSearch" searchName="MP_MESSAGE_HOSPITAL.RECEIVE_MANNER_CODE" dataType="java.lang.String" operSymbol="=" value="<%=receive_manner_code%>">
		<html:option value="-1">ȫ��</html:option>
		<html:options collection="mpInceptManner" labelProperty="RECEIVE_MANNER_NAME" property="RECEIVE_MANNER_CODE"/>
	</flex:searchSelect></td>
	<td><flex:searchImg name="chaxun" action="mpmessagehospitalquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
  				<flex:checkboxCol caption='ѡ��' width="60" property="errorMsgId" name="primaryKey" sortName="MP_MESSAGE_HOSPITAL.ERROR_MSG_ID"></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.MSG_ID")%>' width="120" property="msgId" sortName="MP_MESSAGE_HOSPITAL.MSG_ID" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.SEND_TIME")%>' width="120" property="sendTime" sortName="MP_MESSAGE_HOSPITAL.SEND_TIME" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.RECEIVE_MANNER_CODE")%>' width="150" property="receiveMannerCode" sortName="MP_MESSAGE_HOSPITAL.RECEIVE_MANNER_CODE" type="enum" enumCollection="mpInceptManner" enumKey="RECEIVE_MANNER_CODE" enumValue="RECEIVE_MANNER_NAME" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.RECEIVE_ADDRESS")%>' width="150" property="receiveAddress" sortName="MP_MESSAGE_HOSPITAL.RECEIVE_ADDRESS" style="text-align:left"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.STATUS")%>' width="150" property="status" sortName="MP_MESSAGE_HOSPITAL.STATUS" style="text-align:left" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("MP_MESSAGE_HOSPITAL.DESCRIPTION")%>' width="100" property="description" sortName="MP_MESSAGE_HOSPITAL.DESCRIPTION" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mpmessagehospitalquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	var id = grid.getCellValue(grid.getCurrentLine(),1);
	location.href="mpmessagehospital.cmd?method=detail&primaryKey="+id;
}
grid.show();
function forSend(){
	  var sel=grid.getCheckLine();
	  if(sel==""){
	    alert("��ѡ��Ҫ���͵ļ�¼!");
	    return false;
	  }
	document.forms[0].action ="mpmessagehospital.cmd?method=send";    
  	document.forms[0].submit();	
}
function forInsert(){
  document.forms[0].action ="mpmessagehospital.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mpmessagehospital.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="mpmessagehospital.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpmessagehospital.cmd?method=delete";    
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