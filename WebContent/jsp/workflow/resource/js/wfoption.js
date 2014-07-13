// wfoption.js

// newFunction

var MatrixCol = "σ";
var MatrixRow = "τ";

/**使用浏览器打印表单*/
function printFormUseExp(){
	if(!window.confirm("执行打印操作前请确保已经保存过表单！", "确定", "取消")){
		return false;
	}
	var processId=document.all("processId").value;
	var url="taskinfo.cmd?method=printForm&processId="+processId;
	var window2=window.open(url);
	window2.focus();
}
  /* 
  关闭文件不保存
  */
function closeFileNtko(){
	webWord = null;
	textMenuObj.style.display = "none";
	webOfficeNt.style.display = "none";
	openObjNt.disabled = false;
}

//该函数判断任务是否已经启动
function isStarted(){
	var processId=document.all("processId").value;
	if(processId==""){
		alert("请先保存后再使用该操作！");
		return false;
	}
	return true;
}
//该函数判断是否可以创建任务
function canCreate(){
	var processId=document.all("processId").value;
	if(processId!=""){
		alert("任务已经创建，不能使用该操作！");
		return false;
	}
	return true;
}
//该函数判断是否可以冻结任务
function canSuspend(){
var curActivityState=document.all("curActivityState").value;
	if(curActivityState=="open.not_running.suspended"){
		alert("当前任务已经处于冻结状态，不能使用该操作！");
		return false;
	}
	return true;
}
//该函数判断是否可以解冻任务
function canResume(){
	var curActivityState=document.all("curActivityState").value;
	if(curActivityState!="open.not_running.suspended"){
		alert("当前任务没有处于冻结状态，不能使用该操作！");
		return false;
	}
	return true;
}
//该函数判断是否处于冻结任务
function isSuspend(){
var curActivityState=document.all("curActivityState").value;
	if(curActivityState=="open.not_running.suspended"){
		alert("当前任务处于冻结状态，不能使用该操作！");
		return true;
	}
	return false;
}
//该函数判断是否有正文
function hasDocument(){
	var documentContent=document.all("documentContent").value;
	if(documentContent==""){
		alert("当前任务没有正文，请添加正文！");
		return false;
	}
	return true;
}
function isCurUser(){
	var activityUser=document.all("activityUser").value;
	var bspUserId=document.all("bspUserId").value;
	var actUsers=activityUser.split(",");
	
	for(var i=0;i<actUsers.length;i++){
		if(actUsers[i]==bspUserId) return true;
	}
	return false;
}
function submitAction(action,actionTitle)
{
	
	var canDisable = (window.event != null && window.event.srcElement != null && window.event.srcElement.tagName.toLowerCase() == "button");
	if (canDisable) {
		window.event.srcElement.disabled = true;
	}
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if (!document.forms.item(0).submit())
		{
		window.event.srcElement.disabled = false;
		}
	
}
function submitNoVerfiy(action,actionTitle)
{

		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		document.forms.item(0).submit(false);
}

function create(action,actionTitle){
	if(!canCreate())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	window.event.srcElement.disabled = true;
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
    
    /**设置处理意见*/
	var dealOpinion=document.all("dealOpinion");
	if(dealOpinion!=null){
		if(dealOpinion.length>1){
			dealOpinion=dealOpinion[0];
		}
		var signField=document.all(dealOpinion.valueCtrl);
		var signType=dealOpinion.signType;
		if("1"==signType){
			dealOpinion.value="";
		}else{
			dealOpinion.value=signField.value;
		}
		
	}
    
	if(!document.forms.item(0).submit(false)){
		window.event.srcElement.disabled = false;
	}
}
function createWithVerify(action,actionTitle){
	if(!canCreate())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	window.event.srcElement.disabled = true;
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
    
    /**设置处理意见*/
	var dealOpinion=document.all("dealOpinion");
	if(dealOpinion!=null){
		if(dealOpinion.length>1){
			dealOpinion=dealOpinion[0];
		}
		var signField=document.all(dealOpinion.valueCtrl);
		var signType=dealOpinion.signType;
		if("1"==signType){
			dealOpinion.value="";
		}else{
			dealOpinion.value=signField.value;
		}
		
	}
    
	if(!document.forms.item(0).submit(true)){
		window.event.srcElement.disabled = false;
	}
}
/**
 * 保存并发送
 * @param {} action 
 * @param {} actionTitle 返回的提示
 */
