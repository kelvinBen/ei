<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>
<HTML>
<HEAD>
<TITLE>委员修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript">
function checkProposalUser(){
	  var id = document.forms[0].id;

      if (trim(id.value)=="")
	{
	  alert("请输入主键！");    
	  id.focus();
	  return false;
	}
    id.value = trim(id.value) ;
  	  var userid = document.forms[0].userid;
      if (trim(userid.value)=="")
	{
	  alert("请输入系统登录号！");    
	  userid.focus();
	  return false;
	}
    userid.value = trim(userid.value) ;
  	  var no = document.forms[0].no;
	  var constituency = document.forms[0].constituency;

    constituency.value = trim(constituency.value) ;
  	  var constituencycode = document.forms[0].constituencycode;
  	if (trim(constituencycode.value)=="")
	{
	  alert("请选择界别！");    
	  constituencycode.focus();
	  return false;
	}
  	 constituency.value= getSelectText("constituencycode",constituencycode.value);

	  var firstparty = document.forms[0].firstparty;
	  var firstpartycode = document.forms[0].firstpartycode;
  if (trim(firstpartycode.value)=="")
	{
	  alert("请选择第一党派！");    
	  firstpartycode.focus();
	  return false;
	}
	  firstparty.value= getSelectText("firstpartycode",firstpartycode.value);
	  var secondparty = document.forms[0].secondparty;
	  var secondpartycode = document.forms[0].secondpartycode;
	if (trim(secondpartycode.value)!="")
	{
	  secondparty.value= getSelectText("secondpartycode",secondpartycode.value);
	}
	  	 
	  var name = document.forms[0].name;
	  var phone = document.forms[0].phone;
	  var mobile = document.forms[0].mobile;
	  var dept = document.forms[0].dept;
	  var address = document.forms[0].address;
	  var zipcode = document.forms[0].zipcode;
	  var email = document.forms[0].email;
	  var sessiontype = document.forms[0].sessiontype;
	  var sessiontypecode = document.forms[0].sessiontypecode;
	   sessiontype.value= getSelectText("sessiontypecode",sessiontypecode.value);
	  var duty = document.forms[0].duty;
	  var userareacode = document.forms[0].userareacode;
	  
	  var userareaname = document.forms[0].userareaname;
	   userareaname.value= getSelectText("userareacode",userareacode.value);
	  var note = document.forms[0].note;
	  var note2 = document.forms[0].note2;
	  var note3 = document.forms[0].note3;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="委员信息修改" >
<bsp:containbutton action="proposaluser.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="proposaluser.cmd?method=insertContinue" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="proposaluserquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
		<tr>	                   
 
<!-- 平台用户id -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.USERID")%>：  <span style="color: red">*</span> 	</td>

                    <td class="tdRight"><html:text name="userid" property="userid" size="30"  maxlength="36" /> 
                   <help:helpsearch name="user_select" style="display:none" size="40" onchange="checkUserId();" helpid="helpUserNoPub" ismulti="false" value="" changefield="userid#1,name#2"/> 
<!--  
         <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectUser()">
-->   <html:text name="id" property="id" size="35" style="display:none"    maxlength="36" />                 
   <html:hidden name="olduserid" property="userid" />
   <html:hidden name="oldno" property="no" />
                    </td>
                   
<!-- 委员编号 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.NO")%>： 	</td>
                    <td class="tdRight"><html:text name="no" property="no" size="35" onblur="checkId(this);"  maxlength="80" /> </td>

		</tr>               
<!-- 姓名 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.NAME")%>： 	</td>
                    <td class="tdRight"><html:text name="name" property="name" size="35"  maxlength="100" /> </td>
<!-- 界别名称 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.CONSTITUENCY")%>：  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="constituency" property="constituency" style="display:none"  size="35"  maxlength="300" />
                    	<html:select name="constituencycode" property="constituencycode" >
                    		<html:option value="">选择界别</html:option>
	                        <html:options collection="PROPOSALUSER_CONSTITUENCYCODE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
 </td>
                   
<!-- 界别code -->
					
		</tr>
<!-- 第一党派code -->
<!-- 第二党派 -->
		<tr>	                   
<!-- 第二党派code -->
<!-- 第一党派 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.FIRSTPARTY")%>： 	</td>
                    <td class="tdRight"><html:text name="firstparty" property="firstparty" size="35" style="display:none"   maxlength="100" />
                    	<html:select name="firstpartycode" property="firstpartycode" >
                    	    <html:option value="">选择党派</html:option>
	                        <html:options collection="PROPOSALUSER_FIRSTPARTYCODE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
 </td>
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.SECONDPARTY")%>： 	</td>
                    <td class="tdRight"> <html:text name="secondparty" property="secondparty" style="display:none"  size="35"  maxlength="100" />
                    	<html:select name="secondpartycode" property="secondpartycode" >
	                         <html:option value="">选择党派</html:option>
	                        <html:options collection="PROPOSALUSER_SECONDPARTYCODE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
</td>

		</tr>
		<tr>	                   
<!-- 办公电话 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.PHONE")%>： 	</td>
                    <td class="tdRight"><html:text name="phone" property="phone" size="35"  maxlength="50" /> </td>
<!-- 手机 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.MOBILE")%>： 	</td>
                    <td class="tdRight"><html:text name="mobile" property="mobile" size="35"  maxlength="50" /> </td>
		</tr>
		<tr>	                   
<!-- 工作单位 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.DEPT")%>： 	</td>
                    <td class="tdRight"><html:text name="dept" property="dept" size="35"  maxlength="255" /> </td>
<!-- 通讯地址 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.ADDRESS")%>： 	</td>
                    <td class="tdRight"><html:text name="address" property="address" size="35"  maxlength="255" /> </td>
		</tr>
		<tr>	                   
<!-- 邮编 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.ZIPCODE")%>： 	</td>
                    <td class="tdRight"><html:text name="zipcode" property="zipcode" size="35"  maxlength="20" /> </td>
<!-- EMAIL -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.EMAIL")%>： 	</td>
                    <td class="tdRight"><html:text name="email" property="email" size="35"  maxlength="100" /> </td>
		</tr>

		<tr>	                   
<!-- 职务 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.DUTY")%>： 	</td>
                    <td class="tdRight"><html:text name="duty" property="duty" size="35"  maxlength="255" /> </td>
<!-- 行政区划 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.USERAREACODE")%>： 	</td>
                    <td class="tdRight">
                        <html:select name="userareacode" property="userareaname" >
	                        <html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_CODE"/>
	                    </html:select>
                   <html:text name="userareaname" property="userareaname" size="35" style="display:none"  maxlength="255" /> 	                    
 					</td>
		</tr>
		<tr>	                   
<!-- 行政区划名称 -->
<!-- 备注 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.NOTE")%>： 	</td>
                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_USER.SESSIONTYPE")%>： 	</td>
                   <td class="tdRight">
                     <html:select name="sessiontypecode" property="sessiontypecode" >
	                        <html:options collection="PROPOSALUSER_SESSIONTYPECODE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
                    <html:text name="sessiontype" property="sessiontype" size="35" style="display:none" /> 
 
		</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkProposalUser()) return;	
  document.forms[0].action ="proposaluser.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposaluserquery_page_init.cmd";
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
//检查代表编号是否已经被使用,
function checkId(obj){
	var no= obj.value;
	var userareacode=$('userareacode').value;
	if(no=="")
		return ;
	var oldno=$('oldno').value;
	if(no==oldno)
		return;
	var result= xmlhttp("proposaluser.cmd?method=isExist&no="+no+"&userareacode="+userareacode);
	//alert(result);//返回字符串为空时，表示该主键没被使用
	if(result!=""){
		alert("编号已经被使用，请使用其他编码！");
		obj.focus();
		obj.value="";
	}
}

function selectUser(){
	//两个种个参数isCheckBox和roleId
  //var cmdUrl="user.cmd&method=getchoiceroot";
  
  var cmdUrl="role.cmd&method=doHelpTable";
  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{

  document.all("userid").value=win[0];
  document.all("name").value=win[1];
  	var olduserid=$('olduserid').value;
	if(win[0]==olduserid)
		return;
  var result= xmlhttp("proposaluser.cmd?method=isUserExist&userId="+win[0]);
  if(result!=""){
		alert("该系统登录号被使用，请使用其他登录号！");
		$('userid').focus();
		$('userid').value="";
	}
  }
  	
}

function checkUserId(){
	var userid=document.all("userid").value;
var olduserid=$('olduserid').value;
	if(olduserid==userid)
	  return ;

  var result= xmlhttp("proposaluser.cmd?method=isUserExist&userId="+userid);
  if(result!=""){
		alert("该系统登录号被使用，请使用其他登录号！");
		$('userid').focus();
		$('userid').value="";
	}
  }


</script>