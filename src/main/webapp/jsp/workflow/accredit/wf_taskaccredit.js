/*
ѡ������û� 
*/
function selectAgentOrgan(){
	var url ="jsp/help.jsp?url=";
	url =url+"userStruhelp.cmd&method=getStruUserRoot";
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
	document.forms[0].agentorganName.value = ret[1];
		document.forms[0].agentorganid.value = ret[0];
		document.forms[0].note.value = ret[1];
}


function forProxyInsert(){

	document.forms[0].action ="wftaskaccredit.cmd?method=forProxyInsert"+addUrl;    
 	 document.forms[0].submit();
}


function doStop() {
	if (!isCheck())
		return;
	document.forms[0].action = "wftaskaccredit.cmd?method=stop" + addUrl;
	document.forms[0].submit();

}

function doStart() {

	if (!isCheck())
		return;
	document.forms[0].action = "wftaskaccredit.cmd?method=start" + addUrl;
	document.forms[0].submit();
}

function isCheck() {
	var sel = grid.getCheckLine();
	if (sel == "") {
		alert("��ѡ��Ҫ�����ļ�¼!");
		return false;
	}

	return true;

}


function isConflict(){
//	var type= $('type').value;
//	var dataid= $('dataid').value;
//	var agentorganid= $('agentorganid').value;
	var time = $('time').value;
	var endtime = $('endtime').value;
	var oldorganid = $('oldorganid').value;
	
	var addUrl = "&time="+time;
	addUrl+="&endtime="+endtime;
	addUrl+="&oldorganid="+oldorganid;
	var result= xmlhttp("wftaskaccredit.cmd?method=isConflict"+addUrl);
	//alert(result);//�����ַ���Ϊ��ʱ����ʾ������û��ͻ

	if(result!=""){
		alert("�������ʱ���ͻ");
		return true;
	}
	return false;

}

/*
ѡ��ԭ�û� 
*/
function selectOldOrgan(){
	var rootId = $('rootId').value;
	//var url ="jsp/help.jsp?url=";
	//url =url+"stru.cmd&method=getSelectRoot&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1&rootId="+rootId;
	var url ="jsp/help.jsp?url=";
	url =url+"userStruhelp.cmd&method=getStruUserRoot";
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
	document.forms[0].oldorganid.value = ret[0];
	document.forms[0].oldorganName.value = ret[1];
	document.forms[0].note3.value = ret[1];
}
