<%@ page contentType="text/html;charset=GB2312" %>

<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<%
	String formplugin = request.getParameter("formType");//表单插件名称

	String processtype = request.getParameter("processtype");
	String formName = request.getParameter("formname");
	String formId = request.getParameter("formid");
	String organize = request.getParameter("organize");
	String reserveType = request.getParameter("reservetype");
	String author = (String)request.getAttribute("author");
	
	String organizeName = (String)request.getParameter("organizeName");
	String processtypename = (String)request.getParameter("processtypename");
	String isallsub = (String)request.getParameter("isallsub");
	
	
	
	String url =Global.getString("skin.ca.rootUrl");
	if(url==null || url.trim().equals("")){
		url=ClientUtils.getRootUrl(request);
	}else{
		url+=request.getContextPath()+"/";
	}
	
	String handle="Create";
				String proctemplate=request.getParameter("proctemplate");
				if(proctemplate!=null && !proctemplate.trim().equals(""))
					handle="Templet";
				String id = handle=="Create"?"":proctemplate;
%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
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
		return null;
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
</script>
</HEAD>

<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="载入流程" value="载入流程" onclick="forLoad()"></html:button>&nbsp;<html:button name="保存" value="保存" onclick="forSave()"></html:button>&nbsp;<html:button name="保存为模版" value="保存为模版" onclick="forSaveTemplate()"></html:button>&nbsp;<html:button name="返回" value="返回" onclick="forReturn()"></html:button>
</div>
<html:form  name="frmList"  action="">
<table width="100%" height="95%" cellpadding="0" cellspacing="0" >
	
			<html:hidden name="processtype" property="processtype" value="<%=processtype%>"/>
			<html:hidden name="processtypename"   value="<%=processtypename%>"/>
			
			<html:hidden name="formid" property="formid" value="<%=formId%>"/>
			<html:hidden name="formname" property="formname" value="<%=formName%>"/>
			<html:hidden name="organize" property="organize" value="<%=organize%>"/>
			<html:hidden name="organizeName"   value="<%=organizeName%>"/>
			<html:hidden name="isallsub"   value="<%=isallsub%>"/>

			
			<html:hidden name="reservetype" property="reservetype" value="<%=reserveType%>"/>
						<!--是否模板-->
			<html:hidden  name="istemplet" value="false"/>
			<html:hidden name="id" property="id" />
			<html:hidden name="name" property="name" />
			<html:hidden name="description" property="description" />
			<html:hidden name="versionid" property="versionid" />
			<html:hidden name="author" property="author" />
			<html:hidden name="create" property="create" />
			<html:hidden name="xpdlcontent" property="xpdlcontent" />
			<html:hidden name="xmlcontent" property="xmlcontent" />

	
		<tr>
			<td>
			<%
			String cbpath=url+"jsp/workflow/processmanage/appletjar/mast/";// jar 路径
			%>

				<OBJECT classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" name="myApplet" width="100%" height="100%" align="middle" codebase="http://java.sun.com/update/1.5.0/jinstall-1_5-windows-i586.cab#Version=5,0,0,5">
					<PARAM name="java_code" value="net.mast.workflow.client.NtMastFlowDesginApplet.class">
					<PARAM name="java_archive" value="workflow_engine.jar,workflow-util.jar">

