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
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<% 
//�����ѯ����
    String caseno = RequestUtil.getPara2String(request,"CASENO");
    String STATE=RequestUtil.getPara2String(request,"STATE");
%>
<bsp:container title="�����᰸" >

<html:messages></html:messages>
<html:form name="frmList" action="proposalreplyquery_page_init.cmd?flag=0">
<table id="tblSearch">
<flex:search>
	<tr>
     <td>���ţ�<flex:searchText name="CASENO" searchName="PROPOSAL_REPLY.CASENO" dataType="java.lang.String" operSymbol="=" value="<%=caseno%>" size="12">
	</flex:searchText></td>
	
  <td align="right">״̬��      </td>
     <td>
           <flex:searchSelect name="STATE" searchName="PROPOSAL_BUZI.STATE" dataType="java.lang.Integer" operSymbol="=" value="<%=STATE%>" >
	         <option value="">ȫ��</option>
			<html:option value="0">������</html:option>
			<html:option value="1">����</html:option>
	       </flex:searchSelect>
  </td>
	
 	<td><flex:searchImg name="chaxun" action="proposalreplyquery_page_init.cmd?flag=0" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="450" hasLeft="false" isWrap="true" action="" isSubmit="true">
<!--1 proposalid��� --><flex:checkboxCol caption="ȫѡ" width="35" property="proposalid" name="primaryKey" sortName="PROPOSAL_REPLY.PROPOSALID" style="display:none"></flex:checkboxCol>
<!--2 ID --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REPLY.ID")%>' width="100" property="id" sortName="PROPOSAL_REPLY.id" style="display:none"></flex:flexCol>
<!--3 ���� --><flex:flexCol  caption='<%=ResourcesFactory.getString("PROPOSAL_REPLY.CASENO")%>' width="80" property="caseno" sortName="PROPOSAL_REPLY.CASENO"></flex:flexCol>
<!--4 ���� --><flex:flexCol caption='����' width="100" property="note2" sortName="PROPOSAL_REPLY.NOTE2" ></flex:flexCol>
<!--5 JBDATE --><flex:flexCol caption='��������' width="90" property="jbdatestr"  sortName="PROPOSAL_BUZI.JBDATE"/>

<!--6 �а쵥λ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REPLY.PROCESSDEPT")%>' width="100" property="processdept" sortName="PROPOSAL_REPLY.PROCESSDEPT"></flex:flexCol>
<!--7 �а쵥λid --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REPLY.PROCESSDEPTID")%>' width="100" property="processdeptid" sortName="PROPOSAL_REPLY.PROCESSDEPTID" style="display:none"></flex:flexCol>
<!--8 �а�״̬ --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REPLY.STATE")%>' width="100" property="state"  sortName="PROPOSAL_REPLY.STATE" style="display:none"></flex:flexCol>
<!--9 �а�״̬ --><flex:flexCol style="text-align:left;" caption='�������' title="sss" width="300" property="banliqingkuang"  sortName="PROPOSAL_REPLY.STATE" ></flex:flexCol>
<!--10 �����˵绰 --><flex:flexCol caption='����' width="100" property="telephone" sortName="PROPOSAL_REPLY.TELEPHONE" canSort="false"></flex:flexCol>
<!--11 �����˵绰 --><flex:flexCol caption='��������' width="40" property="depttype" sortName="PROPOSAL_REPLY.TELEPHONE" style="display:none" canSort="false"></flex:flexCol>


</flex:flexgrid>
<flex:pagePolit action="proposalreplyquery_page_init.cmd?flag=0" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
for(var i=1;i<grid.returnRowCount()+1;i++){
	var pk=grid.getCellValue(i, 1);
	var title=grid.getCellValue(i, 4);
	var proposaltype=grid.getCellValue(i, 5);
	//alert(proposaltype);
    var id = grid.getCellValue(i, 2);    
    var state=parseInt(grid.getCellValue(i,8));//״̬
    var PROCESSDEPTID=grid.getCellValue(i, 7); //����λid
	    //�鿴�᰸����
	var forlookb='<a href="javascript:forproposalbuziDetail(\''+pk+'\')" class="blueLink">'+title+'</a> ';
	var forlook1="";
    if(state==0){
     var depttype= grid.getCellValue(i, 11);  //1 ���� 2Э��
      forlook1='<a href="javascript:forrecive(\''+pk+'\','+depttype+')" class="blueLink">'+'[�����᰸]'+'</a> ';
    }
    if(state==1){
      forlook1='<a href="javascript:forreply(\''+id+'\')" class="blueLink">'+'[��]'+'</a> ';
    }
	if(state==3){
	//forlook1='<a href="javascript:replyview(\''+id+'\')" class="blueLink">'+'[�鿴��]'+'</a> ';
	}
	//var forlook='<a href="javascript:dofankui(\''+pk+'\',\''+PROCESSDEPTID+'\')" class="blueLink">'+'[����Ȳ鿴]'+'</a> ';
	grid.getCell(i, 10).innerHTML =forlook1;
	grid.getCell(i, 4).innerHTML =forlookb;
}

function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalreply.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forreply(id){
	  var url="proposalreply.cmd?method=forreply&id="+id;
	  opens_fullcenter(url,"�鿴����Ϣ","no","yes");
	}
function replyview(proposalid,processdeptid){
	  var url="proposalreply.cmd?method=replyview&proposalid="+proposalid+"&processdeptid="+processdeptid;
	  opens_fullcenter(url,"�鿴����Ϣ","no","yes");
}

function forrecive(pk,depttype){
	  var url="proposalreply.cmd?method=forrecive&pk="+pk+"&depttype="+depttype;
	  opens_fullcenter(url,"�����᰸","no","yes");			  
	}

//���������
function dofankui(proposalid , PROCESSDEPTID){
  url="proposalbuzi.cmd?method=forfankui&iswrite=0&proposalid="+proposalid+"&PROCESSDEPTID="+PROCESSDEPTID;    
  opens_center(url,"���������",600,480,"no","yes");
}
function forproposalbuziDetail(primaryKey){
var url="proposalbuzi.cmd?method=view";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
  opens_fullcenter(url,"�鿴�᰸��ϸ��Ϣ��","no","yes");
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalreply.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposalreply.cmd?method=delete";    
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

</script>