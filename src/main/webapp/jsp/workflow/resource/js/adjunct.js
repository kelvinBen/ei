//����һ��
function addAdjunctRow()
{
var tab=document.all("adjucntTab");
var ntr=tab.insertRow();
var ntd=ntr.insertCell();
ntd.innerHTML='<input type="checkbox" name="chk">';
var ntd=ntr.insertCell();
ntd.innerHTML='<input type="file" name="uploadFile" style="width:90%;">';
}
//ɾ��һ��
function deleteAdjunctRow()
{
	var chks=document.all("chk");
	if (chks!= null){ //�жϸ������������Ƿ�Ϊ��,�޴��ж�,����ҳ��ֱ�ӵ�[ɾ����]������
	if(typeof(chks.length)!="undefined")
	{
	for(var i=chks.length-1;i>-1;i--)
	{
		var oc=chks[i];
		if(oc.checked)
		{
		oc.parentElement.parentElement.removeNode(true);
		}
	}
	}
	else
	{
	if(chks.checked)
	chks.parentElement.parentElement.removeNode(true);
	}
}
}
//�ж����ӵ�����,�Ƿ�ѡ���˸���
function isUploadFile(){
	var fileArray = document.all('uploadFile');
	//û�и���ֱ�ӷ���
	if(fileArray == null){
		return true;
	}
	//ֻ�����һ��
	if(fileArray.length == null 
		&& fileArray.value == ""){
		alert("û���ϴ�����,����!");
		return false;
	}
	//����˶����Ч��
	for(var i=0; i<fileArray.length; i++){
		if(fileArray[i].value == ""){
			alert('��'+(i+1)+'��û���ϴ�����,����!');
			return false;
		}
	}
	//�����ж�,�����ϴ�����������
	return true;
}