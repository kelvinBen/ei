<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>�᰸���۱�����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkProposalComment(){
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
  	  var proposalid = document.forms[0].proposalid;
      if (trim(proposalid.value)=="")
	{
	  alert("�������᰸id��");    
	  proposalid.focus();
	  return false;
	}
    proposalid.value = trim(proposalid.value) ;
  	  var name = document.forms[0].name;
	  var content = document.forms[0].content;
	  var state = document.forms[0].state;
	  var suggest = document.forms[0].suggest;
	  var reviewor = document.forms[0].reviewor;
	  var revieworid = document.forms[0].revieworid;
	  var reviewtime = document.forms[0].reviewtime;
	  var time = document.forms[0].time;
	  var title = document.forms[0].title;
	  var note = document.forms[0].note;
	  var note2 = document.forms[0].note2;
	  var note3 = document.forms[0].note3;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="�᰸���۱�����" >
<bsp:containbutton action="proposalcomment.cmd?method=insert" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="proposalcomment.cmd?method=insertContinue" text="���沢����" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="proposalcommentquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
		<tr>	                   
<!-- ���� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.ID")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="id" property="id" size="35"  onblur="checkId(this);"  maxlength="36" /> </td>
<!-- �᰸id -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.PROPOSALID")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="proposalid" property="proposalid" size="35"  maxlength="36" /> </td>
		</tr>
		<tr>	                   
<!-- ���� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NAME")%>�� 	</td>
                    <td class="tdRight"><html:text name="name" property="name" size="35"  maxlength="80" /> </td>
<!-- �������� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.CONTENT")%>�� 	</td>
					<td class="tdRight">
						<html:textarea name="content" cols="35" style="width:75%" property="content"/>
					</td>
		</tr>
		<tr>	                   
<!-- ���״̬ -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.STATE")%>�� 	</td>
                    <td class="tdRight">
                    	<html:select name="state" property="state" >
	                        <html:options collection="PROPOSALCOMMENT_STATE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- ������ -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.SUGGEST")%>�� 	</td>
					<td class="tdRight">
						<html:textarea name="suggest" cols="35" style="width:75%" property="suggest"/>
					</td>
		</tr>
		<tr>	                   
<!-- ����� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWOR")%>�� 	</td>
                    <td class="tdRight"><html:text name="reviewor" property="reviewor" size="35"  maxlength="100" /> </td>
<!-- �����id -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWORID")%>�� 	</td>
                    <td class="tdRight"><html:text name="revieworid" property="revieworid" size="35"  maxlength="36" /> </td>
		</tr>
		<tr>	                   
<!-- ���ʱ�� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.REVIEWTIME")%>�� 	</td>
                    <td class="tdRight"><html:text name="reviewtime" property="reviewtime" size="35"  maxlength="8" /> </td>
<!-- ����ʱ�� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.TIME")%>�� 	</td>
                    <td class="tdRight"><html:text name="time" property="time" size="35"  maxlength="8" /> </td>
		</tr>
		<tr>	                   
<!-- �᰸��Ŀ -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.TITLE")%>�� 	</td>
                    <td class="tdRight"><html:text name="title" property="title" size="35"  maxlength="100" /> </td>
<!-- ��ע -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE")%>�� 	</td>
                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
		</tr>
		<tr>	                   
<!-- NOTE2 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE2")%>�� 	</td>
                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
<!-- NOTE3 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_COMMENT.NOTE3")%>�� 	</td>
                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="30" /> </td>
		</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkProposalComment()) return;	
  document.forms[0].action ="proposalcomment.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkProposalComment()) return;
  document.forms[0].action ="proposalcomment.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposalcommentquery_page_init.cmd";
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
	var result= xmlhttp("proposalcomment.cmd?method=isExist&primaryKey="+primaryKey);
	//alert(result);//�����ַ���Ϊ��ʱ����ʾ������û��ʹ��
	if(result!=""){
		alert("�����Ѿ���ʹ�ã���ʹ���������룡");
		obj.focus();
		obj.value="";
	}
}

</script>