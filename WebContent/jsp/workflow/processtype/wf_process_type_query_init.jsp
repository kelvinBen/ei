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
<TITLE>�������Ͳ�ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<% 
//�����ѯ����
    String type_id = RequestUtil.getPara2String(request,"TYPE_ID");
    String name = RequestUtil.getPara2String(request,"NAME");
    String organ_id = RequestUtil.getPara2String(request,"ORGAN_ID");
    String organ_name = RequestUtil.getPara2String(request,"ORGAN_NAME");
    String isallsub = RequestUtil.getPara2String(request,"ISALLSUB");
    String sortnum = RequestUtil.getPara2String(request,"SORTNUM");
    String description = RequestUtil.getPara2String(request,"DESCRIPTION");
%>
<bsp:container title="�������Ͳ�ѯ" >
<bsp:containbutton action="processtype.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="processtype.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="processtype.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="processtype.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>

<bsp:containbutton onclick="forTaskList()" name="btn_tasklist"  text="ҵ���ֶ�����" />

<html:messages/>
<html:form name="frmList" action="processtypequery.cmd">

<fieldset class="FieldsetCss"><legend>��ѯ����</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    ���ͱ�ţ�<flex:searchText name="TYPE_ID" searchName="WF_PROCESS_TYPE.TYPE_ID" dataType="java.lang.String" operSymbol="=" value="<%=type_id%>" size="12"/>
    </td>
    <td>
    �������ƣ�<flex:searchText name="NAME" searchName="WF_PROCESS_TYPE.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>

    <td>
    �����������ƣ�<flex:searchText name="ORGAN_NAME" searchName="WF_PROCESS_TYPE.ORGAN_NAME" dataType="java.lang.String" operSymbol="=" value="<%=organ_name%>" size="12"/>
    </td>


	<td><flex:searchImg name="chaxun" action="processtypequery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>

<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- ���ͱ�� --><flex:checkboxCol caption="ȫѡ" width="35" property="typeId" name="primaryKey" sortName="WF_PROCESS_TYPE.TYPE_ID"></flex:checkboxCol>
<!-- ���ͱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.TYPE_ID")%>' width="100" property="typeId" sortName="WF_PROCESS_TYPE.NAME"/>

<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.NAME")%>' width="100" property="name" sortName="WF_PROCESS_TYPE.NAME"/>
<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.ORGAN_ID")%>' style="display:none;" width="100" property="organId" sortName="WF_PROCESS_TYPE.ORGAN_ID"/>
<!-- ������������ --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.ORGAN_NAME")%>' width="100" property="organName" sortName="WF_PROCESS_TYPE.ORGAN_NAME"/>
<!-- �Ƿ��������¼�������ʹ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.ISALLSUB")%>' width="200" property="isallsub" type="enum" enumCollection="WFPROCESSTYPE_ISALLSUB_COLLECTION" enumKey ="key" enumValue="value" sortName="WF_PROCESS_TYPE.ISALLSUB"/>


<!-- ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.DESCRIPTION")%>' width="100" property="description" sortName="WF_PROCESS_TYPE.DESCRIPTION"/>
<!-- ��ע --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.NOTE")%>' width="100" property="note" sortName="WF_PROCESS_TYPE.NOTE" style="display:none"/>


</flex:flexgrid>
<flex:pagePolit action="processtypequery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
//���ò鿴����
grid.show();
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var primaryKey=grid.getCellValue(i, 1);
		var title=grid.getCellValue(i, 2);
		var forlook='<a href="javascript:forDetail(\''+primaryKey+'\')" >'+title+'</a>';
		grid.getCell(i, 2).innerHTML =forlook;
	}


function forInsert(){
  document.forms[0].action ="processtype.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="processtype.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(primaryKey){
  var url="processtype.cmd?method=detail";
  if(primaryKey){
     url=url+"&primaryKey="+primaryKey;
     opens_center(url,"�������Ͳ鿴",800,600,"no","yes");
     return ;
  }else if(!getSelect()) return;
  document.forms[0].action =url;    
  document.forms[0].submit();	
}

function forTaskList(){
  if(!getSelect()) return;
  window.location.href ="tasklistquery.cmd?processtype="+grid.getCheckLine();  
 	
}

function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="processtype.cmd?method=delete";    
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