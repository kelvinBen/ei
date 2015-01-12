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
<TITLE>���������ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
//�����ѯ����
    String id = RequestUtil.getPara2String(request,"ID");
    String proposalid = RequestUtil.getPara2String(request,"PROPOSALID");
    String reviewor = RequestUtil.getPara2String(request,"REVIEWOR");
    String revieworid = RequestUtil.getPara2String(request,"REVIEWORID");
    String reviewcomment = RequestUtil.getPara2String(request,"REVIEWCOMMENT");
    String reviewtime = RequestUtil.getPara2String(request,"REVIEWTIME");
    String reviewstate = RequestUtil.getPara2String(request,"REVIEWSTATE");
    String superior = RequestUtil.getPara2String(request,"SUPERIOR");
    String superiorid = RequestUtil.getPara2String(request,"SUPERIORID");
    String reviewnode = RequestUtil.getPara2String(request,"REVIEWNODE");
    String note = RequestUtil.getPara2String(request,"NOTE");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
    String note3 = RequestUtil.getPara2String(request,"NOTE3");
%>
<bsp:container title="���������ѯ" >
<bsp:containbutton action="proposalreview.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="proposalreview.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="proposalreview.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="proposalreview.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="proposalreviewquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    ������<flex:searchText name="ID" searchName="PROPOSAL_REVIEW.ID" dataType="java.lang.String" operSymbol="=" value="<%=id%>" size="12"/>
    </td>
    <td>
    ����ID��<flex:searchText name="PROPOSALID" searchName="PROPOSAL_REVIEW.PROPOSALID" dataType="java.lang.String" operSymbol="=" value="<%=proposalid%>" size="12"/>
    </td>
    <td>
    ����ˣ�<flex:searchText name="REVIEWOR" searchName="PROPOSAL_REVIEW.REVIEWOR" dataType="java.lang.String" operSymbol="=" value="<%=reviewor%>" size="12"/>
    </td>
    <td>
    �����userid��<flex:searchText name="REVIEWORID" searchName="PROPOSAL_REVIEW.REVIEWORID" dataType="java.lang.String" operSymbol="=" value="<%=revieworid%>" size="12"/>
    </td>
    <td>
    ��������<flex:searchText name="REVIEWCOMMENT" searchName="PROPOSAL_REVIEW.REVIEWCOMMENT" dataType="java.lang.String" operSymbol="=" value="<%=reviewcomment%>" size="12"/>
    </td>
    <td>
    ���ʱ�䣺<flex:searchText name="REVIEWTIME" searchName="PROPOSAL_REVIEW.REVIEWTIME" dataType="java.lang.String" operSymbol="=" value="<%=reviewtime%>" size="12"/>
    </td>
  <td>���״̬��
           <flex:searchSelect name="REVIEWSTATE" searchName="PROPOSAL_REVIEW.REVIEWSTATE" dataType="java.lang.Integer" operSymbol="=" value="<%=reviewstate%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALREVIEW_REVIEWSTATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
    <td>
    �ϼ�����ˣ�<flex:searchText name="SUPERIOR" searchName="PROPOSAL_REVIEW.SUPERIOR" dataType="java.lang.String" operSymbol="=" value="<%=superior%>" size="12"/>
    </td>
    <td>
    �ϼ������ID��<flex:searchText name="SUPERIORID" searchName="PROPOSAL_REVIEW.SUPERIORID" dataType="java.lang.String" operSymbol="=" value="<%=superiorid%>" size="12"/>
    </td>
  <td>��˻��ڣ�
           <flex:searchSelect name="REVIEWNODE" searchName="PROPOSAL_REVIEW.REVIEWNODE" dataType="java.lang.String" operSymbol="=" value="<%=reviewnode%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALREVIEW_REVIEWNODE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
    <td>
    ��ע��<flex:searchText name="NOTE" searchName="PROPOSAL_REVIEW.NOTE" dataType="java.lang.String" operSymbol="=" value="<%=note%>" size="12"/>
    </td>
    <td>
    NOTE2��<flex:searchText name="NOTE2" searchName="PROPOSAL_REVIEW.NOTE2" dataType="java.lang.String" operSymbol="=" value="<%=note2%>" size="12"/>
    </td>
    <td>
    NOTE3��<flex:searchText name="NOTE3" searchName="PROPOSAL_REVIEW.NOTE3" dataType="java.lang.String" operSymbol="=" value="<%=note3%>" size="12"/>
    </td>
	<td><flex:searchImg name="chaxun" action="proposalreviewquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- ���� --><flex:checkboxCol caption="ȫѡ" width="35" property="id" name="primaryKey" sortName="PROPOSAL_REVIEW.ID"></flex:checkboxCol>
<!-- ����ID --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.PROPOSALID")%>' width="100" property="proposalid" type="enum" enumCollection="PROPOSALREVIEW_PROPOSALID_COLLECTION" enumKey ="$fk.showCol" enumValue="ID" sortName="PROPOSAL_REVIEW.PROPOSALID"/>
<!-- ����� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWOR")%>' width="100" property="reviewor" sortName="PROPOSAL_REVIEW.REVIEWOR"/>
<!-- �����userid --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWORID")%>' width="100" property="revieworid" sortName="PROPOSAL_REVIEW.REVIEWORID"/>
<!-- ������ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWCOMMENT")%>' width="100" property="reviewcomment" sortName="PROPOSAL_REVIEW.REVIEWCOMMENT"/>
<!-- ���ʱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWTIME")%>' width="100" property="reviewtime" sortName="PROPOSAL_REVIEW.REVIEWTIME" style="display:none"/>
<!-- ���״̬ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWSTATE")%>' width="100" property="reviewstate" sortName="PROPOSAL_REVIEW.REVIEWSTATE" style="display:none"/>
<!-- �ϼ������ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.SUPERIOR")%>' width="100" property="superior" sortName="PROPOSAL_REVIEW.SUPERIOR" style="display:none"/>
<!-- �ϼ������ID --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.SUPERIORID")%>' width="100" property="superiorid" sortName="PROPOSAL_REVIEW.SUPERIORID" style="display:none"/>
<!-- ��˻��� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWNODE")%>' width="100" property="reviewnode" sortName="PROPOSAL_REVIEW.REVIEWNODE" style="display:none"/>
<!-- ��ע --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE")%>' width="100" property="note" sortName="PROPOSAL_REVIEW.NOTE"/>
<!-- NOTE2 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE2")%>' width="100" property="note2" sortName="PROPOSAL_REVIEW.NOTE2"/>
<!-- NOTE3 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE3")%>' width="100" property="note3" sortName="PROPOSAL_REVIEW.NOTE3"/>
</flex:flexgrid>
<flex:pagePolit action="proposalreviewquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="proposalreview.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalreview.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalreview.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposalreview.cmd?method=delete";    
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