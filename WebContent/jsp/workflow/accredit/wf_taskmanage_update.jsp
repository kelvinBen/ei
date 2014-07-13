<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<HTML>
<HEAD>
<TITLE>审批人授权</TITLE>
<%@ include file="common/js.htm" %>

</HEAD>
<BODY topmargin="10px">
<div class="btnareaCss">

</div> 
<%
	String imgHelp = SkinUtils.getImage(request,"liulan.gif");
	String rootId =GetBspInfo.getBspInfo().getAccessRootId();
%>
<html:messages></html:messages>
<html:form  name="frmList"  action="">
<bsp:container title="出差代理增加" >
<bsp:containbutton action="taskManageCmd.cmd?method=saveAssignment" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="重填" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent"> 
 				 <tr>
                    <td class="tdTitle">当前审批人：</td>
                    <td class="tdRight">
                    <input type="hidden" name="_oldUserId" value="<%=request.getParameter("_oldUserId") %>" size="50" readonly="true" />
                    <input type="hidden" name="_processId" value="<%=request.getParameter("_processId") %>" size="300" readonly="true" />
                    <input type="hidden" name="_activityId" value="<%=request.getParameter("_activityId") %>" size="300" readonly="true" />
                    <input type="text" name="_oldUsername" value="<%=request.getParameter("_oldUsername") %>" size="30" readonly="true" />
                    <input type="hidden" name="_applyNo" value="<%=request.getParameter("_applyNo") %>" size="30" readonly="true" />
                    </td>
                    </tr> 
					<tr>
                    <td class="tdTitle">代理人：</td>
                    <td class="tdRight">
                    <html:hidden name="agentorganid" value="" write="false" />
                    <html:text name="agentorganName" value="" size="30" readonly="true" />
                    <span id="agentorganSpan" ></span>
                    <img src="<%=imgHelp%>" onclick="selectAgentOrgan()" style="cursor:hand;" border="0">
                    <span id="agentorganSpan2" class="xinghaoCss">*</span>
                    </td>
                    </tr>    
                     <html:hidden name="type" value="1"></html:hidden> 
  </table>
 				 <html:hidden name="flag" property="flag" value="1" />
	                        
  
</div>

</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
	var agentorganName = document.forms[0].agentorganName.value;
	if('' == agentorganName){
		alert('代理人不能为空');
		return;
	}
	var _oldUserId = document.forms[0]._oldUserId.value;
	var _newUserId = document.forms[0].agentorganid.value;
	if(_oldUserId == _newUserId){
		alert('代理人与当前审批人不能一样');
		return;
	}
  document.forms[0].action ="taskManageCmd.cmd?method=saveAssignment";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="taskQueryCmd.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
/*
选择代理用户 
*/
function selectAgentOrgan(){
	var url ="jsp/help.jsp?url=";
	url =url+"userStruhelp.cmd&method=getStruUserRoot";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	var ret;
	if(win==null){
		return false;
	}else if(typeof(win)=="string" && win==""){
		ret=new Array();
		ret[0]="";
		ret[1]="";
	}else{
		ret = win;
	}
	if(ret[0] == document.forms[0].agentorganid.value){
		return;
	}
	document.forms[0].agentorganid.value = ret[0];
	document.forms[0].agentorganName.value = ret[1];
}
</script>
