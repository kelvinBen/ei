<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<HTML>
<HEAD>
<TITLE><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.TREETITLE")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script> 
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
	alert("您输入的地址类别名称超长，请重新填写！");
	categoryName.focus();   
	return false;
  }
  categoryName.value = trim(categoryName.value) ;
  return true;
}
function checkNameEmail()
{ var rowcount=grid.returnRowCount();
  for(var i=1;i<=rowcount;i++){
  var addressNameO=grid.getCellObject(i,2);
  var addressEmailO=grid.getCellObject(i,3);
  var addressName=addressNameO.value;
  var addressEmail=addressEmailO.value;
  if (trim(addressName)=="")
  {
    alert("请输入联系人姓名！");
    addressNameO.focus();
    return false;
  }
   if( __isQuoteIn( trim(addressName) ) )
  {
	alert("数据有误，请重新填写！");
    addressNameO.focus();
    return false;
  }
    if(byteLength(trim(addressName))>80)
  {
	alert("数据超长，请重新填写！");
	addressNameO.focus();  
	return false;
  }
  addressNameO.value = trim(addressName) ;

 if (trim(addressEmail)=="")
  {
    alert("请输入Email地址！");
    addressEmailO.focus();
    return false;
  }
  if( addressEmail != "" )
  {
	if( !__checkEmail(addressEmail) )
	{
		alert("请输入正确的EMAIL格式！");
		addressEmailO.focus();
		return false;
	}
  }
    if(byteLength(trim(addressEmail))>80)
  {
	alert("数据超长，请重新填写！");
	addressEmailO.focus();   
	return false;
  }
  addressEmailO.value = trim(addressEmail) ;
  }
  return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form name="frmList" action="">

<html:hidden name="categoryId" property="categoryId" write="false"/>
<bsp:container title="地址类别信息" >
	<bsp:containbutton onclick="forSave()" name="btn_insert" text="保存" ></bsp:containbutton>


<fieldset class="FieldsetCss" style="width:100%"><legend>地址类别名称</legend> 
  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">
                    <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.CATEGORY_NAME")%>：</td>
                    <td class="TdRight"><html:text name="categoryName" property="categoryName" size="30" maxlength="80"/><span id="categoryName_span" class="xinghaoCss">*</span></td>
                    </tr>
       </table>
 </fieldset>


	<bsp:containbutton onclick="addCard()" name="btn_add" text="增加" ></bsp:containbutton>
	<bsp:containbutton onclick="delCard()" name="btn_del" text="删除" ></bsp:containbutton>

<fieldset class="FieldsetCss"><legend>联系人列表</legend> 
  <table width="100%" cellpadding="0" class="tblContent">                                         
		<tr>
		<td>
		<grid:grid name="grid" property="mailList" type="edit" height="350"  hasSum="false">
  				
  				<grid:primaryKeyCol  property="addressId" name="addressId" caption="地址编码" width="100" index="1" ></grid:primaryKeyCol> 
  				<grid:textCol property="addressName" name="addressName" caption='联系人姓名' readonly="false"  index="2" width="150" ></grid:textCol>
  				<grid:textCol property="addressEmail" name="addressEmail" caption='邮箱地址' readonly="false"  index="3" width="150" ></grid:textCol>
				<grid:hideCol property="addressType" name="addressType" caption="" readonly="true" index="4" width="50"></grid:hideCol>
				<grid:hideCol property="categoryId" name="categoryId" caption="" readonly="true" index="5" ></grid:hideCol>		
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
grid.show();
function forSave()
{ if(!checkMailAddressCategory())return;
if(checkNameEmail()){
  //保证在提交之前用户只能点击按钮一次
  document.all("btn_insert").disabled=true;
  document.all("btn_add").disabled=true;
  document.all("btn_del").disabled=true;
  document.forms[0].action ="mailaddresscategory.cmd?method=update";
  document.forms[0].submit();	
  }
}
function addCard()
{
 grid.addRow();
}
function delCard()
{
  if(grid.getCurrentLine()!=null){
	if(!confirm('<%=ResourcesFactory.getString("query.delconfirm")%>'))return;
        grid.delRow();
   }
   else {
   	alert("请选择要删除的记录！");
   }
}
</script>