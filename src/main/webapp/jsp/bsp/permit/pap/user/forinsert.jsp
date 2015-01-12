<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.bsp.permit.pap.data.StruTypeRef"%>
<%@ page import="net.mast.bsp.permit.pap.view.*"%>

<%
	String refreshId =(String) request.getAttribute("refreshId");
%>
<%
	boolean flag = true;
	String style="";
	if(flag)
		style="display:block";
	else
		style="display:none";
%>
<%
	String defaultStruTypeRootId = (String)request.getAttribute("defaultStruTypeRootId");
	
	List check_password_list =Global.getList("net.mast.bsp.permit.check_password");
	String pswd_check = ResourcesFactory.getString("PUB_USERS.PSWD_CHECK");
%>

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"editgrid.css")%>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"MultiSelect.js")%>"></script>
</HEAD>
<script language="javascript">
function checkPubUsers(){
//2005��10��2�գ�ȥ��������֤�жԿո�Ĺ��ˣ������������пո����
	var userId = document.forms[0].userId;
	if ( isQuoteIn(userId.value) )
	{
		alert("�ʻ����ܺ��������ַ���");
		tab1.doCardShow("card0");
		userId.value="";
		userId.select();
		userId.focus();
		return false;
	}
	if (trim(userId.value)=="")
	{
		alert("�������ʻ���"); 
		tab1.doCardShow("card0");
		userId.select();
		userId.focus();
		return false;
	}
	userId.value = trim(userId.value) ;
	
	var userName = document.forms[0].userName;
	if ( __isQuoteIn(userName.value) )
	{
		alert("�������Ʋ��ܺ��������ַ���");
		tab1.doCardShow("card0");
		userName.value="";
		userName.select();
		userName.focus();
		return false;
	}
	if (trim(userName.value)=="")
	{
		alert("�������û����ƣ�"); 
		tab1.doCardShow("card0");
		userName.select();
		userName.focus();
		return false;
	}
	userName.value = trim(userName.value) ;
	var password = document.forms[0].password;
	if (password.value=="")
	{
		alert("���������룡"); 
		tab1.doCardShow("card0");
		password.select();
		password.focus();
		return false;
	}
	
	var re_password = document.forms[0].re_password;
	if (re_password.value=="")
	{
		alert("������ȷ�����룡"); 
		tab1.doCardShow("card0");
		re_password.select();
		re_password.focus();
		return false;
	}
	
	var check_password_arr = <%=check_password_list%>; 
	var pswd_check_text ="<%=pswd_check%>";
	for(var i=0;i<check_password_arr.length;i++){
	if(check_password_arr[i]!=null){
		if(!checkPassword(check_password_arr[i],password.value)){
			alert(pswd_check_text);
			return false;
		}
	}  
	}
			
	var securityLevel = document.forms[0].securityLevel;
	if (trim(securityLevel.value)=="")
	{
		alert("�����밲ȫ����"); 
		tab1.doCardShow("card0");
		securityLevel.select();
		securityLevel.focus();
		return false;
	}
	securityLevel.value = trim(securityLevel.value) ;
	var maxSessions = document.forms[0].maxSessions;
	if (trim(maxSessions.value)=="")
	{
		alert("�����������������Ự����");  
		tab1.doCardShow("card0");
		maxSessions.select();
		maxSessions.focus();
		return false;
	}
	maxSessions.value = trim(maxSessions.value) ;
	if(!(maxSessions.value==parseInt(maxSessions.value)&&(maxSessions.value>-2))){
		alert("���Ự�������Ǵ��ڵ���-1��������");
		tab1.doCardShow("card0");
		document.forms[0].maxSessions.value="";
		document.forms[0].maxSessions.focus();
		return false;
	}
	var isSys = document.forms[0].isSys;
	if (trim(isSys.value)=="")
	{
		alert("�������Ƿ�ϵͳ����Ա��"); 
		tab1.doCardShow("card0");
		isSys.select();
		isSys.focus();
		return false;
	}
	isSys.value = trim(isSys.value) ;
	var email= document.forms[0].email;
	if(trim(email.value)!=""){
	if(!__checkEmail(email.value)){
		alert("E_MAIL�ĸ�ʽ����ȷ,���������롣");
		tab1.doCardShow("card0");
		email.value="";
		email.select();
		email.focus();
		return false;
		}
	}
	var msn = document.forms[0].msn;
	if(trim(msn.value)!=""){
	//if(!__checkEmail(msn.value)){
		//alert("�����Ϊ��,���������롣");
		//tab1.doCardShow("card0");
		msn.value="";
		msn.select();
		msn.focus();
		return false;
		//}
	}
	
	var qq= document.forms[0].qq;
	if(trim(qq.value)!=""){
//		if(!__isNum(qq.value)){
//			alert("�û����ŵĸ�ʽ����ȷ,���������롣");
//			tab1.doCardShow("card0");
			qq.value="";
			qq.select();
			qq.focus();
			return false;
//		}
	}
	
	var mobile= document.forms[0].mobile;
	if(trim(mobile.value)!=""){
		//if(!__isMobileTelephone(mobile.value)){
			//alert("MOBILE�ĸ�ʽ����ȷ,���������롣");
			//tab1.doCardShow("card0");
			mobile.value="";
			mobile.select();
			mobile.focus();
			return false;
		//}
	}
	
	if(!stringLengthCheck(userId,30,"�ʻ����ܳ���30���ַ�!")){
		tab1.doCardShow("card0");
		userId.value="";
		userId.select();
		userId.focus();
		return false;
	}
	if(!stringLengthCheck(userName,30,"�������Ʋ��ܳ���30���ַ�!")){
		tab1.doCardShow("card0");
		userName.value="";
		userName.select();
		userName.focus();
		return false;
	}
	if(!stringLengthCheck(password,128,"���벻�ܳ���128���ַ�!")){
		tab1.doCardShow("card0");
		password.value="";
		password.select();
		password.focus();
		return false;
	}
	if(!stringLengthCheck(re_password,30,"ȷ�����벻�ܳ���30���ַ�!")){
		tab1.doCardShow("card0");
		re_password.value="";
		re_password.select();
		re_password.focus();
		return false;
	}
	if(document.forms[0].password.value!=document.forms[0].re_password.value) {
		alert("������������벻һ�������������룡");
		tab1.doCardShow("card0");
		document.forms[0].password.value="";
		document.forms[0].re_password.value="";
		document.forms[0].password.focus();
		return false;
	} 
	if(!stringLengthCheck(maxSessions,4,"�����������Ự�����ܳ���9999!")){
		tab1.doCardShow("card0");
		maxSessions.value="";
		maxSessions.select();
		maxSessions.focus();
		return false;
	}
	if(!stringLengthCheck(qq,20,"QQ���ܳ���20���ַ�!")){
		tab1.doCardShow("card0");
		qq.value="";
		qq.select();
		qq.focus();
		return false;
	}
	var externalUser= getSelect('externalUser');
	if(externalUser==""){
		alert("��ѡ���ʺ��Ƿ�ָ��Ա����");
		tab1.doCardShow("card0");
		return false;
	}
	
	return true
}
</script>

