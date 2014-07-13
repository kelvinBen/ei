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
<TITLE>�����ļ��б��ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<% 
//�����ѯ����
    String process_id = RequestUtil.getPara2String(request,"PROCESS_ID");
    String name = RequestUtil.getPara2String(request,"NAME");
    String type_id = RequestUtil.getPara2String(request,"TYPE_ID");
    String type_name = RequestUtil.getPara2String(request,"TYPE_NAME");
    String organ_id = RequestUtil.getPara2String(request,"ORGAN_ID");
    String organ_name = RequestUtil.getPara2String(request,"ORGAN_NAME");
    String isallsub = RequestUtil.getPara2String(request,"ISALLSUB");
    String formid = RequestUtil.getPara2String(request,"FORMID");
    String formname = RequestUtil.getPara2String(request,"FORMNAME");
    String reservetype = RequestUtil.getPara2String(request,"RESERVETYPE");
    String authpr = RequestUtil.getPara2String(request,"AUTHPR");
    String create_time = RequestUtil.getPara2String(request,"CREATE_TIME");
    String saveimport = RequestUtil.getPara2String(request,"SAVEIMPORT");
    String versionid = RequestUtil.getPara2String(request,"VERSIONID");
    String istemplet = RequestUtil.getPara2String(request,"ISTEMPLET");
    String description = RequestUtil.getPara2String(request,"DESCRIPTION");
%>
<bsp:container title="�����ļ��б��ѯ" >
<bsp:containbutton action="wfprocessfiles.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="wfprocessfiles.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="wfprocessfiles.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="wfprocessfiles.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="wfprocessfilesquery_page_init.cmd">
<fieldset class="FieldsetCss"><legend>��ѯ����</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    ���̶���ID��<flex:searchText name="PROCESS_ID" searchName="WF_PROCESS_FILES.PROCESS_ID" dataType="java.lang.String" operSymbol="=" value="<%=process_id%>" size="12"/>
    </td>
    <td>
    �������ƣ�<flex:searchText name="NAME" searchName="WF_PROCESS_FILES.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>
    <td>
    ���ͱ�ţ�<flex:searchText name="TYPE_ID" searchName="WF_PROCESS_FILES.TYPE_ID" dataType="java.lang.String" operSymbol="=" value="<%=type_id%>" size="12"/>
    </td>
    <td>
    �������ƣ�<flex:searchText name="TYPE_NAME" searchName="WF_PROCESS_FILES.TYPE_NAME" dataType="java.lang.String" operSymbol="=" value="<%=type_name%>" size="12"/>
    </td>
    <td>
    ����������<flex:searchText name="ORGAN_ID" searchName="WF_PROCESS_FILES.ORGAN_ID" dataType="java.lang.String" operSymbol="=" value="<%=organ_id%>" size="12"/>
    </td>
    <td>
    �����������ƣ�<flex:searchText name="ORGAN_NAME" searchName="WF_PROCESS_FILES.ORGAN_NAME" dataType="java.lang.String" operSymbol="=" value="<%=organ_name%>" size="12"/>
    </td>
  <td>�Ƿ��������¼�������ʹ�ã�
           <flex:searchSelect name="ISALLSUB" searchName="WF_PROCESS_FILES.ISALLSUB" dataType="java.lang.String" operSymbol="=" value="<%=isallsub%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="WFPROCESSFILES_ISALLSUB_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
    <td>
    ��ID��<flex:searchText name="FORMID" searchName="WF_PROCESS_FILES.FORMID" dataType="java.lang.String" operSymbol="=" value="<%=formid%>" size="12"/>
    </td>
    <td>
    �����ƣ�<flex:searchText name="FORMNAME" searchName="WF_PROCESS_FILES.FORMNAME" dataType="java.lang.String" operSymbol="=" value="<%=formname%>" size="12"/>
    </td>
    <td>
    ���������ͣ�<flex:searchText name="RESERVETYPE" searchName="WF_PROCESS_FILES.RESERVETYPE" dataType="java.lang.String" operSymbol="=" value="<%=reservetype%>" size="12"/>
    </td>
    <td>
    ���ߣ�<flex:searchText name="AUTHPR" searchName="WF_PROCESS_FILES.AUTHPR" dataType="java.lang.String" operSymbol="=" value="<%=authpr%>" size="12"/>
    </td>
    <td>
    ����ʱ�䣺<flex:searchText name="CREATE_TIME" searchName="WF_PROCESS_FILES.CREATE_TIME" dataType="java.lang.String" operSymbol="=" value="<%=create_time%>" size="12"/>
    </td>
    <td>
    �Ƿ��룺<flex:searchText name="SAVEIMPORT" searchName="WF_PROCESS_FILES.SAVEIMPORT" dataType="java.lang.String" operSymbol="=" value="<%=saveimport%>" size="12"/>
    </td>
    <td>
    �汾�ţ�<flex:searchText name="VERSIONID" searchName="WF_PROCESS_FILES.VERSIONID" dataType="java.lang.String" operSymbol="=" value="<%=versionid%>" size="12"/>
    </td>
  <td>�Ƿ�ģ�壺
           <flex:searchSelect name="ISTEMPLET" searchName="WF_PROCESS_FILES.ISTEMPLET" dataType="java.lang.Integer" operSymbol="=" value="<%=istemplet%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="WFPROCESSFILES_ISTEMPLET_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
    <td>
    ������<flex:searchText name="DESCRIPTION" searchName="WF_PROCESS_FILES.DESCRIPTION" dataType="java.lang.String" operSymbol="=" value="<%=description%>" size="12"/>
    </td>
	<td><flex:searchImg name="chaxun" action="wfprocessfilesquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>

