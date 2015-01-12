<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.TREETITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<%
	String noRefresh = request.getParameter( "noRefresh" );
	//noRefresh=1:禁止刷新树；
	if( noRefresh == null )
		noRefresh = "0";
	//判断查询联系人-修改联系人-保存后的明细页面的返回
	String personBack = request.getParameter( "personBack" );
	if( personBack == null ) personBack = "";
	String addressType = "";
	String addressName = "";
	String addressEmail = "";
	if( "1".equals( personBack ) )//从查询联系人页面过来
	{
		noRefresh="1";
		addressType = request.getParameter( "addressType_1" );
		if( addressType == null ) addressType = "";
		addressName = request.getParameter( "addressName_1" );
		if( addressName == null ) addressName = "";
		addressEmail = request.getParameter( "addressEmail_1" );
		if( addressEmail == null ) addressEmail = "";
	}
%>
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<html:hidden name="addressId" property="addressId" write="false"/>	
<html:hidden name="addressType" property="addressType" write="false"/>	
<html:hidden name="categoryId" property="categoryId" write="false"/>

<html:hidden name="personBack" value="<%=personBack%>" write="false"/>
<html:hidden name="addressType_1" value="<%=addressType%>" write="false"/>
<html:hidden name="addressName_1" value="<%=addressName%>" write="false"/>
<html:hidden name="addressEmail_1" value="<%=addressEmail%>" write="false"/>

<bsp:container title="联系人信息" >
<%
	if( "1".equals( personBack ) )//从查询联系人页面过来
	{
%>
	<bsp:containbutton onclick="forReturn()" name="btn_insert" text="返回" action=""></bsp:containbutton>
<%
	}	
%>


  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">

    <tr>
      <td class="TdLeft" width="20%"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_CARD")%>：</td>
      <td class="TdRight" width="80%"><html:hidden name="addressName" property="addressName" write="true"/></td>
    </tr>
    <tr>
      <td class="TdLeft" width="20%"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_EMAIL")%>：</td>
      <td class="TdRight" width="80%"><html:hidden name="addressEmail" property="addressEmail" write="true"/></td>
    </tr>

  </table>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
init();
function init()
{
	var noRefresh = '<%=noRefresh%>';
	if( noRefresh != "1" )
	{
	var categoryId = document.all( "categoryId" ).value;
	if( categoryId == "" ) categoryId = "0";
	//刷新父节点,根节点生成时默认nodeId=0
	top.contents.new_date.refreshTreeNodeById( categoryId );
	}
}

function forUpdate(){
  document.all("primaryKey").value=document.all("addressId").value;
  document.forms[0].action ="mailaddress.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){   //window.location.href="mailaccountgeneryquery.cmd?addressType=<%=addressType%>&addressName=<%=addressName%>&addressEmail=<%=addressEmail%>";	
  document.forms[0].action ="mailaccountgeneryquery.cmd";
  document.forms[0].submit();	
}
</script>