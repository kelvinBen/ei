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
	String formplugin = request.getParameter("formType");//���������

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
* �÷��������̶��Ƶ�appletʹ��
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
* ��ȡѡ����XML
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
*��ȡ����ʱ��
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
<html:button name="��������" value="��������" onclick="forLoad()"></html:button>&nbsp;<html:button name="����" value="����" onclick="forSave()"></html:button>&nbsp;<html:button name="����Ϊģ��" value="����Ϊģ��" onclick="forSaveTemplate()"></html:button>&nbsp;<html:button name="����" value="����" onclick="forReturn()"></html:button>
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
						<!--�Ƿ�ģ��-->
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
			String cbpath=url+"jsp/workflow/processmanage/appletjar/mast/";// jar ·��
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
setTitleInTreeBar("�������̣����̹�����������");
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
if(confirm("ȷ�Ͻ����̱����ģ����")){
document.all("istemplet").value = "true";
forSave();
}


}
function forReturn(){
  document.forms[0].action ="processquery.cmd?clear=true";
  document.forms[0].submit();	
}

var msg="���̶��ƹ���";
var interval = 100; //setTimeoutִ��һ�ε�ʱ��.
var spacelen = 50;
var space10=" ";
var seq=0;
function Scroll() { 
   len = msg.length;
   window.status = msg.substring(0, seq+1);
   seq++;
   if ( seq >= len ) { //���msg�ַ���ȫ����ʾ����
    seq = spacelen; 
    window.setTimeout("Scroll2();", interval );   //����ʼ
   }
   else
    window.setTimeout("Scroll();", interval );
} 
function Scroll2() { 
   var out="";
   for (i=1; i<=spacelen/space10.length; i++)    //space10.lengthʼ����1,spacelenΪ120��ò���;����Ϊ�ľ�����msgǰ����120���ո�
    out += space10;   //�ո��ַ���
   out = out + msg; //�γ���������ַ���:"             ����һ�������Ч����JavaScript�ĵ�"
   len=out.length;
   window.status=out.substring(seq, len);   //ÿһ�ζ�����һ��ǰ��Ŀո�
   seq++;
   if ( seq >= len ) { seq = 0; };   //����ַ���������,ʹseq=0.��������
   window.setTimeout("Scroll2();", interval );
} 

Scroll();


</script>