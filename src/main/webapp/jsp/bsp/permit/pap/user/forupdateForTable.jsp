<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
 
<%   
	String refreshId =(String) request.getAttribute("refreshId");
	//�ж���������ҳ������޸�ҳ�滹��ֱ�ӽ����޸�ҳ��
    String flag1 = request.getParameter("method").equals("forupdateForTable")?"1":"0";
	String randomPassword = (String)request.getAttribute("randomPassword");

	boolean flag = true;
	String style="";
	if(flag)
		style="display:block";
	else
		style="display:none";

	String defaultStruTypeRootId = (String)request.getAttribute("defaultStruTypeRootId");
	
	String struId = (String)request.getAttribute("struId");
%>


<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"MultiSelect.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"bsp.js")%>"></script>
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
	if (trim(userName.value)=="")
	{
		alert("�������������ƣ�");  
		tab1.doCardShow("card0");
		userName.select();
		userName.focus();
		return false;
	}
	userName.value = trim(userName.value) ;
	var password = document.forms[0].updatePassword;
	if (password.value=="")
	{
		alert("���������룡");   
		tab1.doCardShow("card0");
		password.select();
		password.focus();
		return false;
	}
	
	var re_password = document.forms[0].confirmPassword;
	if (re_password.value=="")
	{
		alert("������ȷ�����룡"); 
		tab1.doCardShow("card0");
		re_password.select();
		re_password.focus();
		return false;
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
		if(!__checkEmail(msn.value)){
			alert("MSN�ĸ�ʽ����ȷ,���������롣");
			tab1.doCardShow("card0");
			msn.value="";
			msn.select();
			msn.focus();
			return false;
		}
	}
	
	if(!stringLengthCheck(userId,30,"�ʻ����ܳ���30���ַ�!")){
		tab1.doCardShow("card0");
		userId.value="";
		userId.select();
		userId.focus();
		return false;
	}
	if(!stringLengthCheck(userName,30,"�û����Ʋ��ܳ���30���ַ�!")){
		tab1.doCardShow("card0");
		userName.value="";
		userName.select();
		userName.focus();
		return false;
	}
	if(!stringLengthCheck(maxSessions,30,"�����������Ự��30���ַ�!")){
		tab1.doCardShow("card0");
		maxSessions.value="";
		maxSessions.select();
		maxSessions.focus();
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
	if(document.forms[0].updatePassword.value!=document.forms[0].confirmPassword.value) {
		alert("������������벻һ�������������룡");
		tab1.doCardShow("card0");
		document.forms[0].updatePassword.value="";
		document.forms[0].confirmPassword.value="";
		document.forms[0].updatePassword.focus();
		return false;
	}
	if(!stringLengthCheck(maxSessions,4,"�����������Ự�����ܳ���9999!")){
		tab1.doCardShow("card0");
		maxSessions.value="";
		maxSessions.select();
		maxSessions.focus();
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
</HEAD>


<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<input type="hidden" name="grantedRolesIdList" value="">
<input type="hidden" name="agentUsersIdList" value="">
<input type="hidden" name="beAgentUsersIdList" value="">

<bsp:container title="�޸��û�" >
<bsp:containbutton text="����" onclick="forSave()" action ="user.cmd?method=updateForTable"></bsp:containbutton>

<bsp:containbutton text="����" onclick="forReturn()"></bsp:containbutton>

<html:messages/>

<tab:tab  id="tab1" type="table">

<tab:card id="card0" text=" һ����Ϣ  ">
  <table width="100%" cellpadding="0" class="tblContent">  
	<tr>
	<td class="tdTitle">�ʻ���</td>
	<td class="tdRight"><html:hidden name="userId"  property="userId" write="true"/></td>
	</tr>

	<tr>
	<td class="tdTitle">�û����ƣ�</td>
	<td class="tdRight"><html:text name="userName"  property="userName" size="20" maxlength="30"  onfocus="isselect()" ondblclick="clean()"/>
	&nbsp;��ָ��Ա����
	<html:radio name="externalUser" property="externalUser" value="01" />��
	<html:radio name="externalUser" property="externalUser" value="10"/>��
	<img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectEmployId()">
	<FONT COLOR=#ff0000>*(�ڲ��û���ѡ���ӦԱ��)</FONT>
	<html:hidden name="password" property="password" />
	</td>
	</tr> 
	<tr>
	<td class="tdTitle">�޸�����</td>
	<td class="tdRight"><input type="password" name="updatePassword" value="<%=randomPassword%>" size="20" maxlenth="30"></td>
	</tr>

	<tr>
	<td class="tdTitle">ȷ������</td>
	<td class="tdRight"><input type="password" name="confirmPassword" value="<%=randomPassword%>" size="20" maxlenth="30"></td>
	</tr>

	<input type="hidden" name="hiddenPassword" value="<%=randomPassword%>" size="20" maxlenth="30">

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
	<td class="tdTitle">�����������Ự����</td>
	<td class="tdRight"><html:text name="maxSessions"  property="maxSessions" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
	</tr> 
	<html:hidden name="isCpublic" property="isCpublic" />
	<html:hidden name="createTime" property="createTime"/>
	<html:hidden name="lockTime" property="lockTime"/>
	<html:hidden name="expiredTime" property="expiredTime"/>
	<html:hidden name="pswdUptTime" property="pswdUptTime"/>
	<html:hidden name="pswdTime" property="pswdTime"/>
	
	<tr>
	<td class="tdTitle">��������:</td>
	<td class="tdRight"><html:hidden name="corporationName" property="corporationName" write="true"/></td>
	</tr>   

	<tr>
	<td class="tdTitle">�������ţ�</td>
	<td class="tdRight"><html:hidden name="departmentName"  property="departmentName" write="true"/></td>
	</tr>               

	<html:hidden name="employeeId" property="employeeId" write="false"/>
	<html:hidden name="employeeName" property="employeeName"  write="false" />
		<html:hidden name="corporationId"  property="corporationId" write="false" />  
	<html:hidden name="departmentId"  property="departmentId" write="false" />  

	<tr>
	<td class="tdTitle">E_MAIL��</td>
	<td class="tdRight"><html:text name="email"  property="email" size="20" maxlength="30" /></td>
	</tr> 

	<tr>
	<td class="tdTitle">MSN��</td>
	<td class="tdRight"><html:text name="msn"  property="msn" size="20" maxlength="30" /></td>
	</tr> 

	<tr>
	<td class="tdTitle">QQ��</td>
	<td class="tdRight"><html:text name="qq"  property="qq" size="20" maxlength="30" /></td>
	</tr> 

	<tr>
	<td class="tdTitle">MOBILE��</td>
	<td class="tdRight"><html:text name="mobile"  property="mobile" size="20" maxlength="30" /></td>
	</tr> 

	<tr>
	<td class="tdTitle">״̬</td>
	<td class="tdRight">
	<html:radio name="accountStatus" property="accountStatus" value="00"/>����
	<html:radio name="accountStatus" property="accountStatus" value="11" />��
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
		<list:pageToPage style="width:400"  type="multiImg" name="multi_0">
		<list:left size="10" name="availableRolesId"  multiple="true" property="userId" styleTd="align:center;width:40%" style="width:100%">
		<html:optionsCollection property="availableRoles" label="roleAlias" value="roleId"/>
		</list:left>
		<list:right size="10" name="grantedRolesId" multiple="true" styleTd="align:center;width:40%" value="" style="width:100%">
		<html:optionsCollection property="grantedRoles" label="roleAlias" value="roleId"/>
		</list:right>
		</list:pageToPage>
	</td>
	</tr>               
 </table>
</tab:card>

<tab:card id="card2" text=" �����û�  ">
<table width="100%" cellpadding="0" class="tblContent"><tr>
<td style="width:300">
	<table cellpadding="0" width="100%">
		<tr><td colspan=2 >�Ѿ������˵�ǰ�ʻ����û���</td></tr>
		<tr>
		<td width=220>
		<html:select   name="agentUsersId" value="" size="10" style="width:200" multiple="true">
			<html:optionsCollection property="agentUsers" label="userName" value="userId" style="width:50%"/>
		</html:select>
		</td>
	 	<td>
		<html:button name="" value="����" onclick="addAgentUser()" />
		<br><br>
		<html:button name="" value="ɾ��" onclick="delAgentUser()" />
		</td>
		</tr>
	 </table>
</td>
<td>&nbsp;</td>
<td style="width:300">	  
	<table  cellpadding="0"  width="100%">
		<tr><td colspan=2 >�Ѿ�����ǰ�ʻ������˵��û���</td></tr>
		<tr>
		<td width=220>
		<html:select   name="beAgentUsersId" value="" size="10" style="width:200" multiple="true">
			<html:optionsCollection property="beAgentUsers" label="userName" value="userId"/>
		</html:select>
		</td>
		<td>
		<html:button name="" value="����" onclick="addBeAgentUser()" />
		<br><br>
		<html:button name="" value="ɾ��" onclick="delBeAgentUser()" />
		</td>
		</tr>
     </table>
</td>	
<td>&nbsp;</td>
</tr></table>
</tab:card>
 
<tab:card id="card3" text=" ����Ȩ��  ">
   <table width="100%" cellpadding="0" class="tblContent" >  
	<input type="hidden" name="net.mast.web.taglib.util.GRIDLENGTH" id="net.mast.web.taglib.util.GRIDLENGTH" value="0">
	<tr><td>
	<iframe style="display:block" id="dataFrame0" width="100%" height="350" frameborder="0"></iframe>
	</td></tr>
   </table> 
</tab:card>
<tab:card id="card4" text=" ��֯�ṹȨ��  ">
<table width="100%" cellpadding="0" class="tblContent" > 
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
	init();
	function init(){				
		var userId = document.all("userId").value;
		var f = document.getElementById("dataFrame0");
		f.src = "userdatarefquery.cmd?userId="+userId+"&update=true";
		if ("<%=flag1%>"=="0"){
			tab1.doCardShow("card3");		
			var refreshId ="<%=refreshId%>";
			if(getTreeFrame().seltree!=null)
			getTreeFrame().seltree.refreshNodeById(refreshId); 
		}
	}
	tab1.doCardClick=function(card){
		if (card.id=="card3"){
			document.frames["dataFrame0"].dataResources.show();
			document.frames["dataFrame0"].dataResources.setSumText("");
		} 
		if (card.id=="card4"){
			struTypeRefList.show();
		} 
	}
	
	function selectStruId(){
		var row = struTypeRefList.getCurrentLine();
		var struType = struTypeRefList.getCellValue(row,1);
		var struId = struTypeRefList.getCellValue(row,6);
		//var rootId;
		//if(struType=="00")
		//	rootId = "<%=defaultStruTypeRootId%>";
		//else
		//	rootId = struTypeRefList.getCellValue(row,6);
		var url ="stru.cmd?method=getSelectRoot&struType="+struType+"&rootId="+struId+"&isCheckBox=0&isIncludeSelf=1&isTree=1&nevervote=1";
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
	function selectEmployId(){
		var departmentId = document.all("departmentId").value;
		var url ="stru.cmd?method=getSelectRoot&rootId="+departmentId+"&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1&isIncludeSubCorporation=0";      
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
		tab1.doCardShow("card4"); 
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
		document.frames["dataFrame0"].document.forms[0].action="userdataref.cmd?method=update";
		document.frames["dataFrame0"].document.forms[0].submit();
		document.forms[0].action ="user.cmd?method=updateForTable&struId="+"<%=struId%>"; 
		//document.forms[0].action ="user.cmd?method=update&refreshId="+"<%=refreshId%>";    
		document.forms[0].submit();
	
	}
function forReturn(){
    getMainFrame().location.href="userQuery.cmd?method=query&struId=<%=struId%>";
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
		var userId = document.all("userId").value;
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
		var userId = document.all("userId").value;
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
