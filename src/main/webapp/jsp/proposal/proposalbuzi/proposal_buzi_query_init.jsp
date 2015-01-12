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
<TITLE>�᰸����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<% 
//�����ѯ����
    String id = RequestUtil.getPara2String(request,"ID");
    String caseno = RequestUtil.getPara2String(request,"CASENO");
    String title = RequestUtil.getPara2String(request,"TITLE");
    String content = RequestUtil.getPara2String(request,"CONTENT");
    String type = RequestUtil.getPara2String(request,"TYPE");
    String largetypecode = RequestUtil.getPara2String(request,"LARGETYPECODE");
    String largetype = RequestUtil.getPara2String(request,"LARGETYPE");
    String smalltypecode = RequestUtil.getPara2String(request,"SMALLTYPECODE");
    String smalltype = RequestUtil.getPara2String(request,"SMALLTYPE");
    String category = RequestUtil.getPara2String(request,"CATEGORY");
    String categorycode = RequestUtil.getPara2String(request,"CATEGORYCODE");
    String proposor = RequestUtil.getPara2String(request,"PROPOSOR");
    String proposoruserid = RequestUtil.getPara2String(request,"PROPOSORUSERID");
    String author = RequestUtil.getPara2String(request,"AUTHOR");
    String authoruserid = RequestUtil.getPara2String(request,"AUTHORUSERID");
    String submitdate = RequestUtil.getPara2String(request,"SUBMITDATE");
    String state = RequestUtil.getPara2String(request,"STATE");
    String registerdate = RequestUtil.getPara2String(request,"REGISTERDATE");
    String registeror = RequestUtil.getPara2String(request,"REGISTEROR");
    String registeroruserid = RequestUtil.getPara2String(request,"REGISTERORUSERID");
    String registerdept = RequestUtil.getPara2String(request,"REGISTERDEPT");
    String registercomment = RequestUtil.getPara2String(request,"REGISTERCOMMENT");
    String processdeptlist = RequestUtil.getPara2String(request,"PROCESSDEPTLIST");
    String xbprocessdeptlist = RequestUtil.getPara2String(request,"XBPROCESSDEPTLIST");
    String processdeptidlist = RequestUtil.getPara2String(request,"PROCESSDEPTIDLIST");
    String xbprocessdeptidlist = RequestUtil.getPara2String(request,"XBPROCESSDEPTIDLIST");
    String zbdealedtimelimit = RequestUtil.getPara2String(request,"ZBDEALEDTIMELIMIT");
    String xbdealedtimelimit = RequestUtil.getPara2String(request,"XBDEALEDTIMELIMIT");
    String isexcellent = RequestUtil.getPara2String(request,"ISEXCELLENT");
    String curexaminer = RequestUtil.getPara2String(request,"CUREXAMINER");
    String webstate = RequestUtil.getPara2String(request,"WEBSTATE");
    String auditstate = RequestUtil.getPara2String(request,"AUDITSTATE");
    String audittime = RequestUtil.getPara2String(request,"AUDITTIME");
    String isadddept = RequestUtil.getPara2String(request,"ISADDDEPT");
    String isregister = RequestUtil.getPara2String(request,"ISREGISTER");
    String period = RequestUtil.getPara2String(request,"PERIOD");
    String meeting = RequestUtil.getPara2String(request,"MEETING");
    String areacode = RequestUtil.getPara2String(request,"AREACODE");
    String areaname = RequestUtil.getPara2String(request,"AREANAME");

%>
<bsp:container title="�᰸������Ϣ���ѯ" >

<bsp:containbutton action="proposalbuzi.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<bsp:containbutton action="proposalbuzi.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>

<html:messages></html:messages>
<html:form name="frmList" action="proposalbuziquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    ���ţ�</td>
    <td><flex:searchText name="CASENO" searchName="PROPOSAL_BUZI.CASENO" dataType="java.lang.String" operSymbol="=" value="<%=caseno%>" size="12"/>
    </td>
    <td>
    ���⣺</td>
    <td><flex:searchText name="TITLE" searchName="PROPOSAL_BUZI.TITLE" dataType="java.lang.String" operSymbol="=" value="<%=title%>" size="12"/>
    </td>

  <td>�������</td>
    <td>
           <flex:searchSelect name="TYPE" searchName="PROPOSAL_BUZI.TYPE" dataType="java.lang.String" operSymbol="=" value="<%=type%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALBUZI_TYPE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
  <td>�᰸�������</td>
    <td>
           <flex:searchSelect name="CATEGORY" searchName="PROPOSAL_BUZI.CATEGORY" dataType="java.lang.String" operSymbol="=" value="<%=category%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALBUZI_CATEGORY_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>

