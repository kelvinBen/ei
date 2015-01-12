<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>复杂消息修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpCmpMessag(){
	var contents = document.forms[0].contents;
  	if (trim(contents.value)=="")
	{
	  alert("请输入消息内容！");   
	  contents.focus(); 
	  return false;
	}
    contents.value = trim(contents.value) ;
      	var msgType = document.forms[0].msgType;
	var msgId = document.forms[0].msgId;
	var note = document.forms[0].note;
	var note2 = document.forms[0].note2;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="复杂消息修改" >
<bsp:containbutton action="mpcmpmessag.cmd?method=update" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="mpcmpmessagquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
<!-- 主键 --><html:hidden name="id" property="id" write="false"/>                                      
					<tr>	                   
<!-- 消息内容 --><td class="tdTitle"><%=ResourcesFactory.getString("MP_CMP_MESSAG.Contents")%>：  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="contents" property="contents" size="35"  maxlength="8" /> </td>
<!-- 消息格式 --><td class="tdTitle"><%=ResourcesFactory.getString("MP_CMP_MESSAG.MSG_TYPE")%>： 	</td>
                    <td class="tdRight">
                    	<html:select name="msgType" property="msgType" >
	                        <html:options collection="MPCMPMESSAG_MSGTYPE_COLLECTION" labelProperty="value" property="key"/>
	                    </html:select>
	                </td>
                    
					</tr>
					<tr>	                   
<!-- 消息外键 --><td class="tdTitle"><%=ResourcesFactory.getString("MP_CMP_MESSAG.MSG_ID")%>： 	</td>

                    <td class="tdRight"><html:text name="msgId" property="msgId" size="35"  maxlength="8" /> </td>
<!-- NOTE --><td class="tdTitle"><%=ResourcesFactory.getString("MP_CMP_MESSAG.NOTE")%>： 	</td>

                    <td class="tdRight"><html:text name="note" property="note" size="35"  maxlength="300" /> </td>
					</tr>
					<tr>	                   
<!-- NOTE2 --><td class="tdTitle"><%=ResourcesFactory.getString("MP_CMP_MESSAG.NOTE2")%>： 	</td>

                    <td class="tdRight"><html:text name="note2" property="note2" size="35"  maxlength="200" /> </td>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMpCmpMessag()) return;	
  document.forms[0].action ="mpcmpmessag.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpcmpmessagquery_page_init.cmd";
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