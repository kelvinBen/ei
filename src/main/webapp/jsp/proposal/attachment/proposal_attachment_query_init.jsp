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
<TITLE>�᰸/���ĸ������ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
//�����ѯ����
    String id = RequestUtil.getPara2String(request,"ID");
    String foreignid = RequestUtil.getPara2String(request,"FOREIGNID");
    String filename = RequestUtil.getPara2String(request,"FILENAME");
    String filepath = RequestUtil.getPara2String(request,"FILEPATH");
    String note = RequestUtil.getPara2String(request,"NOTE");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
    String note3 = RequestUtil.getPara2String(request,"NOTE3");
%>
<bsp:container title="�᰸/���ĸ������ѯ" >
<bsp:containbutton action="proposalattachment.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="proposalattachment.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="proposalattachment.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="proposalattachment.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="proposalattachmentquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    ������<flex:searchText name="ID" searchName="PROPOSAL_ATTACHMENT.ID" dataType="java.lang.String" operSymbol="=" value="<%=id%>" size="12"/>
    </td>
    <td>
    �᰸/����id��<flex:searchText name="FOREIGNID" searchName="PROPOSAL_ATTACHMENT.FOREIGNID" dataType="java.lang.String" operSymbol="=" value="<%=foreignid%>" size="12"/>
    </td>
    <td>
    �������ƣ�<flex:searchText name="FILENAME" searchName="PROPOSAL_ATTACHMENT.FILENAME" dataType="java.lang.String" operSymbol="=" value="<%=filename%>" size="12"/>
    </td>
    <td>
    ����·����<flex:searchText name="FILEPATH" searchName="PROPOSAL_ATTACHMENT.FILEPATH" dataType="java.lang.String" operSymbol="=" value="<%=filepath%>" size="12"/>
    </td>
    <td>
    ��ע��<flex:searchText name="NOTE" searchName="PROPOSAL_ATTACHMENT.NOTE" dataType="java.lang.String" operSymbol="=" value="<%=note%>" size="12"/>
    </td>
    <td>
    NOTE2��<flex:searchText name="NOTE2" searchName="PROPOSAL_ATTACHMENT.NOTE2" dataType="java.lang.String" operSymbol="=" value="<%=note2%>" size="12"/>
    </td>
    <td>
    NOTE3��<flex:searchText name="NOTE3" searchName="PROPOSAL_ATTACHMENT.NOTE3" dataType="java.lang.String" operSymbol="=" value="<%=note3%>" size="12"/>
    </td>
	<td><flex:searchImg name="chaxun" action="proposalattachmentquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- ���� --><flex:checkboxCol caption="ȫѡ" width="35" property="id" name="primaryKey" sortName="PROPOSAL_ATTACHMENT.ID"></flex:checkboxCol>
<!-- �᰸/����id --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.FOREIGNID")%>' width="100" property="foreignid" sortName="PROPOSAL_ATTACHMENT.FOREIGNID"/>
<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.FILENAME")%>' width="100" property="filename" sortName="PROPOSAL_ATTACHMENT.FILENAME"/>
<!-- ����·�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.FILEPATH")%>' width="100" property="filepath" sortName="PROPOSAL_ATTACHMENT.FILEPATH"/>
<!-- ��ע --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.NOTE")%>' width="100" property="note" sortName="PROPOSAL_ATTACHMENT.NOTE"/>
<!-- NOTE2 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.NOTE2")%>' width="100" property="note2" sortName="PROPOSAL_ATTACHMENT.NOTE2"/>
<!-- NOTE3 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.NOTE3")%>' width="100" property="note3" sortName="PROPOSAL_ATTACHMENT.NOTE3"/>
</flex:flexgrid>
<flex:pagePolit action="proposalattachmentquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="proposalattachment.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalattachment.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalattachment.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposalattachment.cmd?method=delete";    
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