<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<input type="hidden" name="grantedRolesIdList" value="">
<input type="hidden" name="agentUsersIdList" value="">
<input type="hidden" name="beAgentUsersIdList" value="">
<bsp:container title="�����û�" >
<bsp:containbutton text="����" onclick="forSave()" action ="user.cmd?method=insert"></bsp:containbutton>
<html:messages/>


<tab:tab  id="tab1" type="table">

<tab:card id="card0" text=" һ����Ϣ  ">
  <table width="100%" cellpadding="0" class="tblContent">
  
	<tr>
	<td class="tdTitle">�û�ID��</td>
	<td class="tdRight"><html:text name="userId"  property="userId" size="20" maxlength="30" value=""/><FONT COLOR=#ff0000>*</FONT></td>
	</tr>  
	
	<tr>
	<td class="tdTitle">�û����ƣ�</td>
	<td class="tdRight"><html:text name="userName"  property="userName" size="20" maxlength="30"  onfocus="isselect()" ondblclick="clean()"/>
	&nbsp;��ָ��Ա����
	<html:radio name="externalUser" property="externalUser" value="01" />��
	<html:radio name="externalUser" property="externalUser" value="10"/>��
	<img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectEmployId()">
	<FONT COLOR=#ff0000>*(�ڲ��û���ѡ���ӦԱ��)</FONT>
	</td>
	
	
	</tr> 
	
	<tr>
	<td class="tdTitle">���룺</td>
	<td class="tdRight"><html:password  name="password" property="password" size="20" maxlength="128" /><FONT COLOR=#ff0000>*</FONT></td>
	</tr>  
	
	<tr>
	<td class="tdTitle">ȷ�����룺</td>
	<td class="tdRight"><html:password  name="re_password" property="password" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
	</tr>  
	
	<tr style="<%=style%>">   
	<td class="tdTitle">��ȫ����</td>
	<td class="tdRight">
	<html:select name="securityLevel" property="securityLevel">
	<html:options collection="securityLevelCollection" labelProperty="LEVEL_NAME" property="SECURITY_LEVEL"/>
	</html:select>
	</td>
	</tr> 
	
	<html:hidden name="isSys" value="1" />	
	
	<tr>
	<td class="tdTitle">�������ˣ�</td>
	<td class="tdRight"><html:hidden name="corporationName"  property="corporationName" write="true"/></td>
	</tr> 
	
	<tr>
	<td class="tdTitle">�������ţ�</td>
	<td class="tdRight"><html:hidden name="departmentName"  property="departmentName" write="true"/></td>
	</tr> 
	
	<html:hidden name="employeeId" property="employeeId" write="false"/>
	
	<html:hidden name="employeeName" property="employeeName"  write="false" />
	
	<html:hidden name="departmentId"  property="departmentId" write="false" />
	
	
	<tr>
	<td class="tdTitle">�����������Ự����</td>
	<td class="tdRight"><html:text name="maxSessions"  property="maxSessions" value="1" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
	</tr> 
	
	<tr>
	<td class="tdTitle">E_MAIL��</td>
	<td class="tdRight"><html:text name="email"  property="email" size="50" maxlength="80" /></td>
	</tr> 
	
	<tr>
	<td class="tdTitle">�� �棺</td>
	<td class="tdRight"><html:text name="msn"  property="msn" size="20" maxlength="30" /></td>
	</tr> 
	
	<tr>
	<td class="tdTitle">QQ��</td>
	<td class="tdRight"><html:text name="qq"  property="qq" size="20" maxlength="20" /></td>
	</tr> 
	
	<tr>
	<td class="tdTitle">��ϵ�绰��</td>
	<td class="tdRight"><html:text name="mobile"  property="mobile" size="20" maxlength="20" /></td>
	</tr> 
	
	<tr>
	<td class="tdTitle">״̬��</td>
	<td class="tdRight">
	<html:radio name="accountStatus" property="accountStatus" value="00"/>����
	<html:radio name="accountStatus" property="accountStatus" value="11"/>��
	</td>
	</tr>
                
   </table>
