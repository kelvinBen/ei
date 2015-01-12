var signBackColor = "16777215";
var displaySignBackColor = "16777215";
var signInkColor = "16216215";
/** 
 * 编辑域点击按钮,对话框的返回值为HashMap,key为隐藏域的名字，其中返回的显示值的key为value
 */
function editField(url,spanid,valueName,hiddens,width,height){
  
	var processId=document.all("processId").value;
    if(processId==null)
      processId="";
    if(!window.confirm("您是否已经保存过表单？如已保存请点击 确定,如未保存过请点击 取消,先保存一下表单!")){
				return;
    }
    var edocType = document.all("Ins_EXT_EDOC_TYPE");
	if(edocType != null){
		url = url + "&edocTypeId="+edocType.value + "&randomNum=" + Math.random();
	}
	if(processId!=""){
		url=url+"&processId="+processId;
	}
	var reValue = new Array();
	var obj = document.all(valueName);
	if (obj.length != null) {
		obj = obj[0];
	}
	var strValue = obj.value;
	var arr = new Array();
	var list = getHiddenField(hiddens,arr);
	if (spanid == null){
		arr["value"] = strValue;
		if (width!=null && height!=null){
			reValue = window.showModalDialog(url,arr,"status:no;dialogWidth:" + width + ";dialogHeight:" + height);
		}else{
			reValue = window.showModalDialog(url,arr,"status:no");
		}
		if (reValue == null){
			return;
		}
		obj.value = reValue["value"];
	}else{
		arr["value"] = decodeHtml(strValue);
		reValue = window.showModalDialog(url,arr,"status:no");
		if (reValue == null){
			return;
		}
		obj.value = encodeHtml(reValue["value"]);
		document.getElementById(spanid).innerHTML = reValue["value"];
	}
	for (var i=0;i<list.size();i++){
		document.all("Ins_" + list.get(i)).value = reValue[list.get(i)];
	}
}
/**
 * 将隐藏域的值取出来放入map,并返回隐藏域列表List
 */
function getHiddenField(hiddens,arr){
	var list = new ArrayList();
	if (hiddens == "")
		return list;
	var hiddenArray = hiddens.split("|");
	for (var i=0;i<hiddenArray.length;i++){
		arr[hiddenArray[i]] = document.all("Ins_" + hiddenArray[i]).value;
		list.add(hiddenArray[i]);
	}
	return list;
}
/**
 *将字符串按HTML需要的编码方式编码
 * @param str
 */
function encodeHtml(str) {
	if (str == null || "" == str.trim()) {
		return "";
	}
	var strToCode = str.replace(/</g,"Ш");
	strToCode = strToCode.replace(/>/g,"Ъ");
	return strToCode;
}
/**
 *将字符串按HTML需要的编码方式解码
 * @param str
 */
function decodeHtml(str) {
	if (str == null || "" == str.trim()) {
		return null;
	}
	var strToCode = str.replace(/Ш/g,"<");
	strToCode = strToCode.replace(/Ъ/g,">");
	return strToCode;
}
/**
 * 特殊编辑域点击按钮
 */
function specialEditField(url,obj,width,height){
	if (obj.length != null) {
		obj = obj[0];
	}
	var reValue = null;
	if (width!=null && height!=null){
		reValue = window.showModalDialog(url,obj.value,"status:no;dialogWidth:" + width + ";dialogHeight:" + height);
	}else{
		reValue = window.showModalDialog(url,obj.value,"status:no");
	}
	if (reValue == null){
		return;
	}
	obj.value = reValue;
}
/**
 * 把页面上的流程实例id、环节定义id、环节实例id和流程定义id传到通用帮助的jsp页面里
 */
function getHistoryUrl(){
	var processId=document.all("processId").value;
	var activityId=document.all("activityId").value;
	var actDefId=document.all("curActDefId").value;
	var processDefId=document.all("curFlowId").value;
	return "jsp/help.jsp?url=historyhelpurlquery.cmd&processId="+processId+"&activityId="+activityId+"&actDefId="+actDefId+"&processDefId="+processDefId;
}
/**
 * 选择域点击按钮
 */
