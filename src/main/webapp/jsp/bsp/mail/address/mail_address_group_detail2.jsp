<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.TREETITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script> 
</HEAD>
<%
	String groupId=(String)request.getAttribute("groupId");
	String struId=(String)request.getAttribute("struId");
%>
<BODY topmargin="10px">
<bsp:container title="从组织结构中导入组" >
	<bsp:containbutton onclick="forInsert()" name="btn_insert" text="继续导入" ></bsp:containbutton>
	<bsp:containbutton onclick="forReturn()" name="btn_return" text="取消导入" ></bsp:containbutton>
<html:form  name="frmList"  action="">

<span id="message"><html:messages/></span>
<fieldset class="FieldsetCss" style="width:100%"><legend>组织结构人员EMAIL信息</legend> 
  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">                                         
		<tr>
		<td class="TdLeft" width="20%"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_GROUP")%>：</td>
		<td class="tdRight" width="80%"><html:label name="addressName" property="addressName" size="30" /></td>
		</tr>                                    	
   </table>
</fieldset>
<fieldset class="FieldsetCss" style="width:100%"><legend>联系人列表</legend> 
  <table width="100%" cellpadding="0" class="tblContent">                                         
		<tr>
		<td>
		<grid:grid name="grid" property="mailGroupCardRefList" type="edit" height="350" width="100%"  hasSum="false">
  				
  				<grid:textCol property="cardName" name="cardName" caption='<%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_CARD1")%>' readonly="true" index="1" width="150"></grid:textCol>
  				<grid:textCol property="cardEmail" name="cardEmail" caption='<%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_EMAIL")%>' readonly="true" index="2" width="150"></grid:textCol>
		</grid:grid>
		</td>
		</tr>                                    	
   </table>
</fieldset>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
init();
function init()
{
	grid.show();
}
function forInsert(){
        //保证在提交之前用户只能点击按钮一次
        document.all("btn_insert").disabled=true;
        document.all("btn_return").disabled=true;
        document.forms[0].action="mailaddress.cmd?method=insertOrganToMailAddressGroup&addressGroupId=<%=groupId%>&struId=<%=struId%>";
		document.forms[0].submit();
}
function forReturn(){
       //保证在提交之前用户只能点击按钮一次
       document.all("btn_insert").disabled=true;
       document.all("btn_return").disabled=true;
       document.forms[0].action="mailaddress.cmd?method=impOrgToTeamRoot&primaryKey=<%=groupId%>";
       document.forms[0].submit();
}

</script>