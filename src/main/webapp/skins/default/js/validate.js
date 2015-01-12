/******************************************************/
/* �ļ�����univerify.js                               */
/* ��  �ܣ������Զ������Ե�ͳһ�����javascript������ */
/******************************************************/
/* ȡ���ַ������ֽڳ��� */
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

/* ����ַ����Ƿ�Ϊ�� */
function isnull(str)
{
var i;
 for (i=0;i<str.length;i++)
{
  if (str.charAt(i)!=' ') return false;
}
 return true;
}
/*���С��λ��*/
function isDigit(str,digit){
	if(str.indexOf(".")!=-1){
      var temp = str.substring(str.indexOf(".")+1,str.length);
      if(temp.length>digit){
        return false;
      }
   }
   return true;
}

/* ����ַ����Ƿ�ȫΪ���� */
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

/* ����ַ����Ƿ��ǷǸ����� */
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

//����Ƿ�Ϊ����
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

//����
function isNegnumber(str){
 if(isNaN(str)){return false;}
 if(str.substr(0,1) != "-"){return false;}
 return true;
}
//����
function isPlusnumber(str){
 if(isNaN(str)){return false;}
 if(str.substr(0,1) == "-"){return false;}
 return true;
}

function isPlusNativeNumber(str){
//����Ȼ��
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
����Ƿ�Ϊ�Ϸ������ʼ�
*/

function isEmail(str){

    var myReg = /^([-_A-Za-z0-9\.]+)@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;    
    if(myReg.test(str)) return true;    
    return false;  
}

/**
����Ƿ�Ϊ�Ϸ����֤
*/
function isIdCardNumber(strIDno)   
{  
   /* var aCity={11:"����",12:"���",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"���",82:"����",91:"����"};   
    
    var iSum = 0;   
    var info = "";   
  
    var idCardLength = strIDno.length;     
    if(!/^\d{17}(\d|x)$/i.test(strIDno)&&!/^\d{15}$/i.test(strIDno))    
    {   
       // f_alert(obj,"�Ƿ����֤��");   
        return false;   
    }   
    
    //�ں����������x�൱������10,����ת����a   
    strIDno = strIDno.replace(/x$/i,"a");   
  
    if(aCity[parseInt(strIDno.substr(0,2))]==null)   
    {   
      //  f_alert(obj,"�Ƿ�����");   
        return false;   
    }   
       
    if (idCardLength==18)   
    {   
        sBirthday=strIDno.substr(6,4)+"-"+Number(strIDno.substr(10,2))+"-"+Number(strIDno.substr(12,2));   
        var d = new Date(sBirthday.replace(/-/g,"/"))   
        if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate()))   
        {          
        //    f_alert(obj,"�Ƿ�����");   
            return false;   
        }   
  
        for(var i = 17;i>=0;i --)   
            iSum += (Math.pow(2,i) % 11) * parseInt(strIDno.charAt(17 - i),11);   
  
        if(iSum%11!=1)   
        {   
       //     f_alert(obj,"�Ƿ����֤��");   
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
         //   f_alert(obj,"�Ƿ�����");   
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
   
//����Ƿ�Ϊ�绰����
/* 
Ҫ��һ���绰���������� "-"���� 
�����绰����Ϊ3��8λ 
��������绰�����а��������ţ���ô����Ϊ��λ����λ 
�ġ�������"("��")"��"-"���������ָ��� 
*/ 

function isPhone(obj){
     
    var pattern=/(^([0\+]\d{2,3})\d{3,4}\-\d{3,8}$)|(^([0\+]\d{2,3})\d{3,4}\d{3,8}$)|(^([0\+]\d{2,3}){0,1}13\d{9}$)|(^\d{3,4}\d{3,8}$)|(^\d{3,4}\-\d{3,8}$)/;
    return (pattern.test(obj)) ? true : false;  
}

//�ж��Ƿ�ΪӢ��
function isCharsInBagEn (s, bag)
{
    var i,c;
    for (i = 0; i < s.length; i++)
    {
        c = s.charAt(i);//�ַ���s�е��ַ�

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
        c = s.charAt(i);//�ַ���s�е��ַ�

        if (bag.indexOf(c) > -1)
        return c;
    }
    return "";
}


//�Ƿ�ΪӢ��
function isEnglish(s)
{
    var errorChar;
    var badChar = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    errorChar = isCharsInBagEn(s, badChar)
    return (errorChar != "" ) ? false : true;
}

function isIp(s)
//�Ƿ�Ϊ��Чip
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
//�Ƿ�ֻΪ����
function isChinese(obj){   
    if (/^[\u4e00-\u9fa5]+$/.test(obj)) {   
      return true;   
    }   
   // f_alert(obj,"�����뺺��");   
    return false;   
}  

//�Ƿ�ΪСдӢ����ĸ
function isLowercase(obj)   
{          
    if (/^[a-z]+$/.test( obj ))    
    {   
       return true;   
    }    
    //f_alert(obj,"������СдӢ����ĸ");   
    return false;   
}   
//�Ƿ�Ϊ��дӢ����ĸ
function isUppercase(obj)   
{          
    if (/^[A-Z]+$/.test( obj))    
    {   
       return true;   
    }    
   // f_alert(obj,"�������дӢ����ĸ");   
    return false;   
}   
//Ӣ����ĸ
function isEnglishLetter(obj)   
{          
    if (/^[A-Za-z]+$/.test( obj ))    
    {   
       return true;   
    }    
   // f_alert(obj,"������Ӣ����ĸ");   
    return false;   
}   
   
//����ֻ�������ֻ���Ӣ��   
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
	       alert('����ֻ�������ֻ�Ӣ����ĸ�����ģ�');
	       return false;
	   }
	   return true;
}
 
 
 function checkRate(str){
		var re = /^[0-9]+.?[0-9]*$/;
		if(!re.test(str)){
			alert("����������(��:0.02)");
	        return false;
	     }
		return true;
} 
  
