<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>������������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkProposalReview(){
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
	  alert("�����밸��ID��");    
	  proposalid.focus();
	  return false;
	}
    proposalid.value = trim(proposalid.value) ;
  	  var reviewor = document.forms[0].reviewor;
      if (trim(reviewor.value)=="")
	{
	  alert("����������ˣ�");    
	  reviewor.focus();
	  return false;
	}
    reviewor.value = trim(reviewor.value) ;
  	  var revieworid = document.forms[0].revieworid;
      if (trim(revieworid.value)=="")
	{
	  alert("�����������userid��");    
	  revieworid.focus();
	  return false;
	}
    revieworid.value = trim(revieworid.value) ;
  	  var reviewcomment = document.forms[0].reviewcomment;
      if (trim(reviewcomment.value)=="")
	{
	  alert("��������������");    
	  reviewcomment.focus();
	  return false;
	}
    reviewcomment.value = trim(reviewcomment.value) ;
  	  var reviewtime = document.forms[0].reviewtime;
	  var reviewstate = document.forms[0].reviewstate;
	  var superior = document.forms[0].superior;
	  var superiorid = document.forms[0].superiorid;
	  var reviewnode = document.forms[0].reviewnode;
    if (! __isFloat(reviewnode.value) )   
    {
      alert("��˻��ڲ��ǺϷ�������");
      reviewnode.focus();
      return false;
    }   
	  var note = document.forms[0].note;
	  var note2 = document.forms[0].note2;
	  var note3 = document.forms[0].note3;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="������������" >
<bsp:containbutton action="proposalreview.cmd?method=insert" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="proposalreview.cmd?method=insertContinue" text="���沢����" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="proposalreviewquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
		<tr>	                   
<!-- ���� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.ID")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="id" property="id" size="35"  onblur="checkId(this);"  maxlength="36" /> </td>
<!-- ����ID -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.PROPOSALID")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="proposalid" property="proposalid" size="35"  maxlength="36" /> </td>
		</tr>
		<tr>	                   
<!-- ����� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWOR")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="reviewor" property="reviewor" size="35"  maxlength="100" /> </td>
<!-- �����userid -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWORID")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="revieworid" property="revieworid" size="35"  maxlength="36" /> </td>
		</tr>
		<tr>	                   
<!-- ������ -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWCOMMENT")%>��  <span style="color: red">*</span> 	</td>
					<td class="tdRight">
						<html:textarea name="reviewcomment" cols="35" style="width:75%" property="reviewcomment"/>
					</td>
<!-- ���ʱ�� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWTIME")%>�� 	</td>
                    <td class="tdRight"><html:text name="reviewtime" property="reviewtime" size="35"  maxlength="8" /> </td>
		</tr>
		<tr>	                   
<!-- ���״̬ -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWSTATE")%>�� 	</td>
                    <td class="tdRight">
                    	<html:select name="reviewstate" property="reviewstate" >
	                        <html:options collection="PROPOSALREVIEW_REVIEWSTATE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- �ϼ������ -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.SUPERIOR")%>�� 	</td>
                    <td class="tdRight"><html:text name="superior" property="superior" size="35"  maxlength="100" /> </td>
		</tr>
		<tr>	                   
<!-- �ϼ������ID -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.SUPERIORID")%>�� 	</td>
                    <td class="tdRight"><html:text name="superiorid" property="superiorid" size="35"  maxlength="36" /> </td>
<!-- ��˻��� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.REVIEWNODE")%>�� 	</td>
                    <td class="tdRight">
                    	<html:select name="reviewnode" property="reviewnode" >
	                        <html:options collection="PROPOSALREVIEW_REVIEWNODE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
		</tr>
		<tr>	                   
<!-- ��ע -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE")%>�� 	</td>
                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
<!-- NOTE2 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE2")%>�� 	</td>
                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
		</tr>
		<tr>	                   
<!-- NOTE3 -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REVIEW.NOTE3")%>�� 	</td>
                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="30" /> </td>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkProposalReview()) return;	
  document.forms[0].action ="proposalreview.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkProposalReview()) return;
  document.forms[0].action ="proposalreview.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposalreviewquery_page_init.cmd";
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
	var result= xmlhttp("proposalreview.cmd?method=isExist&primaryKey="+primaryKey);
	//alert(result);//�����ַ���Ϊ��ʱ����ʾ������û��ʹ��
	if(result!=""){
		alert("�����Ѿ���ʹ�ã���ʹ���������룡");
		obj.focus();
		obj.value="";
	}
}

</script>