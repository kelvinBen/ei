<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.TREETITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script> 
</HEAD>
<BODY topmargin="10px">
<%
	String noRefresh = request.getParameter( "noRefresh" );
	//noRefresh=1:禁止刷新树；
	if( noRefresh == null )
		noRefresh = "0";
%>
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<html:hidden name="categoryId" property="categoryId" write="false"/>
<bsp:container title="地址类别信息" >
<span id="message"><html:messages/></span>
<fieldset class="FieldsetCss" style="width:100%"><legend>地址类别名称</legend> 
  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">
    <tr>
      <td class="TdLeft" width="20%"><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.CATEGORY_NAME")%>：</td>
      <td class="TdRight" width="80%"><html:hidden name="categoryName" property="categoryName" write="true"/></td>
    </tr>
  </table>
</fieldset>
<fieldset class="FieldsetCss" style="width:100%"><legend>联系人列表</legend> 
  <table width="100%" cellpadding="0" class="tblContent">                                         
		<tr>
		<td>
		<grid:grid name="grid" property="mailList" type="edit" height="350" width="100%" hasSum="false">
  			<grid:textCol property="addressName" name="addressName" caption='联系人姓名' readonly="true" index="1" width="150"></grid:textCol>
  			<grid:textCol property="addressEmail" name="addressEmail" caption='邮箱地址' readonly="true" index="2" width="150"></grid:textCol>
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
{       grid.show();
	var noRefresh = '<%=noRefresh%>';
	if( noRefresh != "1" )
	{
		//刷新根节点,根节点生成时默认nodeId=0
		top.contents.new_date.refreshTreeNodeById("0");
	}
}
function forUpdate(){
  document.all("primaryKey").value=document.all("categoryId").value;
  document.forms[0].action ="mailaddresscategory.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mailaddresscategoryquery.cmd";
  document.forms[0].submit();	
}
</script>