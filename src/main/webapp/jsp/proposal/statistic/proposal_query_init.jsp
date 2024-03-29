<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@page import="net.mast.util.RequestUtil"%>
<%@ taglib uri="/tags/web-date" prefix="data"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='calendar.js'/>"></script>

<% 
//保存查询条件
    String caseno = RequestUtil.getPara2String(request,"CASENO");
    String title = RequestUtil.getPara2String(request,"TITLE");
    String type = RequestUtil.getPara2String(request,"TYPE");
    String category = RequestUtil.getPara2String(request,"CATEGORY");
    String endtime = RequestUtil.getPara2String(request,"endtime");
    String proposor = RequestUtil.getPara2String(request,"PROPOSOR");
    String PROPOSORUSERID = RequestUtil.getPara2String(request,"PROPOSORUSERID");
    String author = RequestUtil.getPara2String(request,"AUTHOR");
    String authoruserid = RequestUtil.getPara2String(request,"AUTHORUSERID");
    String submitdate = RequestUtil.getPara2String(request,"SUBMITDATE");
    String state = RequestUtil.getPara2String(request,"STATE");
    String registerdate = RequestUtil.getPara2String(request,"REGISTERDATE");
    String registeror = RequestUtil.getPara2String(request,"REGISTEROR");
    String registeroruserid = RequestUtil.getPara2String(request,"REGISTERORUSERID");
    String starttime = RequestUtil.getPara2String(request,"starttime");
    String isregister = RequestUtil.getPara2String(request,"ISREGISTER");
    String period = RequestUtil.getPara2String(request,"PERIOD");
    String meeting = RequestUtil.getPara2String(request,"MEETING");
    String areacode = RequestUtil.getPara2String(request,"AREACODE");

%>
<bsp:container title="提案查询" >

<html:form name="frmList" action="gjproppsalQueryAction.cmd" method="post">
<table id="tblSearch" width="98%">
<flex:search>
	<tr >
    <td>
    案号：</td>
    <td><flex:searchText name="CASENO" searchName="PROPOSAL_BUZI.CASENO" dataType="java.lang.String" operSymbol="=" value="<%=caseno%>" size="12"/>
    </td>
    <td>
    标题：</td>
    <td><flex:searchText name="TITLE" searchName="PROPOSAL_BUZI.TITLE" dataType="java.lang.String" operSymbol="=" value="<%=title%>" size="12"/>
    </td>

  <td>联名类别：</td>
    <td>
           <flex:searchSelect name="TYPE" searchName="PROPOSAL_BUZI.TYPE" dataType="java.lang.String" operSymbol="=" value="<%=type%>" >
	         <option value="">全部</option>
	         <html:options collection="PROPOSALBUZI_TYPE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>

  <td>内容类别：</td>
    <td>
           <flex:searchSelect name="CATEGORY" searchName="PROPOSAL_BUZI.CATEGORY" dataType="java.lang.String" operSymbol="=" value="<%=category%>" >
	         <option value="">全部</option>
	         <html:options collection="PROPOSALBUZI_CATEGORY_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>

	<tr>
	</tr>
    <td>
    提案者：</td>
    <td><flex:searchText name="PROPOSOR" searchName="PROPOSAL_BUZI.PROPOSOR" dataType="java.lang.String" operSymbol="=" value="<%=proposor%>" size="12"/>
<flex:searchText name="PROPOSORUSERID" searchName="PROPOSAL_BUZI.PROPOSORUSERID" dataType="java.lang.String" operSymbol="=" value="<%= PROPOSORUSERID%>" style="display:none"/>
    </td>

  <td>办理进度：</td>
    <td>
           <flex:searchSelect name="STATE" searchName="PROPOSAL_BUZI.STATE" dataType="java.lang.Integer" operSymbol="=" value="<%=state%>" >
	         <option value="">全部</option>
	         <html:options collection="PROPOSALBUZI_STATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
  
  <td>交办情况：</td>
    <td>
           <flex:searchSelect name="ISREGISTER" searchName="PROPOSAL_BUZI.ISREGISTER" dataType="java.lang.String" operSymbol="=" value="<%=isregister%>" >
	         <option value="">全部</option>
	         <html:options collection="PROPOSALBUZI_ISREGISTER_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>

