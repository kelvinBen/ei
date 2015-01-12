<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>
<HTML>
<HEAD>
<TITLE>工作地点增加</TITLE>
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='date.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript"
	src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
 function checkPubWorkplace(){
 var workplaceCode = document.forms[0].workplaceCode;
 if ( __isQuoteIn(workplaceCode.value) )
    {
      alert("工作地点代码不能含有特殊字符！");
      workplaceCode.value="";
      workplaceCode.select();
      workplaceCode.focus();
      return false;
    }
  
  workplaceCode.value = trim(workplaceCode.value) ;
  var rs = /^([0-9]|[a-z]|[A-Z])+$/;
    if(workplaceCode.value!=""){
	  if((!rs.test(workplaceCode.value)) && (trim(workplaceCode.value)!="")){
	     alert("工作地点代码必须是英文字符或数字！");
	     workplaceCode.value="";
	     workplaceCode.select();
	     workplaceCode.focus();
	     return false;
	  }
  }	  
 var workplaceName = document.forms[0].workplaceName;
 if ( __isQuoteIn(workplaceName.value) )
    {
      alert("工作地点名称不能含有特殊字符！");
      workplaceName.select();
      workplaceName.focus();
      return false;
    }
  if (trim(workplaceName.value)=="")
  {
    alert("请输入工作地点名称！");
    workplaceName.focus();
    return false;
  }
  workplaceName.value = trim(workplaceName.value) ;
  var shortName=document.forms[0].shortName;
   if ( __isQuoteIn(shortName.value) )
    {
      alert("工作地点简称不能含有特殊字符！");
      shortName.select();
      shortName.focus();
      return false;
    }
    if (trim(shortName.value)=="")
  {
    alert("请输入工作地点简称！");
    shortName.focus();
    return false;
  }
  shortName.value = trim(shortName.value) ;
  var cantCode = document.forms[0].cantCode;
  if (trim(cantCode.value)=="")
  {
    alert("请输入工作地点所在行政区划！");
    return false;
  } 
  cantCode.value = trim(cantCode.value) ;
  
  var linkman = document.forms[0].linkman;
    linkman.value = trim(linkman.value) ;
	  var tel = document.forms[0].tel;

    tel.value = trim(tel.value) ;
    if(trim(tel.value)!=""&&!__isFixedTelephone(trim(tel.value)))
  {
  	alert("请输入正确的电话号码！");
  	 tel.value="";
     tel.focus();
     return false;
  }
	  var fax = document.forms[0].fax;
    fax.value = trim(fax.value) ;
    if(trim(fax.value)!=""&&!__isFixedTelephone(trim(fax.value)))
  {
  	alert("请输入正确的传真号码！");
  	 fax.value="";
    fax.focus();
    return false;
  }
	  var email = document.forms[0].email;
    email.value = trim(email.value) ;
    if(email.value !=""){
        if(!__checkEmail(email.value)){
            alert("请输入正确的邮件格式！");
            email.value="";
            email.focus();
            return false;
        }
    }
    
    
	var www = document.forms[0].www;
    www.value = trim(www.value) ;
	var postCode = document.forms[0].postCode;
    postCode.value = trim(postCode.value) ;
    if(trim(postCode.value)!=""){
       if(!__isNum(postCode.value)){
        alert("邮政编码必须是数字!");
        postCode.value="";
        postCode.focus();
        return false;
       }
    }
	  var postAddress = document.forms[0].postAddress;
    postAddress.value = trim(postAddress.value) ;
	  
	  var englishAddress = document.forms[0].englishAddress;   	  
    englishAddress.value = trim(englishAddress.value); 
    var rs = /^([0-9]|[a-z]|[A-Z])+$/;
   if(englishAddress.value!=""){
   if((!rs.test(englishAddress.value)) && (trim(englishAddress.value)!="")){
	     alert("英文通信地址必须是英文字符或数字！");
	      englishAddress.value="";
	     englishAddress.focus();
	     return false;
	  }
  }	  
    
    
       
 var amStartTime = document.forms[0].amStartTime;
  if (trim(amStartTime.value)=="")
  {
    alert("请输入上午开始上班时间！");
    amStartTime.focus();
    return false;
  }
  if(!__checkTime(trim(amStartTime.value))){
    alert("请输入正确的时间格式！");
    amStartTime.value="";
    amStartTime.focus();
    return false;
  }
  amStartTime.value = trim(amStartTime.value) ;
 var amEndTime = document.forms[0].amEndTime;
  if (trim(amEndTime.value)=="")
  {
    alert("请输入上午下班时间！");
    amEndTime.focus();
    return false;
  }
  if(!__checkTime(trim(amEndTime.value))){
    alert("请输入正确的时间格式！");
    amEndTime.value="";
    amEndTime.focus();
    return false;
  }
  amEndTime.value = trim(amEndTime.value) ;
 var pmStartTime = document.forms[0].pmStartTime;
  if (trim(pmStartTime.value)=="")
  {
    alert("请输入下午开始上班时间！");
    pmStartTime.focus();
    return false;
  }
  if(!__checkTime(trim(pmStartTime.value))){
    alert("请输入正确的时间格式！");
    pmStartTime.value="";
    pmStartTime.focus();
    return false;
  }
  pmStartTime.value = trim(pmStartTime.value) ;
 var pmEndTime = document.forms[0].pmEndTime;
  if (trim(pmEndTime.value)=="")
  {
    alert("请输入下午下班时间！");
    pmEndTime.focus();
    return false;
  }
  if(!__checkTime(trim(pmEndTime.value))){
    alert("请输入正确的时间格式！");
    pmEndTime.value="";
    pmEndTime.focus();
    return false;
  }
  pmEndTime.value = trim(pmEndTime.value) ;
 
  if(!stringLengthCheck(workplaceCode,30,"工作地点代码长度不能超过30个字符!")){
    workplaceCode.value="";
    workplaceCode.focus();
    return false;
  }
  if(!stringLengthCheck(workplaceName,100,"工作地点名称长度不能超过100个字符!")){
    workplaceName.value="";
    workplaceName.focus();
    return false;
  }
  if(!stringLengthCheck(shortName,30,"工作地点简称长度不能超过30个字符!")){
    shortName.value="";
    shortName.focus();
    return false;
  }
  if(!stringLengthCheck(cantCode,20,"工作地点所在行政区划长度不能超过20个字符!")){
    cantCode.value="";
    cantCode.focus();
    return false;
  }
  if(!stringLengthCheck(linkman,120,"联系人长度不能超过120个字符!")){
    linkman.value="";
    linkman.focus();
    return false;
  }
  if(!stringLengthCheck(tel,80,"办公电话长度不能超过80个字符!")){
    tel.value="";
    tel.focus();
    return false;
  }
  if(!stringLengthCheck(fax,80,"传真长度不能超过80个字符!")){
    fax.value="";
    fax.focus();
    return false;
  }　
  if(!stringLengthCheck(email,80,"电子邮件长度不能超过80个字符!")){
    email.value="";
    email.focus();
    return false;
  }
  if(!stringLengthCheck(www,250,"WEB地址长度不能超过250个字符!")){
    www.value="";
    www.focus();
    return false;
  }
  if(!stringLengthCheck(postCode,20,"邮政编码长度不能超过20个字符!")){
    postCode.value="";
    postCode.focus();
    return false;
  }
  if(!stringLengthCheck(postAddress,250,"通信地址长度不能超过250个字符!")){
    postAddress.value="";
    postAddress.focus();
    return false;
  }
  if(!stringLengthCheck(englishAddress,250,"英文通信地址长度不能超过250个字符!")){
    englishAddress.value="";
    englishAddress.focus();
    return false;
  }
  if(!stringLengthCheck(amStartTime,8,"上午开始上班时间长度不能超过8个字符!")){
    amStartTime.value="";
    amStartTime.focus();
    return false;
  }
  if(!stringLengthCheck(amEndTime,8,"上午下班时间长度不能超过8个字符!")){
    amEndTime.value="";
    amEndTime.focus();
    return false;
  }
  if(!stringLengthCheck(pmStartTime,8,"下午开始上班时间长度不能超过8个字符!")){
    pmStartTime.value="";
    pmStartTime.focus();
    return false;
  }
  if(!stringLengthCheck(pmEndTime,8,"下午下班时间长度不能超过8个字符!")){
    pmEndTime.value="";
    pmEndTime.focus();
    return false;
  }
  
   
  if(document.forms[0].amStartTime.value>=document.forms[0].amEndTime.value) {
    alert("上午下班时间一定要大于上午开始上班时间，请重新输入！");
    document.forms[0].amEndTime.focus();
    return false;
  }
  if(document.forms[0].amEndTime.value>=document.forms[0].pmStartTime.value) {
    alert("下午开始上班班时间一定要大于上午下班时间，请重新输入！");
    document.forms[0].amEndTime.focus();
    return false;
  }
  if(document.forms[0].pmStartTime.value>=document.forms[0].pmEndTime.value) {
    alert("下午下班时间一定要大于下午开始上班时间，请重新输入！");
    document.forms[0].pmEndTime.focus();
    return false;
  } 
  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form name="frmList" action="">
	<bsp:container title="工作地点增加">
		<bsp:containbutton text="保存" onclick="forSave()"
			action="workplace.cmd?method=insert"></bsp:containbutton>
		<bsp:containbutton text="保存并继续" onclick="forSaveContinue()"
			action="workplace.cmd?method=insertContinue"></bsp:containbutton>
		<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
		<bsp:containbutton text="返回" onclick="forReturn()"
			action="workplacequery.cmd"></bsp:containbutton>
		<div align="center">
		<table width="100%" cellpadding="0" class="tblContent">
			<html:hidden name="workplaceId" property="workplaceId" write="false" />
			<tr>
				<td class="tdTitle"><%=ResourcesFactory
							.getString("PUB_WORKPLACE.WORKPLACE_CODE")%>：</td>
				<td class="tdRight"><html:text name="workplaceCode"
					property="workplaceCode" size="20" maxlength="30" /><FONT
					COLOR=#ff0000>(值为空时,系统自动生成)</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory
							.getString("PUB_WORKPLACE.WORKPLACE_NAME")%>：</td>
				<td class="tdRight"><html:text name="workplaceName"
					property="workplaceName" size="40" maxlength="100" /><FONT
					COLOR=#ff0000>*</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.SHORT_NAME")%>：</td>
				<td class="tdRight"><html:text name="shortName"
					property="shortName" size="20" maxlength="30" /><FONT
					COLOR=#ff0000>*</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.CANT_CODE")%>：</td>
				<td class="tdRight"><html:hidden name="cantCode"
					property="cantCode" write="false" /><html:text name="cantName"
					property="cantName" value="" size="20" maxlength="20"
					readonly="true" ondblclick="clean()" /> <FONT COLOR=#ff0000>*</FONT><img
					src="skins/default/images/liulan.gif" width="28"
					style="cursor:hand" height="16" border="0" onclick="selectCant()">
				</td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.LINKMAN")%>：</td>
				<td class="tdRight"><html:text name="linkman"
					property="linkman" size="50" maxlength="120" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.TEL")%>：</td>
				<td class="tdRight"><html:text name="tel" property="tel"
					size="40" maxlength="80" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.FAX")%>：</td>
				<td class="tdRight"><html:text name="fax" property="fax"
					size="40" maxlength="80" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.E_MAIL")%>：</td>
				<td class="tdRight"><html:text name="email" property="email"
					size="40" maxlength="80" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.WWW")%>：</td>
				<td class="tdRight"><html:text name="www" property="www"
					size="50" maxlength="250" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.POST_CODE")%>：</td>
				<td class="tdRight"><html:text name="postCode"
					property="postCode" size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.POST_ADDRESS")%>：</td>
				<td class="tdRight">

									<help:helpsearch name="postAddress" size="40" helpid="for_cant" property="postAddress" ismulti="false" changefield="postCode#1,www#2"/>	
					</td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory
							.getString("PUB_WORKPLACE.ENGLISH_ADDRESS")%>：</td>
				<td class="tdRight"><html:text name="englishAddress"
					property="englishAddress" size="50" maxlength="250" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory
									.getString("PUB_WORKPLACE.AM_START_TIME")%>：</td>
				<td class="tdRight"><html:text name="amStartTime"
					property="amStartTime" size="8" maxlength="8" /><FONT
					COLOR=#ff0000>*(格式00:00:00)</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.AM_END_TIME")%>：</td>
				<td class="tdRight"><html:text name="amEndTime"
					property="amEndTime" size="8" maxlength="8" /><FONT COLOR=#ff0000>*(格式00:00:00)</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory
									.getString("PUB_WORKPLACE.PM_START_TIME")%>：</td>
				<td class="tdRight"><html:text name="pmStartTime"
					property="pmStartTime" size="8" maxlength="8" /><FONT
					COLOR=#ff0000>*(格式00:00:00)</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.PM_END_TIME")%>：</td>
				<td class="tdRight"><html:text name="pmEndTime"
					property="pmEndTime" size="8" maxlength="8" /><FONT COLOR=#ff0000>*(格式00:00:00)</FONT></td>
			</tr>

		</table>
		</div>
	</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function clean(){
	document.forms[0].cantCode.value=""; 
	document.forms[0].cantName.value="";	
}
function forSave(){
  if(!checkPubWorkplace()) return;	
  document.forms[0].action ="workplace.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkPubWorkplace()) return;
  document.forms[0].action ="workplace.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="workplacequery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}

function selectCant(){
  var url ="jsp/help.jsp?url=canthelp.cmd&method=query";   
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
  if (win == null) {  
  	return;
  }else{
  document.all("cantCode").value=win[0];
  document.all("cantName").value=win[1];
  }
}
</script>
