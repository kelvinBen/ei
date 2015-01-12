<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@page import="net.mast.util.RequestUtil"%>
<%@page import="net.mast.waf.ComponentFactory"%>
<HTML>
<HEAD>
<TITLE>待交办</TITLE>

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>

<% 
//保存查询条件
    String caseno = RequestUtil.getPara2String(request,"CASENO");
    String title = RequestUtil.getPara2String(request,"TITLE");
    String type = RequestUtil.getPara2String(request,"TYPE");
    String category = RequestUtil.getPara2String(request,"categorySearch");

    String proposor = RequestUtil.getPara2String(request,"PROPOSOR");

    String state = RequestUtil.getPara2String(request,"STATE");

    String areacode = RequestUtil.getPara2String(request,"areacodeSearch");

%>
<bsp:container title="提案交办" >

<html:messages></html:messages>
<html:form name="frmList" action="proposalassignQueryPage.cmd?assigType=1">
<table id="tblSearch" width="90%">
<flex:search>
	<tr>
    <td align="right">案号：
      </td>
     <td>  
    <flex:searchText name="CASENO" searchName="PROPOSAL_BUZI.CASENO" dataType="java.lang.String" operSymbol="=" value="<%=caseno%>" size="12"/>
    </td>

    <td align="right">标题：      </td>
     <td><flex:searchText name="TITLE" searchName="PROPOSAL_BUZI.CATEGORYCODE" dataType="java.lang.String" operSymbol="=" value="<%=title%>" size="12"/>
    </td>
</tr>
<tr>
    <td align="right">提案者：      </td>
     <td><flex:searchText name="PROPOSOR" searchName="PROPOSAL_BUZI.PROPOSOR" dataType="java.lang.String" operSymbol="=" value="<%=proposor%>" size="12"/>
    </td>



<!--  
    <td>行政区划：<flex:searchText name="areacodeSearch" searchName="PROPOSAL_BUZI.AREACODE" dataType="java.lang.String" operSymbol="=" value="<%=areacode%>" size="12">
	</flex:searchText></td>
-->
  <td align="right">联名类别：      </td>
     <td>
           <flex:searchSelect name="TYPE" searchName="PROPOSAL_BUZI.TYPE" dataType="java.lang.String" operSymbol="=" value="<%=type%>" >
	         <option value="">全部</option>
	         <html:options collection="PROPOSALBUZI_TYPE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
	<td align="right"><flex:searchImg name="chaxun" action="proposalassignQueryPage.cmd?assigType=1" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" hasLeft="false" isWrap="true" isSubmit="true">

<!-- 编号 --><flex:radioCol caption="选择" width="35" property="id" name="primaryKey" sortName="PROPOSAL_BUZI.ID"/>
<!-- 案号 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.CASENO")%>' width="60" property="caseno" sortName="PROPOSAL_BUZI.CASENO" style="display:none;"></flex:flexCol>
<!-- 案由 --><flex:flexCol style="text-align:left;" caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.TITLE")%>' title="点击查看" width="120" property="title" sortName="PROPOSAL_BUZI.TITLE"></flex:flexCol>
<!-- 4联名类别 --><flex:flexCol caption='联名类别' width="100" property="type" type="enum" enumCollection="PROPOSALBUZI_TYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.TYPE"/>

<!-- 提案者 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.PROPOSOR")%>' width="100" property="proposor" sortName="PROPOSAL_BUZI.PROPOSOR" ></flex:flexCol>
<!-- 提 交 人 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.AUTHOR")%>' width="100" property="author" sortName="PROPOSAL_BUZI.AUTHOR" ></flex:flexCol>

<!-- 提交时间 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.SUBMITDATE")%>' width="100" property="submitdatestr" sortName="PROPOSAL_BUZI.SUBMITDATE"></flex:flexCol>
<!-- 提案状态 --><flex:flexCol caption='交办' width="120" property="state" type="enum" sortName="PROPOSAL_BUZI.STATE" enumCollection="PROPOSALBUZI_STATE_COLLECTION" enumKey ="key" enumValue="value"></flex:flexCol>


</flex:flexgrid>
<flex:pagePolit action="proposalassignQueryPage.cmd?assigType=1" pageSize="15">
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
		var state=grid.getCellValue(i, 8);
		if(state=="待交办")
			forlook=' <a href="javascript:jiaoban(\''+primaryKey+'\')">交办</a>';
		else{			
			forlook=' <a href="javascript:rejiaoban(\''+primaryKey+'\')">重新交办</a>';
			forlook+='<br/> <a href="javascript:looktuiban(\''+primaryKey+'\')">查看单位意见</a>';
		
		}
		grid.getCell(i, 8).innerHTML =state+forlook;
		//如果退回的，则需要重新交办
}

//查看退办信息
function looktuiban(primaryKey){
var url="proposalreply.cmd?method=looktuiban";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
opens_center(url,"查看单位意见",600,480,"no","yes");
}

function jiaoban(primaryKey){
var url="proposalreview.cmd?method=forjiaoban";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
 opens_fullcenter(url,"交办","no","yes"); 
}

function rejiaoban(primaryKey){
var url="proposalreview.cmd?method=rejiaoban";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
  opens_fullcenter(url,"重新交办","no","yes");
}

function forDetail(primaryKey){
var url="proposalbuzi.cmd?method=view";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
//  document.forms[0].target="_blank";
//  document.forms[0].action =url;    
//  document.forms[0].submit();	
//  document.forms[0].target="";
  opens_fullcenter(url,"查看提案详细信息区","no","yes");
  
}
//查看复文
function lookfuwen(proposalid , PROCESSDEPTID){
	  var url="proposalreply.cmd?method=replyview&proposalid="+proposalid+"&processdeptid="+PROCESSDEPTID;
	  opens_fullcenter(url,"查看答复信息","no","yes");
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