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
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script> 
</HEAD>
<%
	String noRefresh = request.getParameter( "noRefresh" );
	//noRefresh=1:��ֹˢ������
	if( noRefresh == null )
		noRefresh = "0";
%>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<html:hidden name="addressId" property="addressId" write="false"/>	
<html:hidden name="addressType" property="addressType" write="false"/>	
<html:hidden name="categoryId" property="categoryId" write="false"/>

<span id="message"><html:messages/></span>
<bsp:container title="��ַ������Ϣ" >
<fieldset class="FieldsetCss" style="width:100%"><legend>��ַ��������</legend> 
  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">                                         
		<tr>
		<td class="TdLeft" width="20%"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_GROUP")%>��</td>
		<td class="tdRight" width="80%"><html:label name="addressName" property="addressName" size="30" /></td>
		</tr>                                    	
   </table>
</fieldset>
<fieldset class="FieldsetCss" style="width:100%"><legend>��ϵ���б�</legend> 
  <table width="100%" cellpadding="0" class="tblContent">                                         
		<tr>
		<td>
		<grid:grid name="grid" property="mailGroupCardRefList" type="edit" height="350" width="100%"  hasSum="false">
  				
  				<grid:textCol property="cardName" name="cardName" caption='<%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_CARD1")%>' readonly="true" index="1" width="150"></grid:textCol>
  				<grid:textCol property="cardEmail" name="cardEmail" caption='<%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_EMAIL")%>' readonly="true" index="2" width="150"></grid:textCol>
				<grid:hideCol property="cardId" name="cardId" caption="��ϵ�˱��" readonly="true" index="3" width="50"></grid:hideCol>
				<grid:hideCol property="groupId" name="groupId" caption="��ַ������" readonly="true" index="4" ></grid:hideCol>		
		</grid:grid>
		</td>
		</tr>                                    	
   </table>
</fieldset>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
init();
function init()
{
	grid.show();
	var noRefresh = '<%=noRefresh%>';
	if( noRefresh != "1" )
	{
		var categoryId = document.all( "categoryId" ).value;
		if( categoryId == "" ) categoryId = "0";
		//ˢ�¸��ڵ�,���ڵ�����ʱĬ��nodeId=0
		top.contents.new_date.refreshTreeNodeById( categoryId );
	}
}
function forUpdate(){
  document.all("primaryKey").value=document.all("addressId").value;
  document.forms[0].action ="mailaddress.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mailaddressquery.cmd";
  document.forms[0].submit();	
}
</script>