function selectField(url,obj,obj1,width,height){
	
	//以下两行是取getHistoryUrl这个方法名，去掉"?isEval=true"这个串
	if(url.indexOf("isEval=true")>=0){
		url=eval(url.substring(0,url.length-12));
	}
	var dataId = getFormDataId();
	var url_dataId = url;
	if(dataId!=null || dataId!="")
	{	
		if(url.substring(0,16)=="adjuncthelpquery")
		{	
			url_dataId = url + '?isEdit=1&dataId='+dataId;
		}
	}
	if (obj.length != null) {
		obj = obj[0];
	}
	if (obj1.length != null) {
		obj1 = obj1[0];
	}
	if (width!=null && height!=null){
		reValue = window.showModalDialog(url_dataId,obj.value,"status:no;dialogWidth:" + width + ";dialogHeight:" + height);
	}else{
		reValue = window.showModalDialog(url_dataId,obj.value,"status:no");
	}
	if (reValue == null){
		return;
	}
	isCheckBox = reValue.type;
	ifInst = reValue.insert;
	if(ifInst!=null && ifInst!=""){
		if(ifInst=="true"){
			if(isCheckBox!=null && isCheckBox!=""){
				if(isCheckBox=="1"){
					var oldArray = parseOldElements(obj.value);
					if(oldArray!=null&&oldArray!="undefined"&&oldArray.length!=0) {
						reValue = getArrayResult(oldArray,reValue);
					}
				}

			}
		}
	}
	obj.value = getValueXml(reValue);
	obj1.innerHTML = getDisplayValue(reValue);
}
//去掉两个数组中的重复项并合并
function getArrayResult(oldArray,newArray)
{
	var newLen = newArray.length;
	var oldLen = oldArray.length;
	var oldOnes = oldArray;
	var pk;
	
	for(var i=0;i<newLen;i++){
		pk = newArray[i]["primary-value"];
		if(!checkArray(oldOnes,pk)){
			oldArray[oldLen]=newArray[i];
			oldLen++;
		}
	}

	return oldArray;
}

//判断二维数组中是否存在给定的值

function checkArray(arrays,pk) {
	var exist="";
	for(var i=0;i<arrays.length;i++){
		exist = arrays[i]["primary-value"];
		if(pk==exist){
			return true;
		}
	}
	return false;
}


//对原来选中的数据进行解析并存入二维数组

function parseOldElements(xmlobj)
{
	if(xmlobj==null || xmlobj=="")
		return "";
	var XmlDoc=new ActiveXObject("MSXML.DOMDocument");
	XmlDoc.loadXML(xmlobj);
	var len = XmlDoc.getElementsByTagName("select-item").length;
	var oldArray = new Array();
	
	for(var i=0;i<len;i++){
		var val = new Array();
		val["primary-value"] = XmlDoc.getElementsByTagName("primary-value")[i].text;
		val["display-str"] = XmlDoc.getElementsByTagName("display-str")[i].text;
		val["display-url"] = XmlDoc.getElementsByTagName("display-url")[i].text;
		oldArray[i]=val;
	}
	return oldArray;
}
/**
 * 明细选择域点击按钮
 * @param url 链接
 * @param objName 返回值存放域名字
 * @param objDisName 返回值显示域名字
 * @param checkName 得到索引的名字
 */
function selectSubField(url,objName,objDisName,checkName){
	var index = checkName.substring(checkName.indexOf('[')+1,checkName.indexOf(']'));
	var i = parseInt(index);
	var reValue = window.showModalDialog(url,document.getElementsByName(objName)[i].value,"status:no");
	if (reValue == null){
		return;
	}
	document.getElementsByName(objName)[i+1].value = getValueXml(reValue);
	var ele = document.getElementsByTagName("span");
	for (var j=0;j<ele.length;j++){
		if (ele[j].name == objDisName + "[" + i + "]"){
			ele[j].innerHTML = getDisplayValue(reValue);
		}
	}

}

/**
 * 得到显示值
 */
function getDisplayValue(reValue){
	var reStr = "";
	for (var i=0;i<reValue.length;i++){
		if (0==i){
			reStr = "<a href=\""+reValue[i]["display-url"]+"\" title=\""+reValue[i]["display-str"]+"\">"+reValue[i]["display-str"]+"</a>";
		}else{
		reStr += "," + "<a href=\""+reValue[i]["display-url"]+"\" title=\""+reValue[i]["display-str"]+"\">"+reValue[i]["display-str"]+"</a>";
		}
	}
	return reStr;
}
/**
 * 得到要存储的xml
 */
