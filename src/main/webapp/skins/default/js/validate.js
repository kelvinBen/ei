/******************************************************/
/* 文件名：univerify.js                               */
/* 功  能：基于自定义属性的统一检测用javascript函数库 */
/******************************************************/
/* 取得字符串的字节长度 */
function strlen(str)
{var i;
var len;
len = 0;
for (i=0;i<str.length;i++)
{
if (str.charCodeAt(i)>255) len+=2; else len++;
}
return len;
}

/* 检测字符串是否为空 */
function isnull(str)
{
var i;
 for (i=0;i<str.length;i++)
{
  if (str.charAt(i)!=' ') return false;
}
 return true;
}
/*检测小数位数*/
function isDigit(str,digit){
	if(str.indexOf(".")!=-1){
      var temp = str.substring(str.indexOf(".")+1,str.length);
      if(temp.length>digit){
        return false;
      }
   }
   return true;
}

/* 检测字符串是否全为数字 */
function isnumber(str)
{
if(isNaN(str))return false;
var number_chars = "1234567890.-";
var i;
for (i=0;i<str.length;i++)
{
if (number_chars.indexOf(str.charAt(i))==-1) return false;
}
return true;
}

/* 检测字符串是否是非负整数 */
function isInteger(str)
{
var number_chars = "1234567890";
var i;
for (i=0;i<str.length;i++)
{
if (number_chars.indexOf(str.charAt(i))==-1) return false;
}
return true;
}

//检查是否为整数
function isAllInteger(str)
{
var number_chars = "1234567890-";
var i;
for (i=0;i<str.length;i++)
{
if (number_chars.indexOf(str.charAt(i))==-1) return false;
}
return true;
}

//负数
function isNegnumber(str){
 if(isNaN(str)){return false;}
 if(str.substr(0,1) != "-"){return false;}
 return true;
}
//正数
function isPlusnumber(str){
 if(isNaN(str)){return false;}
 if(str.substr(0,1) == "-"){return false;}
 return true;
}

function isPlusNativeNumber(str){
//正自然数
  if(isInteger(str)){
    if(parseInt(str)==0){
      return false;
    }
  }else{
    return false;
  }
  return true;
}
/**
检测是否为合法电子邮件
*/

function isEmail(str){

    var myReg = /^([-_A-Za-z0-9\.]+)@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;    
    if(myReg.test(str)) return true;    
    return false;  
}

/**
检测是否为合法身份证
*/
function isIdCardNumber(strIDno)   
{  
   /* var aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};   
    
    var iSum = 0;   
    var info = "";   
  
    var idCardLength = strIDno.length;     
    if(!/^\d{17}(\d|x)$/i.test(strIDno)&&!/^\d{15}$/i.test(strIDno))    
    {   
       // f_alert(obj,"非法身份证号");   
        return false;   
    }   
    
    //在后面的运算中x相当于数字10,所以转换成a   
    strIDno = strIDno.replace(/x$/i,"a");   
  
    if(aCity[parseInt(strIDno.substr(0,2))]==null)   
    {   
      //  f_alert(obj,"非法地区");   
        return false;   
    }   
       
    if (idCardLength==18)   
    {   
        sBirthday=strIDno.substr(6,4)+"-"+Number(strIDno.substr(10,2))+"-"+Number(strIDno.substr(12,2));   
        var d = new Date(sBirthday.replace(/-/g,"/"))   
        if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))   
        {          
        //    f_alert(obj,"非法生日");   
            return false;   
        }   
  
        for(var i = 17;i>=0;i --)   
            iSum += (Math.pow(2,i) % 11) * parseInt(strIDno.charAt(17 - i),11);   
  
        if(iSum%11!=1)   
        {   
       //     f_alert(obj,"非法身份证号");   
            return false;   
        }   
    }   
    else if (idCardLength==15)   
    {   
        sBirthday = "19" + strIDno.substr(6,2) + "-" + Number(strIDno.substr(8,2)) + "-" + Number(strIDno.substr(10,2));   
        var d = new Date(sBirthday.replace(/-/g,"/"))   
        var dd = d.getFullYear().toString() + "-" + (d.getMonth()+1) + "-" + d.getDate();      
        if(sBirthday != dd)   
        {   
         //   f_alert(obj,"非法生日");   
            return false;   
        }   
    }   
    return true;  
    */  
    var len = strIDno.length;
    if(len != 15 && len != 18){
      return false;
    }
    if(!isEnglistOrNumber(strIDno)){
      return false;
    }
    return true;
}   
   
