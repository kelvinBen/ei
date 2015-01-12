<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>提案评论表修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkProposalComment(){
	var proposalid = document.forms[0].proposalid;
  	if (trim(proposalid.value)=="")
	{
	  alert("请输入提案id！");   
	  proposalid.focus(); 
	  return false;
	}
    proposalid.value = trim(proposalid.value) ;
      	var name = document.forms[0].name;
	var content = document.forms[0].content;
	var state = document.forms[0].state;
	var suggest = document.forms[0].suggest;
	var reviewor = document.forms[0].reviewor;
	var revieworid = document.forms[0].revieworid;
	var reviewtime = document.forms[0].reviewtime;
	var time = document.forms[0].time;
	var title = document.forms[0].title;
	var note = document.forms[0].note;
	var note2 = document.forms[0].note2;
	var note3 = document.forms[0].note3;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="提案评论表修改" >
<bsp:containbutton action="proposalcomment.cmd?method=update" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="proposalcommentquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
<!-- 主键 --><html:hidden name="id" property="id" write="false"/>                                      
					<tr>	                   
<!-- 提案id --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.PROPOSALID")%>：  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="proposalid" property="proposalid" size="35"  maxlength="36" /> </td>
<!-- 姓名 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NAME")%>： 	</td>

                    <td class="tdRight"><html:text name="name" property="name" size="35"  maxlength="80" /> </td>
					</tr>
					<tr>	                   
<!-- 评论内容 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.CONTENT")%>： 	</td>

					<td class="tdRight">
						<html:textarea name="content" cols="35" style="width:75%" property="content"/>
					</td>
<!-- 审核状态 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.STATE")%>： 	</td>
                    <td class="tdRight">
                    	<html:select name="state" property="state" >
	                        <html:options collection="PROPOSALCOMMENT_STATE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
					</tr>
					<tr>	                   
<!-- 审核意见 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.SUGGEST")%>： 	</td>

					<td class="tdRight">
						<html:textarea name="suggest" cols="35" style="width:75%" property="suggest"/>
					</td>
<!-- 审核人 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWOR")%>： 	</td>

                    <td class="tdRight"><html:text name="reviewor" property="reviewor" size="35"  maxlength="100" /> </td>
					</tr>
					<tr>	                   
<!-- 审核人id --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWORID")%>： 	</td>

                    <td class="tdRight"><html:text name="revieworid" property="revieworid" size="35"  maxlength="36" /> </td>
<!-- 审核时间 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWTIME")%>： 	</td>

                    <td class="tdRight"><html:text name="reviewtime" property="reviewtime" size="35"  maxlength="8" /> </td>
					</tr>
					<tr>	                   
<!-- 评论时间 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.TIME")%>： 	</td>

                    <td class="tdRight"><html:text name="time" property="time" size="35"  maxlength="8" /> </td>
<!-- 提案题目 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.TITLE")%>： 	</td>

                    <td class="tdRight"><html:text name="title" property="title" size="35"  maxlength="100" /> </td>
					</tr>
					<tr>	                   
<!-- 备注 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE")%>： 	</td>

                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
<!-- NOTE2 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE2")%>： 	</td>

                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
					</tr>
					<tr>	                   
<!-- NOTE3 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE3")%>： 	</td>

                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="30" /> </td>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkProposalComment()) return;	
  document.forms[0].action ="proposalcomment.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposalcommentquery_page_init.cmd";
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