<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>

<HTML> 
<HEAD>
<TITLE>��ʼ�����ݼ��</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>


</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��ʼ�����ݼ��" >

<div align="center">
	<table width="100%" cellpadding="0" class="tblContent"> 
    <tr><td>
    <br>
    ҵ�����
    <br>
    <br>
	��)ϵͳһ�����ż������ʺ�<br>
	��)ÿ������һ����˾�������ʺ�<br>
	��)�κ��û��Զ������ż������û��͹�˾�������û�<br>
	��)���ż������û��͹�˾�������û����ܴ��������û�<br>
	��)������Դ��֯�ṹ��,������������Ϊ�������������������Ƿ��˵�λ����������Ϊ������<br>
	��)�û��ʺŵ������������������š�����Ա�����������˱���һ�¡�<br>
	��)�û�����Ȩ���вο�����Ϊ����ʱ����֯�ṹ��ϵ�����֯�ṹ���Ͳ���Ϊ�ա�<br>
	��)�˵������и��ڵ�PARENT_ID�������(���ڵ����)!<br>
    <br>
    <br>
    &nbsp;
	</td></tr>
   <tr>
   <td class="tdTitle">���õ�ϵͳ��飺</td>
    <td class="tdTitle">&nbsp;</td>
   </tr>
  <tr> 
   <td align="right">
  <html:button name="button" onclick="checkCPubUser()" value="  �����û�������  "></html:button>
  </td>
  <td align="Left">
  <html:button name="button" onclick="checkUserPer()" value="    �û�������   "></html:button>
</td>
</tr>
   <tr>
   <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
  <tr> 
   <tr> 
   <td align="right">
  <html:button name="button" onclick="checkCorporation()" value="  ��֯�������˼��  "></html:button>
  </td>
  <td align="Left">                                  
  <html:button name="button" onclick="checkUserStru()" value="  �û�������֯��� "></html:button>
</td>
</tr>
<tr>
   <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
  <tr> 
   <tr> 
   <td align="right">
  <html:button name="button" onclick="checkUsrDataRef()" value="  �û�����Ȩ�޼��  "></html:button>
  </td>
  <td align="Left">                                  
    <html:button name="button" onclick="checkMenuParent()" value="    �˵��ڵ���   "></html:button>
  </td>
</tr>

  </table>
</div>
<table width="100%" cellpadding="0" class="tblContent"> 
    <tr><td>
    &nbsp;
	</td></tr>
	  </table>

</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">

//��˾�����û�������
function checkCPubUser(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkCPubUser";
  document.forms[0].submit();
}

//�û�������
function checkUserPer(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkUserPer";
  document.forms[0].submit();
}

//��֯�������˼��
function checkCorporation(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkCorporation";
  document.forms[0].submit();
}

//�û�������֯���
function checkUserStru(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkUserStru";
  document.forms[0].submit();
}

//�û�����Ȩ�޼��
function checkUsrDataRef(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkUsrDataRef";
  document.forms[0].submit();
}
//�˵��ڵ���
function checkMenuParent(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkMenuParent";
  document.forms[0].submit();
}
</script>