<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- ���̶���ID --><flex:checkboxCol caption="ȫѡ" width="35" property="processId" name="primaryKey" sortName="WF_PROCESS_FILES.PROCESS_ID"></flex:checkboxCol>
<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.NAME")%>' width="100" property="name" sortName="WF_PROCESS_FILES.NAME"/>
<!-- ���ͱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.TYPE_ID")%>' width="100" property="typeId" sortName="WF_PROCESS_FILES.TYPE_ID"/>
<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.TYPE_NAME")%>' width="100" property="typeName" sortName="WF_PROCESS_FILES.TYPE_NAME"/>
<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.ORGAN_ID")%>' width="100" property="organId" sortName="WF_PROCESS_FILES.ORGAN_ID"/>
<!-- ������������ --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.ORGAN_NAME")%>' width="100" property="organName" sortName="WF_PROCESS_FILES.ORGAN_NAME"/>
<!-- �Ƿ��������¼�������ʹ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.ISALLSUB")%>' width="100" property="isallsub" type="enum" enumCollection="WFPROCESSFILES_ISALLSUB_COLLECTION" enumKey ="key" enumValue="value" sortName="WF_PROCESS_FILES.ISALLSUB"/>
<!-- ��ID --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.FORMID")%>' width="100" property="formid" sortName="WF_PROCESS_FILES.FORMID"/>
<!-- ������ --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.FORMNAME")%>' width="100" property="formname" sortName="WF_PROCESS_FILES.FORMNAME"/>
<!-- ���������� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.RESERVETYPE")%>' width="100" property="reservetype" sortName="WF_PROCESS_FILES.RESERVETYPE"/>
<!-- ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.AUTHPR")%>' width="100" property="authpr" sortName="WF_PROCESS_FILES.AUTHPR"/>
<!-- ����ʱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.CREATE_TIME")%>' width="100" property="createTime" sortName="WF_PROCESS_FILES.CREATE_TIME"/>
<!-- �Ƿ��� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.SAVEIMPORT")%>' width="100" property="saveimport" sortName="WF_PROCESS_FILES.SAVEIMPORT"/>
<!-- �汾�� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.VERSIONID")%>' width="100" property="versionid" sortName="WF_PROCESS_FILES.VERSIONID"/>
<!-- �Ƿ�ģ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.ISTEMPLET")%>' width="100" property="istemplet" sortName="WF_PROCESS_FILES.ISTEMPLET" style="display:none"/>
<!-- ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.DESCRIPTION")%>' width="100" property="description" sortName="WF_PROCESS_FILES.DESCRIPTION"/>
<!-- ��ע --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE")%>' width="100" property="note" sortName="WF_PROCESS_FILES.NOTE" style="display:none"/>
<!-- NOTE2 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE2")%>' width="100" property="note2" sortName="WF_PROCESS_FILES.NOTE2" style="display:none"/>
<!-- NOTE3 --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE3")%>' width="100" property="note3" sortName="WF_PROCESS_FILES.NOTE3" style="display:none"/>
</flex:flexgrid>
<flex:pagePolit action="wfprocessfilesquery_page_init.cmd" pageSize="15">
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
  document.forms[0].action ="wfprocessfiles.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
var url="wfprocessfiles.cmd?method=forupdate";    
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"�����ļ��б��޸�",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDetail(primaryKey){
var url="wfprocessfiles.cmd?method=detail"; 
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"�����ļ��б�鿴",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="wfprocessfiles.cmd?method=delete";    
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