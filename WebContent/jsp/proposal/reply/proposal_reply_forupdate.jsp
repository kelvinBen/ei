<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>���ɸ����޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkProposalReply(){
	var proposalid = document.forms[0].proposalid;
  	if (trim(proposalid.value)=="")
	{
	  alert("�����밸��ID��");   
	  proposalid.focus(); 
	  return false;
	}
    proposalid.value = trim(proposalid.value) ;
      	var caseno = document.forms[0].caseno;
  	if (trim(caseno.value)=="")
	{
	  alert("�����밸�ţ�");   
	  caseno.focus(); 
	  return false;
	}
    caseno.value = trim(caseno.value) ;
      	var digest = document.forms[0].digest;
	var content = document.forms[0].content;
	var word = document.forms[0].word;
	var year = document.forms[0].year;
	var no = document.forms[0].no;
	var type = document.forms[0].type;
  	if (trim(type.value)=="")
	{
	  alert("�������࣡");   
	  type.focus(); 
	  return false;
	}
    type.value = trim(type.value) ;
      	var processdept = document.forms[0].processdept;
	var processdeptid = document.forms[0].processdeptid;
	var leader = document.forms[0].leader;
	var processor = document.forms[0].processor;
	var processdate = document.forms[0].processdate;
	var telephone = document.forms[0].telephone;
	var issuer = document.forms[0].issuer;
	var issueddate = document.forms[0].issueddate;
	var state = document.forms[0].state;
	var feedbackcomment = document.forms[0].feedbackcomment;
	var feedbackor = document.forms[0].feedbackor;
	var feedbackorid = document.forms[0].feedbackorid;
	var attitsatisfy = document.forms[0].attitsatisfy;
	var attitsatisfy = document.forms[0].attitsatisfy;
    if (! __isFloat(attitsatisfy.value) )   
    {
      alert("����̬������Ȳ��ǺϷ�������");
      attitsatisfy.focus();
      return false;
    }   
	var resultsatisfy = document.forms[0].resultsatisfy;
	var resultsatisfy = document.forms[0].resultsatisfy;
    if (! __isFloat(resultsatisfy.value) )   
    {
      alert("����������Ȳ��ǺϷ�������");
      resultsatisfy.focus();
      return false;
    }   
	var isfeedback = document.forms[0].isfeedback;
	var isfeedback = document.forms[0].isfeedback;
    if (! __isFloat(isfeedback.value) )   
    {
      alert("ίԱ�Ƿ������ǺϷ�������");
      isfeedback.focus();
      return false;
    }   
	var feedbacktime = document.forms[0].feedbacktime;
	var jbdate = document.forms[0].jbdate;
	var jsjy = document.forms[0].jsjy;
	var thly = document.forms[0].thly;
	var thjy = document.forms[0].thjy;
	var depttype = document.forms[0].depttype;
	var period = document.forms[0].period;
	var meeting = document.forms[0].meeting;
	var areaname = document.forms[0].areaname;
	var note = document.forms[0].note;
	var note2 = document.forms[0].note2;
	var note3 = document.forms[0].note3;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="���ɸ����޸�" >
<bsp:containbutton action="proposalreply.cmd?method=update" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="proposalreplyquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
<!-- ��� --><html:hidden name="id" property="id" write="false"/>                                      
					<tr>	                   
<!-- ����ID --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.PROPOSALID")%>��  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="proposalid" property="proposalid" size="35"  maxlength="36" /> </td>
<!-- ���� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.CASENO")%>��  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="caseno" property="caseno" size="35"  maxlength="32" /> </td>
					</tr>
					<tr>	                   
<!-- ����ժҪ --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.DIGEST")%>�� 	</td>

					<td class="tdRight">
						<html:textarea name="digest" cols="35" style="width:75%" property="digest"/>
					</td>
<!-- �������� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.CONTENT")%>�� 	</td>

					<td class="tdRight">
						<html:textarea name="content" cols="35" style="width:75%" property="content"/>
					</td>
					</tr>
					<tr>	                   
<!-- �� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.WORD")%>�� 	</td>

                    <td class="tdRight"><html:text name="word" property="word" size="35"  maxlength="20" /> </td>
<!-- �� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.YEAR")%>�� 	</td>

                    <td class="tdRight"><html:text name="year" property="year" size="35"  maxlength="10" /> </td>
					</tr>
					<tr>	                   
<!-- �� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.NO")%>�� 	</td>

                    <td class="tdRight"><html:text name="no" property="no" size="35"  maxlength="10" /> </td>
<!-- �� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.TYPE")%>��  <span style="color: red">*</span>   	</td>
                    <td class="tdRight">
                    	<html:select name="type" property="type" >
	                        <html:options collection="PROPOSALREPLY_TYPE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
					</tr>
					<tr>	                   
<!-- �а쵥λ --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.PROCESSDEPT")%>�� 	</td>

                    <td class="tdRight"><html:text name="processdept" property="processdept" size="35"  maxlength="100" /> </td>
<!-- �а쵥λID --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.PROCESSDEPTID")%>�� 	</td>

                    <td class="tdRight"><html:text name="processdeptid" property="processdeptid" size="35"  maxlength="36" /> </td>
					</tr>
					<tr>	                   
<!-- �а츺���� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.LEADER")%>�� 	</td>

                    <td class="tdRight"><html:text name="leader" property="leader" size="35"  maxlength="100" /> </td>
<!-- ��  ��  �� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.PROCESSOR")%>�� 	</td>

                    <td class="tdRight"><html:text name="processor" property="processor" size="35"  maxlength="100" /> </td>
					</tr>
					<tr>	                   
<!-- �а����� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.PROCESSDATE")%>�� 	</td>

                    <td class="tdRight"><html:text name="processdate" property="processdate" size="35"  maxlength="8" /> </td>
<!-- �����˵绰 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.TELEPHONE")%>�� 	</td>

                    <td class="tdRight"><html:text name="telephone" property="telephone" size="35"  maxlength="30" /> </td>
					</tr>
					<tr>	                   
<!-- ǩ  ��  �� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.ISSUER")%>�� 	</td>

                    <td class="tdRight"><html:text name="issuer" property="issuer" size="35"  maxlength="100" /> </td>
<!-- ǩ������ --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.ISSUEDDATE")%>�� 	</td>

                    <td class="tdRight"><html:text name="issueddate" property="issueddate" size="35"  maxlength="8" /> </td>
					</tr>
					<tr>	                   
<!-- �а�״̬ --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.STATE")%>�� 	</td>
                    <td class="tdRight">
                    	<html:select name="state" property="state" >
	                        <html:options collection="PROPOSALREPLY_STATE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- ������� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.FEEDBACKCOMMENT")%>�� 	</td>

					<td class="tdRight">
						<html:textarea name="feedbackcomment" cols="35" style="width:75%" property="feedbackcomment"/>
					</td>
					</tr>
					<tr>	                   
