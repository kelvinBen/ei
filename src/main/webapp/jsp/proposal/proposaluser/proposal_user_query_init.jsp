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
<TITLE>委员附表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
//保存查询条件
    String id = RequestUtil.getPara2String(request,"ID");
    String userid = RequestUtil.getPara2String(request,"USERID");
    String no = RequestUtil.getPara2String(request,"NO");
    String constituency = RequestUtil.getPara2String(request,"CONSTITUENCY");
    String constituencycode = RequestUtil.getPara2String(request,"CONSTITUENCYCODE");
    String firstparty = RequestUtil.getPara2String(request,"FIRSTPARTY");
    String firstpartycode = RequestUtil.getPara2String(request,"FIRSTPARTYCODE");
    String secondparty = RequestUtil.getPara2String(request,"SECONDPARTY");
    String secondpartycode = RequestUtil.getPara2String(request,"SECONDPARTYCODE");
    String name = RequestUtil.getPara2String(request,"NAME");


    String userareacode = RequestUtil.getPara2String(request,"USERAREACODE");
%>
<bsp:container title="委员查询" >
<bsp:containbutton action="proposaluser.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="proposaluser.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="proposaluser.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="proposaluser.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="proposaluserquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    系统登录号：<flex:searchText name="USERID" searchName="PROPOSAL_USER.USERID" dataType="java.lang.String" operSymbol="=" value="<%=userid%>" size="12"/>
    </td>
    <td>
    委员编号：<flex:searchText name="NO" searchName="PROPOSAL_USER.NO" dataType="java.lang.String" operSymbol="=" value="<%=no%>" size="12"/>
    </td>
    <td>
    姓名：<flex:searchText name="NAME" searchName="PROPOSAL_USER.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>
 
    <td>
    行政区划：
    	 <flex:searchSelect name="USERAREACODE" searchName="PROPOSAL_USER.USERAREACODE" dataType="java.lang.String" operSymbol="=" value="<%=userareacode%>" >
	         <option value="">全部</option>
	         <html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_CODE"/>
	       </flex:searchSelect>
    </td>
	<td><flex:searchImg name="chaxun" action="proposaluserquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
<!-- 主键 --><flex:checkboxCol caption="全选" width="35" property="id" name="primaryKey" sortName="PROPOSAL_USER.ID"></flex:checkboxCol>
<!-- 系统登录号 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.USERID")%>' width="100" property="userid" sortName="PROPOSAL_USER.USERID"/>
<!-- 委员编号 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.NO")%>' width="100" property="no" sortName="PROPOSAL_USER.NO"/>
<!-- 界别名称 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.CONSTITUENCY")%>' width="100" property="constituency" sortName="PROPOSAL_USER.CONSTITUENCY"/>

<!-- 姓名 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.NAME")%>' width="100" property="name" sortName="PROPOSAL_USER.NAME"/>

<!-- 手机 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.MOBILE")%>' width="100" property="mobile" sortName="PROPOSAL_USER.MOBILE"/>
<!-- 工作单位 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.DEPT")%>' width="100" property="dept" sortName="PROPOSAL_USER.DEPT"/>
<!-- 通讯地址 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.ADDRESS")%>' width="100" property="address" sortName="PROPOSAL_USER.ADDRESS"/>
<!-- 届别名称 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.SESSIONTYPE")%>' width="100" property="sessiontype" sortName="PROPOSAL_USER.SESSIONTYPE"/>
<!-- 职务 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.DUTY")%>' width="100" property="duty" sortName="PROPOSAL_USER.DUTY"/>

<!-- 行政区划名称 --><flex:flexCol caption='<%=ResourcesFactory.getString("PROPOSAL_USER.USERAREANAME")%>' width="100" property="userareaname" sortName="PROPOSAL_USER.USERAREANAME"/>

</flex:flexgrid>
<flex:pagePolit action="proposaluserquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="proposaluser.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="proposaluser.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="proposaluser.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="proposaluser.cmd?method=delete";    
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