//��������
function wf_create(action){
    document.forms[0].action =action;
    document.forms[0].submit();
}
//����  
function wf_send(action){
    document.forms[0].action =action;
    document.forms[0].submit();
}
//�������̲�����
function wf_createAndSend(action){
    document.forms[0].action =action;
    document.forms[0].submit();
}
//ѡ����  actionΪִ�е�ҵ�����
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
	//obj[0]�¸����ڶ���Id,obj[1]�¸����ڵ���ʾ����,obj[2]�¸����ڲ����ߵ�Id,obj[3]�¸����ڲ����ߵ�����
    document.forms[0].action =action+"&nextActDefId="+nextActDefId+"&nextActivityDisName="+nextActivityDisName+
  							"&nextActivityPartyName="+nextActivityPartyName+"&nextActivityPartyDisName="+nextActivityPartyDisName;
    document.forms[0].submit();
}
//ѡ����  actionΪִ�е�ҵ�����,conditonStrΪ&���ӵ��ַ���,����"bxsum=2000&salary=4000"
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
	//obj[0]�¸����ڶ���Id,obj[1]�¸����ڵ���ʾ����,obj[2]�¸����ڲ����ߵ�Id,obj[3]�¸����ڲ����ߵ�����
    document.forms[0].action =action+"&nextActDefId="+nextActDefId+"&nextActivityDisName="+nextActivityDisName+
  							"&nextActivityPartyName="+nextActivityPartyName+"&nextActivityPartyDisName="+nextActivityPartyDisName;
    document.forms[0].submit();
}
//����  actionΪִ�е�ҵ�����
function wf_jump(action){
    var processId = document.all("processId").value;
	var url="jspformtaskdeal.cmd?method=getallactivities&processId="+processId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:400px;status:no;scroll:no');
	if(obj==null)return;
	var nextActDefId = obj[0];
	var nextActivityDisName = obj[1];
	var nextActivityPartyName = obj[2];
	var nextActivityPartyDisName = obj[3];
	//obj[0]�¸����ڶ���Id,obj[1]�¸����ڵ���ʾ����,obj[2]�¸����ڲ����ߵ�Id,obj[3]�¸����ڲ����ߵ�����
    document.forms[0].action =action+"&nextActDefId="+nextActDefId+"&nextActivityDisName="+nextActivityDisName+
  							"&nextActivityPartyName="+nextActivityPartyName+"&nextActivityPartyDisName="+nextActivityPartyDisName;
    document.forms[0].submit();
}
//�˻�
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
	//obj[0]�¸����ڶ���Id,obj[1]�¸����ڵ���ʾ����,obj[2]�¸����ڲ����ߵ�Id,obj[3]�¸����ڲ����ߵ�����
    document.forms[0].action =action+"&nextActDefId="+nextActDefId+"&nextActivityDisName="+nextActivityDisName+
  							"&nextActivityPartyName="+nextActivityPartyName+"&nextActivityPartyDisName="+nextActivityPartyDisName;
    document.forms[0].submit();
}
//�ջ�
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