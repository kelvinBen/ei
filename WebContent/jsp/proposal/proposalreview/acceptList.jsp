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
<TITLE>待接收提案</TITLE>
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
//<bsp:containbutton action="proposalreview.cmd?method=accept" onclick="accept()" text="批量接收"></bsp:containbutton>

%>
<bsp:container title="提案审查" >


<html:messages></html:messages>
<html:form name="frmList" action="proposalauditQueryPage.cmd">
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

  <td align="right">状态：      </td>
     <td>
           <flex:searchSelect name="STATE" searchName="PROPOSAL_BUZI.STATE" dataType="java.lang.Integer" operSymbol="=" value="<%=state%>" >
	         <option value="">全部</option>
			<html:option value="1">待接收</html:option>
			<html:option value="2">待审查</html:option>
			</flex:searchSelect>
  </td>
</tr>
<tr>
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

	<td align="right"><flex:searchImg name="chaxun" action="proposalauditQueryPage.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action=""  isSubmit="true">
<!-- 编号 --><flex:checkboxCol caption="全选" width="35" property="id" name="primaryKey" sortName="PROPOSAL_BUZI.ID" style="display:none"/>
<!-- 案号 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.CASENO")%>' width="100" property="caseno" sortName="PROPOSAL_BUZI.CASENO"></flex:flexCol>
<!-- 标题 --><flex:flexCol style="text-align:left;" caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.TITLE")%>' width="180" property="title" sortName="PROPOSAL_BUZI.TITLE"></flex:flexCol>

<!-- 提案者 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.PROPOSOR")%>' width="100" property="proposor" sortName="PROPOSAL_BUZI.PROPOSOR" ></flex:flexCol>
<!-- 提案者ID --><flex:flexCol caption='委员编号' width="100" property="proposoruserid" sortName="PROPOSAL_BUZI.PROPOSORUSERID" ></flex:flexCol>
<!-- 提 交 人 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.AUTHOR")%>' width="100" property="author" sortName="PROPOSAL_BUZI.AUTHOR" ></flex:flexCol>

<!-- 提交时间 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.SUBMITDATE")%>' width="100" property="submitdatestr" sortName="PROPOSAL_BUZI.SUBMITDATE"></flex:flexCol>
<!-- 提案状态 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.STATE")%>' width="100" property="state" style="display:none" sortName="PROPOSAL_BUZI.STATE" ></flex:flexCol>
<!-- 提案状态 --><flex:flexCol caption='操作' width="70" property="state" type="enum" sortName="PROPOSAL_BUZI.STATE" enumCollection="PROPOSALBUZI_STATE_COLLECTION" enumKey ="key" enumValue="value"></flex:flexCol>
<!-- 4联名类别 --><flex:flexCol caption='联名类别' width="100" property="type" type="enum" enumCollection="PROPOSALBUZI_TYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.TYPE"/>


</flex:flexgrid>
<flex:pagePolit action="proposalauditQueryPage.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();

for(var i=1;i<grid.returnRowCount()+1;i++){
		var primaryKey=grid.getCellValue(i, 1);
		var state=grid.getCellValue(i, 8);
		var statename=grid.getCellValue(i, 9);
		var s;
		if(state=="1") //状态为待接收
		   s=' <a href="javascript:accept(\''+primaryKey+'\')" class="blueLink">接收</a>';
		 else
		   s=' <a href="javascript:forAudit(\''+primaryKey+'\')" class="blueLink">审查</a>';
		grid.getCell(i, 9).innerHTML =s;
		var title=grid.getCellValue(i, 3);
		var forlook='<a href="javascript:forDetail(\''+primaryKey+'\')" class="blueLink">'+title+'</a>';
		grid.getCell(i, 3).innerHTML =forlook;
}


function accept(primaryKey){
  if(primaryKey)
  	document.forms[0].action ="proposalreview.cmd?method=accept&primaryKey="+primaryKey; 
  else
     document.forms[0].action ="proposalreview.cmd?method=accept"; 
  document.forms[0].submit();	
}

function toInsert(proposaltype){
  document.forms[0].action ="proposalbuzi.cmd?method=forinsert&proposaltype="+proposaltype;    
  document.forms[0].submit();	
}
function forAudit(primaryKey){
var url="proposalreview.cmd?method=preAudit";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
  opens_fullcenter(url,"查看提案详细信息区","no","yes");
}
function forDetail(primaryKey){
var url="proposalbuzi.cmd?method=view";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
  opens_fullcenter(url,"查看提案详细信息区","no","yes");
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposalbuzi.cmd?method=delete";    
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