<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" onkeydown="forKey()">
<widgets:container title="��ѡ�������Ҫ��¼�������¼�" >
<table width="100%" height="100%">
    
       <tr>
        <td align="right">�����¼�����:</td>
        <td align="left"><html:select name="hrEventType" property="hrEventType" >
        	<html:options collection="hrEventTypeOptions" labelProperty="typeName" property="eventType"/>
    		</html:select><FONT COLOR=#ff0000>*</FONT></td>
      </tr> 
      
              <tr>
        <td  align="right">�����¼���ע:</td>
        <td  align="left"><html:text name="hrEventMemo" property="hrEventMemo" size="40" maxlength="250"/></td>
        </tr> 
        
    <tr>    
    <td colspan="2"  align="center">
    <html:button name="btn.add" value="ȷ��" onclick="showcheckdata()"></html:button>
    <html:button name="btn.del" value="�ر�" onclick="forCancel()"></html:button>
 
    </td>
    </tr>
    </table>
</widgets:container>
</BODY>
<SCRIPT LANGUAGE="JavaScript">

function showcheckdata(){

    var hrEventMemo=document.all.hrEventMemo;
    if(!stringLengthCheck(hrEventMemo,250,"�����¼����ͱ�ע���ܳ���250���ַ�!")){
      return false;
    }

	var key=document.all("hrEventType").value;
	if(key==""){
	alert("��ѡ��ɾ����֯��Ҫ��¼�������¼�����.");
	return  ;
	}
        var returnV=new Array(2);
        returnV[0]=document.all("hrEventType").value;
        returnV[1]=document.all("hrEventMemo").value; 
        window.returnValue=returnV;
        parent.close();
}
function forCancel(){
	parent.close();
}
function forKey(){
	if(window.event.keyCode==13){
		return;
	}
}
</SCRIPT>
</html>