<PARAM NAME="cache_archive" VALUE="workflow_engine.jar,workflow-util.jar,WfDSystemConfig.jar,menu.jar,xsdbean.jar,xbean.jar,picocontainer.jar,nanocontainer.jar,jgraph.jar,bsh.jar,jsr173_1.0_api.jar,javolution.jar">

					<PARAM name="type" value="application/x-java-applet;version=1.5">
					<PARAM name="java_codebase" value="<%=cbpath%>">
					<PARAM name="xpdlid" value="<%=id%>">
					<PARAM name="formplugin" value="<%=formplugin%>">
					<PARAM name="processtype" value="<%=processtype%>">
					<PARAM name="initFormName" value="<%=formName%>">
					<PARAM name="initFormId" value="<%=formId%>">
					<PARAM name="initParty" value="<%=organize%>">
					<PARAM name="initReserve" value="<%=reserveType%>">
					<PARAM name="initType" value="<%=processtype%>">
					<PARAM name="initAuthor" value="<%=author%>">
					<PARAM name="handle" value="<%=handle%>">
					<PARAM name="transferurl" value="<%=url%>">
					<PARAM name="rColor" value="">
					<PARAM name="gColor" value="">
					<PARAM name="bColor" value="">
					<PARAM name="fonttype" value="Alias">
					<PARAM name="fontsize" value="12">
					<COMMENT>
					<EMBED type="application/x-java-applet;version=1.5" name="myApplet" width="100%" height="100%" align="middle" pluginspage="http://java.sun.com/products/plugin/index.html#download" java_code="net.mast.workflow.client.NtMastFlowDesginApplet.class" java_archive="workflow_engine.jar,workflow-util.jar,WfDSystemConfig.jar,menu.jar,xsdbean.jar,xbean.jar,picocontainer.jar,nanocontainer.jar,jgraph.jar,bsh.jar,jsr173_1.0_api.jar,javolution.jar" java_codebase="<%=cbpath%>" xpdlid="<%=id%>" processtype="<%=processtype%>" initFormName="<%=formName%>" initFormId="<%=formId%>" initParty="<%=organize%>" initReserve="<%=reserveType%>" initType="<%=processtype%>" initAuthor="<%=author%>" systemconfighandle="urlconfig.cmd?method=urlGetSystemConfig" menuconfighandle="urlconfig.cmd?method=urlGetMenuConfig" formconfighandle="urlconfig.cmd?method=getActorFields" workformhandle="urlconfig.cmd?method=getWorkform" processconfighandle="urlconfig.cmd?method=urlGetProcess" sysorganhandle="urlconfig.cmd?method=urlGetSystemOrgan" handle="<%=handle%>" transferurl="<%=url%>" rColor="" gColor="" bColor="" fonttype="Alias" fontsize="12"/>
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
setTitleInTreeBar("工作流程－流程管理－增加流程");
function forLoad(){
	  if(!addProcessData()) return;
	  document.forms[0].action ="process.cmd?method=insertLoad";
	  document.forms[0].submit();	
	  window.event.srcElement.disabled=true;
}
function forSave(){
	  if(!addProcessData()) return;
	  document.forms[0].action ="process.cmd?method=insert";
	  document.forms[0].submit();	
}
function forSaveTemplate(){
if(confirm("确认将流程保存成模板吗？")){
document.all("istemplet").value = "true";
forSave();
}


}
function forReturn(){
  document.forms[0].action ="processquery.cmd?clear=true";
  document.forms[0].submit();	
}

var msg="流程定制工具";
var interval = 100; //setTimeout执行一次的时间.
var spacelen = 50;
var space10=" ";
var seq=0;
function Scroll() { 
   len = msg.length;
   window.status = msg.substring(0, seq+1);
   seq++;
   if ( seq >= len ) { //如果msg字符串全部显示出来
    seq = spacelen; 
    window.setTimeout("Scroll2();", interval );   //跑马开始
   }
   else
    window.setTimeout("Scroll();", interval );
} 
function Scroll2() { 
   var out="";
   for (i=1; i<=spacelen/space10.length; i++)    //space10.length始终是1,spacelen为120恒久不变;这里为的就是在msg前加上120个空格
    out += space10;   //空格字符串
   out = out + msg; //形成这个样的字符串:"             这是一个跑马灯效果的JavaScript文档"
   len=out.length;
   window.status=out.substring(seq, len);   //每一次都减少一个前面的空格
   seq++;
   if ( seq >= len ) { seq = 0; };   //如果字符串跑完了,使seq=0.重新再跑
   window.setTimeout("Scroll2();", interval );
} 

Scroll();


</script>