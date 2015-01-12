<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ page import="net.mast.bsp.permit.pap.view.UserDataReferenceView;"%>
<%
	String corporationId = (String)request.getAttribute("corporationId");
	String userId = (String)request.getAttribute("userId");
	String dataResType = request.getParameter("dataResType");
	String update = request.getParameter("update");
	if (dataResType==null){
		dataResType = "";
	}
	String dataResourceName = request.getParameter("dataResourceName");
	if (dataResourceName==null){
		dataResourceName = "";
	}
	UserDataReferenceView view = new UserDataReferenceView();
%>
<HTML>
<HEAD>
<TITLE>�û����ݲο���Ӧ��ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
</HEAD>

<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<BODY style="margin:0">

<html:form action="userdatarefquery.cmd">
<table width="100%"  class="tblList">
<flex:search>
	<html:hidden name="userId" value="<%=userId%>"/>
	<html:hidden name="corporationId" value="<%=corporationId%>"/>
	<html:hidden name="update" value="<%=update%>"/>
	<tr>
	<td class="tdLeft">
	�ο����ͣ�<html:select name="dataResType" value="<%=dataResType%>">
	<html:option value=""></html:option>
	<html:options collection="dataResType" labelProperty="typeName" property="dataResType" />
	</html:select>
	��Դ���ƣ�<html:text name="dataResourceName" value="<%=dataResourceName%>"/>
	<flex:searchNoPageImg name="chaxun" action="userdatarefquery.cmd" image="search.gif"/>
	</td>
	<%
	if (update.equalsIgnoreCase("true")){
	%>
	<td align="right">
		<html:button name="btn.add" onclick="addRowDataResources()" value="����"></html:button>
		<html:button name="btn.delete" onclick="deleteRowDataResources()" value="ɾ��"></html:button>
	</td>
	<%}%>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="dataResources" height="300" isSubmit="true"> 
        <%
	    if (update.equalsIgnoreCase("true")){
	    %>
        <flex:checkboxCol property="dataResourceId" caption="ѡ��" width="40" name="primaryKey" sortName="userDataReferenceView.dataResourceId"></flex:checkboxCol>
        <%
	    }
        else{
        %>
        <flex:checkboxCol property="dataResourceId" caption="ѡ��" width="40" name="primaryKey" sortName="userDataReferenceView.dataResourceId" disabled="true"></flex:checkboxCol>
        <%}%>	
        <flex:flexCol property="dataResourceId" caption="��Դ����" style="display:none" sortName="userDataReferenceView.dataResourceId"></flex:flexCol>
        <flex:flexCol property="dataResourceName" caption="��Դ����" style="width:150px" sortName="userDataReferenceView.dataResourceName"></flex:flexCol>
        <flex:flexCol property="dataResType" caption="�ο�����ID" style="display:none" sortName="userDataReferenceView.dataResType"></flex:flexCol>
        <flex:flexCol property="typeName" caption="�ο�����" style="width:150px" sortName="userDataReferenceView.typeName"></flex:flexCol>
        <flex:flexCol property="isDefault" caption="�Ƿ�ȱʡ"  style="width:90px" canSort="false" sortName="userDataReferenceView.isDefault" showTitle="false" ></flex:flexCol>

        <flex:flexCol property="refId" caption="������" style="display:none" sortName="userDataReferenceView.refId"></flex:flexCol>
	    <flex:flexCol property="struId" caption="��֯�ṹ����" style="display:none" sortName="userDataReferenceView.struId"></flex:flexCol>
        <flex:flexCol property="struType" caption="��֯�ṹ����" style="display:none" sortName="userDataReferenceView.struType"></flex:flexCol>
</flex:flexgrid>
</html:form>

<script language="javascript">
if(document.body.clientHeight>0){
	dataResources.show();
	dataResources.setSumText("");
}

function doTextFocusInGrid(obj){
	var pobj=obj.parentElement.children[1];
	obj.style.display="none";
	pobj.style.display="block";
	pobj.children[0].focus();
}

function doSelBlurInGrid(obj){
	var nobj=obj.parentElement.parentElement.children[0];
	var opt=obj.options[obj.selectedIndex];
	nobj.value=opt.innerText;
	obj.parentElement.style.display="none";
	nobj.style.display="block";
}
function  myIsDefault(){
	var select = event.srcElement;
	var type = select.parentElement.parentElement.parentElement.previousSibling.previousSibling.children[0].innerText;
	var value = select.value;
	var struId = select.parentElement.parentElement.parentElement.nextSibling.nextSibling.children[0].innerText;
	if(value=="0") {
		alert("���ҽ���һ��ȱʡֵ��");
		select.options[0].selected =true;
		doSelBlurInGrid(select);
		return;
	}else {
		var selects = new Array();
		selects = document.all("isDefault");
		for (var i=0;i<selects.length;i++){
			var type1 = selects[i].parentElement.parentElement.parentElement.previousSibling.previousSibling.children[0].innerText;				
			var default1 = selects[i].options(selects[i].selectedIndex).text;			
			if(type1==type && default1=="��" && selects[i]!=select){
				selects[i].options[1].selected = true;
				doSelBlurInGrid(selects[i]);
				return ;
			}
		}		
	}	
  }
function addRowDataResources(){
	var rootId = "<%=corporationId%>"; 
	var userId = "<%=userId%>";
	var cmdUrl = "user.cmd&method=selectUserDataResRef&rootId="+rootId+"&isCheckBox=1&userId="+userId;
	var url ="jsp/help.jsp?url="+cmdUrl; 
	showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:610px;dialogHeight:384px");    
}
function deleteRowDataResources(){
    var sel=dataResources.getCheckLine();
    if(sel==""){
      alert("��ѡ��Ҫɾ���ļ�¼!");
    return false;
    }
    if (!confirm("���Ҫɾ��ѡ�еļ�¼�𣿴˲������ָܻ���")) {
   	     return;
   	 }
	document.forms[0].action="userdataref.cmd?method=delete";
	document.forms[0].submit();
	return;
} 
function refresh(){
	document.forms[0].action="userdatarefquery.cmd";
	document.forms[0].submit();
} 

</script>
</BODY>
</HTML>