function getValueXml(reValue){
	if(reValue.length == 0) return "";
	var reXml = '<?xml version="1.0" encoding="UTF-8"?>\n';
	reXml += '<select-return>\n';
	for (var i=0;i<reValue.length;i++){
		reXml += ('\t<select-item>\n');
		reXml += ('\t\t<display-url><![CDATA[' + reValue[i]["display-url"] + ']]></display-url>\n');
		reXml += ('\t\t<primary-value><![CDATA[' + reValue[i]["primary-value"] + ']]></primary-value>\n');
		reXml += ('\t\t<display-str><![CDATA[' + reValue[i]["display-str"] + ']]></display-str>\n');
		reXml += ('\t</select-item>\n');
	}
	reXml += '</select-return>\n';
	return reXml;
}
/**
 * 设置操作命令
 */
function setOperateType(obj){
//将操作的名字放入
	document.all("operateType").value = obj.value;
}
/**
 * 签名域的显示问题
 * @param disId 要显示历史信息的ID
 * @param valueEdit 返回值
 * @param lastObj 最后编辑域的名字
 * @param name 命名要求
 */
function displaySign(disId,valueEdit,lastObj,name,signType){
	
	var valueStr = "";
	var valueType = "0";
	var obj;
	var allText = disId.getElementsByTagName("pre");
	for (var i=0;i<allText.length;i++){
		if(allText[i].getAttributeNode("name").nodeValue == "content"){
			obj = allText[i];
			if (obj.innerHTML != ""){
				var root = getRoot(obj.innerHTML);
				valueStr = root.text;
				var valueTypeObj = root.attributes.getNamedItem("type")
				if (valueTypeObj!= null){
					valueType = valueTypeObj.nodeValue;
				}
			}
			
			if (valueType == "1"){
				obj.setAttribute("sType","signSign");
				obj.innerHTML = "<OBJECT CLASSID='CLSID:0631B94A-EC26-11D2-95EC-0060082AA655' CODEBASE='/dcwork/jsp/workflow/resource/object/CICCInkocx.CAB#version=3,5,0,4' width='200' height='100' />";
				if (valueStr!="")
					obj.children[0].InkStr = valueStr;
				try{
					lastObj.backcolor=displaySignBackColor;
				}catch(e){
				}
				try{
					if (signInkColor!=""){
						lastObj.InkColor = signInkColor;
					}
				}catch(e){
				}
				obj.children[0].Zoom = 0.3;
				obj.children[0].ReadOnly=true;
			}else{
				obj.setAttribute("sType","signText");
				obj.innerHTML = valueStr;
			}
			obj.style.display="";
		}
	}
	if (valueEdit != null ){
		displayEditSign(valueEdit,lastObj,name,signType);
	}
}
/**
 * 签名域的显示问题（最后的编辑域）
 * @param valueEdit 返回值
 * @param lastObj 最后编辑域的名字
 * @param name 命名要求
 */
function displayEditSign(valueEdit,lastObj,name,signType){
	var valueType = "0";
	var valueStr = "";
	//处理最后编辑
	if (valueEdit == ""){
		valueType = signType;
	}else if (valueEdit == "0" || valueEdit == "1"){
		valueType = valueEdit;
	}else{
		var root = getRoot(valueEdit);
		if (root!=null)
			valueStr = root.text;
		var valueTypeObj = root.attributes.getNamedItem("type");
	
		if (valueTypeObj!= null){
			valueType = valueTypeObj.nodeValue;
		}
	}
	if (valueType == "1"){
		lastObj.outerHTML = "<OBJECT name='last_" + name + "' CLASSID='CLSID:0631B94A-EC26-11D2-95EC-0060082AA655' CODEBASE='/wfweboa/resource/object/CICCInkocx.CAB#version=3,5,0,4' width='200' height='100'/>";
		lastObj = document.all("last_" + name);
		if (valueStr != "") {
			lastObj.InkStr = valueStr;
		}
		try{
			lastObj.backcolor=signBackColor;
		}catch(e){
		}
		try{
			if (signInkColor!=""){
				lastObj.InkColor = signInkColor;
			}
		}catch(e){
		}
		lastObj.Zoom = 0.3;
		lastObj.ReadOnly = true;
		
	}else{
		lastObj.value = valueStr;
		lastObj.style.display = "";
	}
}
/**
 * 签名域的显示问题（解析返回值）
 * @param xml 返回值
 */
