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
<TITLE>ϵͳ��ؿ���̨</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<script language="javascript">
function check(){
      var writeTime = document.forms[0].writeTime;
		writeTime.value = trim(writeTime.value) ;
	  if (isNaN(writeTime.value)){
	    alert("���õ�ʱ��������Ϊ������");

	    writeTime.select();
	    writeTime.focus();
	    return false;
	  }	 
	  if (writeTime.value==""){
	    alert("��������Ҫ���õ�ʱ������");    
	    return false;
	  }

      if(!stringLengthCheck(writeTime,30,"���õ�ʱ������ֵ���ܳ���20���ַ�!")){
        //writeTime.value="";
        writeTime.select();
        writeTime.focus();
        return false;
      }

	  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="ϵͳ��ؿ���̨" >

<div align="center">
<table width="100%" cellpadding="0" class="tblContent"> 
    <tr><td>
    &nbsp;
	<html:messages/>
	</td></tr>
	  </table>
  <table width="100%" cellpadding="0" class="tblContent"> 
  
		    <html:hidden name="isReRead" value="0" write="false"/>
		    <tr>
                    <td class="tdTitle">����д������־ʱ������</td>
                    <td class="tdRight"><html:text name="writeTime"  size="15" maxlength="20" value="0"/>&nbsp;
					<html:button name="button" onclick="forSave()" value="����д����־ʱ����"></html:button></td>
                    </tr>     
                    
                    <tr>
					<td>&nbsp;</td>
                    <td class="tdRight">
					<FONT COLOR=#ff0000>��ÿ���೤ʱ�佫��־д�뵽���ݿ���,��λ����,������õ�ֵС��0,��ô�ر�ϵͳ���,���Ϊ0�����Ĭ������ �� </FONT></td>
                    </tr>               
		    
		    <tr>
                    <td class="tdTitle">�Ƿ����¶�ȡϵͳ��������ļ���</td>
                    <td class="tdRight">&nbsp;<html:button name="button" onclick="forReread()" value="���¶�ȡ "></html:button></td>
                    </tr>  
                    
                    <tr>
					<td>&nbsp;</td>
                    <td class="tdRight"><FONT COLOR=#ff0000>�����ϵͳ��ؿ��ز����Ƿ�ı䡣��</FONT></td>
                    </tr>                   
		            <tr>
                    <td class="tdTitle">���·����˵����</td>
                    <td class="tdRight">�����г���·����ֻҪϵͳ����class����Щ·�����¼�����ô��Щ���õ�class���ǻ��ܵ���ء�<br>
					�����Ҫ�����µļ��·�������޸������ļ�monitor.properties
					</td>
                    </tr>

  </table>

  <table width="100%" cellpadding="0" class="tblContent"> 
  <tr>
  <td align="center" >
  <html:button name="button" onclick="forReset()" value=" �� �� "></html:button>
</td></tr>
  </table>

</div>


</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!check()) return;
  
  document.forms[0].action ="CmdLog.cmd?method=setLogThread";
  document.forms[0].submit();

}

function forReset(){  
  document.forms[0].reset();	
}

function forReread(){ 
  document.forms[0].isReRead.value="1";
  document.forms[0].action ="CmdLog.cmd?method=setLogThread";
  document.forms[0].submit();	
}


</script>