<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@page import="net.mast.util.RequestUtil"%>
<HTML>
<HEAD>
<TITLE>������Ϣ��ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<% 
//�����ѯ����
    String id = RequestUtil.getPara2String(request,"ID");
    String contents = RequestUtil.getPara2String(request,"Contents");
    String msg_type = RequestUtil.getPara2String(request,"MSG_TYPE");
    String msg_id = RequestUtil.getPara2String(request,"MSG_ID");
    String note = RequestUtil.getPara2String(request,"NOTE");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
%>
<bsp:container title="������Ϣ��ѯ" >
<bsp:containbutton action="mpcmpmessag.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="mpcmpmessag.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="mpcmpmessag.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="mpcmpmessag.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mpcmpmessagquery_page_init.cmd">
<fieldset class="FieldsetCss"><legend>��ѯ����</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    ������<flex:searchText name="ID" searchName="MP_CMP_MESSAG.ID" dataType="java.lang.Integer" operSymbol="=" value="<%=id%>" size="12"/>
    </td>
    <td>
    ��Ϣ���ݣ�<flex:searchText name="Contents" searchName="MP_CMP_MESSAG.CONTENTS" dataType="java.lang.String" operSymbol="=" value="<%=contents%>" size="12"/>
    </td>
  <td>��Ϣ��ʽ��
           <flex:searchSelect name="MSG_TYPE" searchName="MP_CMP_MESSAG.MSG_TYPE" dataType="java.lang.String" operSymbol="=" value="<%=msg_type%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="MPCMPMESSAG_MSGTYPE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
    <td>
    ��Ϣ�����<flex:searchText name="MSG_ID" searchName="MP_CMP_MESSAG.MSG_ID" dataType="java.lang.Integer" operSymbol="=" value="<%=msg_id%>" size="12"/>
    </td>
    <td>
    NOTE��<flex:searchText name="NOTE" searchName="MP_CMP_MESSAG.NOTE" dataType="java.lang.String" operSymbol="=" value="<%=note%>" size="12"/>
    </td>
    <td>
    NOTE2��<flex:searchText name="NOTE2" searchName="MP_CMP_MESSAG.NOTE2" dataType="java.lang.String" operSymbol="=" value="<%=note2%>" size="12"/>
    </td>
	<td><flex:searchImg name="chaxun" action="mpcmpmessagquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>

<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- ���� --><flex:checkboxCol caption="ȫѡ" width="35" property="id" name="primaryKey" sortName="MP_CMP_MESSAG.ID"></flex:checkboxCol>
<!-- ��Ϣ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_CMP_MESSAG.Contents")%>' width="100" property="contents" sortName="MP_CMP_MESSAG.CONTENTS"/>
<!-- ��Ϣ��ʽ --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_CMP_MESSAG.MSG_TYPE")%>' width="100" property="msgType" type="enum" enumCollection="MPCMPMESSAG_MSGTYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="MP_CMP_MESSAG.MSG_TYPE"/>
<!-- ��Ϣ��� --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_CMP_MESSAG.MSG_ID")%>' width="100" property="msgId" type="enum" enumCollection="MPCMPMESSAG_MSGID_COLLECTION" enumKey ="$fk.showCol" enumValue="ID" sortName="MP_CMP_MESSAG.MSG_ID"/>
<!-- NOTE --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_CMP_MESSAG.NOTE")%>' width="100" property="note" sortName="MP_CMP_MESSAG.NOTE"/>
<!-- NOTE2 --><flex:flexCol caption='<%=ResourcesFactory.getString("MP_CMP_MESSAG.NOTE2")%>' width="100" property="note2" sortName="MP_CMP_MESSAG.NOTE2"/>
</flex:flexgrid>
<flex:pagePolit action="mpcmpmessagquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
//���ò鿴����
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var primaryKey=grid.getCellValue(i, 1);
		var title=grid.getCellValue(i, 2);
		var forlook='<a href="javascript:forDetail(\''+primaryKey+'\')" >'+title+'</a>';
		grid.getCell(i, 2).innerHTML =forlook;
	}

function forInsert(){
  document.forms[0].action ="mpcmpmessag.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
var url="mpcmpmessag.cmd?method=forupdate";    
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"������Ϣ�޸�",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDetail(primaryKey){
var url="mpcmpmessag.cmd?method=detail"; 
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"������Ϣ�鿴",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mpcmpmessag.cmd?method=delete";    
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