<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>ͨ��ѡ������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubComhelp(){
	  var helpId = document.forms[0].helpId;
  	  if ( __isQuoteIn(helpId.value) )
	  {
	    alert("������Ų��ܺ������Ż�����!");
	    helpId.select();
	    helpId.focus();
	    return false;
	  }
      if (trim(helpId.value)=="")
	{
	  alert("�����������ţ�");    
	  helpId.focus();
	  return false;
	}
    helpId.value = trim(helpId.value) ;
  	  var helpTitle = document.forms[0].helpTitle;
      if (trim(helpTitle.value)=="")
	{
	  alert("������������⣡");    
	  helpTitle.focus();
	  return false;
	}
    helpTitle.value = trim(helpTitle.value) ;
  	  var helpSql = document.forms[0].helpSql;
      if (trim(helpSql.value)=="")
	{
	  alert("��������ʾѡ���SQL��");    
	  helpSql.focus();
	  return false;
	}
    helpSql.value = trim(helpSql.value) ;
  	  var idField = document.forms[0].idField;
      if (trim(idField.value)=="")
	{
	  alert("������Ψһ��ʾ�ֶΣ�");    
	  idField.focus();
	  return false;
	}
    idField.value = trim(idField.value) ;
  	  var showField = document.forms[0].showField;
	  var returnField = document.forms[0].returnField;
	  var shearchField = document.forms[0].shearchField;
	  var showName = document.forms[0].showName;
	  var helpNote = document.forms[0].helpNote;
	  var datasource = document.forms[0].datasource;
	  var note = document.forms[0].note;
	  var note2 = document.forms[0].note2;
	  var note3 = document.forms[0].note3;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="ͨ��ѡ������" >
<bsp:containbutton action="pubcomhelp.cmd?method=insert" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="pubcomhelp.cmd?method=insertContinue" text="���沢����" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="pubcomhelpquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
		<tr>	                   
<!-- ������� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_ID")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="helpId" property="helpId" size="35"  onblur="checkId(this);"  maxlength="36" /> </td>
<!-- �������� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_TITLE")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="helpTitle" property="helpTitle" size="35"  maxlength="80" /> </td>
		</tr>
		<tr>	                   
<!-- ��ʾѡ���SQL -->
					<td class="tdTitle" ><%=ResourcesFactory.getString("PUB_COMHELP.HELP_SQL")%>��  <span style="color: red">* </span> 	</td>
					<td class="tdRight" colspan="3">
						<html:textarea name="helpSql" cols="35" style="width:75%;height:100px" property="helpSql"/>
					<span style="color: red"> <br/>
					(ע��SQL���������Ҫ��where,������ִ�в�ѯ�������ܳ���.
					<br/>�������룺select * from pub_cant where 1=1 ,���SQL��û��where ������ʱ�����,�����Ҫ���붯̬�Ĳ�ѯ����
					<br/> ��ôֻ��ҪSQL �аѸò����� @ @ ���������� �� ���� select * from pub_cant where CANT_CODE like '@CODE@%' 
					<br/> �����SQL ����˼�ͱ�ʾ���ڵ��õ�ǰѡ�������ʱ�򣬻��滻�� @CODE@ Ϊ��ǰ�����е� request.getParameter('CODE') ��ֵ,��ִ�����ݵ���ʾ��
					
					</span> 
					</td>
					</tr>
					<tr>
<!-- Ψһ��ʾ�ֶ� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.ID_FIELD")%>��  <span style="color: red">*</span> 	</td>
                    <td class="tdRight"><html:text name="idField" property="idField" size="35"  maxlength="50" /> </td>
<!-- �����ֶ� --><td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.NAME_FIELD")%>��  <span style="color: red">*</span>   	</td>
                    <td class="tdRight"><html:text name="nameField" property="nameField" size="35"  maxlength="50" /> </td>
		
		<tr>	                   
<!-- ��ʾ�ֶ� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.SHOW_FIELD")%>�� 	</td>
                    <td class="tdRight"><html:text name="showField" property="showField" size="35"  maxlength="300" /> </td>
<!-- �����ֶ� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.RETURN_FIELD")%>�� 	</td>
                    <td class="tdRight"><html:text name="returnField" property="returnField" size="35"  maxlength="300" /> </td>
		</tr>
		<tr>	                   
<!-- ��ѯ�����ֶ� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.SHEARCH_FIELD")%>�� 	</td>
                    <td class="tdRight"><html:text name="shearchField" property="shearchField" size="35"  maxlength="300" /> </td>

		</tr>
<tr>		
		<!-- �����ֶ���ʾ���� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.SHOW_NAME")%>�� 
					</td>
					<td class="tdRight" colspan="3">
						<html:textarea name="showName" cols="35" style="width:85%;height:40px" property="showName"/>
			<span style="text-align: center;color: red">
					<br>(˵������ʽ�� <br>�ֶ�1#��������#�еĿ��,�ֶ�2#��������#�еĿ��,...�ֶ�N#��������#�еĿ��
					<br>���� �еĿ�� ��Ϊ��,Ĭ��Ϊ100
					<br/>���磺CANT_CODE#����#,CANT_NAME#����#,SUPER_CODE#�ϼ�# )
					</span>	
					</td>
</tr>		
		<tr>	                   
<!-- �����õı��� --><td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_TABLE")%>��  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="helpTable" property="helpTable" size="35"  maxlength="40" /> </td>


<!-- ����Դ -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.DATASOURCE")%>�� 	</td>
                    <td class="tdRight"><html:text name="datasource" property="datasource" size="35"  maxlength="60" /> </td>
		</tr>
		<tr>	    
<!-- ˵�� -->
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_NOTE")%>�� 	</td>
                    <td class="tdRight" colspan="3"><html:text name="helpNote" property="helpNote" size="55" style="width:85%;"  maxlength="100" /> </td>
</tr>
 <!--              
 ��ע 
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE")%>�� 	</td>
                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="30" /> </td>
--><!-- NOTE2 
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE2")%>�� 	</td>
                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="30" /> </td>
		</tr>
		<tr>	                   
--><!-- NOTE3 
					<td class="tdTitle"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE3")%>�� 	</td>
                    <td class="tdRight"><html:text name="note3" property="note3" size="35"  maxlength="30" /> </td>
-->  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubComhelp()) return;	
  document.forms[0].action ="pubcomhelp.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkPubComhelp()) return;
  document.forms[0].action ="pubcomhelp.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="pubcomhelpquery_page_init.cmd";
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
	var result= xmlhttp("pubcomhelp.cmd?method=isExist&primaryKey="+primaryKey);
	//alert(result);//�����ַ���Ϊ��ʱ����ʾ������û��ʹ��
	if(result!=""){
		alert("�ñ���Ѿ���ʹ�ã���ʹ��������ţ�");
		obj.focus();
		obj.value="";
	}
}

</script>