<%/* %>     <td>
    行政区划：</td>
    <td>
           <flex:searchSelect name="AREACODE" searchName="PROPOSAL_BUZI.AREACODE" dataType="java.lang.String" operSymbol="=" value="<%=areacode%>" >
	         <option value="">全部</option>
	         <html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_CODE"/>
	       </flex:searchSelect>
    </td>
 <% */%>  
 	<td>提交日期：</td>
    <td colspan="4">
     <data:date name="starttime" divname="starttime1"  value="<%=starttime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date>
     --<data:date name="endtime" divname="endtime1"  value="<%=endtime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date>
 	</td>
	<td><flex:searchImg name="chaxun" action="gjproppsalQueryAction.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" hasLeft="false" isWrap="true" isSubmit="true">
<!-- 编号 --><flex:checkboxCol caption="全选" width="35" property="id" name="primaryKey" sortName="PROPOSAL_BUZI.ID" style="display:none"></flex:checkboxCol>
<!-- 案号 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.CASENO")%>' width="50" property="caseno" sortName="PROPOSAL_BUZI.CASENO"/>
<!-- 标题 --><flex:flexCol style="text-align:left;" caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.TITLE")%>' width="100" property="title" sortName="PROPOSAL_BUZI.TITLE"/>

<!-- 提案者 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.PROPOSOR")%>' width="100" property="proposor" sortName="PROPOSAL_BUZI.PROPOSOR" />
<!-- 提案(联名)类别 --><flex:flexCol caption='联名类别' width="70" property="type" type="enum" enumCollection="PROPOSALBUZI_TYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.TYPE"/>
<!-- 提案内容类别 --><flex:flexCol caption='内容类别' width="70" property="category" type="enum" enumCollection="PROPOSALBUZI_CATEGORY_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.CATEGORY"/>

<!-- 提交时间 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.SUBMITDATE")%>' width="90" property="submitdatestr" sortName="PROPOSAL_BUZI.SUBMITDATE"/>
<!-- 提案状态 --><flex:flexCol caption='办理进度' width="80" property="state" sortName="PROPOSAL_BUZI.STATE" type="enum" enumCollection="PROPOSALBUZI_STATE_COLLECTION" enumKey ="key" enumValue="value"/>

<!-- 交办日期 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.REGISTERDATE")%>' width="90" property="registerdatestr" sortName="PROPOSAL_BUZI.REGISTERDATE" />
<!-- 办复情况 --><flex:flexCol caption='办复情况' title="按满意度排序" style="text-align:left;" width="320" property="banliqingkuang" index="13" sortName="PROPOSAL_BUZI.SATISFY" />

<!-- 交办单位 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.REGISTERDEPT")%>' width="80" property="registerdept" sortName="PROPOSAL_BUZI.REGISTERDEPT" />

<!-- 交办办情况 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_BUZI.ISREGISTER")%>' width="80" property="isregister" index="8" type="enum" enumCollection="PROPOSALBUZI_ISREGISTER_COLLECTION" enumKey ="key" enumValue="value" sortName="PROPOSAL_BUZI.ISREGISTER"/>


</flex:flexgrid>
<flex:pagePolit action="gjproppsalQueryAction.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
for(var i=1;i<grid.returnRowCount()+1;i++){
		var primaryKey=grid.getCellValue(i, 1);
		var title=grid.getCellValue(i, 3);
		var forlook='<a href="javascript:forDetail(\''+primaryKey+'\')" class="blueLink">'+title+'</a> ';
		
		grid.getCell(i, 3).innerHTML =forlook;
}
//查看复文
function lookfuwen(proposalid , PROCESSDEPTID){
	  var url="proposalreply.cmd?method=replyview&proposalid="+proposalid+"&processdeptid="+PROCESSDEPTID;
	  opens_fullcenter(url,"查看答复信息","no","yes");
}
//满意度评价
function dofankui(proposalid , PROCESSDEPTID){
  url="proposalbuzi.cmd?method=forfankui&proposalid="+proposalid+"&PROCESSDEPTID="+PROCESSDEPTID;    
  opens_center(url,"查看满意度",700,480,"no","yes");
}
function forDetail(primaryKey){
var url="proposalbuzi.cmd?method=view";
if(primaryKey)
	url=url+"&primaryKey="+primaryKey;
else
  if(!getSelect()) return;
  opens_fullcenter(url,"查看提案详细信息区","no","yes");
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

</script>