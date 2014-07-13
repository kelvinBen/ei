<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>提案评论表增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkProposalComment(){
	  var id = document.forms[0].id;
  	  if ( __isQuoteIn(id.value) )
	  {
	    alert("主键不能含有引号或单引号!");
	    id.select();
	    id.focus();
	    return false;
	  }
      if (trim(id.value)=="")
	{
	  alert("请输入主键！");    
	  id.focus();
	  return false;
	}
    id.value = trim(id.value) ;
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
<bsp:container title="提案评论表增加" >
<bsp:containbutton action="proposalcomment.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="proposalcomment.cmd?method=insertContinue" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="proposalcommentquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
		<tr>	                   
<!-- 主键 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.ID")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="id" property="id" size="35"  onblur="checkId(this);"  maxlength="36" /> </td>
<!-- 提案id -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.PROPOSALID")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="proposalid" property="proposalid" size="35"  maxlength="36" /> </td>
		</tr>
		<tr>	                   
<!-- 姓名 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NAME")%>： 	</td>
                    <td class="tdRight"><html:text name="name" property="name" size="35"  maxlength="80" /> </td>
<!-- 评论内容 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.CONTENT")%>： 	</td>
					<td class="tdRight">
						<html:textarea name="content" cols="35" style="width:75%" property="content"/>
					</td>
		</tr>
		<tr>	                   
<!-- 审核状态 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.STATE")%>： 	</td>
                    <td class="tdRight">
                    	<html:select name="state" property="state" >
	                        <html:options collection="PROPOSALCOMMENT_STATE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- 审核意见 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.SUGGEST")%>： 	</td>
					<td class="tdRight">
						<html:textarea name="suggest" cols="35" style="width:75%" property="suggest"/>
					</td>
		</tr>
		<tr>	                   
<!-- 审核人 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWOR")%>： 	</td>
                    <td class="tdRight"><html:text name="reviewor" property="reviewor" size="35"  maxlength="100" /> </td>
<!-- 审核人id -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWORID")%>： 	</td>
                    <td class="tdRight"><html:text name="revieworid" property="revieworid" size="35"  maxlength="36" /> </td>
		</tr>
		<tr>	                   
<!-- 审核时间 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWTIME")%>： 	</td>
                    <td class="tdRight"><html:text name="reviewtime" property="reviewtime" size="35"  maxlength="8" /> </td>
<!-- 评论时间 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.TIME")%>： 	</td>
                    <td class="tdRight"><html:text name="time" property="time" size="35"  maxlength="8" /> </td>
		</tr>
		<tr>	                   
<!-- 提案题目 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.TITLE")%>： 	</td>
                    <td class="tdRight"><html:text name="title" property="title" size="35"  maxlength="100" /> </td>
<!-- 备注 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE")%>： 	</td>
                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
		</tr>
		<tr>	                   
<!-- NOTE2 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE2")%>： 	</td>
                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
<!-- NOTE3 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE3")%>： 	</td>
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
  if(!checkProposalComment()) return;	
  document.forms[0].action ="proposalcomment.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkProposalComment()) return;
  document.forms[0].action ="proposalcomment.cmd?method=insertContinue";
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
//检查主键是否已经被使用, 该功能目前只支持单主键，多主键需要修改
function checkId(obj){
	var primaryKey= obj.value;
	if(primaryKey=="")
		return ;
	var result= xmlhttp("proposalcomment.cmd?method=isExist&primaryKey="+primaryKey);
	//alert(result);//返回字符串为空时，表示该主键没被使用
	if(result!=""){
		alert("主键已经被使用，请使用其他编码！");
		obj.focus();
		obj.value="";
	}
}

</script>