var format = '意见:';

function setBlanks(){
	var blank = '';
	for(var i=0;i< 5 ;i++){
		blank = blank + " ";
	}
	return blank ;
}
//针对带弹出框的扩展的特殊编辑域
function setDefaultFormat(signField){
	var curUser = document.all('curUserName').value;
	var myDate = new Date();
	var month = myDate.getMonth()+1;
	var curTime = myDate.getFullYear()+'-'+month+'-'+myDate.getDate();
	var newVal = '签名人:'+ curUser + '  '+curTime;
	val = newVal;
	return val;
}

//特殊编辑域扩展,在审批意见的基础上,添加一个按钮"签名",填入一些基本信息
function defaultSign(fieldName){
	var signField = document.all(fieldName);
	signField.value = setDefault();
}

//获取域名对应的特殊编辑域,填充默认值
function setDefault(){
	var curUser = document.all('curUserName').value;
	var myDate = new Date();
	var month = myDate.getMonth()+1;
	var curTime = myDate.getFullYear()+'-'+month+'-'+myDate.getDate();
	var newVal = '签名人:'+ curUser + '  '+curTime;
	return newVal;
}

//特殊编辑域扩展,在审批意见的基础上,添加一个"填写"按钮,弹出对话框,如果填写了信息,则返回该信息
//显示格式为:意见、签名人、签名日期
//如果不填写信息,就填入默认的格式:签名人、签名日期
function putOption(url,obj,fieldName ,option ,width,height){
	if (obj.length != null) {
		obj = obj[0];
	}
	var signField = document.all(fieldName);
	//隐藏域
	var optionField = document.all(option);
	var reValue = null;
	if (width!=null && height!=null){
		reValue = window.showModalDialog(url,optionField.value ,"status:no;dialogWidth:" + width + ";dialogHeight:" + height);
	}else{
		reValue = window.showModalDialog(url,optionField.value ,"status:no");
	}
	
	//点了取消,则填入默认值
	if (reValue == null && obj.value == null){
		obj.value = setDefaultFormat();
		return ;
	}
	//没填信息,点了确认,也填入默认值
	if( reValue == ""){
		optionField.value = "";
		obj.value = setDefaultFormat();
		return ;
	}
	//填入信息,点了确认,组织成为一个固定格式的字符串
	if( obj.value != null && reValue != null){
		optionField.value = reValue;
		var val = format + reValue ; 
		obj.value = val + setBlanks()+ setDefaultFormat(signField);
		return ;
	}
	//填入信息,点了取消,不做操作
	return ;
}
//初始化意见域
function initFormatOption(obj ,optionField){
	var val = obj.value;
	if(val.indexOf(format)==-1)return;
	var firstIndex = format.length;
	var secondIndex = val.indexOf(setBlanks());
	var reValue = "";
	reValue = val.substring( firstIndex, secondIndex);
	optionField.value = reValue ;
}