<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>����Ȩ�������޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubDataResType(){
    var dataResType = document.forms[0].dataResType;
    if ( __isQuoteIn(dataResType.value)){
      alert("�ο����Ͳ��ܺ��������ַ���");
      dataResType.value="";
      dataResType.select();
      dataResType.focus();
      return false;
    }
    if (trim(dataResType.value)==""){
      alert("������ο����ͣ�");
      dataResType.focus();
      return false;
    }
    dataResType.value = trim(dataResType.value) ;
    var typeName = document.forms[0].typeName;
    if ( __isQuoteIn(typeName.value)){
      alert("�������Ʋ��ܺ��������ַ���");
      typeName.value="";
      typeName.select();
      typeName.focus();
      return false;
    }
    if (trim(typeName.value)==""){
      alert("�������������ƣ�");
      typeName.focus();
      return false;
  }
  typeName.value = trim(typeName.value) ;
 if(!stringLengthCheck(dataResType,8,"�ο����ͳ��Ȳ��ܳ���8���ַ���")){
      dataResType.value="";
      dataResType.select();
      dataResType.focus();
    return false;
  }
 if(!stringLengthCheck(typeName,20,"�������Ƴ��Ȳ��ܳ���20���ַ���")){
      typeName.value="";
      typeName.select();
      typeName.focus();
    return false;
  }
   var resTable = document.forms[0].resTable;
  var resTableName = document.forms[0].resTableName;
  var valueCol = document.forms[0].valueCol;
  var valueColDes = document.forms[0].valueColDes;
  var nameCol = document.forms[0].nameCol;
  var nameColDes = document.forms[0].nameColDes;
  var filterField = document.forms[0].filterField;
  var memo = document.forms[0].memo;
  
 var isStru = document.forms[0].isStru;
if(isStru[0].checked){
	if(resTable==null||trim(resTable.value)==""){ 
		alert("����д���ݶ�������Դ��");
		
      resTable.focus();
		return false;
		}

if(valueCol==null||trim(valueCol.value)==""){ 
		alert("����дѡ����ֶΣ�");
		valueCol.focus();
		return false;
		}
if(nameCol==null||trim(nameCol.value)==""){ 
		alert("����д��ʾ���ֶΣ�");
		nameCol.focus();
		return false;
		}
}
    var isWhere = document.forms[0].isWhere;
    if(isWhere[1].checked){
    if(filterField==null||trim(filterField.value)==""){ 
		alert("����д����������");
		filterField.focus();
		return false;
		}
    
    
    }
  
  if(!stringLengthCheck(resTable,30,"���ݶ�����Դ�������Ȳ��ܳ���30�����ַ���")){
      resTable.value="";
      resTable.select();
      resTable.focus();
    return false;
  }
 if(!stringLengthCheck(resTableName,30,"���ݶ�����Դ���������Ȳ��ܳ���30�����ַ���")){
      resTableName.value="";
      resTableName.select();
      resTableName.focus();
    return false;
  }
  if(!stringLengthCheck(valueCol,30,"ѡ����ֶγ��Ȳ��ܳ���30�����ַ���")){
      valueCol.value="";
      valueCol.select();
      valueCol.focus();
   return false;
  }
 if(!stringLengthCheck(valueColDes,60,"ѡ����ֶ��������Ȳ��ܳ���60�����ַ���")){
      valueColDes.value="";
      valueColDes.select();
      valueColDes.focus();
      return false;
  }
 if(!stringLengthCheck(nameCol,30,"��ʾ���ֶγ��Ȳ��ܳ���30�����ַ���")){
      nameCol.value="";
      nameCol.select();
      nameCol.focus();
      return false;
  }
 if(!stringLengthCheck(nameColDes,60,"��ʾ���ֶ��������Ȳ��ܳ���60�����ַ���")){
      nameColDes.value="";
      nameColDes.select();
      nameColDes.focus();
      return false;
  }
 if(!stringLengthCheck(filterField,600,"�����������Ȳ��ܳ���600�����ַ���")){
      filterField.value="";
      filterField.select();
      filterField.focus();
      return false;
  }
 if(!stringLengthCheck(memo,30,"ע���������Ȳ��ܳ���30�����ַ���")){
      memo.value="";
      memo.select();
      memo.focus();
      return false;
  }
   
  return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="������Դ�����޸�" >
<bsp:containbutton text="����" onclick="forSave()" action ="datarestype.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action ="datarestypequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
                                                        <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.DATA_RES_TYPE")%>��</td>
                    <td class="tdRight"><html:hidden name="dataResType" property="dataResType" write="true"/></td>
                    </tr>
                                                           <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.TYPE_NAME")%>��</td>
                    <td class="tdRight"><html:text name="typeName" property="typeName" size="30" maxlength="30"/><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>
                    <tr>
                       <td class="tdTitle">�ο������Ƿ��ǻ���</td>
                       <td class="tdRight">
                            <html:radio name="isStru" property="isStru" value="0"/>��
                            <html:radio name="isStru" property="isStru" value="1" />��<FONT COLOR=#ff0000>*</FONT>
                       </td>
                    </tr>    
                    <tr>
                    <td class="tdTitle">���ݶ�����Դ������</td>
                    <td class="tdRight"><html:text name="resTable" property="resTable" size="30" maxlength="30"/></td>
                    </tr>
                    <tr>
                    <td class="tdTitle">���ݶ�����Դ��������</td>
                    <td class="tdRight"><html:text name="resTableName" property="resTableName" size="30" maxlength="30"/></td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.VALUE_COL")%>��</td>
                    <td class="tdRight"><html:text name="valueCol" property="valueCol" size="30" maxlength="30"/></td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.VALUE_COL_DES")%>��</td>
                    <td class="tdRight"><html:text name="valueColDes" property="valueColDes" size="60" maxlength="60"/></td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.NAME_COL")%>��</td>
                    <td class="tdRight"><html:text name="nameCol" property="nameCol" size="30" maxlength="30"/></td>
                    </tr>
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.NAME_COL_DES")%>��</td>
                    <td class="tdRight"><html:text name="nameColDes" property="nameColDes" size="60" maxlength="60"/></td>
                    </tr>
                    <tr>
                       <td class="tdTitle">�Ƿ�ʹ��WHERE����:</td>
                       <td class="tdRight">
                            <html:radio name="isWhere" property="isWhere" value="0"/>��
                            <html:radio name="isWhere" property="isWhere" value="1" />��
                       </td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.FILTER_FIELD")%>��</td>
                    <td class="tdRight"><html:text name="filterField" property="filterField" size="50" maxlength="600"/></td>
                    </tr>
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_DATA_RES_TYPE.MEMO")%>��</td>
                    <td class="tdRight"><html:text name="memo" property="memo" size="30" maxlength="30"/></td>
                    </tr>
       </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubDataResType()) return;	
  document.forms[0].action ="datarestype.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="datarestypequery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>