//检测是否为电话号码
/* 
要求：一、电话号码由数字 "-"构成 
二、电话号码为3到8位 
三、如果电话号码中包含有区号，那么区号为三位或四位 
四、区号用"("、")"或"-"和其他部分隔开 
*/ 

function isPhone(obj){
     
    var pattern=/(^([0\+]\d{2,3})\d{3,4}\-\d{3,8}$)|(^([0\+]\d{2,3})\d{3,4}\d{3,8}$)|(^([0\+]\d{2,3}){0,1}13\d{9}$)|(^\d{3,4}\d{3,8}$)|(^\d{3,4}\-\d{3,8}$)/;
    return (pattern.test(obj)) ? true : false;  
}

//判断是否为英文
function isCharsInBagEn (s, bag)
{
    var i,c;
    for (i = 0; i < s.length; i++)
    {
        c = s.charAt(i);//字符串s中的字符

        if (bag.indexOf(c) <0)
        return c;
    }
    return "";
}

function isCharsInBag (s, bag)
{
    var i,c;
    for (i = 0; i < s.length; i++)
    {
        c = s.charAt(i);//字符串s中的字符

        if (bag.indexOf(c) > -1)
        return c;
    }
    return "";
}


//是否为英文
function isEnglish(s)
{
    var errorChar;
    var badChar = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    errorChar = isCharsInBagEn(s, badChar)
    return (errorChar != "" ) ? false : true;
}

function isIp(s)
//是否为有效ip
{
    var check = function(v)
    {
        try
        {
            return (v <= 255 && v >= 0);
        }
        catch(x)
        {
            return false;
        }
    }
    var re = s.split(".")
    return (re.length==4)?(check(re[0]) && check(re[1]) && check(re[2]) && check(re[3])):false
}
//是否只为汉字
function isChinese(obj){   
    if (/^[\u4e00-\u9fa5]+$/.test(obj)) {   
      return true;   
    }   
   // f_alert(obj,"请输入汉字");   
    return false;   
}  

//是否为小写英文字母
function isLowercase(obj)   
{          
    if (/^[a-z]+$/.test( obj ))    
    {   
       return true;   
    }    
    //f_alert(obj,"请输入小写英文字母");   
    return false;   
}   
//是否为大写英文字母
function isUppercase(obj)   
{          
    if (/^[A-Z]+$/.test( obj))    
    {   
       return true;   
    }    
   // f_alert(obj,"请输入大写英文字母");   
    return false;   
}   
//英文字母
function isEnglishLetter(obj)   
{          
    if (/^[A-Za-z]+$/.test( obj ))    
    {   
       return true;   
    }    
   // f_alert(obj,"请输入英文字母");   
    return false;   
}   
   
//检验只能是数字或者英文   
 function isEnglistOrNumber(str){   
	 var reg=/^[a-z0-9.]*$/gi   
	 if(reg.test(str)){
	 	return   true   
	 }else{     
	 	return   false;   
	 }   
 }
 
 function isEnglishOrNumberOrChinese(str){
      var re = /^[a-zA-Z\d\u4e00-\u9fa5]+$/;
      if(!re.test(str)){
	       alert('名称只能是数字或英文字母或中文！');
	       return false;
	   }
	   return true;
}
 
 
 function checkRate(str){
		var re = /^[0-9]+.?[0-9]*$/;
		if(!re.test(str)){
			alert("请输入数字(例:0.02)");
	        return false;
	     }
		return true;
} 
  
