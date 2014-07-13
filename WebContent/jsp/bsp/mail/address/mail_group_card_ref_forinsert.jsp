<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>�ʼ���ַ���鿨Ƭ����������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkMailGroupCardRef(){
var id = document.forms[0].id;
    if ( __isQuoteIn(id.value) )
    {
      alert("ID���ܺ������Ż�����");
      id.select();
      id.focus();
      return false;
    }
  if (trim(id.value)=="")
  {
    alert("������ID��");
    id.focus();
    return false;
  }
  id.value = trim(id.value) ;
 var groupId = document.forms[0].groupId;
  if (trim(groupId.value)=="")
  {
    alert("�������ַ����ID��");
    groupId.focus();
    return false;
  }
  groupId.value = trim(groupId.value) ;
 var cardId = document.forms[0].cardId;
  if (trim(cardId.value)=="")
  {
    alert("�������ַ��ƬID��");
    cardId.focus();
    return false;
  }
  cardId.value = trim(cardId.value) ;
  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="�ʼ���ַ���鿨Ƭ����������" >
	<bsp:containbutton onclick="forSave()" name="btn_insert" text="����" ></bsp:containbutton>
	<bsp:containbutton onclick="forSaveContinue()" name="btn_update" text="���沢����" ></bsp:containbutton>
	<bsp:containbutton onclick="forReset()" name="btn_detail" text="�ָ�" ></bsp:containbutton>
	<bsp:containbutton onclick="forReturn()" name="btn_delete" text="����" ></bsp:containbutton>


  <table width="100%" cellpadding="0" class="tblContent">  
                    <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_GROUP_CARD_REF.ID")%>��</td>
                    <td class="tdRight"><html:text name="id" property="id" size="30" maxlength="30" /><span id="id_span" class="xinghaoCss">*</span></td>
                    </tr>                    
                     <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_GROUP_CARD_REF.GROUP_ID")%>��</td>
                    <td class="tdRight"><html:select name="groupId" property="groupId" >
	                        <html:options collection="MAILGROUPCARDREF_GROUPID_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select><span id="groupId_span" class="xinghaoCss">*</span></td>
                    </tr>
                     <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_GROUP_CARD_REF.CARD_ID")%>��</td>
                    <td class="tdRight"><html:select name="cardId" property="cardId" >
	                        <html:options collection="MAILGROUPCARDREF_CARDID_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select><span id="cardId_span" class="xinghaoCss">*</span></td>
                    </tr>
   </table>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMailGroupCardRef()) return;	
  document.forms[0].action ="mailgroupcardref.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMailGroupCardRef()) return;
  document.forms[0].action ="mailgroupcardref.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mailgroupcardrefquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>