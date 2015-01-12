<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%
    String userId = request.getParameter("searchUserId");
    if(userId==null)
		userId="";
	String userName = request.getParameter("userName");
	if(userName==null)
		userName="";
		
	String departmentName = request.getParameter("departmentName");
	if(departmentName==null)
		departmentName="";

	String  selectDepartmentId=request.getParameter("selectDepartmentId");
	if(selectDepartmentId==null)
		selectDepartmentId="";

    String roleId = request.getParameter("roleId");
    if(roleId==null)
		roleId="";	
	String struId = (String)request.getAttribute("struId");
	String url = "userQuery.cmd?method=query&struId="+struId;
%>

<HTML>
<HEAD>
<TITLE>��ѯ�û�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css_xp4.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>

<bsp:container title="��ѯ�û�" >
<bsp:containbutton onclick="forUpdate()" text="�޸�" action="user.cmd?method=forupdateForTable"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()" text="��ϸ" action="user.cmd?method=detailForTable"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="">
<input type="hidden" name="struId" value="<%=struId%>">
<table id="tblSearch">
<flex:search>
	<tr>
		<td>��&nbsp;&nbsp����</td>
		<td><flex:searchText name="searchUserId" searchName="PUB_USERS.USER_ID" dataType="java.lang.String" operSymbol="=" value="<%=userId%>" size="15">
		</flex:searchText></td>
		<td>�������ţ�</td>
		<!--�����򣬱������beforDepartmentId-->

		<td><flex:searchHidden name="selectDepartmentId" searchName="PUB_USERS.DEPARTMENT_ID" dataType="java.lang.String" operSymbol="=" value="<%=selectDepartmentId%>" >
		</flex:searchHidden>
		<flex:searchText name="departmentName" searchName="PUB_USERS.DEPARTMENT_NAME" dataType="java.lang.String" operSymbol="=" value="<%=departmentName%>" readonly="true" size="30">
		</flex:searchText><img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectDepartment()">
		</td>
	</tr>
	<tr>
		<td>��������</td>
		<td><flex:searchText name="userName" searchName="PUB_USERS.USER_NAME" dataType="java.lang.String" operSymbol="=" value="<%=userName%>" size="15">
		</flex:searchText></td>
		<td>��&nbsp;&nbsp;&nbsp;&nbspɫ��</td>
		<td><flex:searchSelect name="roleId" searchName="PUB_USERS.ROLE" dataType="java.lang.String" operSymbol="=" value="<%=roleId%>">
	    		<option value="">ȫ��</option>
	        	<html:options collection="allRoleList" labelProperty="roleAlias" property="roleId"/>
		     </flex:searchSelect>
		</td>
		<td>&nbsp;&nbsp;<flex:searchNoPageImg name="chaxun" imgClick="if(forA()) return false;" action="<%=url%>" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
                <flex:radioCol caption="ѡ��" width="40" property="userId"  name="userId" sortName="PUB_USERS.USER_ID"></flex:radioCol>
  				<flex:flexCol caption="�ʻ�" width="100" property="userId" style="text-align:left" sortName="PUB_USERS.USER_ID"></flex:flexCol>
				<flex:flexCol caption="������" width="100" property="userName" style="text-align:left" sortName="PUB_USERS.USER_NAME"></flex:flexCol>
				<flex:flexCol caption="�ʻ�״̬" width="100" property="accountStatusName" style="text-align:left" sortName="PUB_USERS.ACCOUNT_STATUS"></flex:flexCol>
</flex:flexgrid>
</html:form>
</bsp:container>
</body>
</html>
<script language="javascript">
function forA(){
	if(!checkCondition()) return true;
}
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="user.cmd?method=detailForTable&userId="+id+"&struId=<%=struId%>";
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");

function checkCondition(){
	 if ( __isQuoteIn(document.forms[0].searchUserId.value) )
		  {
		    alert("�ʻ����Ʋ��ܺ��������ַ���");
		    document.forms[0].searchUserId.select();
		    document.forms[0].searchUserId.focus();
		    return false;
		  }
		  if ( __isQuoteIn(document.forms[0].userName.value) )
		  {
		    alert("���������ܺ��������ַ���");
		    document.forms[0].userName.select();
		    document.forms[0].userName.focus();
		    return false;
		  }
	return true;
	}
	
function selectDepartment(){
    var url ="stru.cmd?method=getSelectRoot&rootId="+"<%=struId%>"+"&organType=1,2&showOrganType=2&isCheckBox=0&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=0";
    var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
    if(win==null)
       return;
    if(win[0]=="") return;
    document.all("selectDepartmentId").value=win[2];
    document.all("departmentName").value=win[1];
}
function forUpdate(){
    if(!getSelect()) return;
    document.forms[0].action ="user.cmd?method=forupdateForTable&struId="+"<%=struId%>";    
    document.forms[0].submit();	
}
function forDelete(){
    if(!getDelete()) return;
    document.forms[0].action ="user.cmd?method=deleteForTable";    
    document.forms[0].submit();	
}
function forDetail(){
    if(!getSelect()) return;
    document.forms[0].action ="user.cmd?method=detailForTable&struId="+"<%=struId%>";    
    document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("��ѡ��һ����¼!");
    return false;
  }  
 
  return true;
}
function getDelete(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��Ҫɾ���ļ�¼!");
    return false;
  }
  if (!confirm("���Ҫɾ��ѡ�еļ�¼�𣿴˲������ָܻ���")) {
   	     return false;
   	     }  
  return true;
}
</script>