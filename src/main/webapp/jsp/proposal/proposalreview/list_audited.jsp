<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@page import="net.mast.util.RequestUtil"%>
<%@page import="net.mast.waf.ComponentFactory"%>
<%@page import="net.mast.waf.data.EnumCollection"%>
<HTML>
<HEAD>
<TITLE>������᰸</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<% 
//�����ѯ����
    String caseno = RequestUtil.getPara2String(request,"CASENO");
    String title = RequestUtil.getPara2String(request,"TITLE");
    String type = RequestUtil.getPara2String(request,"TYPE");

    String proposor = RequestUtil.getPara2String(request,"PROPOSOR");

    String state = RequestUtil.getPara2String(request,"STATE");
    String areacode = RequestUtil.getPara2String(request,"AREACODE");

    
    String auditType = RequestUtil.getPara2String(request,"auditType");
   //String s= RequestUtil.getRequestAttributesInfo(request);

%>
<bsp:container title="������᰸" >

<html:messages></html:messages>
<html:form name="frmList" action="proposalauditQueryPage.cmd">
<input type="hidden" name="auditType" value="<%=auditType %>"/>
<table id="tblSearch" width="90%">
<flex:search>
	<tr>
    <td align="right">���ţ�
      </td>
     <td>  
    <flex:searchText name="CASENO" searchName="PROPOSAL_BUZI.CASENO" dataType="java.lang.String" operSymbol="=" value="<%=caseno%>" size="12"/>
    </td>

    <td align="right">���⣺      </td>
     <td><flex:searchText name="TITLE" searchName="PROPOSAL_BUZI.CATEGORYCODE" dataType="java.lang.String" operSymbol="=" value="<%=title%>" size="12"/>
    </td>
</tr>
<tr>
    <td align="right">�᰸�ߣ�      </td>
     <td><flex:searchText name="PROPOSOR" searchName="PROPOSAL_BUZI.PROPOSOR" dataType="java.lang.String" operSymbol="=" value="<%=proposor%>" size="12"/>
    </td>

  <td align="right">״̬��      </td>
     <td>
           <flex:searchSelect name="STATE" searchName="PROPOSAL_BUZI.STATE" dataType="java.lang.Integer" operSymbol="=" value="<%=state%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALBUZI_STATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
</tr>
<tr>
<!--  
    <td>����������<flex:searchText name="areacodeSearch" searchName="PROPOSAL_BUZI.AREACODE" dataType="java.lang.String" operSymbol="=" value="<%=areacode%>" size="12">
	</flex:searchText></td>
-->
  <td align="right">�������      </td>
     <td>
           <flex:searchSelect name="TYPE" searchName="PROPOSAL_BUZI.TYPE" dataType="java.lang.String" operSymbol="=" value="<%=type%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALBUZI_TYPE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>

	<td align="right"><flex:searchImg name="chaxun" action="proposalauditQueryPage.cmd" image="search.gif"/></td>
	</tr>
</flex:search>

</table>
<flex:flexgrid name="grid" height="342" action="" hasLeft="false" isWrap="true" isSubmit="true">
<!-- ��� --><flex:checkboxCol caption="ȫѡ" width="35" property="id" name="primaryKey" sortName="PROPOSAL_BUZI.ID" style="display:none"></flex:checkboxCol>
<!-- ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.CASENO")%>' width="100" property="caseno" sortName="PROPOSAL_BUZI.CASENO"></flex:flexCol>
<!-- ���� --><flex:flexCol style="text-align:left;" caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.TITLE")%>' width="100" property="title" sortName="PROPOSAL_BUZI.TITLE"></flex:flexCol>

<!-- �᰸�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.PROPOSOR")%>' width="100" property="proposor" sortName="PROPOSAL_BUZI.PROPOSOR" ></flex:flexCol>

<!-- �� �� �� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.AUTHOR")%>' width="100" property="author" sortName="PROPOSAL_BUZI.AUTHOR" style="display:none"></flex:flexCol>

<!-- �ύʱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.SUBMITDATE")%>' width="100" property="submitdatestr" sortName="PROPOSAL_BUZI.SUBMITDATE"></flex:flexCol>
<!-- �᰸״̬ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.STATE")%>' width="100" property="state" type="enum" sortName="PROPOSAL_BUZI.STATE" enumCollection="PROPOSALBUZI_STATE_COLLECTION" enumKey ="key" enumValue="value"></flex:flexCol>

<!-- �츴��� --><flex:flexCol caption='�츴���' title="�츴���" style="text-align:left;" width="300" property="banliqingkuang" index="13" sortName="PROPOSAL_BUZI.STATE" canSort="false"/>

<!-- �Ƿ��ѽ��� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.ISREGISTER")%>' width="100" property="isregister" type="enum" enumCollection="PROPOSALBUZI_ISREGISTER_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.ISREGISTER"></flex:flexCol>


</flex:flexgrid>
<flex:pagePolit action="proposalauditQueryPage.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();

for(var i=1;i<grid.returnRowCount()+1;i++){
		var primaryKey=grid.getCellValue(i, 1);

		var title=grid.getCellValue(i, 3);
		var forlook='<a href="javascript:forDetail(\''+primaryKey+'\')" class="blueLink">'+title+'</a>';
		grid.getCell(i, 3).innerHTML =forlook;
}

//���������
function dofankui(proposalid , PROCESSDEPTID){
  url="proposalbuzi.cmd?method=forfankui&iswrite=0&proposalid="+proposalid+"&PROCESSDEPTID="+PROCESSDEPTID;    
 
  opens_center(url,"����Ȳ鿴",600,480,"no","yes");
}


function forDetail(primaryKey){
var url="proposalbuzi.cmd?method=view";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
  opens_fullcenter(url,"�鿴�᰸��ϸ��Ϣ��","no","yes");
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
//�鿴����
function lookfuwen(proposalid , PROCESSDEPTID){
	  var url="proposalreply.cmd?method=replyview&proposalid="+proposalid+"&processdeptid="+PROCESSDEPTID;
	  opens_fullcenter(url,"�鿴����Ϣ","no","yes");
}
</script>