</tab:card>
    
<tab:card id="card1" text=" ��ɫ  " >
  <table width="100%" cellpadding="0" class="tblContent" >  
	<tr>
	<td class="tdLeft">���ý�ɫ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������Ľ�ɫ��</td>
	</tr> 
	<tr>
	<td> 
	<list:pageToPage style="width:800"  type="multiImg" name="multi_0">
	<list:left size="10" name="availableRolesId"  multiple="true" property="userId" styleTd="align:center;width:50%" style="width:100%">
	<html:optionsCollection property="availableRoles" label="roleAlias" value="roleId"/>
	</list:left>
	<list:right size="10" name="grantedRolesId" multiple="true" styleTd="align:center;width:50%" value="" style="width:100%">	
	</list:right>
	</list:pageToPage>
	</td>
	</tr>               
 </table>
</tab:card>
 

<tab:card id="card2" text=" �����û�  ">
<table width="" cellpadding="0" class="tblContent"><tr>
<td class="tdLeft">
	<table cellpadding="0" width="210">
		<tr><td class="tdLeft">�Ѿ������˵�ǰ�ʻ����û���</td></tr>
		<tr>
		<td >
		<html:select   name="agentUsersId" value="" size="10" style="width:100%" multiple="true">
		</html:select>
		</td>
	 	<td>
		<html:button name="" value="����" onclick="addAgentUser()" />
		<br>
		<html:button name="" value="ɾ��" onclick="delAgentUser()" />
		</td>
		</tr>
	 </table>
</td>
<td class="tdLeft">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td class="tdLeft">	  
	<table  cellpadding="0" width="210">
		<tr><td class="tdLeft">�Ѿ�����ǰ�ʻ������˵��û���</td></tr>
		<tr>
		<td >
		<html:select   name="beAgentUsersId" value="" size="10" style="width:100%" multiple="true">
		</html:select>
		</td>
		<td>
		<html:button name="" value="����" onclick="addBeAgentUser()" />
		<br>
		<html:button name="" value="ɾ��" onclick="delBeAgentUser()" />
		</td>
		</tr>
     </table>
</td>	
<td width="100%" class="tdLeft">&nbsp;</td>
</tr></table>
</tab:card>

