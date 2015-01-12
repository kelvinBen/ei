<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>审查意见表修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkProposalReview(){
	var proposalid = document.forms[0].proposalid;
  	if (trim(proposalid.value)=="")
	{
	  alert("请输入案由ID！");   
	  proposalid.focus(); 
	  return false;
	}
    proposalid.value = trim(proposalid.value) ;
      	var reviewor = document.forms[0].reviewor;
  	if (trim(reviewor.value)=="")
	{
	  alert("请输入审核人！");   
	  reviewor.focus(); 
	  return false;
	}
    reviewor.value = trim(reviewor.value) ;
      	var revieworid = document.forms[0].revieworid;
  	if (trim(revieworid.value)=="")
	{
	  alert("请输入审核人userid！");   
	  revieworid.focus(); 
	  return false;
	}
    revieworid.value = trim(revieworid.value) ;
      	var reviewcomment = document.forms[0].reviewcomment;
  	if (trim(reviewcomment.value)=="")
	{
	  alert("请输入审核意见！");   
	  reviewcomment.focus(); 
	  return false;
	}
    reviewcomment.value = trim(reviewcomment.value) ;
      	var reviewtime = document.forms[0].reviewtime;
	var reviewstate = document.forms[0].reviewstate;
	var superior = document.forms[0].superior;
	var superiorid = document.forms[0].superiorid;
	var reviewnode = document.forms[0].reviewnode;
	var reviewnode = document.forms[0].reviewnode;
    if (! __isFloat(reviewnode.value) )   
    {
      alert("审核环节不是合法浮点数");
      reviewnode.focus();
      return false;
    }   
	var note = document.forms[0].note;
	var note2 = document.forms[0].note2;
	var note3 = document.forms[0].note3;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="审查意见表修改" >
<bsp:containbutton action="proposalreview.cmd?method=update" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="proposalreviewquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
<!-- 主键 --><html:hidden name="id" property="id" write="false"/>                                      
					<tr>	                   
<!-- 案由ID --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.PROPOSALID")%>：  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="proposalid" property="proposalid" size="35"  maxlength="36" /> </td>
<!-- 审核人 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWOR")%>：  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="reviewor" property="reviewor" size="35"  maxlength="100" /> </td>
					</tr>
					<tr>	                   
<!-- 审核人userid --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWORID")%>：  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="revieworid" property="revieworid" size="35"  maxlength="36" /> </td>
<!-- 审核意见 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWCOMMENT")%>：  <span style="color: red">*</span>   	</td>

					<td class="tdRight">
						<html:textarea name="reviewcomment" cols="35" style="width:75%" property="reviewcomment"/>
					</td>
					</tr>
					<tr>	                   
<!-- 审核时间 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWTIME")%>： 	</td>

                    <td class="tdRight"><html:text name="reviewtime" property="reviewtime" size="35"  maxlength="8" /> </td>
<!-- 审核状态 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWSTATE")%>： 	</td>
                    <td class="tdRight">
                    	<html:select name="reviewstate" property="reviewstate" >
	                        <html:options collection="PROPOSALREVIEW_REVIEWSTATE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
					</tr>
					<tr>	                   
<!-- 上级审查人 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.SUPERIOR")%>： 	</td>

                    <td class="tdRight"><html:text name="superior" property="superior" size="35"  maxlength="100" /> </td>
<!-- 上级审查人ID --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.SUPERIORID")%>： 	</td>

                    <td class="tdRight"><html:text name="superiorid" property="superiorid" size="35"  maxlength="36" /> </td>
					</tr>
					<tr>	                   
<!-- 审核环节 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWNODE")%>： 	</td>
                    <td class="tdRight">
                    	<html:select name="reviewnode" property="reviewnode" >
	                        <html:options collection="PROPOSALREVIEW_REVIEWNODE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- 备注 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE")%>： 	</td>

                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
					</tr>
					<tr>	                   
<!-- NOTE2 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE2")%>： 	</td>

                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
<!-- NOTE3 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE3")%>： 	</td>

                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="30" /> </td>
					</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkProposalReview()) return;	
  document.forms[0].action ="proposalreview.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposalreviewquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function ctlent(event) {
	if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {
			forSave();
			return;
	}
}
</script>