function createAndSend(action,actionTitle){
	if(!canCreate())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	document.all("Ins_ISAPPROVE").value = "0";	
	window.event.srcElement.disabled = true;
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
    
    /**设置处理意见*/
	var dealOpinion=document.all("dealOpinion");
	if(dealOpinion!=null){
		if(dealOpinion.length>1){
			dealOpinion=dealOpinion[0];
		}
		var signField=document.all(dealOpinion.valueCtrl);
		var signType=dealOpinion.signType;
		if("1"==signType){
			dealOpinion.value="";
		}else{
			dealOpinion.value=signField.value;
		}
		
	}
    
	if(!document.forms.item(0).submit(true)){
		window.event.srcElement.disabled = false;
	}
}
function saveFormData(action,actionTitle,verify){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	window.event.srcElement.disabled = true;
	document.forms.item(0).SAVE_RETURN_URL.value="taskinfo.cmd?method=fordeal&activityId="+document.forms.item(0).activityId.value+"&processId="+document.forms.item(0).processId.value;
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
	if(!document.forms.item(0).submit(verify)){
		window.event.srcElement.disabled = false;
	}
		
}



function saveControl(actionTitle){
	
	var processId=document.forms.item(0).processId.value;
	if(processId=="")
		create("taskinfo.cmd?method=createdocument&isSave=1",actionTitle);
	else
		saveFormData("taskinfo.cmd?method=saveformdata&isSave=1",actionTitle,false);
}
function saveControlWithVerify(actionTitle){
	
	var processId=document.forms.item(0).processId.value;
	if(processId=="")
		createWithVerify("taskinfo.cmd?method=createdocument&isSave=1",actionTitle);
	else
		saveFormData("taskinfo.cmd?method=saveformdata&isSave=1",actionTitle,true);
}
function sendControl(actionTitle){
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var processId=document.forms.item(0).processId.value;
	if(processId=="")
		createAndSend("taskinfo.cmd?method=createAndSend",actionTitle);
	else
		send("taskinfo.cmd?method=send",actionTitle);
}
function adjunctManage(isEdit) {
	if(isSuspend()) return;
	window.location.href="#adjunct";
}

function approve(action,actionTitle){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	if(!isCurUser()){
		alert("只有当前任务处理人才有权使用该操作！");
		return;
	}
	document.all("Ins_ISAPPROVE").value = "1";
		window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(true)){
			window.event.srcElement.disabled = false;
		}
		
}
function reject(action,actionTitle){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	if(!isCurUser()){
		alert("只有当前任务处理人才有权使用该操作！");
		return;
	}
	document.all("Ins_ISAPPROVE").value = "-1";
		window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(true)){
			window.event.srcElement.disabled = false;
		}
}