<tab:card id="card3" text=" ��֯�ṹȨ��  ">
<table width="100%" cellpadding="0" class="tblContent" >
	<!--Ϊ�����̨UserView�Ķ�Ӧ,��Ӹ�������-->
	<input type="hidden" name="net.mast.web.taglib.util.GRIDLENGTH" id="net.mast.web.taglib.util.GRIDLENGTH" value="0">
   <tr>
   <td>
                <grid:grid name="struTypeRefList" property="struTypeRefList" type="edit" height="200" sumRow="false">
                     <grid:hideCol property="struType" name="struType" caption="�ṹ���ʹ���" readonly="true" index="1" ></grid:hideCol>
                     <grid:textCol property="struTypeName" name="struTypeName" caption="�ṹ����" readonly="true" index="2" width="200"></grid:textCol>
                     <grid:hideCol property="struId" name="struId" caption="��߷��ʽڵ�Ľṹ����" readonly="true" index="3" ></grid:hideCol>
                     <grid:imageTextCol property="organName" name="organName" caption="����Ȩ��" index="4" defaultValue=" " width="200"
	                    imageUrl="skins/default/images/liulan.gif" imageClick="selectStruId();" style="width:70%"></grid:imageTextCol>
	             <grid:primaryKeyCol property="struType" name="primaryKey" caption="������" readonly="true" index="5" ></grid:primaryKeyCol>
	             <grid:hideCol property="rootId" name="rootId" caption="ÿ�ֽṹ���͸��ڵ�Ľṹ����" readonly="true" index="6" ></grid:hideCol>
	        </grid:grid>
   </td>
   </tr> 
