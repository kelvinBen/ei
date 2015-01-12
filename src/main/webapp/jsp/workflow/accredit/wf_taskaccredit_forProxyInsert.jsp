<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="common/javacode.jsp" %>
<HTML>
<HEAD>
<TITLE>出差代理增加</TITLE>
<%@ include file="common/js.htm" %>

</HEAD>
<BODY topmargin="10px">
<div class="btnareaCss">

</div> 
<html:messages></html:messages>
<html:form  name="frmList"  action="">
<bsp:container title="出差代理增加" >
<bsp:containbutton action="wftaskaccredit.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="URL" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="重填" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="wftaskaccreditquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
	<%@ include file="insert/proxy_body.jsp" %>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkWfTaskaccredit()) return;
  // 检查流程是否已有代理	
  // if(!checkId()) return;	
  
  // 检查 是否 存在代理的时间冲突	
  if(isConflict()) return;	
  
  document.forms[0].action ="wftaskaccredit.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkWfTaskaccredit()) return;
  document.forms[0].action ="wftaskaccredit.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="wftaskaccreditquery.cmd";
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
	url =url+"stru.cmd&method=getSelectRoot&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>";
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
	document.forms[0].note.value = ret[1];
}
/*
选择流程定义或者流程类型
*/
function selectData(){
	var type=document.all("type").value;
	//流程定义
	var wfUrl ="jsp/help.jsp?url=processhelpquery.cmd&organId=1&isSelect=0";  // 流程这块通过通用组件定制查询,查出来的数据只是当前用户有权处理的流程
	
	//流程类型
	var wfTypeUrl="jsp/help.jsp?url=processtypehelpquery.cmd";
	var win ="";
	if(type=="1")
		//win = showModalDialog(wfUrl,window,"scroll:yes;status:no;dialogWidth:550px;dialogHeight:500px");
		win=help("wf_processhelp");
	else
		win = showModalDialog(wfTypeUrl,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	if(win==null)return;
	var ret;
	if(type=="1")
		 ret = win[0];
	else
		 ret=win;
	if(ret==null){
		ret=new Array(3);
		ret[0]="";
		ret[1]="";
		ret[2]="";
	}
	if(ret[0]==null){
		ret[0]="";
		ret[1]="";
		ret[2]="";
	}
	if(ret[0] == document.forms[0].dataid.value){
		return;
	}
	document.forms[0].dataid.value = ret[0];
	document.forms[0].dataname.value = ret[1];
}
function typeChanged(){
	document.forms[0].dataid.value = "";
	document.forms[0].dataname.value = "";
}

function checkId(){
	var type= $('type').value;
	var dataid= $('dataid').value;
	var agentorganid= $('agentorganid').value;
	var result= xmlhttp("wftaskaccredit.cmd?method=isExist&type="+type+"&dataid="+dataid+"&agentorganid="+agentorganid);
	//alert(result);//返回字符串为空时，表示该主键没被使用
	if(result!=""){
		alert("该流程已经被指定了代理人,一个流程只能指定一个代理人！");
		return false;
	}
	return true;
}


</script>
<script type="text/javascript"
	src="jsp/workflow/accredit/wf_taskaccredit.js"></script>