function send(action,actionTitle){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var curActivityState=document.all("curActivityState").value;
	if("open.not_running.suspended"==curActivityState){
		alert("当前任务被冻结，无法操作！");
		return
	}
	if(!isCurUser()){
		alert("只有当前任务处理人才有权使用该操作！");
		return;
	}
	var dealOpinion=document.all("dealOpinion");
	if(dealOpinion!=null){
		if(dealOpinion.length>1){
			dealOpinion=dealOpinion[0];
		}
		var signField=document.all(dealOpinion.valueCtrl);
		var signType=dealOpinion.signType;
		if("1"==signType){
			dealOpinion.value="";
		}else{
			dealOpinion.value=signField.value;
		}
		
	}

	document.all("Ins_ISAPPROVE").value = "0";	
		window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(true)){
			window.event.srcElement.disabled = false;
		}
		
}
/**回复*/
function revert(action,actionTitle){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var curActivityState=document.all("curActivityState").value;
	if("open.not_running.suspended"==curActivityState){
		alert("当前任务被冻结，无法操作！");
		return
	}
	if(document.all("previousActivityId").value==""){
		alert("没有发送环节，无法操作！");
		return;
	}
	if(document.all("previousResource").value==""){
		alert("没有发送人，无法操作！");
		return;
	}	
	/**设置处理意见*/
	var dealOpinion=document.all("dealOpinion");
	if(dealOpinion!=null){
		if(dealOpinion.length>1){
			dealOpinion=dealOpinion[0];
		}
		var signField=document.all(dealOpinion.valueCtrl);
		var signType=dealOpinion.signType;
		if("1"==signType){
			dealOpinion.value="";
		}else{
			dealOpinion.value=signField.value;
		}
		
	}
	
	//设置目标环节和参与者
	document.all("nextActivityName").value=document.all("previousActivityId").value;
	document.all("nextActivityDisName").value=document.all("previousActivityName").value;
	document.all("nextActivityPartyName").value=document.all("previousResource").value;
	document.all("nextActivityPartyDisName").value=document.all("previousResourceName").value;
	
    document.all("Ins_ISAPPROVE").value = "0";	
	window.event.srcElement.disabled = true;
	action=action+"&JUMP_SIGN=revert";
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
	if(!document.forms.item(0).submit(true)){
		window.event.srcElement.disabled = false;
	}
}
function openFlow(){
	//if(!isStarted())return;
	var curFlowId=document.all("curFlowId").value;
	var processId=document.all("processId").value;
	var curFormId=document.all("curFormId").value;
  	var url="taskinfo.cmd?method=displaystatus&processId="+ processId+ "&curFormId=" +curFormId+"&curFlowId="+curFlowId;
 	showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function getDate(dateinput)
{
	var obj=showModalDialog('jsp/workflow/resource/datetime/datepage.jsp?val='+dateinput,window,'dialogWidth:162px;dialogHeight:160px;dialogLeft:'+event.screenX+';dialogTop:'+event.screenY+';status:no;scroll:no');
	if(obj!=null)
	document.all(dateinput).value=obj;
	document.all(dateinput).fireEvent("onchange");
	
}
function getDateTime(dateinput)
{
	var obj=showModalDialog('jsp/workflow/resource/datetime/datetimepage.jsp?val='+dateinput,window,'dialogWidth:162px;dialogHeight:200px;dialogLeft:'+event.screenX+';dialogTop:'+event.screenY+';status:no;scroll:no');
	if(obj!=null)
	document.all(dateinput).value=obj;	
	document.all(dateinput).fireEvent("onchange");
}
//清除日期时间
function clearDateTime(obj){
	obj.value='';
}
function getSubDate(elName,i)
{
	var index = new Number(i);
	var obj=showModalDialog('jsp/workflow/resource/datetime/datepage.jsp',window,'dialogWidth:162px;dialogHeight:160px;dialogLeft:'+event.screenX+';dialogTop:'+event.screenY+';status:no;scroll:no');
	if(obj!=null)
	document.getElementsByName(elName)[index+1].value = obj;
	document.getElementsByName(elName)[index+1].fireEvent("onchange");
	
}
function getSubDateTime(elName,i)
{
	var index = new Number(i);
	var obj=showModalDialog('jsp/workflow/resource/datetime/datetimepage.jsp',window,'dialogWidth:162px;dialogHeight:200px;dialogLeft:'+event.screenX+';dialogTop:'+event.screenY+';status:no;scroll:no');
	if(obj!=null)
	document.getElementsByName(elName)[index+1].value = obj;
	document.getElementsByName(elName)[index+1].fireEvent("onchange");
}

/**退回操作,backMode=1表示退回后再使用非选择发送时，直接发送到当前环节*/
function backto(action,actionTitle,backMode){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var userType=document.all("activityUserType").value;
	if(userType!="HUMAN"){
		alert("角色任务不允许使用该操作！");
		return;
	}
	var processId=document.all("processId").value;
	var curActDefId=document.all("curActDefId").value;
	var url="taskinfo.cmd?method=gethistoryactivities&processId="+processId+"&curActDefId="+curActDefId+"&backMode="+backMode;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:600px;status:no;scroll:no');
	if(obj==null)return;
	document.all("nextActivityName").value=obj[0];
	document.all("nextActivityDisName").value=obj[1];
	document.all("nextActivityPartyName").value=obj[2];
	document.all("nextActivityPartyDisName").value=obj[3];
	document.all("DCWORK_ACTIVITY_ISREVERT").value=obj[4];
	document.all("DCWORK_ACTIVITY_MSGTYPES").value=obj[5];
	document.all("OPERATE_REASON").value=obj[6];
	document.all("DCWORK_ACTIVITY_DURATION_UNIT").value=obj[7];
	document.all("DCWORK_ACTIVITY_LIMIT_TIME").value=obj[8];
	document.all("DCWORK_ACTIVITY_WARN_TIME").value=obj[9];		
	action=action+"&JUMP_SIGN=backto";

	//退回的方式
	action=action+"&backMode="+backMode;
		
     	window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(false)){
			window.event.srcElement.disabled = false;
		}
		
}
/**只需选择环节，不用选择参与者的退回*/
function goback(action,actionTitle,backMode){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var userType=document.all("activityUserType").value;
	if(userType!="HUMAN"){
		alert("角色任务不允许使用该操作！");
		return;
	}
	var processId=document.all("processId").value;
	var curActDefId=document.all("curActDefId").value;
	var activityId =document.all("activityId").value;
	var url="taskinfo.cmd?method=gethistoryactivities&processId="+processId+"&curActDefId="+curActDefId+"&activityId="+activityId+"&backMode="+backMode;

	var obj=showModalDialog(url,window,'dialogWidth:400px;dialogHeight:300px;status:no;scroll:no');
	
	if(obj==null)return;
	
	document.all("nextActivityName").value=obj[0];
	document.all("nextActivityDisName").value=obj[1];
	action=action+"&JUMP_SIGN=backto"+"&NOT_SELPARTY=yes";
	action=action+"&backMode="+backMode;
		window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(false)){
			window.event.srcElement.disabled = false;
		}
}
function jump(action,actionTitle,isSaveFormData){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var processId=document.all("processId").value;
	var procDefId=document.all("curFlowId").value;
	var userType=document.all("activityUserType").value;
	if(userType!="HUMAN"){
		alert("角色任务不允许使用该操作！");
		return;
	}
	var url="taskinfo.cmd?method=getjumpactivities&processId="+processId;
	var obj=showModalDialog(url,window,'dialogWidth:640px;dialogHeight:480px;status:no;scroll:no');
	if(obj==null)return;
	document.all("nextActivityName").value=obj[0];
	document.all("nextActivityDisName").value=obj[1];
	document.all("nextActivityPartyName").value=obj[2];
	document.all("nextActivityPartyDisName").value=obj[3];
	document.all("DCWORK_ACTIVITY_ISREVERT").value=obj[4];
	document.all("DCWORK_ACTIVITY_MSGTYPES").value=obj[5];
	document.all("OPERATE_REASON").value=obj[6];
	document.all("DCWORK_ACTIVITY_DURATION_UNIT").value=obj[7];
	document.all("DCWORK_ACTIVITY_LIMIT_TIME").value=obj[8];
	document.all("DCWORK_ACTIVITY_WARN_TIME").value=obj[9];
	action=action+"&JUMP_SIGN=jump";
	action=action+"&isSaveFormData="+isSaveFormData;
		window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(false)){
			window.event.srcElement.disabled = false;
		}
		
}
/*
 * 选择发送
 */