//网址
function isNetworkAddress(obj){ 
    var myReg =  /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\?+!]*([^<>\"\"])*$/;       
    if(myReg.test( obj )) return true; 
    var myReg1 =  /^www\.[A-Za-z0-9]+\.[A-Za-z0-9]+$/;       
    if(myReg1.test( obj )) return true;   
    return false;    
}

//必须带协议头的网址
function isNetAddwithHttp(obj){
	obj = obj.toLowerCase();
	var myReg = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\?+!]*([^<>\"\"])*$/;
	if(myReg.test( obj )) return true; 
	return false;
}      

//手机号码
function isMobile(obj){
   var myReg = /^1[3,5,8]{1}[0-9]{1}[0-9]{8}$/;       
    if(myReg.test( obj )) return true;    
    return false;
    /**
	   if(/^13\d{9}$/g.test(obj)||(/^15\d{9}$/g.test(obj))){
	         return true;
	    }else{
	        return false;
	   }
	   **/
}
//文件名
 function  isFileName(str){  
  re   =   /[\\\/\:\*\?\<\>\|]/i;   
  if   (str.search(re)>-1)   
  {   
  return   false;   
  }   
  else{   
  return   true;   
  }
 }
// QQ
function isQQQQ(obj) {
	var myReg = /^[1-9]\d{4,8}$/;
	if(myReg.test(obj)) return true;
	return false;
}   
/* 检测指定文本框输入是否合法 */
function verifyInput(input)
{
var i;
var error = false;
/* 长度校验 */
if (input.maxsize!="undefined" && !isNaN(input.maxsize)&&strlen(input.value)>parseInt(input.maxsize))
{
//modified by chenzhaohua 2008-04-08  add"input.maxsize!="undefined" && !isNaN(input.maxsize)&&"  for validate textarea 
alert(input.cn_name+"超出最大长度"+input.maxsize);
error = true;
}else if (input.minsize!="undefined" && !isNaN(input.minsize)&&strlen(input.value)<parseInt(input.minsize))
{
alert(input.cn_name+"超出最小长度"+input.minsize);
error = true;
}else if(input.maxSize!="undefined" && !isNaN(input.maxSize)&&strlen(input.value)>parseInt(input.maxSize)){
//added by chenzhaohua 2008-07-09  
alert(input.cn_name+"超出最大长度"+input.maxSize);
error = true;
}else if(input.maxintsize != "undefined" && !isNaN(input.maxintsize) && strlen(Math.abs(parseInt(input.value))+"")>parseInt(input.maxintsize)){
//added by chenzhaohua 2008-07-10 
//整数部分长度
alert(input.cn_name+"整数部分超出最大长度"+input.maxintsize);
error=true;
}else if(input.maxfloatsize != "undefined" && !isNaN(input.maxfloatsize) && Math.abs(parseFloat(input.value))>parseFloat(input.maxfloatsize)){
//added by chenzhaohua 2008-07-10 
alert(input.cn_name+"超出最大值"+input.maxfloatsize);
error=true;
}else if(input.digit!="undefined" && !isDigit(input.value,input.digit)){
alert(input.cn_name+"小数位数应为："+input.digit+"位!");
error=true;
}
else if (input.nullable != "undefined" && input.nullable=="no"&&isnull(input.value))
{/* 非空校验 */
alert(input.cn_name+"不能为空");
error = true;
}
else if(isnull(input.value) == false)
{
/* 数据类型校验 */
switch(input.datatype)
{
case "number": if (isnumber(input.value)==false)
{//input.value.replace(/^\+/g,"") added by chenzhaohua  2008-07-10 除掉数字前+号
alert(input.cn_name+"值应该全为数字");
error = true;
}
break;
case "integer": if(isInteger(input.value)==false)
{
alert(input.cn_name+"值应该为非负整数!");
error = true;
}
break;
case "email":if(isEmail(input.value)==false)
{
alert(input.cn_name+"值格式应该为: abc@123.com!");
error = true;
}
break;
case "mobile":if(isMobile(input.value)==false)
{
alert(input.cn_name+"格式错误!");
error = true;
}
break;
case "zipcode":if(isInteger(input.value)==false||strlen(input.value)!=6)
{
alert(input.cn_name+"值应该为6位数字!");
error = true;
}
break;
case "idnumber":if(isIdCardNumber(input.value)==false)
{
alert(input.cn_name+"值应该为合法身份证号码!");
error = true;
}
break;
case "phone":if(isPhone(input.value)==false)
{
   alert(input.cn_name+"值格式应该为 020-12345678");
   error = true;
}
break;
case "networkaddress":if(isNetworkAddress(input.value)==false)
{
   alert(input.cn_name+"值格式错误! ");
   error = true;
}
break;
case "networkaddresswithhttp":if(isNetAddwithHttp(input.value)==false)
{
	alert(input.cn_name+"值格式错误！请根据提示信息填写！");
	error = true;
}
break;
case "negnumber":if(isNegnumber(input.value)==false)
{
   alert(input.cn_name+"值应为负数! ");
   error = true;
}
case "double":if(checkRate(input.value) == false)
{
	error = true;
}
break;
case "plusnumber":if(isPlusnumber(input.value)==false)
{
   alert(input.cn_name+"值应为正数! ");
   error = true;
}
break;
case "allinteger":if(isAllInteger(input.value)==false)
{
   alert(input.cn_name+"值应为整数! ");
   error = true;
}
break;
case "plusnativenumber":if(isPlusNativeNumber(input.value)==false)
{
   alert(input.cn_name+"值应为正整数! ");
   error = true;
}
break;
case "englistornumber":if(isEnglistOrNumber(input.value)==false)
{
   alert(input.cn_name+"值应为英文字母或数字! ");
   error = true;
}
break;
case "qqqq":if(isQQQQ(input.value)==false)
{
	alert(input.cn_name+"值不正确!");
	error = true;
}
break;
/* 在这里可以添加多个自定义数据类型的校验判断 */
/*  case datatype1: ... ; break;        */
/*  case datatype2: ... ; break;        */
/*  ....................................*/
default  : break;
}
}
/* 根据有无错误设置或取消警示标志 */
if (error)
{
return false;
}
else
{
return true;
}
}
/* 检测指定FORM表单所有应被检测的元素
（那些具有自定义属性的元素）是否合法，此函数用于表单的onsubmit事件 */
function validateAll(myform)
{
	var i;
	var selArray=new Array();
	for (i=0;i<myform.elements.length;i++)
	{
		 /* 非自定义属性的元素不予理睬 */
		if (myform.elements[i].cn_name+""=="undefined") continue;
		/* 校验当前元素 */
		if (verifyInput(myform.elements[i])==false)
		{
		myform.elements[i].focus();
		return false;
		}
		/**保存checkbox控件和radio控件名*/
		if((myform.elements[i].datatype=="checkbox"||myform.elements[i].datatype=="radio")&&(myform.elements[i].nullable=="no"))
		{
			var isExited=false;
			for(var n=0;n<selArray.length;n++)
			{
				if(selArray[n].name==myform.elements[i].name)
					isExited=true;
			}
			if(!isExited){
				selArray.push(myform.elements[i]);
			}
		}
	}
	//对checkbox和radio类型控件进行校验
	var bFlag=true;
	for(var t=0;t<selArray.length;t++)
	{
		if(!validateCheckboxCtl(selArray[t],myform)){
			bFlag=false;
			break;
		}
	}
	return bFlag;
}

/**对复选框进行校验*/
function validateCheckboxCtl(element,myform){
	var param=0;
	for (var i=0;i<myform.elements.length;i++) {
		if (myform.elements[i].name==element.name && myform.elements[i].checked==true)
		param++;
	}
	if(param==0){
		alert(element.cn_name+"不能为空");
		return false;
	}
	return true;
}


function inputIsValid(object)
{
	var str="`~!@#$%^&*()+|\{}[]:':?/.<>\" ";
	var bool=true;
	for(var j=0;j<object.length;j++)
	{
		  var ch=object.charAt(j);
		  if(str.indexOf(ch)!=-1)
		  {
		  	bool=false;
			break;
		  }
	 }
       return bool;
}
//日期格式校验： 
function IsValidDate(str)   
  {       
  var   reg     =     /^(\d{4})-(\d{1,2})-\d{1,2}$/;       
  if(!str.match(reg))   
  {       
  alert("日期格式不正确，正确的格式为：2010-01-17");   
  return     false;   
  }
return true;  
  }