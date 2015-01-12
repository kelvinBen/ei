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
<TITLE></TITLE>
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
  
    String STATE = RequestUtil.getPara2String(request,"STATE");

    String period = RequestUtil.getPara2String(request,"periodSearch");
    String meeting = RequestUtil.getPara2String(request,"meetingSearch");
    String areacode = RequestUtil.getPara2String(request,"areacodeSearch");
    String areaname = RequestUtil.getPara2String(request,"areanameSearch");
    String insteador = RequestUtil.getPara2String(request,"insteadorSearch");
    String insteadoruserid = RequestUtil.getPara2String(request,"insteadoruseridSearch");
    String publishdate = RequestUtil.getPara2String(request,"publishdateSearch");
    String deletestate = RequestUtil.getPara2String(request,"deletestateSearch");
    String proposaltype = RequestUtil.getPara2String(request,"proposaltypeSearch");
   //String s= RequestUtil.getRequestAttributesInfo(request);

%>
<bsp:container title="�ҵ��᰸" >

<html:messages></html:messages>
<html:form name="frmList" action="myproposallist.cmd">
<table id="tblSearch">
<flex:search>
	<tr>

    <td>���ţ�<flex:searchText name="CASENO" searchName="PROPOSAL_BUZI.CASENO" dataType="java.lang.String" operSymbol="=" value="<%=caseno%>" size="12">
	</flex:searchText></td>

    <td align="right">���⣺      </td>
     <td><flex:searchText name="TITLE" searchName="PROPOSAL_BUZI.CATEGORYCODE" dataType="java.lang.String" operSymbol="=" value="<%=title%>" size="12"/>
    </td>

  <td>״̬��
           <flex:searchSelect name="STATE" searchName="PROPOSAL_BUZI.STATE" dataType="java.lang.Integer" operSymbol="=" value="<%=STATE%>" >
	         <option value="">ȫ��</option>
	         <html:options collection="PROPOSALBUZI_STATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>


	<td><flex:searchImg name="chaxun" action="myproposallist.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" hasLeft="false" isWrap="true" isSubmit="true">
<!-- 1��� --><flex:radioCol caption="ѡ��" width="35"  property="id" name="primaryKey" index="1" style="display:none" sortName="PROPOSAL_BUZI.ID"/>
<!-- 2���� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.CASENO")%>' width="60" property="caseno" index="2" sortName="PROPOSAL_BUZI.CASENO"/>
<!-- 3���� --><flex:flexCol style="text-align:left;" caption='����' width="100" property="title" index="3" sortName="PROPOSAL_BUZI.TITLE"/>
<!-- 4�鰸����״̬ --><flex:flexCol caption='' width="100" property="state" sortName="PROPOSAL_BUZI.STATE" style="display:none"/>

<!-- 5�鰸/������ --><flex:flexCol caption='�᰸��' width="100" property="proposor" sortName="PROPOSAL_BUZI.PROPOSOR" index="4"/>

<!-- 6�� �� �� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.AUTHOR")%>' width="100" property="author" sortName="PROPOSAL_BUZI.AUTHOR" index="5" style="display:none"/>

<!--7 �ύʱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.SUBMITDATE")%>' width="100" property="submitdatestr" index="6" sortName="PROPOSAL_BUZI.SUBMITDATE"/>
<!--8 �鰸����״̬ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.STATE")%>' width="100" property="state" sortName="PROPOSAL_BUZI.STATE" index="7" type="enum" enumCollection="PROPOSALBUZI_STATE_COLLECTION" enumKey ="key" enumValue="value"/>

<!--9 �츴��� --><flex:flexCol caption='�츴���' title="�츴���" style="text-align:left;" width="300" property="banliqingkuang" index="13" sortName="PROPOSAL_BUZI.STATE" canSort="false"/>

<!--10 �Ƿ��ѽ��� --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.ISREGISTER")%>' width="100" property="isregister" index="8" type="enum" enumCollection="PROPOSALBUZI_ISREGISTER_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.ISREGISTER"/>



</flex:flexgrid>
<flex:pagePolit action="myproposallist.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
for(var i=1;i<grid.returnRowCount()+1;i++){
		var primaryKey=grid.getCellValue(i, 1);
		var title=grid.getCellValue(i, 3);
		var forlook='<a href="javascript:forDetail(\''+primaryKey+'\')" class="blueLink">'+title+'</a> ';
		
		//���ò���
		var dosome="&nbsp";
		var state=parseInt(grid.getCellValue(i, 4));//״̬
		//alert(state);
		if(state==1||state==8){// �����û��� ���߱�����˻��������޸Ĺ���
			dosome='<a href="javascript:forUpdate(\''+primaryKey+'\')" class="blueLink"><FONT COLOR="red">�޸�</FONT></a>  ';
			forlook+=dosome;
		}else if(state==6) {//�Ѵ�
//			dosome= '<a href="javascript:lookfuwen(\''+primaryKey+'\')" class="blueLink">�鿴����</a>  ';
//			dosome+= '<a href="javascript:dofankui(\''+primaryKey+'\')" class="blueLink">��д�����</a>  ';
		}else if(state==7)  {
//			dosome= '<a href="javascript:lookfuwen(\''+primaryKey+'\')" class="blueLink">�鿴����</a>  ';
//			dosome+= '<a href="javascript:dofankui(\''+primaryKey+'\')" class="blueLink">�鿴�����</a>  ';
		}else{
			//dosome=grid.getCellValue(i, 7);
		}
	//	grid.getCell(i, 10).innerHTML =dosome;
		grid.getCell(i, 3).innerHTML =forlook;
}
//�鿴����
function lookfuwen(proposalid , PROCESSDEPTID){
	  var url="proposalreply.cmd?method=replyview&proposalid="+proposalid+"&processdeptid="+PROCESSDEPTID;
	  opens_fullcenter(url,"�鿴����Ϣ","no","yes");
}
//���������
function dofankui(proposalid , PROCESSDEPTID){
  url="proposalbuzi.cmd?method=forfankui&iswrite=1&proposalid="+proposalid+"&PROCESSDEPTID="+PROCESSDEPTID;    
  opens_center(url,"���������",700,480,"no","yes");
}

function toInsert(proposaltype){
  document.forms[0].action ="proposalbuzi.cmd?method=forinsert&proposaltype="+proposaltype;    
  document.forms[0].submit();	
}
function forUpdate(primaryKey){
var url="proposalbuzi.cmd?method=forupdate&flag=editByUser";   
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
//    document.forms[0].target="_blank";
  document.forms[0].action =url;    
  document.forms[0].submit();	
//    document.forms[0].target="";
}
function forDetail(primaryKey){
var url="proposalbuzi.cmd?method=view";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
  opens_fullcenter(url,"�鿴�鰸��ϸ��Ϣ��","no","yes");
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