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
<TITLE>系统监控控制台</TITLE>
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
	    alert("设置的时间间隔必须为整数！");

	    writeTime.select();
	    writeTime.focus();
	    return false;
	  }	 
	  if (writeTime.value==""){
	    alert("请输入需要设置的时间间隔！");    
	    return false;
	  }

      if(!stringLengthCheck(writeTime,30,"设置的时间间隔数值不能超过20个字符!")){
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
<bsp:container title="系统监控控制台" >

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
                    <td class="tdTitle">设置写入监控日志时间间隔：</td>
                    <td class="tdRight"><html:text name="writeTime"  size="15" maxlength="20" value="0"/>&nbsp;
					<html:button name="button" onclick="forSave()" value="设置写入日志时间间隔"></html:button></td>
                    </tr>     
                    
                    <tr>
					<td>&nbsp;</td>
                    <td class="tdRight">
					<FONT COLOR=#ff0000>（每隔多长时间将日志写入到数据库中,单位毫秒,如果设置的值小于0,那么关闭系统监控,如果为0则采用默认设置 ） </FONT></td>
                    </tr>               
		    
		    <tr>
                    <td class="tdTitle">是否重新读取系统监控配置文件：</td>
                    <td class="tdRight">&nbsp;<html:button name="button" onclick="forReread()" value="重新读取 "></html:button></td>
                    </tr>  
                    
                    <tr>
					<td>&nbsp;</td>
                    <td class="tdRight"><FONT COLOR=#ff0000>（检查系统监控开关参数是否改变。）</FONT></td>
                    </tr>                   
		            <tr>
                    <td class="tdTitle">监控路径的说明：</td>
                    <td class="tdRight">按照列出的路径，只要系统调用class是这些路径的下级，那么这些调用的class就是会受到监控。<br>
					如果需要设置新的监控路径，请修改配置文件monitor.properties
					</td>
                    </tr>

  </table>

  <table width="100%" cellpadding="0" class="tblContent"> 
  <tr>
  <td align="center" >
  <html:button name="button" onclick="forReset()" value=" 重 置 "></html:button>
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