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
<TITLE>������Ϣ���ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
//�����ѯ����
    String id = RequestUtil.getPara2String(request,"ID");
    String proposalid = RequestUtil.getPara2String(request,"PROPOSALID");
    String no = RequestUtil.getPara2String(request,"NO");
    String name = RequestUtil.getPara2String(request,"NAME");
    String phone = RequestUtil.getPara2String(request,"PHONE");
    String dept = RequestUtil.getPara2String(request,"DEPT");
    String duty = RequestUtil.getPara2String(request,"DUTY");
    String sortindex = RequestUtil.getPara2String(request,"SORTINDEX");
    String constituency = RequestUtil.getPara2String(request,"CONSTITUENCY");
    String note = RequestUtil.getPara2String(request,"NOTE");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
    String note3 = RequestUtil.getPara2String(request,"NOTE3");
%>
<bsp:container title="������Ϣ���ѯ" >
<bsp:containbutton action="proposaljoint.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="proposaljoint.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="proposaljoint.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="proposaljoint.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="proposaljointquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    ������<flex:searchText name="ID" searchName="PROPOSAL_JOINT.ID" dataType="java.lang.String" operSymbol="=" value="<%=id%>" size="12"/>
    </td>
    <td>
    �᰸id��<flex:searchText name="PROPOSALID" searchName="PROPOSAL_JOINT.PROPOSALID" dataType="java.lang.String" operSymbol="=" value="<%=proposalid%>" size="12"/>
    </td>
    <td>
    ίԱ��ţ�<flex:searchText name="NO" searchName="PROPOSAL_JOINT.NO" dataType="java.lang.String" operSymbol="=" value="<%=no%>" size="12"/>
    </td>
    <td>
    ίԱ������<flex:searchText name="NAME" searchName="PROPOSAL_JOINT.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>
    <td>
    ��ϵ�绰��<flex:searchText name="PHONE" searchName="PROPOSAL_JOINT.PHONE" dataType="java.lang.String" operSymbol="=" value="<%=phone%>" size="12"/>
    </td>
    <td>
    ������λ��<flex:searchText name="DEPT" searchName="PROPOSAL_JOINT.DEPT" dataType="java.lang.String" operSymbol="=" value="<%=dept%>" size="12"/>
    </td>
    <td>
    ְ��<flex:searchText name="DUTY" searchName="PROPOSAL_JOINT.DUTY" dataType="java.lang.String" operSymbol="=" value="<%=duty%>" size="12"/>
    </td>
    <td>
    ��ţ�<flex:searchText name="SORTINDEX" searchName="PROPOSAL_JOINT.SORTINDEX" dataType="java.lang.Integer" operSymbol="=" value="<%=sortindex%>" size="12"/>
    </td>
    <td>
    ������ƣ�<flex:searchText name="CONSTITUENCY" searchName="PROPOSAL_JOINT.CONSTITUENCY" dataType="java.lang.String" operSymbol="=" value="<%=constituency%>" size="12"/>
    </td>
    <td>
    ��ע��<flex:searchText name="NOTE" searchName="PROPOSAL_JOINT.NOTE" dataType="java.lang.String" operSymbol="=" value="<%=note%>" size="12"/>
    </td>
    <td>
    NOTE2��<flex:searchText name="NOTE2" searchName="PROPOSAL_JOINT.NOTE2" dataType="java.lang.String" operSymbol="=" value="<%=note2%>" size="12"/>
    </td>
    <td>
    NOTE3��<flex:searchText name="NOTE3" searchName="PROPOSAL_JOINT.NOTE3" dataType="java.lang.String" operSymbol="=" value="<%=note3%>" size="12"/>
    </td>
	<td><flex:searchImg name="chaxun" action="proposaljointquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- ���� --><flex:checkboxCol caption="ȫѡ" width="35" property="id" name="primaryKey" sortName="PROPOSAL_JOINT.ID"></flex:checkboxCol>
<!-- �᰸id --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.PROPOSALID")%>' width="100" property="proposalid" type="enum" enumCollection="PROPOSALJOINT_PROPOSALID_COLLECTION" enumKey ="$fk.showCol" enumValue="ID" sortName="PROPOSAL_JOINT.PROPOSALID"/>
<!-- ίԱ��� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.NO")%>' width="100" property="no" sortName="PROPOSAL_JOINT.NO"/>
<!-- ίԱ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.NAME")%>' width="100" property="name" sortName="PROPOSAL_JOINT.NAME"/>
<!-- ��ϵ�绰 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.PHONE")%>' width="100" property="phone" sortName="PROPOSAL_JOINT.PHONE"/>
<!-- ������λ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.DEPT")%>' width="100" property="dept" sortName="PROPOSAL_JOINT.DEPT"/>
<!-- ְ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.DUTY")%>' width="100" property="duty" sortName="PROPOSAL_JOINT.DUTY"/>
<!-- ��� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.SORTINDEX")%>' width="100" property="sortindex" sortName="PROPOSAL_JOINT.SORTINDEX"/>
<!-- ������� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.CONSTITUENCY")%>' width="100" property="constituency" sortName="PROPOSAL_JOINT.CONSTITUENCY"/>
<!-- ��ע --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE")%>' width="100" property="note" sortName="PROPOSAL_JOINT.NOTE"/>
<!-- NOTE2 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE2")%>' width="100" property="note2" sortName="PROPOSAL_JOINT.NOTE2"/>
<!-- NOTE3 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE3")%>' width="100" property="note3" sortName="PROPOSAL_JOINT.NOTE3"/>
</flex:flexgrid>
<flex:pagePolit action="proposaljointquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="proposaljoint.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposaljoint.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="proposaljoint.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposaljoint.cmd?method=delete";    
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