</table>  
</tab:card>
</tab:tab>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function clean(){
	document.forms[0].userName.value="";
}
  tab1.doCardClick=function(card){
	if (card.id=="card3"){
		struTypeRefList.show();
	} 
  }
  
  function selectStruId(){
	var row = struTypeRefList.getCurrentLine();
	var struType = struTypeRefList.getCellValue(row,1);
	var rootId;
	if(struType=="00")
		rootId = "<%=defaultStruTypeRootId%>";
	else
		rootId = struTypeRefList.getCellValue(row,6);
	var url ="stru.cmd?method=getSelectRoot&struType="+struType+"&rootId="+rootId+"&isCheckBox=0&isIncludeSelf=1&isTree=1&nevervote=1";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
	if (win == null) {  
		return; 
	}else{
		if(win[0]=="")
		return;
		struTypeRefList.setCellValue(row,3,win[2]);
		struTypeRefList.setCellValue(row,4,win[1]);
	}
  }
  
  //�ж��Ƿ���Ҫѡ���ڲ��û������ѡ��Ϊ�ڲ��û���
 function isselect(){
 	var employeeId= $('employeeId').value;
 	var externalUser=document.forms[0].externalUser;
 	if(employeeId!=""){
 		return ;
 	}else if(externalUser[0].checked){
 		selectEmployId();
 	}
 }
 
  
  function selectEmployId(){
	var departmentId = document.all("departmentId").value;
	var url ="stru.cmd?method=getSelectRoot&isIncludeSubCorporation=0&rootId="+departmentId+"&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1";      
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
	if (win == null) {  
		return;
	}else{
		if(win[0]=="") return;
		document.all("employeeId").value=win[2];
		document.all("employeeName").value=win[1];
		document.all("userName").value=win[1];
	}
  }
   
  function forSave(){
	if(!checkPubUsers()) return; 
	tab1.doCardShow("card3");
	//��ȫ����ĸ�ֵ
	var flag = <%=flag%>;
	if(flag==false)
		document.all("securityLevel").value="9";    
	var rightListValue_grantedRoles="";
	var select_grantedRoles=document.all("grantedRolesId");
	var lens=select_grantedRoles.options.length;
	for(var i=0;i<=lens-1;i++)
	{
		if (i==lens-1)
		rightListValue_grantedRoles=rightListValue_grantedRoles+select_grantedRoles.options[i].value;
		else 
		rightListValue_grantedRoles=rightListValue_grantedRoles+select_grantedRoles.options[i].value+",";
	}
	document.all.grantedRolesIdList.value=rightListValue_grantedRoles;
	
	var rightListValue_agentUsers="";
	var select_agentUsers=document.all("agentUsersId");
	
	var lens=select_agentUsers.options.length;
	for(var i=0;i<=lens-1;i++)
	{
		if (i==lens-1)
		rightListValue_agentUsers=rightListValue_agentUsers+select_agentUsers.options[i].value;
		else 
		rightListValue_agentUsers=rightListValue_agentUsers+select_agentUsers.options[i].value+",";
	}
	document.all.agentUsersIdList.value=rightListValue_agentUsers;
	
	var rightListValue_beAgentUsers="";
	var select_beAgentUsers=document.all("beAgentUsersId");
	var lens=select_beAgentUsers.options.length;
	for(var i=0;i<=lens-1;i++)
	{
		if (i==lens-1)
		rightListValue_beAgentUsers=rightListValue_beAgentUsers+select_beAgentUsers.options[i].value;
		else 
		rightListValue_beAgentUsers=rightListValue_beAgentUsers+select_beAgentUsers.options[i].value+",";
	}
	document.all.beAgentUsersIdList.value=rightListValue_beAgentUsers;
	
	document.forms[0].action ="user.cmd?method=insert&refreshId="+"<%=refreshId%>";    
	document.forms[0].submit();	
  }
  
  	function getSelOpis(list){
		var len=list.options.length;
		var opis=new Array();
		var j=0;
		for(var i=0;i<len;i++){
			if(list.options[i].selected)
				opis[j++]=list.options[i];
		}
		return opis;
	}

	function addOptions(list,opiVals,opiTits){
		if(opiVals!=""&&opiTits!=""){
			var vals=opiVals.split(",");
			var tits=opiTits.split(",");
			var len=vals.length>tits.length?tits.length:vals.length;
			for(var i=0;i<len;i++){
				var newOpi=document.createElement("<OPTION>");
				list.options.add(newOpi);
				newOpi.value=vals[i];
				newOpi.innerText=tits[i];
				
			}
		}	
	}
	var delagentopts = "";//�����û�ɾ����optionӦ����������ʾ����
	var delbeagentopts = "";//�������û�ɾ����optionӦ����������ʾ����
	//���Ӵ����û�
	function addAgentUser(){
		var list = document.all("agentUsersId");
		var viewagentopts = "";//��������ʾ��option
		for(var i=0;i<list.options.length;i++){
			viewagentopts = viewagentopts+list.options[i].value+",";
		}
		//var userId = document.all("userId").value;
		var userId ="";
		var cmdUrl="user.cmd&method=getAvailableAgentUsersCheckRoot&userId="+userId+"&viewagentopts="+viewagentopts.substring(0,viewagentopts.length-1)+"&delagentopts="+delagentopts.substring(0,delagentopts.length-1);
		var url ="jsp/help.jsp?url="+cmdUrl;  
		var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
		if (win == null) {  
			return;
	  	}else{
			addOptions(list,win[0],win[1]);
	  	}
	  	delagentopts="";//���ɾ����option
	}

	//ɾ�������û�
	function delAgentUser(){
		var list = document.all("agentUsersId");
		var dels=getSelOpis(list);
		var len=dels.length;
		var i=0;
		for(var j=0;j<list.options.length;j++)
			if(list.options[j]==dels[i]){
				delagentopts = delagentopts+list.options[j].value+",";
				list.options.remove(j--);
				i++;
		}
	}
	
	//���ӱ������û�
	function addBeAgentUser(){
		var list = document.all("beAgentUsersId");
		var viewbeagentopts = "";//��������ʾ��option
		for(var i=0;i<list.options.length;i++){
			viewbeagentopts = viewbeagentopts+list.options[i].value+",";
		}
		//var userId = document.all("userId").value;
		var userId ="";
		var cmdUrl="user.cmd&method=getAvailableBeAgentUsersCheckRoot&userId="+userId+"&viewbeagentopts="+viewbeagentopts.substring(0,viewbeagentopts.length-1)+"&delbeagentopts="+delbeagentopts.substring(0,delbeagentopts.length-1);
		var url ="jsp/help.jsp?url="+cmdUrl;  
		var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
		if (win == null) {  
			return;
	  	}else{
			addOptions(list,win[0],win[1]);
	  	}
	  	delbeagentopts="";//���ɾ����option
	}
	
	//ɾ���������û�
	function delBeAgentUser(){
		var list = document.all("beAgentUsersId");
		var dels=getSelOpis(list);
		var len=dels.length;
		var i=0;
		for(var j=0;j<list.options.length;j++)
			if(list.options[j]==dels[i]){
				delbeagentopts = delbeagentopts+list.options[j].value+",";
				list.options.remove(j--);
				i++;
		}
	}
</script>