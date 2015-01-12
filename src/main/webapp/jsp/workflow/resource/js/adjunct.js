//增加一行
function addAdjunctRow()
{
var tab=document.all("adjucntTab");
var ntr=tab.insertRow();
var ntd=ntr.insertCell();
ntd.innerHTML='<input type="checkbox" name="chk">';
var ntd=ntr.insertCell();
ntd.innerHTML='<input type="file" name="uploadFile" style="width:90%;">';
}
//删除一行
function deleteAdjunctRow()
{
	var chks=document.all("chk");
	if (chks!= null){ //判断附件输入栏的是否为空,无此判断,当打开页面直接点[删除行]将出错
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
//判断增加的行中,是否选中了附件
function isUploadFile(){
	var fileArray = document.all('uploadFile');
	//没有附件直接返回
	if(fileArray == null){
		return true;
	}
	//只添加了一行
	if(fileArray.length == null 
		&& fileArray.value == ""){
		alert("没有上传附件,请检查!");
		return false;
	}
	//添加了多个无效行
	for(var i=0; i<fileArray.length; i++){
		if(fileArray[i].value == ""){
			alert('第'+(i+1)+'行没有上传附件,请检查!');
			return false;
		}
	}
	//经过判断,附件上传不存在问题
	return true;
}