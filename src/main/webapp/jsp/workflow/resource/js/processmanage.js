// processmanage.js
// ȫ�ֱ���
	var canOperate = true;//�Ƿ����ִ�в�������applet��ʼ����Ϻ���Ϊtrue
	var notOperateMsg = "����ʧ�ܣ�������Ϣδ������ϻ�������Ϣ����";

	function setCanOperate(b) {
		//canOperate = b; 
		canOperate=true; //�������ִ�У�����д���� true ��
	}
	
	function getCanOperate() {
		return canOperate;
	}
	
	function showMsg(m) {
		alert(m);
	}
/**
 * �½�����ʱ���������̺󣬱����������̵��������
 */	
function addProcessData(){
	try {
		if(canOperate){
			//if(validate()) {			
				var xpdlcontent = document.myApplet.saveXpdl();
				document.forms[0].xpdlcontent.value = xpdlcontent;
				document.forms[0].xmlcontent.value = document.myApplet.saveXml();		
				document.forms[0].id.value = document.myApplet.getProcessId();
				document.forms[0].name.value = document.myApplet.getProcessName();
				document.forms[0].description.value = document.myApplet.getProcessDescription();
				document.forms[0].versionid.value = document.myApplet.getProcessVersion();
				document.forms[0].author.value = document.myApplet.getProcessAuthor();
				document.forms[0].create.value = document.myApplet.getProcessCreate();
				return true;
			//}
		}else{
			showMsg(notOperateMsg);
			return false;
		}
	}catch(e){	
		return false;
	}
}

/**
 * �޸�����ʱ����ǰ���̱����һ���°汾������
 */	
 	function saveNewVersion(n){  
		try{
			if(canOperate){
				//if(validate()) {			
					var processid = document.myApplet.getProcessId();
					if(document.forms[n].id.value != processid){
						alert("�����桱�򡰱���Ϊ�°汾���������޸�����id��");
						return false;
					} 
					document.forms[n].id.value = processid;
					document.forms[n].xpdlcontent.value = document.myApplet.saveXpdlVersion();
					document.forms[n].xmlcontent.value = document.myApplet.saveXml();  
					document.forms[n].name.value = document.myApplet.getProcessName();
					document.forms[n].description.value = document.myApplet.getProcessDescription();
					document.forms[n].versionid.value = document.myApplet.getProcessVersion();
					document.forms[n].author.value = document.myApplet.getProcessAuthor();
					document.forms[n].create.value = document.myApplet.getProcessCreate();
					return true;
				//}
			}else{
				showMsg(notOperateMsg);
				return false;
			}		
		}catch(e){
			return false;
		}
 	}

/**
 * �޸�����ʱ����ǰ�������Ϊһ���µ�����
 */	
 	function saveAsProcessData(n){ 
		try {
			if(canOperate){
				//if(validate()) {			
					var processid = document.myApplet.getProcessId();
					if(document.forms[n].id.value == processid){
						alert("�����Ϊ�������޸�����id��");
						return false;
					} 
					document.forms[n].id.value = processid;
					document.forms[n].xpdlcontent.value = document.myApplet.saveXpdl();
					document.forms[n].xmlcontent.value = document.myApplet.saveXml();    
					document.forms[n].name.value = document.myApplet.getProcessName();
					document.forms[n].description.value = document.myApplet.getProcessDescription();
					document.forms[n].versionid.value = document.myApplet.getProcessVersion();
					document.forms[n].author.value = document.myApplet.getProcessAuthor();
					document.forms[n].create.value = document.myApplet.getProcessCreate();
					return true;
				//}
			}else{
				showMsg(notOperateMsg);
				return false;
			}
		} catch(e){
			return false;
		}  		
	}
/**
 * �޸�����ʱֱ���޸ı��浱ǰ����
 */		
	function saveProcessData(n){
		try{
			if(canOperate){
				//if(validate()) {			
					var processid = document.myApplet.getProcessId();
					if(document.forms[n].id.value != processid){
						alert("�����桱�򡰱���Ϊ�°汾���������޸�����id��");
						return false;
					} 
					document.forms[n].id.value = processid;
					document.forms[n].xpdlcontent.value = document.myApplet.saveXpdl();
					document.forms[n].xmlcontent.value = document.myApplet.saveXml();   
					document.forms[n].name.value = document.myApplet.getProcessName();
					document.forms[n].description.value = document.myApplet.getProcessDescription();
					document.forms[n].versionid.value = document.myApplet.getProcessVersion();
					document.forms[n].author.value = document.myApplet.getProcessAuthor();
					document.forms[n].create.value = document.myApplet.getProcessCreate();
					return true;
				//}
			}else{
				showMsg(notOperateMsg);
				return false;
			}
		}catch(e){
			return false;
		}
	}
/**
 * У�鵱ǰ����
 */		
	function validateProcess(){
		try {
			if(canOperate) {
				return document.myApplet.validateProcess(true);
			}else{
				showMsg(notOperateMsg);
			}	 		
		}catch(e){

		}
	 }

	function validate(){
		try {
			return document.myApplet.validateProcess(false);
	 		
		} catch(e){
		}
 	}

/**
 * ��ʾxpdl
 */		
	function showXpdlContent(){
		try {
			if(canOperate) {
				//У��ͨ������ִ��
				if(validate()) {
					document.myApplet.showXpdlContent();
				}				
			}else {
				showMsg(notOperateMsg);
			}		
	 		
		} catch(e){
		}
 	} 	
	