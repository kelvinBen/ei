//启动流程
function tagCrtProcess(){
	runFormVerify(document.forms[0]);
	//alert("启动流程");
	if(document.all("procDefId").value=="null"){
	   	alert("缺少流程定义ID，无法启动流程!");
	   	return;
   	}	
	document.forms[0].action ="qingjiaform.cmd?method=insert";
  	document.forms[0].submit();	
}

//保存
function tagSave(){
	runFormVerify(document.forms[0]);
	//alert("保存");
	document.forms[0].action ="qingjiaform.cmd?method=update";
  	document.forms[0].submit();	
}

//选择发送
function tagForSend(){
	runFormVerify(document.forms[0]);runFormVerify(document.forms[0]);
	//alert("选择发送");
	var activityId = document.all("activityId").value;
	var processId = document.all("procId").value;
	var activityDefId = document.all("activityDefId").value;
	var url="taskinfo.cmd?method=getnextactivities&activityId="+activityId+"&processId="+processId+"&curActDefId="+activityDefId;
	//alert(url);
  	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	var nextActDefId = obj[0];
	var nextActDefName = obj[1];
	var nextActivityPartyName = obj[2];
	var nextActivityPartyDisName = obj[3];
	//obj[0]下个环节定义Id,obj[1]下个环节的显示名称,obj[2]下个环节参与者的Id,obj[3]下个环节参与者的名字
  document.forms[0].action ="qingjiaform.cmd?method=forSend"+"&nextActDefId="+nextActDefId+"&nextActDefName="+nextActDefName+
  							"&nextActivityPartyName="+nextActivityPartyName+"&nextActivityPartyDisName="+nextActivityPartyDisName;
  document.forms[0].submit();
}

//直接发送
function tagSend(){
	//alert("直接发送");
	runFormVerify(document.forms[0]);runFormVerify(document.forms[0]);
	document.forms[0].action ="qingjiaform.cmd?method=forSend";
	document.forms[0].submit();
}

//驳回
function tagForReject(){
	alert("驳回");
}

//查看流转历史
function tagForFlowHistory(){
	alert("查看流转历史");
}