var format = '���:';

function setBlanks(){
	var blank = '';
	for(var i=0;i< 5 ;i++){
		blank = blank + " ";
	}
	return blank ;
}
//��Դ����������չ������༭��
function setDefaultFormat(signField){
	var curUser = document.all('curUserName').value;
	var myDate = new Date();
	var month = myDate.getMonth()+1;
	var curTime = myDate.getFullYear()+'-'+month+'-'+myDate.getDate();
	var newVal = 'ǩ����:'+ curUser + '  '+curTime;
	val = newVal;
	return val;
}

//����༭����չ,����������Ļ�����,���һ����ť"ǩ��",����һЩ������Ϣ
function defaultSign(fieldName){
	var signField = document.all(fieldName);
	signField.value = setDefault();
}

//��ȡ������Ӧ������༭��,���Ĭ��ֵ
function setDefault(){
	var curUser = document.all('curUserName').value;
	var myDate = new Date();
	var month = myDate.getMonth()+1;
	var curTime = myDate.getFullYear()+'-'+month+'-'+myDate.getDate();
	var newVal = 'ǩ����:'+ curUser + '  '+curTime;
	return newVal;
}

//����༭����չ,����������Ļ�����,���һ��"��д"��ť,�����Ի���,�����д����Ϣ,�򷵻ظ���Ϣ
//��ʾ��ʽΪ:�����ǩ���ˡ�ǩ������
//�������д��Ϣ,������Ĭ�ϵĸ�ʽ:ǩ���ˡ�ǩ������
function putOption(url,obj,fieldName ,option ,width,height){
	if (obj.length != null) {
		obj = obj[0];
	}
	var signField = document.all(fieldName);
	//������
	var optionField = document.all(option);
	var reValue = null;
	if (width!=null && height!=null){
		reValue = window.showModalDialog(url,optionField.value ,"status:no;dialogWidth:" + width + ";dialogHeight:" + height);
	}else{
		reValue = window.showModalDialog(url,optionField.value ,"status:no");
	}
	
	//����ȡ��,������Ĭ��ֵ
	if (reValue == null && obj.value == null){
		obj.value = setDefaultFormat();
		return ;
	}
	//û����Ϣ,����ȷ��,Ҳ����Ĭ��ֵ
	if( reValue == ""){
		optionField.value = "";
		obj.value = setDefaultFormat();
		return ;
	}
	//������Ϣ,����ȷ��,��֯��Ϊһ���̶���ʽ���ַ���
	if( obj.value != null && reValue != null){
		optionField.value = reValue;
		var val = format + reValue ; 
		obj.value = val + setBlanks()+ setDefaultFormat(signField);
		return ;
	}
	//������Ϣ,����ȡ��,��������
	return ;
}
//��ʼ�������
function initFormatOption(obj ,optionField){
	var val = obj.value;
	if(val.indexOf(format)==-1)return;
	var firstIndex = format.length;
	var secondIndex = val.indexOf(setBlanks());
	var reValue = "";
	reValue = val.substring( firstIndex, secondIndex);
	optionField.value = reValue ;
}