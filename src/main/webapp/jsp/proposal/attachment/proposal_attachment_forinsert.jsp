<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>�᰸/���ĸ���������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkProposalAttachment(){
	  var id = document.forms[0].id;
  	  if ( __isQuoteIn(id.value) )
	  {
	    alert("�������ܺ������Ż�����!");
	    id.select();
	    id.focus();
	    return false;
	  }
      if (trim(id.value)=="")
	{
	  alert("������������");    
	  id.focus();
	  return false;
	}
    id.value = trim(id.value) ;
  	  var foreignid = document.forms[0].foreignid;
      if (trim(foreignid.value)=="")
	{
	  alert("�������᰸/����id��");    
	  foreignid.focus();
	  return false;
	}
    foreignid.value = trim(foreignid.value) ;
  	  var filename = document.forms[0].filename;
	  var filepath = document.forms[0].filepath;
	  var note = document.forms[0].note;
	  var note2 = document.forms[0].note2;
	  var note3 = document.forms[0].note3;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="�᰸/���ĸ���������" >
<bsp:containbutton action="proposalattachment.cmd?method=insert" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="proposalattachment.cmd?method=insertContinue" text="���沢����" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="proposalattachmentquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
		<tr>	                   
<!-- ���� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.ID")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="id" property="id" size="35"  onblur="checkId(this);"  maxlength="36" /> </td>
<!-- �᰸/����id -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.FOREIGNID")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="foreignid" property="foreignid" size="35"  maxlength="36" /> </td>
		</tr>
		<tr>	                   
<!-- �������� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.FILENAME")%>�� 	</td>
                    <td class="tdRight"><html:text name="filename" property="filename" size="35"  maxlength="255" /> </td>
<!-- ����·�� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.FILEPATH")%>�� 	</td>
					<td class="tdRight">
						<html:textarea name="filepath" cols="35" style="width:75%" property="filepath"/>
					</td>
		</tr>
		<tr>	                   
<!-- ��ע -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.NOTE")%>�� 	</td>
                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
<!-- NOTE2 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.NOTE2")%>�� 	</td>
                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
		</tr>
		<tr>	                   
<!-- NOTE3 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_ATTACHMENT.NOTE3")%>�� 	</td>
                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="30" /> </td>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkProposalAttachment()) return;	
  document.forms[0].action ="proposalattachment.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkProposalAttachment()) return;
  document.forms[0].action ="proposalattachment.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposalattachmentquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function ctlent(event) {
	if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {
			forSave();
			return;
	}
}
//��������Ƿ��Ѿ���ʹ��, �ù���Ŀǰֻ֧�ֵ���������������Ҫ�޸�
function checkId(obj){
	var primaryKey= obj.value;
	if(primaryKey=="")
		return ;
	var result= xmlhttp("proposalattachment.cmd?method=isExist&primaryKey="+primaryKey);
	//alert(result);//�����ַ���Ϊ��ʱ����ʾ������û��ʹ��
	if(result!=""){
		alert("�����Ѿ���ʹ�ã���ʹ���������룡");
		obj.focus();
		obj.value="";
	}
}

</script>