<!-- ������ --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.FEEDBACKOR")%>�� 	</td>

                    <td class="tdRight"><html:text name="feedbackor" property="feedbackor" size="35"  maxlength="100" /> </td>
<!-- ������ID --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.FEEDBACKORID")%>�� 	</td>

                    <td class="tdRight"><html:text name="feedbackorid" property="feedbackorid" size="35"  maxlength="36" /> </td>
					</tr>
					<tr>	                   
<!-- ����̬������� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.ATTITSATISFY")%>�� 	</td>

                    <td class="tdRight"><html:text name="attitsatisfy" property="attitsatisfy" size="35"  maxlength="1" /> </td>
<!-- ����������� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.RESULTSATISFY")%>�� 	</td>

                    <td class="tdRight"><html:text name="resultsatisfy" property="resultsatisfy" size="35"  maxlength="1" /> </td>
					</tr>
					<tr>	                   
<!-- ίԱ�Ƿ��� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.ISFEEDBACK")%>�� 	</td>

                    <td class="tdRight"><html:text name="isfeedback" property="isfeedback" size="35"  maxlength="1" /> </td>
<!-- ����ʱ�� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.FEEDBACKTIME")%>�� 	</td>

                    <td class="tdRight"><html:text name="feedbacktime" property="feedbacktime" size="35"  maxlength="8" /> </td>
					</tr>
					<tr>	                   
<!-- �������� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.JBDATE")%>�� 	</td>

                    <td class="tdRight"><html:text name="jbdate" property="jbdate" size="35"  maxlength="8" /> </td>
<!-- ���콨�� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.JSJY")%>�� 	</td>

					<td class="tdRight">
						<html:textarea name="jsjy" cols="35" style="width:75%" property="jsjy"/>
					</td>
					</tr>
					<tr>	                   
<!-- �˻����� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.THLY")%>�� 	</td>

					<td class="tdRight">
						<html:textarea name="thly" cols="35" style="width:75%" property="thly"/>
					</td>
<!-- �˻ظİ콨�� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.THJY")%>�� 	</td>

					<td class="tdRight">
						<html:textarea name="thjy" cols="35" style="width:75%" property="thjy"/>
					</td>
					</tr>
					<tr>	                   
<!-- �ظ���λ���� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.DEPTTYPE")%>�� 	</td>
                    <td class="tdRight">
                    	<html:select name="depttype" property="depttype" >
	                        <html:options collection="PROPOSALREPLY_DEPTTYPE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
<!-- ��� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.PERIOD")%>�� 	</td>

                    <td class="tdRight"><html:text name="period" property="period" size="35"  maxlength="30" /> </td>
					</tr>
					<tr>	                   
<!-- ���� --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.MEETING")%>�� 	</td>

                    <td class="tdRight"><html:text name="meeting" property="meeting" size="35"  maxlength="30" /> </td>
<!-- ������������ --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.AREANAME")%>�� 	</td>

                    <td class="tdRight"><html:text name="areaname" property="areaname" size="35"  maxlength="30" /> </td>
					</tr>
					<tr>	                   
<!-- ��ע --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.NOTE")%>�� 	</td>

                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
<!-- NOTE2 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.NOTE2")%>�� 	</td>

                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
					</tr>
					<tr>	                   
<!-- NOTE3 --><td class="tdTitle"><%=ResourcesFactory.getString("PROPOSAL_REPLY.NOTE3")%>�� 	</td>

                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="30" /> </td>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkProposalReply()) return;	
  document.forms[0].action ="proposalreply.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposalreplyquery_page_init.cmd";
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
</script>