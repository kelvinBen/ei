<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>��֯�������ͱ��޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkOrganParmsT(){
	  var parmsName = document.forms[0].parmsName;
  	  //if ( __isQuoteIn(parmsName.value) )
	  //{
	  //  alert("�������Ʋ��ܺ��������ַ���");
	  //  parmsName.select();
	  //  parmsName.focus();
	  //  return false;
	  //}
     // if (trim(parmsName.value)=="")
	//{
	  //alert("������������ƣ�");    
	 // parmsName.focus();
	  //return false;
	//}
	 //if(byteLength(trim(parmsName.value))>"30")
  //{
  	//alert("���������������");
   // parmsName.focus();
    //return false;
  //}
   // parmsName.value = trim(parmsName.value) ;
  	  var parmsValue = document.forms[0].parmsValue;
      if (trim(parmsValue.value)=="")
	{
	  alert("���������������");    
	  parmsValue.focus();
	  return false;
	}
	 if(byteLength(trim(parmsValue.value))>"250")
  {
  	alert("���������������");
    parmsValue.focus();
    return false;
  }
    parmsValue.value = trim(parmsValue.value) ;
  	  var dataRes = document.forms[0].dataRes; 
      if (trim(dataRes.value)=="")
	{
	  alert("������������Դ��");    
	  dataRes.focus();
	  return false;
	}

    dataRes.value = trim(dataRes.value) ;
    if(trim(dataRes.value)=="1"){
  		var enumName = document.forms[0].enumName;
		if(trim(enumName.value)==""){
			alert("������ö�����ƣ�");
			enumName.focus();
			return false;
		}
		  
  		var enumVaule = document.forms[0].enumVaule;
		if(trim(enumVaule.value)==""){
			alert("������ö��������");
			enumVaule.focus();
			return false;
		}
		 
	}
	var enumName = document.forms[0].enumName;
	if(byteLength(trim(enumName.value))>"30")
  		{
  			alert("ö�������������");
    		enumName.focus();
    		return false;
  		}
  	var enumVaule = document.forms[0].enumVaule;
  	if(byteLength(trim(enumVaule.value))>"30")
  		{
  			alert("ö�������������");
    		enumVaule.focus();
    		return false;
  		}
	
	if(trim(dataRes.value)=="2"){
  		var resTable = document.forms[0].resTable;
		if(trim(resTable.value)==""){
			alert("���������ݶ�����Դ��");
			resTable.focus();
			return false;
		} 
		 
		var resTableName = document.forms[0].resTableName;
		if(trim(resTableName.value)==""){
			alert("���������ݶ�����Դ������");
			resTableName.focus();
			return false;
		}
		 
		var valueCol = document.forms[0].valueCol;
		if(trim(valueCol.value)==""){
			alert("������Ҫѡ����ֶΣ�");
			valueCol.focus();
			return false;
		}
		 
		var valueColDes = document.forms[0].valueColDes;
		if(trim(valueColDes.value)==""){
			alert("������Ҫѡ����ֶ�������");
			valueColDes.focus();
			return false;
		}
		 
		var nameCol = document.forms[0].nameCol;
		if(trim(nameCol.value)==""){
			alert("������Ҫ��ʾ���ֶΣ�");
			nameCol.focus();
			return false;
		}
		 
		var nameColDes = document.forms[0].nameColDes;
		if(trim(nameColDes.value)==""){
			alert("������Ҫ��ʾ���ֶ�������");
			nameColDes.focus();
			return false;
		}	
			 
	}
	var resTable = document.forms[0].resTable;
	if(byteLength(trim(resTable.value))>"30")
  		{
  			alert("���ݶ�����Դ���������");
    		resTable.focus();
    		return false;
  		}
	var resTableName = document.forms[0].resTableName;
	if(byteLength(trim(resTableName.value))>"30")
  		{
  			alert("���ݶ�����Դ�����������");
    		resTableName.focus();
    		return false;
  		}
	var valueCol = document.forms[0].valueCol;
	if(byteLength(trim(valueCol.value))>"30")
  		{
  			alert("ѡ����ֶ��������");
    		valueCol.focus();
    		return false;
  		}
	var valueColDes = document.forms[0].valueColDes;
	if(byteLength(trim(valueColDes.value))>"60")
  		{
  			alert("ѡ����ֶ������������");
    		valueColDes.focus();
    		return false;
  		}
	var nameCol = document.forms[0].nameCol;
	if(byteLength(trim(nameCol.value))>"30")
  		{
  			alert("��ʾ���ֶ��������");
    		nameCol.focus();
    		return false;
  		}
	var nameColDes = document.forms[0].nameColDes;
	if(byteLength(trim(nameColDes.value))>"60")
  		{
  			alert("��ʾ���ֶ������������");
    		nameColDes.focus();
    		return false;
  		}   
	var filterField = document.forms[0].filterField;
	if(byteLength(trim(filterField.value))>"600")
  		{
  			alert("���������������");
    		filterField.focus();
    		return false;
  		}   
	var note = document.forms[0].note;
	if(byteLength(trim(note.value))>"250")
  		{
  			alert("ע���������");
    		note.focus();
    		return false;
  		}   
	
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��֯�������ͱ��޸�" >
<bsp:containbutton action="organparmst.cmd?method=update" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="organparmstquery.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.PARMS_NAME")%>��</td>
                    <td class="tdRight"><html:hidden name="parmsName" property="parmsName" write="true" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.PARMS_VALUE")%>��</td>
                    <td class="tdRight"><html:text name="parmsValue" property="parmsValue" size="30" maxlength="250" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.DATA_RES")%>��</td>
                    <td class="tdRight">
                    	<html:select name="dataRes" property="dataRes" >
	                        <html:options collection="ORGANPARMST_DATARES_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select><FONT COLOR=#ff0000>*</FONT>
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.ENUM_NAME")%>��</td>
                    <td class="tdRight"><html:text name="enumName" property="enumName" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.ENUM_VAULE")%>��</td>
                    <td class="tdRight"><html:text name="enumVaule" property="enumVaule" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.RES_TABLE")%>��</td>
                    <td class="tdRight"><html:text name="resTable" property="resTable" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.RES_TABLE_NAME")%>��</td>
                    <td class="tdRight"><html:text name="resTableName" property="resTableName" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.VALUE_COL")%>��</td>
                    <td class="tdRight"><html:text name="valueCol" property="valueCol" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.VALUE_COL_DES")%>��</td>
                    <td class="tdRight"><html:text name="valueColDes" property="valueColDes" size="60" maxlength="60" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.NAME_COL")%>��</td>
                    <td class="tdRight"><html:text name="nameCol" property="nameCol" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.NAME_COL_DES")%>��</td>
                    <td class="tdRight"><html:text name="nameColDes" property="nameColDes" size="60" maxlength="60" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.IS_WHERE")%>��</td>
                    <td class="tdRight"> 
                            <html:radio name="isWhere" property="isWhere" value="0"/>��
                            <html:radio name="isWhere" property="isWhere" value="1"/>��
	                </td>
                    </tr>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.FILTER_FIELD")%>��</td>
                    <td class="tdRight"><html:text name="filterField" property="filterField" size="60" maxlength="600" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.NOTE")%>��</td>
                    <td class="tdRight"><html:text name="note" property="note" size="60" maxlength="250" /></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkOrganParmsT()) return;	
  document.forms[0].action ="organparmst.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="organparmstquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>