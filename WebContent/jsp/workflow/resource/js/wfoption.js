// wfoption.js

// newFunction

var MatrixCol = "��";
var MatrixRow = "��";

/**ʹ���������ӡ��*/
function printFormUseExp(){
	if(!window.confirm("ִ�д�ӡ����ǰ��ȷ���Ѿ����������", "ȷ��", "ȡ��")){
		return false;
	}
	var processId=document.all("processId").value;
	var url="taskinfo.cmd?method=printForm&processId="+processId;
	var window2=window.open(url);
	window2.focus();
}
  /* 
  �ر��ļ�������
  */
function closeFileNtko(){
	webWord = null;
	textMenuObj.style.display = "none";
	webOfficeNt.style.display = "none";
	openObjNt.disabled = false;
}

//�ú����ж������Ƿ��Ѿ�����
function isStarted(){
	var processId=document.all("processId").value;
	if(processId==""){
		alert("���ȱ������ʹ�øò�����");
		return false;
	}
	return true;
}
//�ú����ж��Ƿ���Դ�������
function canCreate(){
	var processId=document.all("processId").value;
	if(processId!=""){
		alert("�����Ѿ�����������ʹ�øò�����");
		return false;
	}
	return true;
}
//�ú����ж��Ƿ���Զ�������
function canSuspend(){
var curActivityState=document.all("curActivityState").value;
	if(curActivityState=="open.not_running.suspended"){
		alert("��ǰ�����Ѿ����ڶ���״̬������ʹ�øò�����");
		return false;
	}
	return true;
}
//�ú����ж��Ƿ���Խⶳ����
function canResume(){
	var curActivityState=document.all("curActivityState").value;
	if(curActivityState!="open.not_running.suspended"){
		alert("��ǰ����û�д��ڶ���״̬������ʹ�øò�����");
		return false;
	}
	return true;
}
//�ú����ж��Ƿ��ڶ�������
function isSuspend(){
var curActivityState=document.all("curActivityState").value;
	if(curActivityState=="open.not_running.suspended"){
		alert("��ǰ�����ڶ���״̬������ʹ�øò�����");
		return true;
	}
	return false;
}
//�ú����ж��Ƿ�������
function hasDocument(){
	var documentContent=document.all("documentContent").value;
	if(documentContent==""){
		alert("��ǰ����û�����ģ���������ģ�");
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	window.event.srcElement.disabled = true;
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
    
    /**���ô������*/
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	window.event.srcElement.disabled = true;
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
    
    /**���ô������*/
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
 * ���沢����
 * @param {} action 
 * @param {} actionTitle ���ص���ʾ
 */
function createAndSend(action,actionTitle){
	if(!canCreate())return;
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	document.all("Ins_ISAPPROVE").value = "0";	
	window.event.srcElement.disabled = true;
	document.forms.item(0).action = action;
    document.forms[0].operateType.value=actionTitle;
    
    /**���ô������*/
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	if(!isCurUser()){
		alert("ֻ�е�ǰ�������˲���Ȩʹ�øò�����");
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	if(!isCurUser()){
		alert("ֻ�е�ǰ�������˲���Ȩʹ�øò�����");
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	var curActivityState=document.all("curActivityState").value;
	if("open.not_running.suspended"==curActivityState){
		alert("��ǰ���񱻶��ᣬ�޷�������");
		return
	}
	if(!isCurUser()){
		alert("ֻ�е�ǰ�������˲���Ȩʹ�øò�����");
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
/**�ظ�*/
function revert(action,actionTitle){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	var curActivityState=document.all("curActivityState").value;
	if("open.not_running.suspended"==curActivityState){
		alert("��ǰ���񱻶��ᣬ�޷�������");
		return
	}
	if(document.all("previousActivityId").value==""){
		alert("û�з��ͻ��ڣ��޷�������");
		return;
	}
	if(document.all("previousResource").value==""){
		alert("û�з����ˣ��޷�������");
		return;
	}	
	/**���ô������*/
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
	
	//����Ŀ�껷�ںͲ�����
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
//�������ʱ��
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

/**�˻ز���,backMode=1��ʾ�˻غ���ʹ�÷�ѡ����ʱ��ֱ�ӷ��͵���ǰ����*/
function backto(action,actionTitle,backMode){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	var userType=document.all("activityUserType").value;
	if(userType!="HUMAN"){
		alert("��ɫ��������ʹ�øò�����");
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

	//�˻صķ�ʽ
	action=action+"&backMode="+backMode;
		
     	window.event.srcElement.disabled = true;
		document.forms.item(0).action = action;
        document.forms[0].operateType.value=actionTitle;
		if(!document.forms.item(0).submit(false)){
			window.event.srcElement.disabled = false;
		}
		
}
/**ֻ��ѡ�񻷽ڣ�����ѡ������ߵ��˻�*/
function goback(action,actionTitle,backMode){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	var userType=document.all("activityUserType").value;
	if(userType!="HUMAN"){
		alert("��ɫ��������ʹ�øò�����");
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	var processId=document.all("processId").value;
	var procDefId=document.all("curFlowId").value;
	var userType=document.all("activityUserType").value;
	if(userType!="HUMAN"){
		alert("��ɫ��������ʹ�øò�����");
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
 * ѡ����
 */
function selectAndSend(action,actionTitle)
{	if(!isStarted())return;
	if(isSuspend())return;
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
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
    
    /**���ô������*/
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	
	////////////////ѡ����ǰ���Զ�����һ�±� 2006.3.3
	var d = saveFormFrame.document;
	//�����ַ�������,���򱣴��(ִ��saveformdata)ʱ��������
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
	d.forms[0].operateType.value="����";
	d.forms[0].action = "taskinfo.cmd?method=saveformdata&isSave=1&subformIframe=1";
	if(!d.forms.item(0).submit(false)){
		window.event.srcElement.disabled = false;
	}
	var timeOut=500;//��ʱʱ�� 500����
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
    
    /**���ô������*/
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	if(!confirm("�ò������ɻָ���ȷ��Ҫ������"))return;
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
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
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
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
	//20060808��������
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628���渽��У��
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
	//20060808��������
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628���渽��У��
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
	//20060808��������
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	if (!hasDocument())return;
    var url1 ="struhelp.cmd?method=getSelectRoot&isCheckBox=1&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=0&nevervote=1&organType=1,2&title=ѡ�����ͻ���&clearButtonVisible=false";   
  	var win1 = showModalDialog(url1,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
 	if(win1==null)return;
 	var mainOrganId=win1[0];
 	if(mainOrganId==""){
 		return;
 	}
 	var url2 ="struhelp.cmd?method=getSelectRoot&isCheckBox=1&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=0&nevervote=1&organType=1,2&title=ѡ���ͻ���&clearButtonVisible=false&mustSelect=false";   
 	var win2 = showModalDialog(url2,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
 	if(win2==null)return;
 	var copyOrganId=win2[0];
 	if (copyOrganId != "") {
		var mainOrgan=win1[0].split(MatrixCol);
		var copyOrgan=win2[0].split(MatrixCol);
 	
		for (var i=1; i<=mainOrgan.length; i++) {
			for (var j=1; j<=copyOrgan.length; j++) {
				if (mainOrgan[i-1] == copyOrgan[j-1]) {
					alert("���ͻ����볭�ͻ��ز����ظ�");
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
	//20060808��������
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628���渽��У��
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
//��ᣨĿǰ���ã�
function finishedoc(){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808��������
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
		//У���
	if(!runFormVerify(document.forms(0))) return false;
	
	if(!confirm("ȷ�ϰ�᣿"))return;
 	var processId=document.all("processId").value;
 	var edocType=document.all("Ins_EXT_EDOC_TYPE").value;
 	var url="edocfinish.cmd?PROCESS_ID="+processId+"&EDOC_TYPE="+edocType;
	
	var conn = new ActiveXObject("Microsoft.XMLHTTP");
	conn.open("GET", url, false);
    conn.send();
    var ret=conn.responseText;
    //alert(ret);
    if(ret.indexOf("success")!=-1){
    	sendControl('���');
    }else{
    	alert(ret);
    }
}
function deleteprocess(action,actionTitle){
	if(!isStarted())return;
	if(isSuspend())return;
	//20060808��������
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	if(!confirm("�ò������ɻָ���ȷ��Ҫ������"))return;
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
		alert("��ǰ���񱻶��ᣬ�޷�������");
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
	//20060808��������
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628���渽��У��
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
	//20060808��������
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628���渽��У��
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
		alert("û�ж�����Ϣ�����߶�����Ϣû���·���");
		return;
	}
	//20060808��������
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628���渽��У��
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
		alert("û�ж�����Ϣ�����߶�����Ϣû���·���");
		return;
	}
	//20060808��������
	if(!isSavedNtko())
	{saveDocFile();}
	//20060628���渽��У��
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
				alert(el.getAttribute("formTitle")+"��������ݹ�������󳤶�Ϊ��" + len + "�ֽ�");
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
/**ʹ��ͨ�����̣��ѱ�ת�������˲鿴����д���*/
function forward(){
	var processId=document.all("processId").value;
	var processName=document.all("curFlowName").value;
	var formId=document.all("curFormId").value;
	var dataId=document.all("Ins_DATAID").value;
	var url ="jsp/workflow/uniProcess/wf_uniprocess_forward_help.jsp?processId="+processId+"&processName="+processName+"&formId="+formId+"&dataId="+dataId;    
 	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:400px"); 
}
/**ͨ�����̲�ѯ ��ѯͨ������ת����¼������״̬*/
function uinProcessQuery(){
	var processId=document.all("processId").value;
	var url ="wfuniprocessquery_page_init.cmd?helpQuery=true&processidSearch="+processId+"&statusSearch=0&hasSelf=false";    
 	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:650px;dialogHeight:500px"); 
}
/**��̬�����ӻ��ڲ����ߣ���ǩ����ʹ�ã�����������˳���ǩ*/
function addAssign(){

	if(!isCurUser()){
		alert("ֻ�е�ǰ�������˲���Ȩʹ�øò�����");
		return;
	}
	var curActivityState=document.all("curActivityState").value;
	if("open.not_running.suspended"==curActivityState){
		alert("��ǰ���񱻶��ᣬ�޷�������");
		return
	}
	var url ="struhelp.cmd?method=getSelectRoot&isTree=1&isCheckBox=1&isIncludeSelf=0&organType=8&rootId=1&mustSelect=true&clearButtonVisible=false";    
 	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
 	//ȡ��
 	if (win==null) return;
 	//���
	if(typeof(win)=="string"){
		document.forms[0].newUserIds.value="";
 		document.forms[0].newUserNames.value="";
	}
 	//ȷ�� organId#organName,organId#organName
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
/**��̬�����ӻ��ڲ����߲��������ͳ�ȥ����ǩ����ʹ�ã�����������˳���ǩ*/
function addAssignAndSend(actionTitle){
	
	if(!isCurUser()){
		alert("ֻ�е�ǰ�������˲���Ȩʹ�øò�����");
		return;
	}
	var curActivityState=document.all("curActivityState").value;
	if("open.not_running.suspended"==curActivityState){
		alert("��ǰ���񱻶��ᣬ�޷�������");
		return
	}
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
	if(!isUploadFile())return;
	//У���
	if(!runFormVerify(document.forms(0))) return false;
	
	var processId=document.forms.item(0).processId.value;
	if(processId==""){
		alert("�˻��ڲ���ֻ�����ڻ�ǩ���ڣ�");
		return false;
	}else{
		document.all("Ins_ISAPPROVE").value = "0";	
		//window.event.srcElement.disabled = true;
        document.forms[0].operateType.value=actionTitle;
	}
		
	//��ʾѡ����Ա�İ�������
	var url ="struhelp.cmd?method=getSelectRoot&isTree=1&isCheckBox=1&isIncludeSelf=0&organType=8&rootId=1&mustSelect=true&clearButtonVisible=false";    
 	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
 	//ȡ��
 	if (win==null) return;
 	//���
	if(typeof(win)=="string"){
		document.forms[0].newUserIds.value="";
 		document.forms[0].newUserNames.value="";
	}
 	//ȷ�� organId#organName,organId#organName
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
//�ջ�����
function retract(action){
   var processId=document.all("processId").value;
	var curActDefId=document.all("curActDefId").value;
	var activityId =document.all("activityId").value;
	var url="taskinfo.cmd?method=gethistoryactivities&processId="+processId+"&curActDefId="+curActDefId+"&activityId="+activityId;
	//20060808��������
	//if(!isSavedNtko())
	//{saveDocFile();}
	//20060628���渽��У��
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

//�ú����ж����ĵ�Ȩ�ޣ�������Ȩ��ѡ����"����"���ģ�����ֱ�ӹر�����
function saveDocFile()
{	
    if (webWord == null) {
			return true;
	}
	//�ĵ���Ȩ��
	var documentRight = document.all("documentRight").value;
	if(documentRight=="read"){	
		//û�б༭���ĵ�Ȩ�ޣ��ر�����
		closeFileNtko();
		return false;
	}
	else{
		if(documentRight=="edit" || documentRight=="emend")
		//�����ı༭Ȩ��,��������
		saveFileNtko();
		return true;
	}
}