function getRoot(xml){
	var xmlDoc = new ActiveXObject("Microsoft.XMLDOM"); //创建Document对象
    xmlDoc.async = "false"; //设置文档异步下载为否
    xmlDoc.loadXML(decodeHtml(xml)); //加载XML样式的字符串
	return xmlDoc.documentElement; //定义root为文档的根节点
}
/**
 * 签名
 * @param url 弹出页面地址
 * @param obj 保存数据的域
 * @param lastObj 显示数据的域
 * @param name 命名基准
 * @param width 弹出窗口宽度
 * @param height 弹出窗口高度 
 */
function signField(url,obj,lastObj,name,width,height,signType){
	
	if (obj.length != null) {
		obj = obj[0];
	}
	var reValue = null;

	if (obj.value == null || obj.value.trim()==""){
		obj.value = signType;
	}
	obj.value = decodeHtml(obj.value);
	if (getSignType(obj.value,signType)!=signType){
		if (signType=="1"){
			if(!window.confirm("当前域已经修改为手写\n如果继续将按进行手写输入,原数据将丢失。\n是否继续?")){
				return;
			}
		}else{
			if(!window.confirm("当前域已经修改为键盘输入\n如果继续将进行键盘输入,原数据将丢失。\n是否继续?")){
				return;
			}
		}
		obj.value = signType;
	}
	if (width!=null && height!=null){
		reValue = window.showModalDialog(url,obj,"status:no;scroll:no;dialogWidth:" + width + ";dialogHeight:" + height);
	}else{
		reValue = window.showModalDialog(url,obj,"status:no;scroll:no");
	}
	if (reValue != null){
		obj.value = reValue;
	}
	var signValue = getSignValue(obj.value).get("value");
	if (signValue == null || signValue == "" || (signType == "1" && signValue == "eNpjYICA////M5AIAJWlAv4A")) {
		obj.value = "";
	}
	else {
		obj.value = encodeHtml(obj.value);
	}
	displayEditSign(obj.value,lastObj,name,signType);
}
function getSignType(valueEdit,signType){
		if (valueEdit=="0" || valueEdit=="1"){
			return valueEdit;
		}
		var valueType = signType;
		var root = getRoot(valueEdit);
		if (root!=null){
			valueStr = root.text;
			var valueTypeObj = root.attributes.getNamedItem("type");
		
			if (valueTypeObj!= null){
				valueType = valueTypeObj.nodeValue;
			}
		}
		return valueType;
}

function getSignValue(xmlValue){
	var map = new HashMap();
	if (xmlValue == "0"){
		map.put("type","0");
		map.put("value","");
	}else if (xmlValue == "1"){
		map.put("type","1");
		map.put("value","");
	}else{
		var xmlDoc = new ActiveXObject("Microsoft.XMLDOM"); //创建Document对象
	    xmlDoc.async = "false"; //设置文档异步下载为否
	    xmlDoc.loadXML(xmlValue); //加载XML样式的字符串
		var root = xmlDoc.documentElement; //定义root为文档的根节点
		var disTempValue = root.text;
		var disNodeType = root.attributes.getNamedItem("type");
		var disType = "0";
		if (disNodeType != null){
			disType = disNodeType.nodeValue;
		}
		map.put("type",disType);
		map.put("value",disTempValue);
	}
	return map;
}
/**
 * 选择域的查看信息处理
 */
function selectOpen(url){
	window.showModelessDialog(url,"","scrollbars=no;dialogWidth=450px;dialogHeight=290px");
}
/*
 * 处理附件选择
 */
function getFormDataId()
{
	var ins_dataid= document.all("Ins_DATAID");
	if (ins_dataid==null) return null;
	
	var dataId = document.all("Ins_DATAID").value;//获取表单ID
	if(dataId!=null && dataId!="")
	{ 
	return dataId; }
	else{
	return null;
	}
}