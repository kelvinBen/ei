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
    alert("�������ַ������ƣ�");
    categoryName.focus();
    return false;
  }
  if( __isQuoteIn( trim(categoryName.value) ) )
  {
	alert("����������������д��");
    categoryName.focus();
    return false;
  }
  if(byteLength(trim(categoryName.value))>80)
  {
	alert("���ݳ�������������д��");
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
<bsp:container title="���ӵ�ַ���" >
	<bsp:containbutton onclick="forSave()" name="btn_insert" text="����" ></bsp:containbutton>

<span id="message"><html:messages/></span>
<fieldset class="FieldsetCss"><legend>��ַ�����Ϣ</legend> 
  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">  
                    <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.CATEGORY_NAME")%>��</td>
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
  //��֤���ύ֮ǰ�û�ֻ�ܵ����ťһ��
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