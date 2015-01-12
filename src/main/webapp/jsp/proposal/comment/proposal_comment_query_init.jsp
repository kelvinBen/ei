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
<TITLE>提案评论表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
//保存查询条件
    String id = RequestUtil.getPara2String(request,"ID");
    String proposalid = RequestUtil.getPara2String(request,"PROPOSALID");
    String name = RequestUtil.getPara2String(request,"NAME");
    String content = RequestUtil.getPara2String(request,"CONTENT");
    String state = RequestUtil.getPara2String(request,"STATE");
    String suggest = RequestUtil.getPara2String(request,"SUGGEST");
    String reviewor = RequestUtil.getPara2String(request,"REVIEWOR");
    String revieworid = RequestUtil.getPara2String(request,"REVIEWORID");
    String reviewtime = RequestUtil.getPara2String(request,"REVIEWTIME");
    String time = RequestUtil.getPara2String(request,"TIME");
    String title = RequestUtil.getPara2String(request,"TITLE");
    String note = RequestUtil.getPara2String(request,"NOTE");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
    String note3 = RequestUtil.getPara2String(request,"NOTE3");
%>
<bsp:container title="提案评论表查询" >
<bsp:containbutton action="proposalcomment.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="proposalcomment.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="proposalcomment.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="proposalcomment.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="proposalcommentquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    主键：<flex:searchText name="ID" searchName="PROPOSAL_COMMENT.ID" dataType="java.lang.String" operSymbol="=" value="<%=id%>" size="12"/>
    </td>
    <td>
    提案id：<flex:searchText name="PROPOSALID" searchName="PROPOSAL_COMMENT.PROPOSALID" dataType="java.lang.String" operSymbol="=" value="<%=proposalid%>" size="12"/>
    </td>
    <td>
    姓名：<flex:searchText name="NAME" searchName="PROPOSAL_COMMENT.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>
    <td>
    评论内容：<flex:searchText name="CONTENT" searchName="PROPOSAL_COMMENT.CONTENT" dataType="java.lang.String" operSymbol="=" value="<%=content%>" size="12"/>
    </td>
  <td>审核状态：
           <flex:searchSelect name="STATE" searchName="PROPOSAL_COMMENT.STATE" dataType="java.lang.Integer" operSymbol="=" value="<%=state%>" >
	         <option value="">全部</option>
	         <html:options collection="PROPOSALCOMMENT_STATE_COLLECTION" labelProperty="value" property="key"/>
	       </flex:searchSelect>
  </td>
    <td>
    审核意见：<flex:searchText name="SUGGEST" searchName="PROPOSAL_COMMENT.SUGGEST" dataType="java.lang.String" operSymbol="=" value="<%=suggest%>" size="12"/>
    </td>
    <td>
    审核人：<flex:searchText name="REVIEWOR" searchName="PROPOSAL_COMMENT.REVIEWOR" dataType="java.lang.String" operSymbol="=" value="<%=reviewor%>" size="12"/>
    </td>
    <td>
    审核人id：<flex:searchText name="REVIEWORID" searchName="PROPOSAL_COMMENT.REVIEWORID" dataType="java.lang.String" operSymbol="=" value="<%=revieworid%>" size="12"/>
    </td>
    <td>
    审核时间：<flex:searchText name="REVIEWTIME" searchName="PROPOSAL_COMMENT.REVIEWTIME" dataType="java.lang.String" operSymbol="=" value="<%=reviewtime%>" size="12"/>
    </td>
    <td>
    评论时间：<flex:searchText name="TIME" searchName="PROPOSAL_COMMENT.TIME" dataType="java.lang.String" operSymbol="=" value="<%=time%>" size="12"/>
    </td>
    <td>
    提案题目：<flex:searchText name="TITLE" searchName="PROPOSAL_COMMENT.TITLE" dataType="java.lang.String" operSymbol="=" value="<%=title%>" size="12"/>
    </td>
    <td>
    备注：<flex:searchText name="NOTE" searchName="PROPOSAL_COMMENT.NOTE" dataType="java.lang.String" operSymbol="=" value="<%=note%>" size="12"/>
    </td>
    <td>
    NOTE2：<flex:searchText name="NOTE2" searchName="PROPOSAL_COMMENT.NOTE2" dataType="java.lang.String" operSymbol="=" value="<%=note2%>" size="12"/>
    </td>
    <td>
    NOTE3：<flex:searchText name="NOTE3" searchName="PROPOSAL_COMMENT.NOTE3" dataType="java.lang.String" operSymbol="=" value="<%=note3%>" size="12"/>
    </td>
	<td><flex:searchImg name="chaxun" action="proposalcommentquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- 主键 --><flex:checkboxCol caption="全选" width="35" property="id" name="primaryKey" sortName="PROPOSAL_COMMENT.ID"></flex:checkboxCol>
<!-- 提案id --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.PROPOSALID")%>' width="100" property="proposalid" type="enum" enumCollection="PROPOSALCOMMENT_PROPOSALID_COLLECTION" enumKey ="$fk.showCol" enumValue="ID" sortName="PROPOSAL_COMMENT.PROPOSALID"/>
<!-- 姓名 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.NAME")%>' width="100" property="name" sortName="PROPOSAL_COMMENT.NAME"/>
<!-- 评论内容 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.CONTENT")%>' width="100" property="content" sortName="PROPOSAL_COMMENT.CONTENT"/>
<!-- 审核状态 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.STATE")%>' width="100" property="state" sortName="PROPOSAL_COMMENT.STATE" style="display:none"/>
<!-- 审核意见 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.SUGGEST")%>' width="100" property="suggest" sortName="PROPOSAL_COMMENT.SUGGEST"/>
<!-- 审核人 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWOR")%>' width="100" property="reviewor" sortName="PROPOSAL_COMMENT.REVIEWOR"/>
<!-- 审核人id --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWORID")%>' width="100" property="revieworid" sortName="PROPOSAL_COMMENT.REVIEWORID"/>
<!-- 审核时间 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWTIME")%>' width="100" property="reviewtime" sortName="PROPOSAL_COMMENT.REVIEWTIME"/>
<!-- 评论时间 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.TIME")%>' width="100" property="time" sortName="PROPOSAL_COMMENT.TIME"/>
<!-- 提案题目 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.TITLE")%>' width="100" property="title" sortName="PROPOSAL_COMMENT.TITLE"/>
<!-- 备注 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE")%>' width="100" property="note" sortName="PROPOSAL_COMMENT.NOTE"/>
<!-- NOTE2 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE2")%>' width="100" property="note2" sortName="PROPOSAL_COMMENT.NOTE2"/>
<!-- NOTE3 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE3")%>' width="100" property="note3" sortName="PROPOSAL_COMMENT.NOTE3"/>
</flex:flexgrid>
<flex:pagePolit action="proposalcommentquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="proposalcomment.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalcomment.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="proposalcomment.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposalcomment.cmd?method=delete";    
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