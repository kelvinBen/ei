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
<TITLE>�����ص�����</TITLE>
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
      alert("�����ص���벻�ܺ��������ַ���");
      workplaceCode.value="";
      workplaceCode.select();
      workplaceCode.focus();
      return false;
    }
  
  workplaceCode.value = trim(workplaceCode.value) ;
  var rs = /^([0-9]|[a-z]|[A-Z])+$/;
    if(workplaceCode.value!=""){
	  if((!rs.test(workplaceCode.value)) && (trim(workplaceCode.value)!="")){
	     alert("�����ص���������Ӣ���ַ������֣�");
	     workplaceCode.value="";
	     workplaceCode.select();
	     workplaceCode.focus();
	     return false;
	  }
  }	  
 var workplaceName = document.forms[0].workplaceName;
 if ( __isQuoteIn(workplaceName.value) )
    {
      alert("�����ص����Ʋ��ܺ��������ַ���");
      workplaceName.select();
      workplaceName.focus();
      return false;
    }
  if (trim(workplaceName.value)=="")
  {
    alert("�����빤���ص����ƣ�");
    workplaceName.focus();
    return false;
  }
  workplaceName.value = trim(workplaceName.value) ;
  var shortName=document.forms[0].shortName;
   if ( __isQuoteIn(shortName.value) )
    {
      alert("�����ص��Ʋ��ܺ��������ַ���");
      shortName.select();
      shortName.focus();
      return false;
    }
    if (trim(shortName.value)=="")
  {
    alert("�����빤���ص��ƣ�");
    shortName.focus();
    return false;
  }
  shortName.value = trim(shortName.value) ;
  var cantCode = document.forms[0].cantCode;
  if (trim(cantCode.value)=="")
  {
    alert("�����빤���ص���������������");
    return false;
  } 
  cantCode.value = trim(cantCode.value) ;
  
  var linkman = document.forms[0].linkman;
    linkman.value = trim(linkman.value) ;
	  var tel = document.forms[0].tel;

    tel.value = trim(tel.value) ;
    if(trim(tel.value)!=""&&!__isFixedTelephone(trim(tel.value)))
  {
  	alert("��������ȷ�ĵ绰���룡");
  	 tel.value="";
     tel.focus();
     return false;
  }
	  var fax = document.forms[0].fax;
    fax.value = trim(fax.value) ;
    if(trim(fax.value)!=""&&!__isFixedTelephone(trim(fax.value)))
  {
  	alert("��������ȷ�Ĵ�����룡");
  	 fax.value="";
    fax.focus();
    return false;
  }
	  var email = document.forms[0].email;
    email.value = trim(email.value) ;
    if(email.value !=""){
        if(!__checkEmail(email.value)){
            alert("��������ȷ���ʼ���ʽ��");
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
        alert("�����������������!");
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
	     alert("Ӣ��ͨ�ŵ�ַ������Ӣ���ַ������֣�");
	      englishAddress.value="";
	     englishAddress.focus();
	     return false;
	  }
  }	  
    
    
       
 var amStartTime = document.forms[0].amStartTime;
  if (trim(amStartTime.value)=="")
  {
    alert("���������翪ʼ�ϰ�ʱ�䣡");
    amStartTime.focus();
    return false;
  }
  if(!__checkTime(trim(amStartTime.value))){
    alert("��������ȷ��ʱ���ʽ��");
    amStartTime.value="";
    amStartTime.focus();
    return false;
  }
  amStartTime.value = trim(amStartTime.value) ;
 var amEndTime = document.forms[0].amEndTime;
  if (trim(amEndTime.value)=="")
  {
    alert("�����������°�ʱ�䣡");
    amEndTime.focus();
    return false;
  }
  if(!__checkTime(trim(amEndTime.value))){
    alert("��������ȷ��ʱ���ʽ��");
    amEndTime.value="";
    amEndTime.focus();
    return false;
  }
  amEndTime.value = trim(amEndTime.value) ;
 var pmStartTime = document.forms[0].pmStartTime;
  if (trim(pmStartTime.value)=="")
  {
    alert("���������翪ʼ�ϰ�ʱ�䣡");
    pmStartTime.focus();
    return false;
  }
  if(!__checkTime(trim(pmStartTime.value))){
    alert("��������ȷ��ʱ���ʽ��");
    pmStartTime.value="";
    pmStartTime.focus();
    return false;
  }
  pmStartTime.value = trim(pmStartTime.value) ;
 var pmEndTime = document.forms[0].pmEndTime;
  if (trim(pmEndTime.value)=="")
  {
    alert("�����������°�ʱ�䣡");
    pmEndTime.focus();
    return false;
  }
  if(!__checkTime(trim(pmEndTime.value))){
    alert("��������ȷ��ʱ���ʽ��");
    pmEndTime.value="";
    pmEndTime.focus();
    return false;
  }
  pmEndTime.value = trim(pmEndTime.value) ;
 
  if(!stringLengthCheck(workplaceCode,30,"�����ص���볤�Ȳ��ܳ���30���ַ�!")){
    workplaceCode.value="";
    workplaceCode.focus();
    return false;
  }
  if(!stringLengthCheck(workplaceName,100,"�����ص����Ƴ��Ȳ��ܳ���100���ַ�!")){
    workplaceName.value="";
    workplaceName.focus();
    return false;
  }
  if(!stringLengthCheck(shortName,30,"�����ص��Ƴ��Ȳ��ܳ���30���ַ�!")){
    shortName.value="";
    shortName.focus();
    return false;
  }
  if(!stringLengthCheck(cantCode,20,"�����ص����������������Ȳ��ܳ���20���ַ�!")){
    cantCode.value="";
    cantCode.focus();
    return false;
  }
  if(!stringLengthCheck(linkman,120,"��ϵ�˳��Ȳ��ܳ���120���ַ�!")){
    linkman.value="";
    linkman.focus();
    return false;
  }
  if(!stringLengthCheck(tel,80,"�칫�绰���Ȳ��ܳ���80���ַ�!")){
    tel.value="";
    tel.focus();
    return false;
  }
  if(!stringLengthCheck(fax,80,"���泤�Ȳ��ܳ���80���ַ�!")){
    fax.value="";
    fax.focus();
    return false;
  }��
  if(!stringLengthCheck(email,80,"�����ʼ����Ȳ��ܳ���80���ַ�!")){
    email.value="";
    email.focus();
    return false;
  }
  if(!stringLengthCheck(www,250,"WEB��ַ���Ȳ��ܳ���250���ַ�!")){
    www.value="";
    www.focus();
    return false;
  }
  if(!stringLengthCheck(postCode,20,"�������볤�Ȳ��ܳ���20���ַ�!")){
    postCode.value="";
    postCode.focus();
    return false;
  }
  if(!stringLengthCheck(postAddress,250,"ͨ�ŵ�ַ���Ȳ��ܳ���250���ַ�!")){
    postAddress.value="";
    postAddress.focus();
    return false;
  }
  if(!stringLengthCheck(englishAddress,250,"Ӣ��ͨ�ŵ�ַ���Ȳ��ܳ���250���ַ�!")){
    englishAddress.value="";
    englishAddress.focus();
    return false;
  }
  if(!stringLengthCheck(amStartTime,8,"���翪ʼ�ϰ�ʱ�䳤�Ȳ��ܳ���8���ַ�!")){
    amStartTime.value="";
    amStartTime.focus();
    return false;
  }
  if(!stringLengthCheck(amEndTime,8,"�����°�ʱ�䳤�Ȳ��ܳ���8���ַ�!")){
    amEndTime.value="";
    amEndTime.focus();
    return false;
  }
  if(!stringLengthCheck(pmStartTime,8,"���翪ʼ�ϰ�ʱ�䳤�Ȳ��ܳ���8���ַ�!")){
    pmStartTime.value="";
    pmStartTime.focus();
    return false;
  }
  if(!stringLengthCheck(pmEndTime,8,"�����°�ʱ�䳤�Ȳ��ܳ���8���ַ�!")){
    pmEndTime.value="";
    pmEndTime.focus();
    return false;
  }
  
   
  if(document.forms[0].amStartTime.value>=document.forms[0].amEndTime.value) {
    alert("�����°�ʱ��һ��Ҫ�������翪ʼ�ϰ�ʱ�䣬���������룡");
    document.forms[0].amEndTime.focus();
    return false;
  }
  if(document.forms[0].amEndTime.value>=document.forms[0].pmStartTime.value) {
    alert("���翪ʼ�ϰ��ʱ��һ��Ҫ���������°�ʱ�䣬���������룡");
    document.forms[0].amEndTime.focus();
    return false;
  }
  if(document.forms[0].pmStartTime.value>=document.forms[0].pmEndTime.value) {
    alert("�����°�ʱ��һ��Ҫ�������翪ʼ�ϰ�ʱ�䣬���������룡");
    document.forms[0].pmEndTime.focus();
    return false;
  } 
  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form name="frmList" action="">
	<bsp:container title="�����ص�����">
		<bsp:containbutton text="����" onclick="forSave()"
			action="workplace.cmd?method=insert"></bsp:containbutton>
		<bsp:containbutton text="���沢����" onclick="forSaveContinue()"
			action="workplace.cmd?method=insertContinue"></bsp:containbutton>
		<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
		<bsp:containbutton text="����" onclick="forReturn()"
			action="workplacequery.cmd"></bsp:containbutton>
		<div align="center">
		<table width="100%" cellpadding="0" class="tblContent">
			<html:hidden name="workplaceId" property="workplaceId" write="false" />
			<tr>
				<td class="tdTitle"><%=ResourcesFactory
							.getString("PUB_WORKPLACE.WORKPLACE_CODE")%>��</td>
				<td class="tdRight"><html:text name="workplaceCode"
					property="workplaceCode" size="20" maxlength="30" /><FONT
					COLOR=#ff0000>(ֵΪ��ʱ,ϵͳ�Զ�����)</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory
							.getString("PUB_WORKPLACE.WORKPLACE_NAME")%>��</td>
				<td class="tdRight"><html:text name="workplaceName"
					property="workplaceName" size="40" maxlength="100" /><FONT
					COLOR=#ff0000>*</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.SHORT_NAME")%>��</td>
				<td class="tdRight"><html:text name="shortName"
					property="shortName" size="20" maxlength="30" /><FONT
					COLOR=#ff0000>*</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.CANT_CODE")%>��</td>
				<td class="tdRight"><html:hidden name="cantCode"
					property="cantCode" write="false" /><html:text name="cantName"
					property="cantName" value="" size="20" maxlength="20"
					readonly="true" ondblclick="clean()" /> <FONT COLOR=#ff0000>*</FONT><img
					src="skins/default/images/liulan.gif" width="28"
					style="cursor:hand" height="16" border="0" onclick="selectCant()">
				</td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.LINKMAN")%>��</td>
				<td class="tdRight"><html:text name="linkman"
					property="linkman" size="50" maxlength="120" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.TEL")%>��</td>
				<td class="tdRight"><html:text name="tel" property="tel"
					size="40" maxlength="80" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.FAX")%>��</td>
				<td class="tdRight"><html:text name="fax" property="fax"
					size="40" maxlength="80" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.E_MAIL")%>��</td>
				<td class="tdRight"><html:text name="email" property="email"
					size="40" maxlength="80" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.WWW")%>��</td>
				<td class="tdRight"><html:text name="www" property="www"
					size="50" maxlength="250" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.POST_CODE")%>��</td>
				<td class="tdRight"><html:text name="postCode"
					property="postCode" size="20" maxlength="20" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.POST_ADDRESS")%>��</td>
				<td class="tdRight">

									<help:helpsearch name="postAddress" size="40" helpid="for_cant" property="postAddress" ismulti="false" changefield="postCode#1,www#2"/>	
					</td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory
							.getString("PUB_WORKPLACE.ENGLISH_ADDRESS")%>��</td>
				<td class="tdRight"><html:text name="englishAddress"
					property="englishAddress" size="50" maxlength="250" /></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory
									.getString("PUB_WORKPLACE.AM_START_TIME")%>��</td>
				<td class="tdRight"><html:text name="amStartTime"
					property="amStartTime" size="8" maxlength="8" /><FONT
					COLOR=#ff0000>*(��ʽ00:00:00)</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.AM_END_TIME")%>��</td>
				<td class="tdRight"><html:text name="amEndTime"
					property="amEndTime" size="8" maxlength="8" /><FONT COLOR=#ff0000>*(��ʽ00:00:00)</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory
									.getString("PUB_WORKPLACE.PM_START_TIME")%>��</td>
				<td class="tdRight"><html:text name="pmStartTime"
					property="pmStartTime" size="8" maxlength="8" /><FONT
					COLOR=#ff0000>*(��ʽ00:00:00)</FONT></td>
			</tr>
			<tr>
				<td class="tdTitle"><%=ResourcesFactory.getString("PUB_WORKPLACE.PM_END_TIME")%>��</td>
				<td class="tdRight"><html:text name="pmEndTime"
					property="pmEndTime" size="8" maxlength="8" /><FONT COLOR=#ff0000>*(��ʽ00:00:00)</FONT></td>
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
