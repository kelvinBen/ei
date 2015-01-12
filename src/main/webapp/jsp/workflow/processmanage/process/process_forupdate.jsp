<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<%
	String formplugin = "wfd_self.bsh"; //表单插件
	String processtype = request.getParameter("processtype");
	String processid = request.getParameter("processid");
	String formid = request.getParameter("formid");
	if(formid == "") formplugin = "wfd_self.bsh";
	else formplugin = (String)request.getAttribute("formplugin");//表单插件名称
	String formname = request.getParameter("formname");
	String organize = request.getParameter("organize");
	
	//String organizeName = (String)request.getParameter("organizeName");
	//String processtypename = (String)request.getParameter("processtypename");
	//String isallsub = (String)request.getParameter("isallsub");
	
	
	String reservetype = (String)request.getAttribute("reservetype");//表单插件类型
	
	String author = (String)request.getAttribute("author");
	String url =Global.getString("skin.ca.rootUrl");
	if(url==null || url.trim().equals("")){
		url=ClientUtils.getRootUrl(request);
	}else{
		url+=request.getContextPath()+"/";
	}
		
	
%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="jsp/workflow/resource/js/specialField.js"></script>
<script language="javascript" src="jsp/workflow/resource/js/processmanage.js"></script>
<script language="javascript">
/**
* 该方法供流程定制的applet使用
*/
function choice(txt){
	var transferUrl = '<%=url%>';
	var win = window.showModalDialog(transferUrl + txt,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px" ); 
	if (win == null||(typeof(win)=="string"&&win=="")) {  
		return;
	}else{
		return win[0]+"|"+win[1];
	}
}

/**
* 获取选择域XML
*/
function appletSelectField(txt){
	var transferUrl = '<%=url%>';
	var win = window.showModalDialog(transferUrl + txt,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px" ); 
	if (win == null) {  
		return ;
	}else{
		return getValueXml(win);
	}
}
/**
*获取日期时间
*/
function appletGetDate(type){
		if(type == "date"){
			return getDate();
		} else if(type == "time"){
			return "00:00:00.000";
		} else if(type == "timestamp"){
			return getDateTime();
		}
}
function getDate()
{
	var obj=showModalDialog('jsp/workflow/resource/datetime/datepage.jsp',window,'dialogWidth:162px;dialogHeight:160px;status:no;scroll:no');
	if(obj!=null)return obj;
	else return "";  
}
function getDateTime(dateinput)
{
	var obj=showModalDialog('jsp/workflow/resource/datetime/datetimepage.jsp',window,'dialogWidth:162px;dialogHeight:200px;status:no;scroll:no');
	if(obj!=null)return obj;
	else return "";
} 	
</script>
</HEAD>

<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="载入流程为新版本" value="载入流程为新版本" onclick="forLoad()"></html:button>&nbsp;
<!--  -->
<html:button name="覆盖最新版本载入" value="覆盖最新版本载入" onclick="forfugaiLoadVer()"></html:button>&nbsp;

<html:button name="保存" value="保存" onclick="forSave()"></html:button>&nbsp;
<html:button name="另存为" value="另存为" onclick="forSaveAs()">
</html:button>&nbsp;<html:button name="保存为模版" value="保存为模版" onclick="forSaveTemplate()">
</html:button>&nbsp;<html:button name="取消模版" value="取消模版" onclick="cancelTemplate()"></html:button>&nbsp;
<html:button name="返回" value="返回" onclick="forReturn()"></html:button>&nbsp;
</div>
<html:form  name="frmList"  action="">
<html:hidden name="processid" property="id"/>
<html:hidden name="formid" property="formid" value="<%=formid%>"/>
<html:hidden name="formname" property="formname" value="<%=formname%>"/>
<html:hidden name="organize" property="organize" value="<%=organize%>"/>
	    <html:hidden name="organizeName"  property="organName"   />
<html:hidden name="reservetype" property="reservetype" value="<%=reservetype%>"/>
<html:hidden name="processtype" property="processtype" value="<%=processtype%>"/>
		<html:hidden name="processtypename"  property="typeName"/>
		<html:hidden name="isallsub"  property="isallsub"/>
<html:hidden name="id" property="id"/>
<html:hidden name="name" property="name"  />
<html:hidden name="description" property="description"  />
<html:hidden name="versionid" property="versionid"  />
<html:hidden name="author" property="author" />
<html:hidden name="create" property="create" />
<!--是否模板-->
<html:hidden  name="istemplet" property="istemplet"/>
			
<INPUT type="hidden" name="xpdlcontent" value="">
<INPUT type="hidden" name="xmlcontent" value="">

	<table width="100%" height="95%" cellpadding="0" cellspacing="0" class="tblContent">                                      
		<tr>
			<td colspan="2">
			<%
			String cbpath=url+"jsp/workflow/processmanage/appletjar/mast/";// jar 路径
			%>

<!-- mast-->	
				<OBJECT classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" name="myApplet" width="100%" height="100%" align="middle" codebase="http://java.sun.com/update/1.5.0/jinstall-1_5-windows-i586.cab#Version=5,0,0,5">
					<PARAM name="java_code" value="net.mast.workflow.client.NtMastFlowDesginApplet.class">
					<PARAM name="java_archive" value="workflow_engine.jar,workflow-util.jar">
<PARAM NAME="cache_archive" VALUE="workflow_engine.jar,workflow-util.jar,WfDSystemConfig.jar,menu.jar,xsdbean.jar,xbean.jar,picocontainer.jar,nanocontainer.jar,jgraph.jar,bsh.jar,jsr173_1.0_api.jar,javolution.jar">
					<PARAM name="type" value="application/x-java-applet;version=1.5">
					<PARAM name="java_codebase" value="<%=cbpath%>">
					<PARAM name="xpdlid" value="<%=processid%>">
					<PARAM name="formplugin" value="<%=formplugin%>">
					<PARAM name="processtype" value="<%=processtype%>">
					<PARAM name="initFormName" value="<%=formname%>">
					<PARAM name="initFormId" value="<%=formid%>">
					<PARAM name="initParty" value="<%=organize%>">
					<PARAM name="initReserve" value="<%=reservetype%>">
					<PARAM name="initType" value="<%=processtype%>">
					<PARAM name="initAuthor" value="<%=author%>">
					<PARAM name="handle" value="Show">
					<PARAM name="transferurl" value="<%=url%>">
					<PARAM name="rColor" value="">
					<PARAM name="gColor" value="">
					<PARAM name="bColor" value="">
					<PARAM name="fonttype" value="Alias">
					<PARAM name="fontsize" value="12">
					<COMMENT>
					<EMBED type="application/x-java-applet;version=1.5" name="myApplet" width="100%" height="100%" align="middle" pluginspage="http://java.sun.com/products/plugin/index.html#download" java_code="net.mast.workflow.client.NtMastFlowDesginApplet.class" java_archive="workflow_engine.jar,workflow-util.jar,WfDSystemConfig.jar,menu.jar,xsdbean.jar,xbean.jar,picocontainer.jar,nanocontainer.jar,jgraph.jar,bsh.jar,jsr173_1.0_api.jar,javolution.jar" java_codebase="<%=cbpath%>" xpdlid="<%=processid%>" processtype="<%=processtype%>" initFormName="<%=formname%>" initFormId="<%=formid%>" initParty="<%=organize%>" initReserve="<%=reservetype%>" initType="<%=processtype%>" initAuthor="<%=author%>" systemconfighandle="urlconfig.cmd?method=urlGetSystemConfig" menuconfighandle="urlconfig.cmd?method=urlGetMenuConfig" formconfighandle="urlconfig.cmd?method=getActorFields" workformhandle="urlconfig.cmd?method=getWorkform" processconfighandle="urlconfig.cmd?method=urlGetProcess" sysorganhandle="urlconfig.cmd?method=urlGetSystemOrgan" handle="Show" transferurl="<%=url%>" rColor="" gColor="" bColor="" fonttype="Alias" fontsize="12"/>
					<NOEMBED>
												<p>Unable to load applet</p>
					</NOEMBED>
					</COMMENT>
				</OBJECT>			
 			
			</td>
		</tr>	
	</table>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("工作流程－流程管理－修改流程");
function forLoad(){
	if(!saveProcessData(0)) return;
	document.forms[0].action ="process.cmd?method=loadProcess";
	document.forms[0].submit();	
	window.event.srcElement.disabled=true;
}
function forSave(){
	if(!saveProcessData(0)) return;
	document.forms[0].action ="process.cmd?method=update";
	document.forms[0].submit();	
}
function forfugaiLoadVer(){
if(!window.confirm("如果流程改动过大，覆盖最近版本的操作可能会导致已经在跑的流程运行异常，请问是否覆盖载入?")) return ;
	if(!saveProcessData(0)) return;
	document.forms[0].action ="process.cmd?method=loadProcess&flag=fugai";
	document.forms[0].submit();	
}
function forSaveAs(){
	if(!saveAsProcessData(0)) return;
	document.forms[0].action ="process.cmd?method=insert";
	document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="processquery.cmd?clear=true";
  document.forms[0].submit();	
}
function forSaveTemplate(){
	if(canOperate){
		if(confirm("确认将流程保存成模板吗？")){
			document.all("istemplet").value = "true";
			forSave();
		}
	}else{
		showMsg(notOperateMsg);
	}
}
function cancelTemplate(){
	if(canOperate){
		var istemplet=document.all("istemplet").value;
		if("true"!=istemplet){
			alert("该流程不是模版流程！");
			return;
		}
		if(confirm("确认将流程取消模板吗？")){
			document.all("istemplet").value = "false";
			forSave();
		}
	}else{
		showMsg(notOperateMsg);
	}
}
function init(){
 var istemplet=document.all("istemplet").value;
 if("true"!=istemplet){
	 document.all("取消模版").style.display="none";
 	//document.all("取消模版").disabled=true;
 }
}
init();

var msg="流程定制工具";


</script>