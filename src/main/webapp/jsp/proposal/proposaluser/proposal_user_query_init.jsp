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
<TITLE>ίԱ�����ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
//�����ѯ����
    String id = RequestUtil.getPara2String(request,"ID");
    String userid = RequestUtil.getPara2String(request,"USERID");
    String no = RequestUtil.getPara2String(request,"NO");
    String constituency = RequestUtil.getPara2String(request,"CONSTITUENCY");
    String constituencycode = RequestUtil.getPara2String(request,"CONSTITUENCYCODE");
    String firstparty = RequestUtil.getPara2String(request,"FIRSTPARTY");
    String firstpartycode = RequestUtil.getPara2String(request,"FIRSTPARTYCODE");
    String secondparty = RequestUtil.getPara2String(request,"SECONDPARTY");
    String secondpartycode = RequestUtil.getPara2String(request,"SECONDPARTYCODE");
    String name = RequestUtil.getPara2String(request,"NAME");


    String userareacode = RequestUtil.getPara2String(request,"USERAREACODE");
%>
<bsp:container title="ίԱ��ѯ" >
<bsp:containbutton action="proposaluser.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="proposaluser.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="proposaluser.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="proposaluser.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="proposaluserquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    ϵͳ��¼�ţ�<flex:searchText name="USERID" searchName="PROPOSAL_USER.USERID" dataType="java.lang.String" operSymbol="=" value="<%=userid%>" size="12"/>
    </td>
    <td>
    ίԱ��ţ�<flex:searchText name="NO" searchName="PROPOSAL_USER.NO" dataType="java.lang.String" operSymbol="=" value="<%=no%>" size="12"/>
    </td>
    <td>
    ������<flex:searchText name="NAME" searchName="PROPOSAL_USER.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>
 
    <td>
    ����������
    	 <flex:searchSelect name="USERAREACODE" searchName="PROPOSAL_USER.USERAREACODE" dataType="java.lang.String" operSymbol="=" value="<%=userareacode%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_CODE"/>
	       </flex:searchSelect>
    </td>
	<td><flex:searchImg name="chaxun" action="proposaluserquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
<!-- ���� --><flex:checkboxCol caption="ȫѡ" width="35" property="id" name="primaryKey" sortName="PROPOSAL_USER.ID"></flex:checkboxCol>
<!-- ϵͳ��¼�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.USERID")%>' width="100" property="userid" sortName="PROPOSAL_USER.USERID"/>
<!-- ίԱ��� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.NO")%>' width="100" property="no" sortName="PROPOSAL_USER.NO"/>
<!-- ������� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.CONSTITUENCY")%>' width="100" property="constituency" sortName="PROPOSAL_USER.CONSTITUENCY"/>

<!-- ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.NAME")%>' width="100" property="name" sortName="PROPOSAL_USER.NAME"/>

<!-- �ֻ� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.MOBILE")%>' width="100" property="mobile" sortName="PROPOSAL_USER.MOBILE"/>
<!-- ������λ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.DEPT")%>' width="100" property="dept" sortName="PROPOSAL_USER.DEPT"/>
<!-- ͨѶ��ַ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.ADDRESS")%>' width="100" property="address" sortName="PROPOSAL_USER.ADDRESS"/>
<!-- ������� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.SESSIONTYPE")%>' width="100" property="sessiontype" sortName="PROPOSAL_USER.SESSIONTYPE"/>
<!-- ְ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.DUTY")%>' width="100" property="duty" sortName="PROPOSAL_USER.DUTY"/>

<!-- ������������ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.USERAREANAME")%>' width="100" property="userareaname" sortName="PROPOSAL_USER.USERAREANAME"/>

</flex:flexgrid>
<flex:pagePolit action="proposaluserquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="proposaluser.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposaluser.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="proposaluser.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposaluser.cmd?method=delete";    
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