function selectAndSend(action,actionTitle)
{	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	document.all("Ins_ISAPPROVE").value = "0";
	var activityId=document.all("activityId").value;
	var processId=document.all("processId").value;
	var curActDefId=document.all("curActDefId").value;
	var isApprove=document.all("Ins_ISAPPROVE").value;
	var url="taskinfo.cmd?method=getnextactivities&activityId="+activityId+"&processId="+processId+"&curActDefId="+curActDefId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	document.all("nextActivityName").value=obj[0];
	document.all("nextActivityDisName").value=obj[1];
	document.all("nextActivityPartyName").value=obj[2];
	document.all("nextActivityPartyDisName").value=obj[3];
	
	document.all("DCWORK_ACTIVITY_ISREVERT").value=obj[4];
	document.all("DCWORK_ACTIVITY_MSGTYPES").value=obj[5];
	
	document.all("DCWORK_ACTIVITY_DURATION_UNIT").value=obj[6];
	document.all("DCWORK_ACTIVITY_LIMIT_TIME").value=obj[7];
	document.all("DCWORK_ACTIVITY_WARN_TIME").value=obj[8];
	window.event.srcElement.disabled = true;
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
    
    /**设置处理意见*/
	var dealOpinion=document.all("dealOpinion");
	if(dealOpinion!=null){
		if(dealOpinion.length>1){
			dealOpinion=dealOpinion[0];
		}
		var signField=document.all(dealOpinion.valueCtrl);
		var signType=dealOpinion.signType;
		if("1"==signType){
			dealOpinion.value="";
		}else{
			dealOpinion.value=signField.value;
		}
		
	}
    
	if(!document.forms.item(0).submit(true)){
		window.event.srcElement.disabled = false;
	}
		
	
}
function selectAndSendWithFilter(action,actionTitle)
{	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	
	////////////////选择发送前先自动保存一下表单 2006.3.3
	var d = saveFormFrame.document;
	//设置字符集编码,否则保存表单(执行saveformdata)时出现乱码
	d.charset="GBK";
	var fdiv=null;
	var form0=d.forms;
	if(form0==null || form0.length==0){
		fdiv=d.createElement("div");
		d.body.appendChild(fdiv);
	}else{
		d.body.removeChild(form0[0]);
		fdiv=d.createElement("div");
		d.body.appendChild(fdiv);
		//d.body.insertBefore(fdiv,form0[0]);
	}
	window.event.srcElement.disabled = true;
	fdiv.innerHTML=window.document.getElementById("mainfrmDiv").innerHTML;
	d.forms[0].SAVE_RETURN_URL.value="taskinfo.cmd?method=fordeal&activityId="+document.forms.item(0).activityId.value+"&processId="+document.forms.item(0).processId.value;
	d.forms[0].operateType.value="保存";
	d.forms[0].action = "taskinfo.cmd?method=saveformdata&isSave=1&subformIframe=1";
	if(!d.forms.item(0).submit(false)){
		window.event.srcElement.disabled = false;
	}
	var timeOut=500;//延时时间 500毫秒
	var startTime=new Date().getTime();
	while (new Date().getTime() - startTime<timeOut){}
	///////////////
	
	document.all("Ins_ISAPPROVE").value = "0";
	var activityId=document.all("activityId").value;
	var processId=document.all("processId").value;
	var curActDefId=document.all("curActDefId").value;
	var isApprove=document.all("Ins_ISAPPROVE").value;
	var formId=document.all("curFormId").value;
	var dataId=document.all("Ins_DATAID").value;
	
	var url="taskinfo.cmd?method=getnextactivities&activityId="+activityId+"&processId="+processId+"&curActDefId="+curActDefId+"&formId="+formId+"&dataId="+dataId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	document.all("nextActivityName").value=obj[0];
	document.all("nextActivityDisName").value=obj[1];
	document.all("nextActivityPartyName").value=obj[2];
	document.all("nextActivityPartyDisName").value=obj[3];
	
	document.all("DCWORK_ACTIVITY_ISREVERT").value=obj[4];
	document.all("DCWORK_ACTIVITY_MSGTYPES").value=obj[5];
	
	document.all("DCWORK_ACTIVITY_DURATION_UNIT").value=obj[6];
	document.all("DCWORK_ACTIVITY_LIMIT_TIME").value=obj[7];
	document.all("DCWORK_ACTIVITY_WARN_TIME").value=obj[8];
	window.event.srcElement.disabled = true;
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
    
    /**设置处理意见*/
	var dealOpinion=document.all("dealOpinion");
	if(dealOpinion!=null){
		if(dealOpinion.length>1){
			dealOpinion=dealOpinion[0];
		}
		var signField=document.all(dealOpinion.valueCtrl);
		var signType=dealOpinion.signType;
		if("1"==signType){
			dealOpinion.value="";
		}else{
			dealOpinion.value=signField.value;
		}
		
	}
    
	if(!document.forms.item(0).submit(true)){
		window.event.srcElement.disabled = false;
	}
		
	
}
function terminate(action,actionTitle){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	if(!confirm("该操作不可恢复，确定要继续吗？"))return;
	var url = "taskinfo.cmd?method=forterminatedialog";
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;

	document.all("DCWORK_ACTIVITY_MSGTYPES").value=obj[0];
	document.all("MESSAGE_MANAGER").value=obj[1];
	document.all("OPERATE_REASON").value=obj[2];
		window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(false)){
			window.event.srcElement.disabled = false;
		}
		
}
function suspend(action,actionTitle){
	if(!isStarted())return;
	if(!canSuspend())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var url = "taskinfo.cmd?method=forsuspenddialog";
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	action+="&RESUME_DATE="+obj[2];
	document.all("DCWORK_ACTIVITY_MSGTYPES").value=obj[0];
	document.all("MESSAGE_MANAGER").value=obj[1];
	document.all("OPERATE_REASON").value=obj[3];
		window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(false)){
			window.event.srcElement.disabled = false;
		}
		
}
function resume(action,actionTitle){
	if(!isStarted())return;
	if(!canResume())return;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var url = "taskinfo.cmd?method=forresumedialog";
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	document.all("DCWORK_ACTIVITY_MSGTYPES").value=obj[0];
	document.all("MESSAGE_MANAGER").value=obj[1];	
	document.all("OPERATE_REASON").value=obj[2];
		window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(false)){
			window.event.srcElement.disabled = false;
		}
		
}

