<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>审查意见表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="审查意见表明细" >
<bsp:containbutton action="proposalreview.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="proposalreviewquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$id" write="false"/>
	<tr>	                   
<!-- 主键 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.ID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="id" property="id" write="true"/></td>
     
<!-- 案由ID -->
  	 
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.PROPOSALID")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="proposalid" property="proposalid" collection="PROPOSALREVIEW_PROPOSALID_COLLECTION" labelProperty="$fk.showCol" labelKey="ID" />
      </td>
     
		</tr>
	<tr>	                   
<!-- 审核人 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWOR")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="reviewor" property="reviewor" write="true"/></td>
     
<!-- 审核人userid -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWORID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="revieworid" property="revieworid" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 审核意见 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWCOMMENT")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="reviewcomment" property="reviewcomment" write="true"/></td>
     
<!-- 审核时间 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWTIME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="reviewtime" property="reviewtime" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 审核状态 -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWSTATE")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="reviewstate" property="reviewstate" collection="PROPOSALREVIEW_REVIEWSTATE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
<!-- 上级审查人 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.SUPERIOR")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="superior" property="superior" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 上级审查人ID -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.SUPERIORID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="superiorid" property="superiorid" write="true"/></td>
     
<!-- 审核环节 -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWNODE")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="reviewnode" property="reviewnode" collection="PROPOSALREVIEW_REVIEWNODE_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
		</tr>
	<tr>	                   
<!-- 备注 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
<!-- NOTE2 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE2")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- NOTE3 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE3")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note3" property="note3" write="true"/></td>
     
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="proposalreview.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposalreviewquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>