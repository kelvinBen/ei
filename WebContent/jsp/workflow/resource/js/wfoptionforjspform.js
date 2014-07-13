//创建流程
function wf_create(action){
    document.forms[0].action =action;
    document.forms[0].submit();
}
//发送  
function wf_send(action){
    document.forms[0].action =action;
    document.forms[0].submit();
}
//创建流程并发送
function wf_createAndSend(action){
    document.forms[0].action =action;
    document.forms[0].submit();
}
//选择发送  action为执行的业务操作
function wf_selectAndSend(action){
    var processId = document.all("processId").value;
    var activityId = document.all("activityId").value;
    var curActDefId = document.all("curActDefId").value; 
    var url="jspformtaskdeal.cmd?method=getnextactivities&activityId="+activityId+"&processId="+processId+"&curActDefId="+curActDefId;
    var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
    if(obj==null)return;
    var nextActDefId = obj[0];
	var nextActivityDisName = obj[1];
	var nextActivityPartyName = obj[2];
	var nextActivityPartyDisName = obj[3];
	//obj[0]下个环节定义Id,obj[1]下个环节的显示名称,obj[2]下个环节参与者的Id,obj[3]下个环节参与者的名字
    document.forms[0].action =action+"&nextActDefId="+nextActDefId+"&nextActivityDisName="+nextActivityDisName+
  							"&nextActivityPartyName="+nextActivityPartyName+"&nextActivityPartyDisName="+nextActivityPartyDisName;
    document.forms[0].submit();
}
//选择发送  action为执行的业务操作,conditonStr为&连接的字符串,例如"bxsum=2000&salary=4000"
function wf_selectAndSendWithFilter(action,conditionStr){
    var processId = document.all("processId").value;
    var activityId = document.all("activityId").value;
    var curActDefId = document.all("curActDefId").value; 
    var url="jspformtaskdeal.cmd?method=getnextactivitiesbytransitions&activityId="+activityId+"&processId="+processId+"&curActDefId="+curActDefId+"&"+conditionStr;
    var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
    if(obj==null)return;
    var nextActDefId = obj[0];
	var nextActivityDisName = obj[1];
	var nextActivityPartyName = obj[2];
	var nextActivityPartyDisName = obj[3];
	//obj[0]下个环节定义Id,obj[1]下个环节的显示名称,obj[2]下个环节参与者的Id,obj[3]下个环节参与者的名字
    document.forms[0].action =action+"&nextActDefId="+nextActDefId+"&nextActivityDisName="+nextActivityDisName+
  							"&nextActivityPartyName="+nextActivityPartyName+"&nextActivityPartyDisName="+nextActivityPartyDisName;
    document.forms[0].submit();
}
//跳过  action为执行的业务操作
function wf_jump(action){
    var processId = document.all("processId").value;
	var url="jspformtaskdeal.cmd?method=getallactivities&processId="+processId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:400px;status:no;scroll:no');
	if(obj==null)return;
	var nextActDefId = obj[0];
	var nextActivityDisName = obj[1];
	var nextActivityPartyName = obj[2];
	var nextActivityPartyDisName = obj[3];
	//obj[0]下个环节定义Id,obj[1]下个环节的显示名称,obj[2]下个环节参与者的Id,obj[3]下个环节参与者的名字
    document.forms[0].action =action+"&nextActDefId="+nextActDefId+"&nextActivityDisName="+nextActivityDisName+
  							"&nextActivityPartyName="+nextActivityPartyName+"&nextActivityPartyDisName="+nextActivityPartyDisName;
    document.forms[0].submit();
}
//退回
function wf_backto(action){
    var processId=document.all("processId").value;
	var curActDefId=document.all("curActDefId").value;
	var url="jspformtaskdeal.cmd?method=gethistoryactivities&processId="+processId+"&curActDefId="+curActDefId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:600px;status:no;scroll:no');
	if(obj==null)return;
	var nextActDefId = obj[0];
	var nextActivityDisName = obj[1];
	var nextActivityPartyName = obj[2];
	var nextActivityPartyDisName = obj[3];
	//obj[0]下个环节定义Id,obj[1]下个环节的显示名称,obj[2]下个环节参与者的Id,obj[3]下个环节参与者的名字
    document.forms[0].action =action+"&nextActDefId="+nextActDefId+"&nextActivityDisName="+nextActivityDisName+
  							"&nextActivityPartyName="+nextActivityPartyName+"&nextActivityPartyDisName="+nextActivityPartyDisName;
    document.forms[0].submit();
}
//收回
function wf_retract(action){
    var processId=document.all("processId").value;
	var curActDefId=document.all("curActDefId").value;
	var url="jspformtaskdeal.cmd?method=gethistoryactivitiesbycurrentuser&processId="+processId+"&curActDefId="+curActDefId;
	var obj=showModalDialog(url,window,'dialogWidth:400px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
    var nextActDefId = obj[0];
	var nextActivityDisName = obj[1];
	document.forms[0].action =action+"&nextActDefId="+nextActDefId+"&nextActivityDisName="+nextActivityDisName;
    document.forms[0].submit();
}