 /*********************************************
 **********************************************
 ****************  基本类型  *******************
 **********************************************
 *********************************************/
/**
 * List对象
 */
function List(){
	this.array = new Array();
	this.size = function(){
		return this.array.length;
	}
	this.get = function(i){
		return this.array[i];
	}
	this.add = function(obj){}
}
/**
 * ArrayList对象
 */
function ArrayList(){
	this.base = List;
	this.base();
	this.add = function(obj){
		this.array[this.size()] = obj;
	}
}
/**
 * Map对象
 */
function Map(){
	this.values = new Array();
	this.keys = new Array();
	this.keyArray = function (){
		return this.keys;
	}
	this.get = function(name){
		return this.values[name];
	}
	this.getKey = function(i){
		return this.keys[i];
	}
	this.size = function (){
		return this.keys.length;
	}
	this.put = function (key,value){}
}
/**
 * HashMap对象
 */
function HashMap(){
	this.base = Map;
	this.base();
	this.put = function (key,value){
		this.values[key] = value;
		this.keys[this.size()] = key;
	}
	this.toString = function(split){
		var temStr = "";
		if (split==null)
			split = ",";
		for (var i=0;i<this.size();i++){
			if (i==0)
				temStr = this.getKey(i) + "=" + this.get(this.getKey(i));
			else
				temStr += split + this.getKey(i) + "=" + this.get(this.getKey(i));
		}
		return temStr;
	}
}

 /*********************************************
 **********************************************
 ****************  BASE64编码处理  *******************
 **********************************************
 *********************************************/
var base64EncodeChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
var base64DecodeChars = new Array(
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
    -1,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
    -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1);

function base64encode(str) {
    var out, i, len;
    var c1, c2, c3;

    len = str.length;
    i = 0;
    out = "";
    while(i < len) {
	c1 = str.charCodeAt(i++) & 0xff;
	if(i == len)
	{
	    out += base64EncodeChars.charAt(c1 >> 2);
	    out += base64EncodeChars.charAt((c1 & 0x3) << 4);
	    out += "==";
	    break;
	}
	c2 = str.charCodeAt(i++);
	if(i == len)
	{
	    out += base64EncodeChars.charAt(c1 >> 2);
	    out += base64EncodeChars.charAt(((c1 & 0x3)<< 4) | ((c2 & 0xF0) >> 4));
	    out += base64EncodeChars.charAt((c2 & 0xF) << 2);
	    out += "=";
	    break;
	}
	c3 = str.charCodeAt(i++);
	out += base64EncodeChars.charAt(c1 >> 2);
	out += base64EncodeChars.charAt(((c1 & 0x3)<< 4) | ((c2 & 0xF0) >> 4));
	out += base64EncodeChars.charAt(((c2 & 0xF) << 2) | ((c3 & 0xC0) >>6));
	out += base64EncodeChars.charAt(c3 & 0x3F);
    }
    return out;
}

function base64decode(str) {
    var c1, c2, c3, c4;
    var i, len, out;

    len = str.length;
    i = 0;
    out = "";
    while(i < len) {

	do {
	    c1 = base64DecodeChars[str.charCodeAt(i++) & 0xff];
	} while(i < len && c1 == -1);
	if(c1 == -1)
	    break;


	do {
	    c2 = base64DecodeChars[str.charCodeAt(i++) & 0xff];
	} while(i < len && c2 == -1);
	if(c2 == -1)
	    break;

	out += String.fromCharCode((c1 << 2) | ((c2 & 0x30) >> 4));


	do {
	    c3 = str.charCodeAt(i++) & 0xff;
	    if(c3 == 61)
		return out;
	    c3 = base64DecodeChars[c3];
	} while(i < len && c3 == -1);
	if(c3 == -1)
	    break;

	out += String.fromCharCode(((c2 & 0XF) << 4) | ((c3 & 0x3C) >> 2));


	do {
	    c4 = str.charCodeAt(i++) & 0xff;
	    if(c4 == 61)
		return out;
	    c4 = base64DecodeChars[c4];
	} while(i < len && c4 == -1);
	if(c4 == -1)
	    break;
	out += String.fromCharCode(((c3 & 0x03) << 6) | c4);
    }
    return out;
}

function utf16to8(str) {
    var out, i, len, c;
    out = "";
    len = str.length;
    for(i = 0; i < len; i++) {
		c = str.charCodeAt(i);
		if ((c >= 0x0001) && (c <= 0x007F)) {
		    out += str.charAt(i);
		} else if (c > 0x07FF) {
		    out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
		    out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));
		    out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));
		} else {
		    out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));
		    out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));
		}
    }
    return out;
}

function utf8to16(str) {
    var out, i, len, c;
    var char2, char3;
    out = "";
    len = str.length;
    i = 0;
    while(i < len) {
		c = str.charCodeAt(i++);
		switch(c >> 4){ 
		  case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7:
		    out += str.charAt(i-1);
		    break;
		  case 12: case 13:
		    char2 = str.charCodeAt(i++);
		    out += String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));
		    break;
		  case 14:
		    char2 = str.charCodeAt(i++);
		    char3 = str.charCodeAt(i++);
		    out += String.fromCharCode(((c & 0x0F) << 12) |
						   ((char2 & 0x3F) << 6) |
						   ((char3 & 0x3F) << 0));
		    break;
		}
    }

    return out;
}

/**
 * 进行Base64编码
 * @param str 要编码的字符串
 */
function base64(str) {
    return base64encode(utf16to8(str))
}
/**
 * 进行Base64解码
 * @param base64Code 要解码的Base64串
 */
function unBase64(base64Code) {
    return utf8to16(base64decode(base64Code))
}
/**
 * 将文件转为Base64
 * @param obj 控件
 * @param filePath 文件的全路径
 * @return 编码后的Base64字符串
 */
function fileToBase64(obj,filePath){
	obj.filename = filePath;
	obj.encode();
	return obj.encodeString;
}
/**
 * 将Base64转为文件，并返回文件的全路径
 * @param obj 控件
 * @param base64Code Base64编码的字符串
 * @param expand 文件的扩展名
 * @return 文件的完整路径 
 */
function bsae64ToFile(obj,base64Code,expand){
	obj.decodeValue(base64Code);
	obj.changeFileName(expand);
	return obj.decodefile;
}

/******************************************************/
function getValue(xmlValue){
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