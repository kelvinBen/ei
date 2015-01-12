// processmanage.js
// 全局变量
	var canOperate = true;//是否可以执行操作，当applet初始化完毕后，置为true
	var notOperateMsg = "操作失败，流程信息未加载完毕或流程信息出错！";

	function setCanOperate(b) {
		//canOperate = b; 
		canOperate=true; //不管如何执行，都被写死成 true 了
	}
	
	function getCanOperate() {
		return canOperate;
	}
	
	function showMsg(m) {
		alert(m);
	}
/**
 * 新建流程时定制完流程后，保存所有流程的相关数据
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
 * 修改流程时将当前流程保存成一个新版本的流程
 */	
 	function saveNewVersion(n){  
		try{
			if(canOperate){
				//if(validate()) {			
					var processid = document.myApplet.getProcessId();
					if(document.forms[n].id.value != processid){
						alert("“保存”或“保存为新版本”不允许修改流程id！");
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
 * 修改流程时将当前流程另存为一个新的流程
 */	
 	function saveAsProcessData(n){ 
		try {
			if(canOperate){
				//if(validate()) {			
					var processid = document.myApplet.getProcessId();
					if(document.forms[n].id.value == processid){
						alert("“另存为”必须修改流程id！");
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
 * 修改流程时直接修改保存当前流程
 */		
	function saveProcessData(n){
		try{
			if(canOperate){
				//if(validate()) {			
					var processid = document.myApplet.getProcessId();
					if(document.forms[n].id.value != processid){
						alert("“保存”或“保存为新版本”不允许修改流程id！");
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
 * 校验当前流程
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
 * 显示xpdl
 */		
	function showXpdlContent(){
		try {
			if(canOperate) {
				//校验通过才能执行
				if(validate()) {
					document.myApplet.showXpdlContent();
				}				
			}else {
				showMsg(notOperateMsg);
			}		
	 		
		} catch(e){
		}
 	} 	
	