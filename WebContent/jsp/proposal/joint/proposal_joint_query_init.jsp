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
<TITLE>联名信息表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
//保存查询条件
    String id = RequestUtil.getPara2String(request,"ID");
    String proposalid = RequestUtil.getPara2String(request,"PROPOSALID");
    String no = RequestUtil.getPara2String(request,"NO");
    String name = RequestUtil.getPara2String(request,"NAME");
    String phone = RequestUtil.getPara2String(request,"PHONE");
    String dept = RequestUtil.getPara2String(request,"DEPT");
    String duty = RequestUtil.getPara2String(request,"DUTY");
    String sortindex = RequestUtil.getPara2String(request,"SORTINDEX");
    String constituency = RequestUtil.getPara2String(request,"CONSTITUENCY");
    String note = RequestUtil.getPara2String(request,"NOTE");
    String note2 = RequestUtil.getPara2String(request,"NOTE2");
    String note3 = RequestUtil.getPara2String(request,"NOTE3");
%>
<bsp:container title="联名信息表查询" >
<bsp:containbutton action="proposaljoint.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="proposaljoint.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="proposaljoint.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="proposaljoint.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="proposaljointquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    主键：<flex:searchText name="ID" searchName="PROPOSAL_JOINT.ID" dataType="java.lang.String" operSymbol="=" value="<%=id%>" size="12"/>
    </td>
    <td>
    提案id：<flex:searchText name="PROPOSALID" searchName="PROPOSAL_JOINT.PROPOSALID" dataType="java.lang.String" operSymbol="=" value="<%=proposalid%>" size="12"/>
    </td>
    <td>
    委员编号：<flex:searchText name="NO" searchName="PROPOSAL_JOINT.NO" dataType="java.lang.String" operSymbol="=" value="<%=no%>" size="12"/>
    </td>
    <td>
    委员姓名：<flex:searchText name="NAME" searchName="PROPOSAL_JOINT.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>
    <td>
    联系电话：<flex:searchText name="PHONE" searchName="PROPOSAL_JOINT.PHONE" dataType="java.lang.String" operSymbol="=" value="<%=phone%>" size="12"/>
    </td>
    <td>
    工作单位：<flex:searchText name="DEPT" searchName="PROPOSAL_JOINT.DEPT" dataType="java.lang.String" operSymbol="=" value="<%=dept%>" size="12"/>
    </td>
    <td>
    职务：<flex:searchText name="DUTY" searchName="PROPOSAL_JOINT.DUTY" dataType="java.lang.String" operSymbol="=" value="<%=duty%>" size="12"/>
    </td>
    <td>
    序号：<flex:searchText name="SORTINDEX" searchName="PROPOSAL_JOINT.SORTINDEX" dataType="java.lang.Integer" operSymbol="=" value="<%=sortindex%>" size="12"/>
    </td>
    <td>
    界别名称：<flex:searchText name="CONSTITUENCY" searchName="PROPOSAL_JOINT.CONSTITUENCY" dataType="java.lang.String" operSymbol="=" value="<%=constituency%>" size="12"/>
    </td>
    <td>
    备注：<flex:searchText name="NOTE" searchName="PROPOSAL_JOINT.NOTE" dataType="java.lang.String" operSymbol="=" value="<%=note%>" size="12"/>
    </td>
    <td>
    NOTE2：<flex:searchText name="NOTE2" searchName="PROPOSAL_JOINT.NOTE2" dataType="java.lang.String" operSymbol="=" value="<%=note2%>" size="12"/>
    </td>
    <td>
    NOTE3：<flex:searchText name="NOTE3" searchName="PROPOSAL_JOINT.NOTE3" dataType="java.lang.String" operSymbol="=" value="<%=note3%>" size="12"/>
    </td>
	<td><flex:searchImg name="chaxun" action="proposaljointquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" isSubmit="true">
<!-- 主键 --><flex:checkboxCol caption="全选" width="35" property="id" name="primaryKey" sortName="PROPOSAL_JOINT.ID"></flex:checkboxCol>
<!-- 提案id --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.PROPOSALID")%>' width="100" property="proposalid" type="enum" enumCollection="PROPOSALJOINT_PROPOSALID_COLLECTION" enumKey ="$fk.showCol" enumValue="ID" sortName="PROPOSAL_JOINT.PROPOSALID"/>
<!-- 委员编号 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.NO")%>' width="100" property="no" sortName="PROPOSAL_JOINT.NO"/>
<!-- 委员姓名 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.NAME")%>' width="100" property="name" sortName="PROPOSAL_JOINT.NAME"/>
<!-- 联系电话 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.PHONE")%>' width="100" property="phone" sortName="PROPOSAL_JOINT.PHONE"/>
<!-- 工作单位 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.DEPT")%>' width="100" property="dept" sortName="PROPOSAL_JOINT.DEPT"/>
<!-- 职务 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.DUTY")%>' width="100" property="duty" sortName="PROPOSAL_JOINT.DUTY"/>
<!-- 序号 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.SORTINDEX")%>' width="100" property="sortindex" sortName="PROPOSAL_JOINT.SORTINDEX"/>
<!-- 界别名称 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.CONSTITUENCY")%>' width="100" property="constituency" sortName="PROPOSAL_JOINT.CONSTITUENCY"/>
<!-- 备注 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE")%>' width="100" property="note" sortName="PROPOSAL_JOINT.NOTE"/>
<!-- NOTE2 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE2")%>' width="100" property="note2" sortName="PROPOSAL_JOINT.NOTE2"/>
<!-- NOTE3 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE3")%>' width="100" property="note3" sortName="PROPOSAL_JOINT.NOTE3"/>
</flex:flexgrid>
<flex:pagePolit action="proposaljointquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="proposaljoint.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposaljoint.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="proposaljoint.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposaljoint.cmd?method=delete";    
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