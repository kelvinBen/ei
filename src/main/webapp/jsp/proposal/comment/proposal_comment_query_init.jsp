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
<TITLE>�᰸���۱��ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
//�����ѯ����
    String id = RequestUtil.getPara2String(request,"ID");
    String proposalid = RequestUtil.getPara2String(request,"PROPOSALID");
    String name = RequestUtil.getPara2String(request,"NAME");
    String content = RequestUtil.getPara2String(request,"CONTENT");
    String state = RequestUtil.getPara2String(request,"STATE");
    String suggest = RequestUtil.getPara2String(request,"SUGGEST");
    String reviewor = RequestUtil.getPara2String(request,"REVIEWOR");
    String revieworid = RequestUtil.getPara2String(request,"REVIEWORID");
    String reviewtime = RequestUtil.getPara2String(request,"REVIEWTIME");
    String time = RequestUtil.getPara2String(request,"TIME");
    String title = RequestUtil.getPara2String(request,"TITLE");
    String note = RequestUtil.getPara2String(request,"NOTE");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
    String note3 = RequestUtil.getPara2String(request,"NOTE3");
%>
<bsp:container title="�᰸���۱��ѯ" >
<bsp:containbutton action="proposalcomment.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="proposalcomment.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="proposalcomment.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="proposalcomment.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="proposalcommentquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    ������<flex:searchText name="ID" searchName="PROPOSAL_COMMENT.ID" dataType="java.lang.String" operSymbol="=" value="<%=id%>" size="12"/>
    </td>
    <td>
    �᰸id��<flex:searchText name="PROPOSALID" searchName="PROPOSAL_COMMENT.PROPOSALID" dataType="java.lang.String" operSymbol="=" value="<%=proposalid%>" size="12"/>
    </td>
    <td>
    ������<flex:searchText name="NAME" searchName="PROPOSAL_COMMENT.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>
    <td>
    �������ݣ�<flex:searchText name="CONTENT" searchName="PROPOSAL_COMMENT.CONTENT" dataType="java.lang.String" operSymbol="=" value="<%=content%>" size="12"/>
    </td>
  <td>���״̬��
           <flex:searchSelect name="STATE" searchName="PROPOSAL_COMMENT.STATE" dataType="java.lang.Integer" operSymbol="=" value="<%=state%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALCOMMENT_STATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
    <td>
    ��������<flex:searchText name="SUGGEST" searchName="PROPOSAL_COMMENT.SUGGEST" dataType="java.lang.String" operSymbol="=" value="<%=suggest%>" size="12"/>
    </td>
    <td>
    ����ˣ�<flex:searchText name="REVIEWOR" searchName="PROPOSAL_COMMENT.REVIEWOR" dataType="java.lang.String" operSymbol="=" value="<%=reviewor%>" size="12"/>
    </td>
    <td>
    �����id��<flex:searchText name="REVIEWORID" searchName="PROPOSAL_COMMENT.REVIEWORID" dataType="java.lang.String" operSymbol="=" value="<%=revieworid%>" size="12"/>
    </td>
    <td>
    ���ʱ�䣺<flex:searchText name="REVIEWTIME" searchName="PROPOSAL_COMMENT.REVIEWTIME" dataType="java.lang.String" operSymbol="=" value="<%=reviewtime%>" size="12"/>
    </td>
    <td>
    ����ʱ�䣺<flex:searchText name="TIME" searchName="PROPOSAL_COMMENT.TIME" dataType="java.lang.String" operSymbol="=" value="<%=time%>" size="12"/>
    </td>
    <td>
    �᰸��Ŀ��<flex:searchText name="TITLE" searchName="PROPOSAL_COMMENT.TITLE" dataType="java.lang.String" operSymbol="=" value="<%=title%>" size="12"/>
    </td>
    <td>
    ��ע��<flex:searchText name="NOTE" searchName="PROPOSAL_COMMENT.NOTE" dataType="java.lang.String" operSymbol="=" value="<%=note%>" size="12"/>
    </td>
    <td>
    NOTE2��<flex:searchText name="NOTE2" searchName="PROPOSAL_COMMENT.NOTE2" dataType="java.lang.String" operSymbol="=" value="<%=note2%>" size="12"/>
    </td>
    <td>
    NOTE3��<flex:searchText name="NOTE3" searchName="PROPOSAL_COMMENT.NOTE3" dataType="java.lang.String" operSymbol="=" value="<%=note3%>" size="12"/>
    </td>
	<td><flex:searchImg name="chaxun" action="proposalcommentquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- ���� --><flex:checkboxCol caption="ȫѡ" width="35" property="id" name="primaryKey" sortName="PROPOSAL_COMMENT.ID"></flex:checkboxCol>
<!-- �᰸id --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.PROPOSALID")%>' width="100" property="proposalid" type="enum" enumCollection="PROPOSALCOMMENT_PROPOSALID_COLLECTION" enumKey ="$fk.showCol" enumValue="ID" sortName="PROPOSAL_COMMENT.PROPOSALID"/>
<!-- ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.NAME")%>' width="100" property="name" sortName="PROPOSAL_COMMENT.NAME"/>
<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.CONTENT")%>' width="100" property="content" sortName="PROPOSAL_COMMENT.CONTENT"/>
<!-- ���״̬ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.STATE")%>' width="100" property="state" sortName="PROPOSAL_COMMENT.STATE" style="display:none"/>
<!-- ������ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.SUGGEST")%>' width="100" property="suggest" sortName="PROPOSAL_COMMENT.SUGGEST"/>
<!-- ����� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWOR")%>' width="100" property="reviewor" sortName="PROPOSAL_COMMENT.REVIEWOR"/>
<!-- �����id --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWORID")%>' width="100" property="revieworid" sortName="PROPOSAL_COMMENT.REVIEWORID"/>
<!-- ���ʱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWTIME")%>' width="100" property="reviewtime" sortName="PROPOSAL_COMMENT.REVIEWTIME"/>
<!-- ����ʱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.TIME")%>' width="100" property="time" sortName="PROPOSAL_COMMENT.TIME"/>
<!-- �᰸��Ŀ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.TITLE")%>' width="100" property="title" sortName="PROPOSAL_COMMENT.TITLE"/>
<!-- ��ע --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE")%>' width="100" property="note" sortName="PROPOSAL_COMMENT.NOTE"/>
<!-- NOTE2 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE2")%>' width="100" property="note2" sortName="PROPOSAL_COMMENT.NOTE2"/>
<!-- NOTE3 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE3")%>' width="100" property="note3" sortName="PROPOSAL_COMMENT.NOTE3"/>
</flex:flexgrid>
<flex:pagePolit action="proposalcommentquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="proposalcomment.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalcomment.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalcomment.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposalcomment.cmd?method=delete";    
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