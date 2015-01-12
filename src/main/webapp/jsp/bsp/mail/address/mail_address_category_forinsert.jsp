<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.TREETITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkMailAddressCategory()
{
 var categoryName = document.forms[0].categoryName;
  if (trim(categoryName.value)=="")
  {
    alert("请输入地址类别名称！");
    categoryName.focus();
    return false;
  }
  if( __isQuoteIn( trim(categoryName.value) ) )
  {
	alert("数据有误，请重新填写！");
    categoryName.focus();
    return false;
  }
  if(byteLength(trim(categoryName.value))>80)
  {
	alert("数据超长，请重新填写！");
	categoryName.focus();   
	return false;
  }
  categoryName.value = trim(categoryName.value) ;
  return true;
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="增加地址类别" >
	<bsp:containbutton onclick="forSave()" name="btn_insert" text="保存" ></bsp:containbutton>

<span id="message"><html:messages/></span>
<fieldset class="FieldsetCss"><legend>地址类别信息</legend> 
  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">  
                    <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.CATEGORY_NAME")%>：</td>
                    <td class="tdRight"><html:text name="categoryName" property="categoryName" size="30" maxlength="80" /><span id="categoryName_span" class="xinghaoCss">*</span></td>
                    </tr>                    
   </table>
</fieldset>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave()
{
  if(!checkMailAddressCategory()) 
	  return;	
  //保证在提交之前用户只能点击按钮一次
  document.all("btn_insert").disabled=true;
  document.forms[0].action ="mailaddresscategory.cmd?method=insert";
  document.forms[0].submit();	
}
function forReturn()
{
  document.forms[0].action ="mailaddresscategoryquery.cmd";
  document.forms[0].submit();	
}

</script>