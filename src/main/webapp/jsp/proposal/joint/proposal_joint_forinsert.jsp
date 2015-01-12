<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>联名信息表增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkProposalJoint(){
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
  	  var no = document.forms[0].no;
	  var name = document.forms[0].name;
	  var phone = document.forms[0].phone;
	  var dept = document.forms[0].dept;
	  var duty = document.forms[0].duty;
	  var sortindex = document.forms[0].sortindex;
	  var constituency = document.forms[0].constituency;
	  var note = document.forms[0].note;
	  var note2 = document.forms[0].note2;
	  var note3 = document.forms[0].note3;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="联名信息表增加" >
<bsp:containbutton action="proposaljoint.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="proposaljoint.cmd?method=insertContinue" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="proposaljointquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
		<tr>	                   
<!-- 主键 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.ID")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="id" property="id" size="35"  onblur="checkId(this);"  maxlength="36" /> </td>
<!-- 提案id -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.PROPOSALID")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="proposalid" property="proposalid" size="35"  maxlength="36" /> </td>
		</tr>
		<tr>	                   
<!-- 委员编号 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.NO")%>： 	</td>
                    <td class="tdRight"><html:text name="no" property="no" size="35"  maxlength="30" /> </td>
<!-- 委员姓名 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.NAME")%>： 	</td>
                    <td class="tdRight"><html:text name="name" property="name" size="35"  maxlength="80" /> </td>
		</tr>
		<tr>	                   
<!-- 联系电话 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.PHONE")%>： 	</td>
                    <td class="tdRight"><html:text name="phone" property="phone" size="35"  maxlength="50" /> </td>
<!-- 工作单位 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.DEPT")%>： 	</td>
                    <td class="tdRight"><html:text name="dept" property="dept" size="35"  maxlength="300" /> </td>
		</tr>
		<tr>	                   
<!-- 职务 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.DUTY")%>： 	</td>
                    <td class="tdRight"><html:text name="duty" property="duty" size="35"  maxlength="200" /> </td>
<!-- 序号 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.SORTINDEX")%>： 	</td>
                    <td class="tdRight"><html:text name="sortindex" property="sortindex" size="35"  maxlength="8" /> </td>
		</tr>
		<tr>	                   
<!-- 界别名称 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.CONSTITUENCY")%>： 	</td>
                    <td class="tdRight"><html:text name="constituency" property="constituency" size="35"  maxlength="100" /> </td>
<!-- 备注 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE")%>： 	</td>
                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
		</tr>
		<tr>	                   
<!-- NOTE2 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE2")%>： 	</td>
                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
<!-- NOTE3 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_JOINT.NOTE3")%>： 	</td>
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
  if(!checkProposalJoint()) return;	
  document.forms[0].action ="proposaljoint.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkProposalJoint()) return;
  document.forms[0].action ="proposaljoint.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposaljointquery_page_init.cmd";
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
	var result= xmlhttp("proposaljoint.cmd?method=isExist&primaryKey="+primaryKey);
	//alert(result);//返回字符串为空时，表示该主键没被使用
	if(result!=""){
		alert("主键已经被使用，请使用其他编码！");
		obj.focus();
		obj.value="";
	}
}

</script>