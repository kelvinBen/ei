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
function checkMailAddress(){
 var addressName = document.forms[0].addressName;
  if (trim(addressName.value)=="")
  {
    alert("请输入地址分组名称！");
    addressName.focus();
    return false;
  }
  if( __isQuoteIn( trim(addressName.value) ) )
  {
	alert("数据有误，请重新填写！");
    addressName.focus();
    return false;
  }
   if(byteLength(trim(addressName.value))>80)
  {
	alert("数据超长，请重新填写！");
	addressName.focus();   
	return false;
  }
  addressName.value = trim(addressName.value) ;
  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<span id="message"><html:messages/></span>

<html:hidden name="addressId" property="addressId" write="false"/>	
<html:hidden name="addressType" property="addressType" write="false"/>	
<html:hidden name="categoryId" property="categoryId" write="false"/>
<bsp:container title="地址分组信息" >
<bsp:containbutton onclick="forSave()" name="btn_insert" text="保存" ></bsp:containbutton>
<fieldset class="FieldsetCss" style="width:100%"><legend>地址分组名称</legend> 
  <table width="100%" cellspacing="0" cellpadding="0" class="tblContent">                                         
		<tr>
		<td class="TdLeft" width="20%"><%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_GROUP")%>：</td>
		<td class="tdRight" width="80%"><html:text name="addressName" property="addressName" size="30"/><span id="addressName_span" class="xinghaoCss">*</span></td>
		</tr>                                    	
   </table>
</fieldset>
<fieldset class="FieldsetCss" style="width:100%"><legend>联系人列表</legend> 
	<bsp:containbutton onclick="addCard()" name="btn_add" text="增加" ></bsp:containbutton>
	<bsp:containbutton onclick="delCard()" name="btn_detail" text="删除" ></bsp:containbutton>
  <table width="100%" cellpadding="0" class="tblContent">                                         
		<tr>
		<td>
		<grid:grid name="grid" property="mailGroupCardRefList" type="edit" height="350"  hasSum="false">
  				<grid:checkboxCol property="id" name="id" caption="选择" index="1" ></grid:checkboxCol>
  				<grid:textCol property="cardName" name="cardName" caption='<%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_NAME_CARD1")%>' readonly="true" index="2" width="150"></grid:textCol>
  				<grid:textCol property="cardEmail" name="cardEmail" caption='<%=ResourcesFactory.getString("MAIL_ADDRESS.ADDRESS_EMAIL")%>' readonly="true" index="3" width="150"></grid:textCol>
				<grid:hideCol property="cardId" name="cardId" caption="联系人编号" readonly="true" index="4" width="50"></grid:hideCol>
				<grid:hideCol property="groupId" name="groupId" caption="地址分组编号" readonly="true" index="5" ></grid:hideCol>		
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
function addCard()
{
	var url ="mailaddress.cmd?method=gettreeroot_category_card"; 
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:520px;dialogHeight:420px");
	if( win==null || win[0]=="" ) return;
	//删除原来的列表
	var checkboxArr = document.getElementsByName( "mailGroupCardRefList.id" );
	if( checkboxArr.length > 1 )
	{
		for( var i = checkboxArr.length - 1 ; i >= 1 ; i -- )
		{
			checkboxArr[ i ].checked = true;
		}
		grid.delCheckRow( '1' );
	}
	
	var cardInfoArr = null;
	var cardId = "";
	var cardName = "";
	var cardEmail = "";
	for( var i = 0 ; i < win.length ; i ++ )
	{
		cardInfoArr = new Array();
		cardInfoArr = win[ i ].split( ";" );

	    cardId = "";
	    cardName = "";
	    cardEmail = "";

	    cardId = cardInfoArr[ 0 ];
	    cardName = cardInfoArr[ 2 ];
		cardEmail = cardInfoArr[ 3 ];
		var row = grid.returnRowCount()+1;
		grid.addRow();
		
		grid.setCellValue(row,1,"");
	    grid.setCellValue(row,2,cardName);
	    grid.setCellValue(row,3,cardEmail);
	    grid.setCellValue(row,4,cardId);
	    grid.setCellValue(row,5,"");
	}
}
function delCard()
{
  if( !getDelete() )
	  return ;
  grid.delCheckRow( '1' );
}
function getDelete()
{
	var sel=grid.getCheckAll();
	if(sel=="")
	{
		alert("请选择要删除的纪录！");
		return false;
	}
	 if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) 
	{
		return false;
	}  
	return true;
}
function forSave(){
  if(!checkMailAddress()) return;
  //保证在提交之前用户只能点击按钮一次
  document.all("btn_insert").disabled=true;
  document.forms[0].action ="mailaddress.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mailaddressquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>