//��ַ
function isNetworkAddress(obj){ 
    var myReg =  /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\?+!]*([^<>\"\"])*$/;       
    if(myReg.test( obj )) return true; 
    var myReg1 =  /^www\.[A-Za-z0-9]+\.[A-Za-z0-9]+$/;       
    if(myReg1.test( obj )) return true;   
    return false;    
}

//�����Э��ͷ����ַ
function isNetAddwithHttp(obj){
	obj = obj.toLowerCase();
	var myReg = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\?+!]*([^<>\"\"])*$/;
	if(myReg.test( obj )) return true; 
	return false;
}      

//�ֻ�����
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
//�ļ���
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
/* ���ָ���ı��������Ƿ�Ϸ� */
function verifyInput(input)
{
var i;
var error = false;
/* ����У�� */
if (input.maxsize!="undefined" && !isNaN(input.maxsize)&&strlen(input.value)>parseInt(input.maxsize))
{
//modified by chenzhaohua 2008-04-08  add"input.maxsize!="undefined" && !isNaN(input.maxsize)&&"  for validate textarea 
alert(input.cn_name+"������󳤶�"+input.maxsize);
error = true;
}else if (input.minsize!="undefined" && !isNaN(input.minsize)&&strlen(input.value)<parseInt(input.minsize))
{
alert(input.cn_name+"������С����"+input.minsize);
error = true;
}else if(input.maxSize!="undefined" && !isNaN(input.maxSize)&&strlen(input.value)>parseInt(input.maxSize)){
//added by chenzhaohua 2008-07-09  
alert(input.cn_name+"������󳤶�"+input.maxSize);
error = true;
}else if(input.maxintsize != "undefined" && !isNaN(input.maxintsize) && strlen(Math.abs(parseInt(input.value))+"")>parseInt(input.maxintsize)){
//added by chenzhaohua 2008-07-10 
//�������ֳ���
alert(input.cn_name+"�������ֳ�����󳤶�"+input.maxintsize);
error=true;
}else if(input.maxfloatsize != "undefined" && !isNaN(input.maxfloatsize) && Math.abs(parseFloat(input.value))>parseFloat(input.maxfloatsize)){
//added by chenzhaohua 2008-07-10 
alert(input.cn_name+"�������ֵ"+input.maxfloatsize);
error=true;
}else if(input.digit!="undefined" && !isDigit(input.value,input.digit)){
alert(input.cn_name+"С��λ��ӦΪ��"+input.digit+"λ!");
error=true;
}
else if (input.nullable != "undefined" && input.nullable=="no"&&isnull(input.value))
{/* �ǿ�У�� */
alert(input.cn_name+"����Ϊ��");
error = true;
}
else if(isnull(input.value) == false)
{
/* ��������У�� */
switch(input.datatype)
{
case "number": if (isnumber(input.value)==false)
{//input.value.replace(/^\+/g,"") added by chenzhaohua  2008-07-10 ��������ǰ+��
alert(input.cn_name+"ֵӦ��ȫΪ����");
error = true;
}
break;
case "integer": if(isInteger(input.value)==false)
{
alert(input.cn_name+"ֵӦ��Ϊ�Ǹ�����!");
error = true;
}
break;
case "email":if(isEmail(input.value)==false)
{
alert(input.cn_name+"ֵ��ʽӦ��Ϊ: abc@123.com!");
error = true;
}
break;
case "mobile":if(isMobile(input.value)==false)
{
alert(input.cn_name+"��ʽ����!");
error = true;
}
break;
case "zipcode":if(isInteger(input.value)==false||strlen(input.value)!=6)
{
alert(input.cn_name+"ֵӦ��Ϊ6λ����!");
error = true;
}
break;
case "idnumber":if(isIdCardNumber(input.value)==false)
{
alert(input.cn_name+"ֵӦ��Ϊ�Ϸ����֤����!");
error = true;
}
break;
case "phone":if(isPhone(input.value)==false)
{
   alert(input.cn_name+"ֵ��ʽӦ��Ϊ 020-12345678");
   error = true;
}
break;
case "networkaddress":if(isNetworkAddress(input.value)==false)
{
   alert(input.cn_name+"ֵ��ʽ����! ");
   error = true;
}
break;
case "networkaddresswithhttp":if(isNetAddwithHttp(input.value)==false)
{
	alert(input.cn_name+"ֵ��ʽ�����������ʾ��Ϣ��д��");
	error = true;
}
break;
case "negnumber":if(isNegnumber(input.value)==false)
{
   alert(input.cn_name+"ֵӦΪ����! ");
   error = true;
}
case "double":if(checkRate(input.value) == false)
{
	error = true;
}
break;
case "plusnumber":if(isPlusnumber(input.value)==false)
{
   alert(input.cn_name+"ֵӦΪ����! ");
   error = true;
}
break;
case "allinteger":if(isAllInteger(input.value)==false)
{
   alert(input.cn_name+"ֵӦΪ����! ");
   error = true;
}
break;
case "plusnativenumber":if(isPlusNativeNumber(input.value)==false)
{
   alert(input.cn_name+"ֵӦΪ������! ");
   error = true;
}
break;
case "englistornumber":if(isEnglistOrNumber(input.value)==false)
{
   alert(input.cn_name+"ֵӦΪӢ����ĸ������! ");
   error = true;
}
break;
case "qqqq":if(isQQQQ(input.value)==false)
{
	alert(input.cn_name+"ֵ����ȷ!");
	error = true;
}
break;
/* �����������Ӷ���Զ����������͵�У���ж� */
/*  case datatype1: ... ; break;        */
/*  case datatype2: ... ; break;        */
/*  ....................................*/
default  : break;
}
}
/* �������޴������û�ȡ����ʾ��־ */
if (error)
{
return false;
}
else
{
return true;
}
}
/* ���ָ��FORM������Ӧ������Ԫ��
����Щ�����Զ������Ե�Ԫ�أ��Ƿ�Ϸ����˺������ڱ���onsubmit�¼� */
function validateAll(myform)
{
	var i;
	var selArray=new Array();
	for (i=0;i<myform.elements.length;i++)
	{
		 /* ���Զ������Ե�Ԫ�ز������ */
		if (myform.elements[i].cn_name+""=="undefined") continue;
		/* У�鵱ǰԪ�� */
		if (verifyInput(myform.elements[i])==false)
		{
		myform.elements[i].focus();
		return false;
		}
		/**����checkbox�ؼ���radio�ؼ���*/
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
	//��checkbox��radio���Ϳؼ�����У��
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

/**�Ը�ѡ�����У��*/
function validateCheckboxCtl(element,myform){
	var param=0;
	for (var i=0;i<myform.elements.length;i++) {
		if (myform.elements[i].name==element.name && myform.elements[i].checked==true)
		param++;
	}
	if(param==0){
		alert(element.cn_name+"����Ϊ��");
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
//���ڸ�ʽУ�飺 
function IsValidDate(str)   
  {       
  var   reg     =     /^(\d{4})-(\d{1,2})-\d{1,2}$/;       
  if(!str.match(reg))   
  {       
  alert("���ڸ�ʽ����ȷ����ȷ�ĸ�ʽΪ��2010-01-17");   
  return     false;   
  }
return true;  
  }