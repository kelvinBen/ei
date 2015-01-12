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
//保存查询条件
    String caseno = RequestUtil.getPara2String(request,"CASENO");

%>
<bsp:container title="已办提案" >

<html:messages></html:messages>
<html:form name="frmList" action="proposalreplyquery_page_init.cmd?flag=1">
<table id="tblSearch">
<flex:search>
	<tr>
     <td>案号：<flex:searchText name="CASENO" searchName="PROPOSAL_REPLY.CASENO" dataType="java.lang.String" operSymbol="=" value="<%=caseno%>" size="12">
	</flex:searchText></td>
 	<td><flex:searchImg name="chaxun" action="proposalreplyquery_page_init.cmd?flag=1" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="450" hasLeft="false" isWrap="true" action="" isSubmit="true">
<!--1 proposalid编号 --><flex:checkboxCol caption="全选" width="35" property="proposalid" name="primaryKey" sortName="PROPOSAL_REPLY.PROPOSALID" style="display:none"></flex:checkboxCol>
<!--2 ID --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REPLY.ID")%>' width="80" property="id" sortName="PROPOSAL_REPLY.id" style="display:none"></flex:flexCol>
<!--3 案号 --><flex:flexCol  caption='<%=ResourcesFactory.getString("PROPOSAL_REPLY.CASENO")%>' width="80" property="caseno" sortName="PROPOSAL_REPLY.CASENO"></flex:flexCol>
<!--4 标题 --><flex:flexCol caption='标题' width="100" property="note2" sortName="PROPOSAL_REPLY.NOTE2" ></flex:flexCol>
<!--5 JBDATE --><flex:flexCol caption='交办日期' width="90" property="jbdatestr"  sortName="PROPOSAL_BUZI.JBDATE"/>
<!--6 承办单位 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REPLY.PROCESSDEPT")%>' width="100" property="processdept" sortName="PROPOSAL_REPLY.PROCESSDEPT"></flex:flexCol>
<!--7 承办单位id --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REPLY.PROCESSDEPTID")%>' width="100" property="processdeptid" sortName="PROPOSAL_REPLY.PROCESSDEPTID" style="display:none"></flex:flexCol>
<!--8 承办状态 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_REPLY.STATE")%>' width="100" property="state"  sortName="PROPOSAL_REPLY.STATE" style="display:none"></flex:flexCol>
<!--9 承办状态 --><flex:flexCol style="text-align:left;" caption='办理情况' title="办理情况" width="300" property="banliqingkuang"  sortName="PROPOSAL_REPLY.STATE" ></flex:flexCol>
<!--10 负责人电话 --><flex:flexCol caption='操作' width="180" property="telephone" sortName="PROPOSAL_REPLY.TELEPHONE"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="proposalreplyquery_page_init.cmd?flag=1" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
for(var i=1;i<grid.returnRowCount()+1;i++){
	var pk=grid.getCellValue(i, 1);
	var title=grid.getCellValue(i, 4);
    var id = grid.getCellValue(i, 2);    
    var state=parseInt(grid.getCellValue(i,8));//状态
    var PROCESSDEPTID=grid.getCellValue(i, 7); //办理单位id
    //查看提案或建议
	var forlookb='<a href="javascript:forproposalbuziDetail(\''+pk+'\')" class="blueLink">'+title+'</a> ';
	var forlook1="";
    if(state==0){
      forlook1='<a href="javascript:forrecive(\''+pk+'\')" class="blueLink">'+'[接收]'+'</a> ';
    }
    if(state==1){
      forlook1='<a href="javascript:forreply(\''+id+'\')" class="blueLink">'+'[答复]'+'</a> ';
    }
	if(state==3){
	forlook1='<a href="javascript:replyredo(\''+pk+'\',\''+PROCESSDEPTID+'\')" class="blueLink">'+'[重新答复]'+'</a> ';
	}
	var forlook='<a href="javascript:dofankui(\''+pk+'\',\''+PROCESSDEPTID+'\')" class="blueLink">'+'[满意度查看]'+'</a> ';
	grid.getCell(i, 10).innerHTML =forlook1+forlook;
	grid.getCell(i, 4).innerHTML =forlookb;
	//grid.getCell(i, 9).innerHTML =forlook1;
}
function forInsert(){
  document.forms[0].action ="proposalreply.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalreply.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forreply(id){
	  var url="proposalreply.cmd?method=forreply&id="+id;
	  opens_fullcenter(url,"查看答复信息","no","yes");
	}
function replyview(proposalid,processdeptid){
	  var url="proposalreply.cmd?method=replyview&proposalid="+proposalid+"&processdeptid="+processdeptid;
	  opens_fullcenter(url,"查看答复信息","no","yes");
}

function replyredo(proposalid,processdeptid){
	  var url="proposalreply.cmd?method=redoreply&proposalid="+proposalid+"&processdeptid="+processdeptid;
	  opens_fullcenter(url,"重新答复信息","no","yes");
}

function forrecive(pk){
	  var url="proposalreply.cmd?method=forrecive&pk="+pk;
	  opens_fullcenter(url,"接收","no","yes");			  
	}

function forproposalbuziDetail(primaryKey){
var url="proposalbuzi.cmd?method=view";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
  opens_fullcenter(url,"查看提案详细信息区","no","yes");
}

//满意度评价
function dofankui(proposalid , PROCESSDEPTID){
  url="proposalbuzi.cmd?method=forfankui&iswrite=0&proposalid="+proposalid+"&PROCESSDEPTID="+PROCESSDEPTID;    
  opens_center(url,"满意度评价",600,480,"no","yes");
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
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要删除的记录!");
    return false;
  }
  if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
</script>