</tr>
<tr>
    <td>
    �᰸�ߣ�</td>
    <td><flex:searchText name="PROPOSOR" searchName="PROPOSAL_BUZI.PROPOSOR" dataType="java.lang.String" operSymbol="=" value="<%=proposor%>" size="12"/>
    </td>

  <td>�᰸״̬��</td>
    <td>
           <flex:searchSelect name="STATE" searchName="PROPOSAL_BUZI.STATE" dataType="java.lang.Integer" operSymbol="=" value="<%=state%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALBUZI_STATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
  
  <td>���������</td>
    <td>
           <flex:searchSelect name="ISREGISTER" searchName="PROPOSAL_BUZI.ISREGISTER" dataType="java.lang.String" operSymbol="=" value="<%=isregister%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALBUZI_ISREGISTER_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
<!--  
    <td>
    ��������code��<flex:searchText name="AREACODE" searchName="PROPOSAL_BUZI.AREACODE" dataType="java.lang.String" operSymbol="=" value="<%=areacode%>" size="12"/>
    </td>
-->

	<td><flex:searchImg name="chaxun" action="proposalbuziquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" hasLeft="false" isWrap="true" isSubmit="true">
<!-- ��� --><flex:checkboxCol caption="ȫѡ" width="35" property="id" name="primaryKey" sortName="PROPOSAL_BUZI.ID"></flex:checkboxCol>
<!-- ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.CASENO")%>' width="100" property="caseno" sortName="PROPOSAL_BUZI.CASENO"/>
<!-- ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.TITLE")%>' width="100" property="title" sortName="PROPOSAL_BUZI.TITLE"/>

<!-- �᰸�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.PROPOSOR")%>' width="100" property="proposor" sortName="PROPOSAL_BUZI.PROPOSOR" />
<!-- �᰸(����)��� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.TYPE")%>' width="100" property="type" type="enum" enumCollection="PROPOSALBUZI_TYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.TYPE"/>

<!-- �� �� �� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.AUTHOR")%>' width="100" property="author" sortName="PROPOSAL_BUZI.AUTHOR" style="display:none"/>
<!-- �ύʱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.SUBMITDATE")%>' width="100" property="submitdatestr" sortName="PROPOSAL_BUZI.SUBMITDATE"/>
<!-- �᰸״̬ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.STATE")%>' width="100" property="state" sortName="PROPOSAL_BUZI.STATE" style="display:none"/>

<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.REGISTERDATE")%>' width="100" property="registerdatestr" sortName="PROPOSAL_BUZI.REGISTERDATE" />
<!-- �츴��� --><flex:flexCol caption='�츴���' title="������ʱ������" style="text-align:left;" width="300" property="banliqingkuang" index="13" sortName="PROPOSAL_BUZI.ZBDEALEDTIMELIMIT" />

<!-- ���쵥λ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.REGISTERDEPT")%>' width="100" property="registerdept" sortName="PROPOSAL_BUZI.REGISTERDEPT" />

<!-- �Ƿ��ѽ��� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.ISREGISTER")%>' width="100" property="isregister" index="8" type="enum" enumCollection="PROPOSALBUZI_ISREGISTER_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.ISREGISTER"/>


</flex:flexgrid>
<flex:pagePolit action="proposalbuziquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
//�鿴����
function lookfuwen(proposalid , PROCESSDEPTID){
	  var url="proposalreply.cmd?method=replyview&proposalid="+proposalid+"&processdeptid="+PROCESSDEPTID;
	  opens_fullcenter(url,"�鿴����Ϣ","no","yes");
}
//���������
function dofankui(proposalid , PROCESSDEPTID){
  url="proposalbuzi.cmd?method=forfankui&proposalid="+proposalid+"&PROCESSDEPTID="+PROCESSDEPTID;    
  opens_center(url,"�鿴�����",700,480,"no","yes");
}

function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalbuzi.cmd?method=forupdate";    
  document.forms[0].submit();	
}

function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalbuzi.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposalbuzi.cmd?method=delete";    
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