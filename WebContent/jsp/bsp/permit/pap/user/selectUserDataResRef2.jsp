<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>

<%
    String rootId = (String)request.getAttribute("rootId");
    String userId = (String)request.getAttribute("userId");
    String isCheckBox = (String)request.getAttribute("isCheckBox");
    String isStru = request.getAttribute("isStru")==null?"":(String)request.getAttribute("isStru");
	String loginCorporationStruId = (String)request.getAttribute("loginCorporationStruId");
	String dataResType = request.getParameter("dataResType");
	if (dataResType==null){
		dataResType = "";
	}		
	String organCode = request.getParameter("organCode");
	if (organCode==null){
		organCode = "";
	}
	String organName = request.getParameter("organName");
	if (organName==null){
		organName="";
	}
	String struId = request.getParameter("struId");
	if (struId==null){
		struId="";
	}
	String corporationList = request.getParameter("corporationList");
	if (corporationList==null){
		corporationList = "";
	}else{
		loginCorporationStruId=corporationList;
	}	
%>	

<HTML>
<HEAD>
<TITLE>ѡ��������Դ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<BODY topmargin="10px">
<widgets:container title="������Դ" >
<widgets:containbutton onclick="clickOk()" text="ȷ��"></widgets:containbutton>
<widgets:containbutton onclick="clickCancel()" text="�ر�"></widgets:containbutton>
<html:form name="form1" action="">
	<html:hidden name="userId" value="<%=userId%>"/>
	<html:hidden name="isStru" value="<%=isStru%>"/>
	<div>
		<label style="white-space:nowrap">
			���ˣ�
			<html:select name="corporationList" value="<%=loginCorporationStruId%>">
			<html:options collection="corporationList" labelProperty="corporationStruName" property="corporationStruId" />
			</html:select></label>
			 <label style="white-space:nowrap">
		    �ο����ͣ�		 
			<html:select name="dataResType" value="<%=dataResType%>" >
			<html:options collection="dataResType" labelProperty="typeName" property="typeStru" />
			</html:select>
		</label>	
	</div>	
	<table id="tblSearch">
		<tr>
		<td>��֯���룺</td>
		<td><html:text name="organCode" value="<%=organCode%>" size="12" maxlength="30"/>&nbsp;&nbsp;</td>
		<td>��֯���ƣ�</td>
		<td><html:text name="organName" value="<%=organName%>" size="12" maxlength="30"/>&nbsp;&nbsp;</td>
		<td><flex:searchNoPageImg name="chaxun" action="javascript:search()" image="search.gif"/></td>
		</tr>
	</table>

<flex:flexgrid name="grid" height="250"  action="" isSubmit="true">
	<flex:checkboxCol caption="ѡ��" width="40" property="dataResourceId"  name="primaryKey" sortName="stru.struId"></flex:checkboxCol>
	<flex:flexCol property="dataResourceName" name="dataResourceName" caption="��Դ����" width="200"  style="text-align:left" canSort="false" sortName="stru.organName"></flex:flexCol>                          
	<flex:flexCol property="dataResourceNameUp" name="dataResourceNameUp" caption="��Դ�ϼ�����" width="200"  style="text-align:left" canSort="false" sortName="stru.organName"></flex:flexCol>                          
	<flex:flexCol property="dataResType" name="dataResType" caption="�ο�����ID" width="40"  style="display:none" sortName="stru.organId"></flex:flexCol> 
	<flex:flexCol property="typeName" name="typeName" caption="�ο�����" width="200"  style="display:none" sortName="stru.organId"></flex:flexCol> 
	<flex:flexCol property="struId" name="struId" caption="��֯�ṹ����" width="40"  style="display:none" sortName="stru.organId"></flex:flexCol> 
	<flex:flexCol property="struType" name="struType" caption="��֯�ṹ����" width="40"  style="display:none" sortName="stru.organId"></flex:flexCol>    
</flex:flexgrid>
<html:hidden name="dataResources1" value=""/>
<iframe style="display:none" name="dataFrame0"></iframe>
</html:form>
</widgets:container>
<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(1,"center");
grid.setTouAlign(2,"center");
document.onkeydown = keyDown;
function keyDown(){
	if(event.keyCode==13) {
		search();
	}
}
function search(){
	var temp = document.all("dataResType");
	var typeStru = temp.value;
	var typeName = temp.options[temp.selectedIndex].innerText;  
	
	var struIdTemp = document.all("corporationList");
	var struId = struIdTemp.value;
	var corporationStruName = struIdTemp.options[struIdTemp.selectedIndex].innerText;  
	var organCode = document.all("organCode").value;
	var organName = document.all("organName").value;
 
	document.forms[0].action="user.cmd?method=selectUserDataResRef&rootId="+"<%=rootId%>"+"&typeName="+typeName+"&isCheckBox="+"<%=isCheckBox%>"+"&struId="+struId;
	document.forms[0].submit();
} 
function clickOk(){
	var dataResources=grid.getCheckAll();
	if(dataResources==null) return;
	document.forms[0].dataResources1.value=dataResources;
	document.forms[0].action="userdataref.cmd?method=insert";
	document.forms[0].target="dataFrame0";
	document.forms[0].submit();
}

function clickCancel(){
	parent.close();
}
</script>