function assign(action,actionTitle){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var activityUser=document.all("activityUser").value;
	var activityUserType=document.all("activityUserType").value;
	var processId=document.all("processId").value;
    var url = "jsp/help.jsp?url=taskinfo.cmd&method=forassigndialog&processId="+processId+"&activityUser="+activityUser+"&activityUserType="+activityUserType;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:600px;status:no;scroll:no');
	if(obj==null)return;
	
  
  
  document.all("DCWORK_ACTIVITY_MSGTYPES").value=obj[0];
  document.all("MESSAGE_MANAGER").value=obj[1];
  document.all("NEW_USER_ID").value=obj[2];
  document.all("NEW_USER_NAME").value=obj[3];
  document.all("OPERATE_REASON").value=obj[4];
  document.all("OLD_USER_NOTE").value=obj[5];
  document.all("NEW_USER_NOTE").value=obj[6];
  document.all("OLD_USER_ID").value=obj[7];
  document.all("OLD_USER_NAME").value=obj[8];
  
		window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(false)){
			window.event.srcElement.disabled = false;
		}
		
}
function hasten(){
	if(!isStarted())return;
	if(isSuspend())return;
	var url = "taskinfo.cmd?method=forhastendialog";
	url=url+"&activityId="+document.all("activityId").value;
	url=url+"&activityName="+document.all("curActivityName").value;
	url=url+"&processId="+document.all("processId").value;
	url=url+"&formId="+document.all("curFormId").value;
	url=url+"&curFlowId="+document.all("curFlowId").value;
	url=url+"&curFlowName="+document.all("curFlowName").value;
	url=url+"&dataId="+document.all("Ins_DATAID").value;
	url=url+"&activityUser="+document.all("activityUser").value;
	url=url+"&curActDefId="+document.all("curActDefId").value;
	showModalDialog(url,window,'dialogWidth:600px;dialogHeight:400px;status:no;scroll:no');
	
}
function makeCopy(){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	//var url ="struhelp.cmd?method=getCheckEmpRoot&isCheckBox=1&isTree=1&organType=8";      
	var url ="struhelp.cmd?method=getSelectRoot&isCheckBox=1&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=0&nevervote=1&organType=8";   
  	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
 	var curobj=window.event.srcElement;
 	if(win==null)return;
 	if(win.length==0)return;
	if(win[0]==""){
		return;
	}
 	var processId=document.all("processId").value;
 	var edocType=document.all("Ins_EXT_EDOC_TYPE").value;
 	var activityName=document.all("curActivityName").value;
 	var formId=document.all("curFormId").value;
 	var dataId=document.all("Ins_DATAID").value;
 	url="edoccopy.cmd?method=insert&PROCESS_ID="+processId+"&ORGAN_ID="+win[0]+"&ACTIVITY_NAME="+activityName+"&ORGAN_NAME="+win[1]+"&FORM_ID="+formId+"&DATA_ID="+dataId+"&EDOC_TYPE="+edocType;
	var conn = new ActiveXObject("Microsoft.XMLHTTP");
	conn.open("GET", url, false);
    conn.send();
    alert(conn.responseText);
}
function localsend(){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	if (!hasDocument())return;
    var url1 ="struhelp.cmd?method=getSelectRoot&isCheckBox=1&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=0&nevervote=1&organType=1,2&title=选择主送机关&clearButtonVisible=false";   
  	var win1 = showModalDialog(url1,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
 	if(win1==null)return;
 	var mainOrganId=win1[0];
 	if(mainOrganId==""){
 		return;
 	}
 	var url2 ="struhelp.cmd?method=getSelectRoot&isCheckBox=1&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=0&nevervote=1&organType=1,2&title=选择抄送机关&clearButtonVisible=false&mustSelect=false";   
 	var win2 = showModalDialog(url2,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
 	if(win2==null)return;
 	var copyOrganId=win2[0];
 	if (copyOrganId != "") {
		var mainOrgan=win1[0].split(MatrixCol);
		var copyOrgan=win2[0].split(MatrixCol);
 	
		for (var i=1; i<=mainOrgan.length; i++) {
			for (var j=1; j<=copyOrgan.length; j++) {
				if (mainOrgan[i-1] == copyOrgan[j-1]) {
					alert("主送机关与抄送机关不能重复");
					return;
				}
			}
		}
	}
 	
 	var processId=document.all("processId").value;
 	var edocType=document.all("Ins_EXT_EDOC_TYPE").value;
 	var formId=document.all("curFormId").value;
 	var dataId=document.all("Ins_DATAID").value;
 	var url3="edocsend.cmd?PROCESS_ID="+processId+"&MAIN_ORGAN_ID="+mainOrganId+"&COPY_ORGAN_ID="+copyOrganId+"&FORM_ID="+formId+"&DATA_ID="+dataId+"&EDOC_TYPE="+edocType;

	var conn = new ActiveXObject("Microsoft.XMLHTTP");
	conn.open("GET", url3, false);
    conn.send();
    alert(conn.responseText);
}
function foreignsend(){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	if (!hasDocument())return;
 	
 	var processId=document.all("processId").value;
 	var edocType=document.all("Ins_EXT_EDOC_TYPE").value;
 	var formId=document.all("curFormId").value;
 	var dataId=document.all("Ins_DATAID").value;
 	var url3="edocforeignsend.cmd?PROCESS_ID="+processId+"&FORM_ID="+formId+"&DATA_ID="+dataId+"&EDOC_TYPE="+edocType;

	var conn = new ActiveXObject("Microsoft.XMLHTTP");
	conn.open("GET", url3, false);
	conn.send();
	alert(conn.responseText);
}
//办结（目前不用）
function finishedoc(){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
		//校验表单
	if(!runFormVerify(document.forms(0))) return false;
	
	if(!confirm("确认办结？"))return;
 	var processId=document.all("processId").value;
 	var edocType=document.all("Ins_EXT_EDOC_TYPE").value;
 	var url="edocfinish.cmd?PROCESS_ID="+processId+"&EDOC_TYPE="+edocType;
	
	var conn = new ActiveXObject("Microsoft.XMLHTTP");
	conn.open("GET", url, false);
    conn.send();
    var ret=conn.responseText;
    //alert(ret);
    if(ret.indexOf("success")!=-1){
    	sendControl('办结');
    }else{
    	alert(ret);
    }
}
function deleteprocess(action,actionTitle){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	if(!confirm("该操作不可恢复，确定要继续吗？"))return;
		window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(false)){
			window.event.srcElement.disabled = false;
		}
		
}
function limittime(){
    var curActivityState=document.all("curActivityState").value;
	if("open.not_running.suspended"==curActivityState){
		alert("当前任务被冻结，无法操作！");
		return;
	}
	var url="taskinfo.cmd?method=forlimittime";
	url+="&DCWORK_ACTIVITY_DURATION_UNIT="+document.all("DCWORK_ACTIVITY_DURATION_UNIT").value;
	url+="&DCWORK_ACTIVITY_LIMIT_TIME="+document.all("DCWORK_ACTIVITY_LIMIT_TIME").value;
	url+="&DCWORK_ACTIVITY_WARN_TIME="+document.all("DCWORK_ACTIVITY_WARN_TIME").value;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	document.all("DCWORK_ACTIVITY_DURATION_UNIT").value=obj[0];
	document.all("DCWORK_ACTIVITY_LIMIT_TIME").value=obj[1];
	document.all("DCWORK_ACTIVITY_WARN_TIME").value=obj[2];
}
function huizhi(){
	var url="taskinfo.cmd?method=forhuizhi&DCWORK_ACTIVITY_ISREVERT="+document.all("DCWORK_ACTIVITY_ISREVERT").value;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	document.all("DCWORK_ACTIVITY_ISREVERT").value=obj[0];
}
function undelegate(action,actionTitle){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	window.event.srcElement.disabled = true;
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
	if(!document.forms.item(0).submit(false)){
		window.event.srcElement.disabled = false;
	}
		
}
function dubanxiafa(){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808保存正文
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	if(!hasDocument()){
		return;
	}
	var url="edocduban.cmd?method=forxiafa";
	url=url+"&PROCESS_ID="+document.all("processId").value;
	url=url+"&DATA_ID="+document.all("Ins_DATAID").value;
	url=url+"&FORM_ID="+document.all("curFormId").value;
	
	var obj=showModalDialog(url,window,'dialogWidth:600px;dialogHeight:600px;status:no;scroll:no');
	
}
function edocDuban(){
	if(!isStarted())return;
	if(isSuspend())return;
	if(!isDuban()){
		alert("没有督办信息，或者督办信息没有下发！");
		return;
	}
	//20060808保存正文
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var processId = document.all("processId").value;
	var dubanProcessId = document.all("Ins_EXT_DUBAN_PROCID").value;
	var url = "edocduban.cmd?method=getDubanByProcessId&processId="+processId+"&dubanProcessId="+dubanProcessId;
	var obj=showModalDialog(url,window,'dialogWidth:700px;dialogHeight:600px;status:no;scroll:no');
}
function edocDubanResult(){
	if(!isStarted())return;
	if(isSuspend())return;
	if(!isDuban()){
		alert("没有督办信息，或者督办信息没有下发！");
		return;
	}
	//20060808保存正文
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;	
	var processId = document.all("processId").value;
	var dubanProcessId = document.all("Ins_EXT_DUBAN_PROCID").value;
	var url = "jsp/help.jsp?url=edocdubanresult.cmd&method=forinsert&processId="+processId+"&dubanProcessId="+dubanProcessId;
	var obj=showModalDialog(url,window,'dialogWidth:700px;dialogHeight:600px;status:no;scroll:no');
}
function isDuban(){
	var processId=document.all("processId").value;
 	var dubanProcessId=document.all("Ins_EXT_DUBAN_PROCID").value;
 	url="edocduban.cmd?method=isDuban&processId="+processId+"&dubanProcessId="+dubanProcessId;
	var conn = new ActiveXObject("Microsoft.XMLHTTP");
	conn.open("GET", url, false);
    conn.send();
	var isDuban = conn.responseText;
	return isDuban.trim()=="true"?true:false;
}
function backtoHistory(){
	var processId=document.all("processId").value;
	var url ="jsp/help.jsp?url=edocmonitorinfoquery.cmd&infoType=7&processId="+processId;
	var obj=showModalDialog(url,window,'dialogWidth:600px;dialogHeight:450px;status:no;scroll:yes');
}

function textareaDoBlur(el){

	var len = el.getAttribute("maxlength");
	if (len != null && !isNaN(parseInt(len)) && parseInt(len) > 0) {
			if (el.value.getByte() > parseInt(len)) {
				alert(el.getAttribute("formTitle")+"输入的内容过长！最大长度为：" + len + "字节");
				el.select();
				el.focus();
			}
		}
}
function showText(obj){
	tab11.doCardShow("card_text"); 
	//if(isSavedNtko())
		//openFileNtKo(obj);
}
function showReadText(obj){
	tab11.doCardShow("card_text"); 
	//if(isSavedNtko())
		//openFileNtKo(obj);
}
/**使用通用流程，把表单转发给他人查看并填写意见*/
function forward(){
	var processId=document.all("processId").value;
	var processName=document.all("curFlowName").value;
	var formId=document.all("curFormId").value;
	var dataId=document.all("Ins_DATAID").value;
	var url ="jsp/workflow/uniProcess/wf_uniprocess_forward_help.jsp?processId="+processId+"&processName="+processName+"&formId="+formId+"&dataId="+dataId;    
 	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:400px"); 
}
/**通用流程查询 查询通用流程转发记录及处理状态*/
function uinProcessQuery(){
	var processId=document.all("processId").value;
	var url ="wfuniprocessquery_page_init.cmd?helpQuery=true&processidSearch="+processId+"&statusSearch=0&hasSelf=false";    
 	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:650px;dialogHeight:500px"); 
}
/**动态的增加环节参与者，会签环节使用，但不能用于顺序会签*/
function addAssign(){

	if(!isCurUser()){
		alert("只有当前任务处理人才有权使用该操作！");
		return;
	}
	var curActivityState=document.all("curActivityState").value;
	if("open.not_running.suspended"==curActivityState){
		alert("当前任务被冻结，无法操作！");
		return
	}
	var url ="struhelp.cmd?method=getSelectRoot&isTree=1&isCheckBox=1&isIncludeSelf=0&organType=8&rootId=1&mustSelect=true&clearButtonVisible=false";    
 	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
 	//取消
 	if (win==null) return;
 	//清除
	if(typeof(win)=="string"){
		document.forms[0].newUserIds.value="";
 		document.forms[0].newUserNames.value="";
	}
 	//确定 organId#organName,organId#organName
 	var organIdNames=win[4];
 	var ids="";
 	var names="";
 	var idNamesArr=organIdNames.split(",");
 	for(var i=0;i<idNamesArr.length;i++){
 		if(ids==""){
 			ids=idNamesArr[i].split("#")[0];
 			names=idNamesArr[i].split("#")[1];
 		}else{
 			ids+=","+idNamesArr[i].split("#")[0];
 			names+=","+idNamesArr[i].split("#")[1];
 		}
 	}
 	
 	var processId=document.all("processId").value;
 	var activityId=document.forms.item(0).activityId.value;
 	url="taskinfo.cmd?method=addAssign&processId="+processId+"&activityId="+activityId+"&addedUserIds="+ids+"&addedUserNames="+names;
    
    document.forms[0].action=url;
    document.forms[0].submit();
}
/**动态的增加环节参与者并把任务发送出去，会签环节使用，但不能用于顺序会签*/
function addAssignAndSend(actionTitle){
	
	if(!isCurUser()){
		alert("只有当前任务处理人才有权使用该操作！");
		return;
	}
	var curActivityState=document.all("curActivityState").value;
	if("open.not_running.suspended"==curActivityState){
		alert("当前任务被冻结，无法操作！");
		return
	}
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	//校验表单
	if(!runFormVerify(document.forms(0))) return false;
	
	var processId=document.forms.item(0).processId.value;
	if(processId==""){
		alert("此环节操作只适用于会签环节！");
		return false;
	}else{
		document.all("Ins_ISAPPROVE").value = "0";	
		//window.event.srcElement.disabled = true;
        document.forms[0].operateType.value=actionTitle;
	}
		
	//显示选择人员的帮助窗口
	var url ="struhelp.cmd?method=getSelectRoot&isTree=1&isCheckBox=1&isIncludeSelf=0&organType=8&rootId=1&mustSelect=true&clearButtonVisible=false";    
 	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
 	//取消
 	if (win==null) return;
 	//清除
	if(typeof(win)=="string"){
		document.forms[0].newUserIds.value="";
 		document.forms[0].newUserNames.value="";
	}
 	//确定 organId#organName,organId#organName
 	var organIdNames=win[4];
 	var ids="";
 	var names="";
 	var idNamesArr=organIdNames.split(",");
 	for(var i=0;i<idNamesArr.length;i++){
 		if(ids==""){
 			ids=idNamesArr[i].split("#")[0];
 			names=idNamesArr[i].split("#")[1];
 		}else{
 			ids+=","+idNamesArr[i].split("#")[0];
 			names+=","+idNamesArr[i].split("#")[1];
 		}
 	}
 	
 	//var processId=document.all("processId").value;
 	var activityId=document.forms.item(0).activityId.value;
 	var url2="taskinfo.cmd?method=addAssign&send_=true&processId="+processId+"&activityId="+activityId+"&addedUserIds="+ids+"&addedUserNames="+names;
    
    document.forms[0].action=url2;
    document.forms[0].submit();
}
//收回任务
function retract(action){
   var processId=document.all("processId").value;
	var curActDefId=document.all("curActDefId").value;
	var activityId =document.all("activityId").value;
	var url="taskinfo.cmd?method=gethistoryactivities&processId="+processId+"&curActDefId="+curActDefId+"&activityId="+activityId;
	//20060808保存正文
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628保存附件校验
	if(!isUploadFile())return;
	var obj=showModalDialog(url,window,'dialogWidth:400px;dialogHeight:300px;status:no;scroll:no');
	
	if(obj==null)return;
	document.all("nextActivityName").value=obj[0];
	document.all("nextActivityDisName").value=obj[1];
	window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
   		if(!document.forms.item(0).submit(false)){
			window.event.srcElement.disabled = false;
		}
}

//该函数判断正文的权限，并根据权限选择是"保存"正文，还是直接关闭正文
function saveDocFile()
{	
    if (webWord == null) {
			return true;
	}
	//文档的权限
	var documentRight = document.all("documentRight").value;
	if(documentRight=="read"){	
		//没有编辑正文的权限，关闭正文
		closeFileNtko();
		return false;
	}
	else{
		if(documentRight=="edit" || documentRight=="emend")
		//有正文编辑权限,保存正文
		saveFileNtko();
		return true;
	}
}