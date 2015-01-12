var signBackColor = "16777215";
var displaySignBackColor = "16777215";
var signInkColor = "16216215";
/** 
 * �༭������ť,�Ի���ķ���ֵΪHashMap,keyΪ����������֣����з��ص���ʾֵ��keyΪvalue
 */
function editField(url,spanid,valueName,hiddens,width,height){
  
	var processId=document.all("processId").value;
    if(processId==null)
      processId="";
    if(!window.confirm("���Ƿ��Ѿ�������������ѱ������� ȷ��,��δ��������� ȡ��,�ȱ���һ�±�!")){
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
 * ���������ֵȡ��������map,�������������б�List
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
 *���ַ�����HTML��Ҫ�ı��뷽ʽ����
 * @param str
 */
function encodeHtml(str) {
	if (str == null || "" == str.trim()) {
		return "";
	}
	var strToCode = str.replace(/</g,"��");
	strToCode = strToCode.replace(/>/g,"��");
	return strToCode;
}
/**
 *���ַ�����HTML��Ҫ�ı��뷽ʽ����
 * @param str
 */
function decodeHtml(str) {
	if (str == null || "" == str.trim()) {
		return null;
	}
	var strToCode = str.replace(/��/g,"<");
	strToCode = strToCode.replace(/��/g,">");
	return strToCode;
}
/**
 * ����༭������ť
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
 * ��ҳ���ϵ�����ʵ��id�����ڶ���id������ʵ��id�����̶���id����ͨ�ð�����jspҳ����
 */
function getHistoryUrl(){
	var processId=document.all("processId").value;
	var activityId=document.all("activityId").value;
	var actDefId=document.all("curActDefId").value;
	var processDefId=document.all("curFlowId").value;
	return "jsp/help.jsp?url=historyhelpurlquery.cmd&processId="+processId+"&activityId="+activityId+"&actDefId="+actDefId+"&processDefId="+processDefId;
}
/**
 * ѡ��������ť
 */
function selectField(url,obj,obj1,width,height){
	
	//����������ȡgetHistoryUrl�����������ȥ��"?isEval=true"�����
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
//ȥ�����������е��ظ���ϲ�
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

//�ж϶�ά�������Ƿ���ڸ�����ֵ

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


//��ԭ��ѡ�е����ݽ��н����������ά����

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
 * ��ϸѡ��������ť
 * @param url ����
 * @param objName ����ֵ���������
 * @param objDisName ����ֵ��ʾ������
 * @param checkName �õ�����������
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
 * �õ���ʾֵ
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
 * �õ�Ҫ�洢��xml
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
 * ���ò�������
 */
function setOperateType(obj){
//�����������ַ���
	document.all("operateType").value = obj.value;
}
/**
 * ǩ�������ʾ����
 * @param disId Ҫ��ʾ��ʷ��Ϣ��ID
 * @param valueEdit ����ֵ
 * @param lastObj ���༭�������
 * @param name ����Ҫ��
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
 * ǩ�������ʾ���⣨���ı༭��
 * @param valueEdit ����ֵ
 * @param lastObj ���༭�������
 * @param name ����Ҫ��
 */
function displayEditSign(valueEdit,lastObj,name,signType){
	var valueType = "0";
	var valueStr = "";
	//�������༭
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
 * ǩ�������ʾ���⣨��������ֵ��
 * @param xml ����ֵ
 */
function getRoot(xml){
	var xmlDoc = new ActiveXObject("Microsoft.XMLDOM"); //����Document����
    xmlDoc.async = "false"; //�����ĵ��첽����Ϊ��
    xmlDoc.loadXML(decodeHtml(xml)); //����XML��ʽ���ַ���
	return xmlDoc.documentElement; //����rootΪ�ĵ��ĸ��ڵ�
}
/**
 * ǩ��
 * @param url ����ҳ���ַ
 * @param obj �������ݵ���
 * @param lastObj ��ʾ���ݵ���
 * @param name ������׼
 * @param width �������ڿ��
 * @param height �������ڸ߶� 
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
			if(!window.confirm("��ǰ���Ѿ��޸�Ϊ��д\n�����������������д����,ԭ���ݽ���ʧ��\n�Ƿ����?")){
				return;
			}
		}else{
			if(!window.confirm("��ǰ���Ѿ��޸�Ϊ��������\n������������м�������,ԭ���ݽ���ʧ��\n�Ƿ����?")){
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
		var xmlDoc = new ActiveXObject("Microsoft.XMLDOM"); //����Document����
	    xmlDoc.async = "false"; //�����ĵ��첽����Ϊ��
	    xmlDoc.loadXML(xmlValue); //����XML��ʽ���ַ���
		var root = xmlDoc.documentElement; //����rootΪ�ĵ��ĸ��ڵ�
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
 * ѡ����Ĳ鿴��Ϣ����
 */
function selectOpen(url){
	window.showModelessDialog(url,"","scrollbars=no;dialogWidth=450px;dialogHeight=290px");
}
/*
 * ������ѡ��
 */
function getFormDataId()
{
	var ins_dataid= document.all("Ins_DATAID");
	if (ins_dataid==null) return null;
	
	var dataId = document.all("Ins_DATAID").value;//��ȡ��ID
	if(dataId!=null && dataId!="")
	{ 
	return dataId; }
	else{
	return null;
	}
}