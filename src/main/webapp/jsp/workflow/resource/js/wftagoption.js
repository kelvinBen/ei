//��������
function tagCrtProcess(){
	runFormVerify(document.forms[0]);
	//alert("��������");
	if(document.all("procDefId").value=="null"){
	   	alert("ȱ�����̶���ID���޷���������!");
	   	return;
   	}	
	document.forms[0].action ="qingjiaform.cmd?method=insert";
  	document.forms[0].submit();	
}

//����
function tagSave(){
	runFormVerify(document.forms[0]);
	//alert("����");
	document.forms[0].action ="qingjiaform.cmd?method=update";
  	document.forms[0].submit();	
}

//ѡ����
function tagForSend(){
	runFormVerify(document.forms[0]);runFormVerify(document.forms[0]);
	//alert("ѡ����");
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
	//obj[0]�¸����ڶ���Id,obj[1]�¸����ڵ���ʾ����,obj[2]�¸����ڲ����ߵ�Id,obj[3]�¸����ڲ����ߵ�����
  document.forms[0].action ="qingjiaform.cmd?method=forSend"+"&nextActDefId="+nextActDefId+"&nextActDefName="+nextActDefName+
  							"&nextActivityPartyName="+nextActivityPartyName+"&nextActivityPartyDisName="+nextActivityPartyDisName;
  document.forms[0].submit();
}

//ֱ�ӷ���
function tagSend(){
	//alert("ֱ�ӷ���");
	runFormVerify(document.forms[0]);runFormVerify(document.forms[0]);
	document.forms[0].action ="qingjiaform.cmd?method=forSend";
	document.forms[0].submit();
}

//����
function tagForReject(){
	alert("����");
}

//�鿴��ת��ʷ
function tagForFlowHistory(){
	alert("�鿴��ת��ʷ");
}