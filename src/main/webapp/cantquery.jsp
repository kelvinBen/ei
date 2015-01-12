<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>

<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@page import="org.ld.soa.util.RequestUtil"%>
<HTML>
<HEAD>
<TITLE>����������ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
    String chakan = (String)request.getParameter("chakan");
  
  
  List s=new ArrayList();
  request.setAttribute("flexgrid.data",s);
  for(int i=0;i<10;i++){
	  Map m=new HashMap();
	 m.put("cantCode",i+"c");
	 m.put("cantName",i+"����");
	 m.put("shortName",i+"���");
	 s.add(m);
  }
String 	sourceReferenceId=(String)request.getAttribute("sourceReferenceId"); //ҵ������
	if(sourceReferenceId==null)
		sourceReferenceId="";	
String 	formId=(String)request.getAttribute("formId"); //ҵ��ģ���ʶ
	if(sourceReferenceId==null)
		sourceReferenceId="";	
	
String procDefId = request.getParameter("procDefId");
		String actDefId=request.getParameter("actDefId");
		String actDefName=request.getParameter("actDefName");
		
if(actDefName==null)
	actDefName=(String)request.getAttribute("curActName"); //��ǰ��������
if(actDefId==null)
		actDefId=(String)request.getAttribute("curActDefId"); //��ǰ���ڶ���ID
	

String activityId=RequestUtil.getPara2String(request,"activityId"); //����ʵ��ID
String processId=RequestUtil.getPara2String(request,"processId"); //����ʵ��ID
String sysOrganId=RequestUtil.getPara2String(request,"sysOrganId"); //��ǰ����Ĵ�����

String userId=GetBspInfo.getBspInfo().getEmployee().getOrganId();

    Map map = new HashMap();
request.setAttribute("html.data", map);
%>
<widgets:container title=" �б�" >

<html:form name="frmList" action="testprocess.jsp">

<html:button name="aa" onclick="createP()" value="��������" ></html:button>
<html:button name="aa" onclick="createAndsendP()" value="�������̲�����" ></html:button>
<html:button name="aab" onclick="sendP()" value="������һ������" ></html:button>
<html:button name="aab" onclick="showProcStatus()" value="�鿴����ͼ" ></html:button>
<br/>
<html:button name="aab" onclick="selectNextActive()" value="ѡ����Է��ͻ���" ></html:button>
<html:button name="aab" onclick="sendBySelect()" value="���͵�ѡ���Ļ���" ></html:button>
<br/>
<html:button name="aab" onclick="selectJump()" value="ѡ�����ת����" ></html:button>
<html:button name="aab" onclick="Jump()" value="��ת��ѡ���Ļ���" ></html:button>

<hr/>

���̶���ID (procDefId )��
<input type="text" name="procDefId" id="procDefId" value="<%=procDefId%>" size=50> 
<br/>
������ID (userId����organId )��
<input type="text" name="userId" id="userId" value="<%=userId%>" size=50> 
<br/>
ҵ��������<input type="text" name="sourceReferenceId" id="sourceReferenceId" value="<%=sourceReferenceId%>" size=50> 
<br/>
�������ƣ�operateType <input type="text" name="operateType" id="operateType" value="��������" size=50> 
<br/>
��ǰ���ڶ���ID��actDefId<input type="text" name="actDefId" id="actDefId" value="<%=actDefId%>" size=50> 
��ǰ�������ƣ�actDefName<input type="text" name="actDefName" id="actDefName" value="<%=actDefName%>" size=50> 
<br/>
����ҵ��ģ�飺formId <input type="text" name="formId" id="formId" value="<%=formId %>" size=50> 
<br/>
<hr>

����ʵ��ID��processId <input type="text" name="processId" id="processId" value="<%=processId %>" size=50> 
<br/>
��ǰ����ʵ��ID��activityId <input type="text" name="activityId" id="activityId" value="<%=activityId %>" size=50> 
<br/>
��ǰ����Ĵ����ˣ�sysOrganId <input type="text" name="sysOrganId" id="sysOrganId" value="<%=sysOrganId %>" size=50> 
<br/>
<br/>
<hr>

ѡ��Ļ���ID��nextActivityDefId <input type="text" name="nextActivityDefId" id="nextActivityDefId" value="" size=50> 
<br/>
ѡ��Ļ��ڣ�nextActivityDisName <input type="text" name="nextActivityDisName" id="nextActivityDisName" value="" size=50> 
<br/>
ѡ��ĸû��ڵĴ�����ID��nextActivityUserId <input type="text" name="nextActivityUserId" id="nextActivityUserId" value="" size=50> 
<br/>
ѡ��ĸû��ڵĴ����ˣ�nextActivityUserName <input type="text" name="nextActivityUserName" id="nextActivityUserName" value="" size=50> 
<br/>

�Ƿ�鿴��<%=chakan %>
</html:form>
</widgets:container>

<script language="javascript">

//�Լ�����ѡ����
function createP(){
	document.forms[0].submit();
	
}

function createAndsendP(){
	document.forms[0].action="createAndsendP.jsp";
	document.forms[0].submit();
	
}

function sendP(){
    document.forms[0].action="sendprocess.jsp";
	document.forms[0].submit();
	
}
//�鿴����ͼ
function showProcStatus(){
	var curFlowId=document.all("procDefId").value;
	var processId=document.all("processId").value;
	var curFormId=document.all("formId").value;
  	var url="taskinfo.cmd?method=displaystatus&processId="+ processId+ "&curFormId=" +curFormId+"&curFlowId="+curFlowId;
	window.open(url);
	
}
//ѡ����Է��ͻ���
function selectNextActive()
{
   var activityId=$('activityId').value;
   var processId=$('processId').value;
   var curActDefId= $('actDefId').value; //��ǰ���ڶ���ID
   
	var url="taskinfo.cmd?method=getnextactivities&activityId="+activityId+"&processId="+processId+"&curActDefId="+curActDefId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	document.all("nextActivityDefId").value=obj[0];
	document.all("nextActivityDisName").value=obj[1];
	document.all("nextActivityUserId").value=obj[2];
	document.all("nextActivityUserName").value=obj[3];
	
}
//���͵�ѡ�еĻ���
function sendBySelect(){
    document.forms[0].action="sendBySelect.jsp";
	document.forms[0].submit();
}

//��ת����
function selectJump()
{
   var activityId=$('activityId').value;
   var processId=$('processId').value;
   var curActDefId= $('actDefId').value; //��ǰ���ڶ���ID
   
	var url="taskinfo.cmd?method=getjumpactivities&processId="+processId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	document.all("nextActivityDefId").value=obj[0];
	document.all("nextActivityDisName").value=obj[1];
	document.all("nextActivityUserId").value=obj[2];
	document.all("nextActivityUserName").value=obj[3];
	
}

//���͵�ѡ�еĻ���
function Jump(){
    document.forms[0].action="jump.jsp";
	document.forms[0].submit();
}


</script>