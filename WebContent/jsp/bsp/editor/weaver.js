//取消输入框后面跟随的红色惊叹号
function checkinput(elementname,spanid){
	tmpvalue = document.all(elementname).value;

	while(tmpvalue.indexOf(" ") == 0)
		tmpvalue = tmpvalue.substring(1,tmpvalue.length);
	if(tmpvalue!=""){
		 document.all(spanid).innerHTML='';
	}
	else{
	 document.all(spanid).innerHTML="<IMG src='/images/BacoError.gif' align=absMiddle>";
	 document.all(elementname).value = "";
	}
}
//判断email格式是否正确
//modified by lupeng 2004.06.04.
function checkinput_email(elementname,spanid){
	emailStr = document.all(elementname).value;
	emailStr = emailStr.replace(" ","");
	if (emailStr == "" || !checkEmail(emailStr)) {
		document.all(spanid).innerHTML = "<IMG src='/images/BacoError.gif' align=absMiddle>";
		document.all(elementname).value = "";
	} else
		document.all(spanid).innerHTML = "";
}

/**
 * Reference: Sandeep V. Tamhankar (stamhankar@hotmail.com),
 * Added by lupeng 2004.06.04.
 */
function checkEmail(emailStr) {	
   if (emailStr.length == 0) {
	   return true;
   }
   var emailPat=/^(.+)@(.+)$/;
   var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
   var validChars="\[^\\s" + specialChars + "\]";
   var quotedUser="(\"[^\"]*\")";
   var ipDomainPat=/^(\d{1,3})[.](\d{1,3})[.](\d{1,3})[.](\d{1,3})$/;
   var atom=validChars + '+';
   var word="(" + atom + "|" + quotedUser + ")";
   var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
   var domainPat=new RegExp("^" + atom + "(\\." + atom + ")*$");
   var matchArray=emailStr.match(emailPat);
   if (matchArray == null) {
	   return false;
   }
   var user=matchArray[1];
   var domain=matchArray[2];
   if (user.match(userPat) == null) {
	   return false;
   }
   var IPArray = domain.match(ipDomainPat);
   if (IPArray != null) {
	   for (var i = 1; i <= 4; i++) {
		  if (IPArray[i] > 255) {
			 return false;
		  }
	   }
	   return true;
   }
   var domainArray=domain.match(domainPat);
   if (domainArray == null) {
	   return false;
   }
   var atomPat=new RegExp(atom,"g");
   var domArr=domain.match(atomPat);
   var len=domArr.length;
   if ((domArr[domArr.length-1].length < 2) ||
	   (domArr[domArr.length-1].length > 3)) {
	   return false;
   }
   if (len < 2) {
	   return false;
   }
   return true;
}

function checkinput1(elementname,spanid){
	tmpvalue = elementname.value;

	while(tmpvalue.indexOf(" ") == 0)
		tmpvalue = tmpvalue.substring(1,tmpvalue.length);
	if(tmpvalue!=""){
		 spanid.innerHTML='';
	}
	else{
	 spanid.innerHTML="<IMG src='/images/BacoError.gif' align=absMiddle>";
	 elementname.value = "";
	}
}
//判断input框中是否输入的是数字,包括小数点
function ItemNum_KeyPress()
{
 if(!(((window.event.keyCode>=48) && (window.event.keyCode<=57)) || window.event.keyCode==46 || window.event.keyCode==45))
  {
     window.event.keyCode=0;
  }
}

//判断input框中是否输入的是数字,不包括小数点
function ItemCount_KeyPress()
{
 if(!(((window.event.keyCode>=48) && (window.event.keyCode<=57))|| window.event.keyCode==45))
  {
     window.event.keyCode=0;
  }
}

//判断input框中是否输入的是数字,包括"-"
function ItemPhone_KeyPress()
{
 if(!(((window.event.keyCode>=48) && (window.event.keyCode<=57)) || window.event.keyCode==45))
  {
     window.event.keyCode=0;
  }
}

//判断input框中是否输入的是数字,不包括小数点
function checkcount(objectname)
{
	valuechar = document.all(objectname).value.split("") ;
	isnumber = false ;
	for(i=0 ; i<valuechar.length ; i++) { charnumber = parseInt(valuechar[i]) ; if( isNaN(charnumber) && valuechar[i]!="-") isnumber = true ;}
	if(isnumber) document.all(objectname).value = "" ;
}

function checkcount1(objectname)
{
	valuechar = objectname.value.split("") ;
	isnumber = false ;
	for(i=0 ; i<valuechar.length ; i++) { charnumber = parseInt(valuechar[i]) ; if( isNaN(charnumber) && valuechar[i]!="-") isnumber = true ;}
	if(isnumber) objectname.value = "" ;
}



//判断input框中是否输入的是数字,包括小数点
function checknumber(objectname)
{
	valuechar = document.all(objectname).value.split("") ;
	isnumber = false ;
	for(i=0 ; i<valuechar.length ; i++) { charnumber = parseInt(valuechar[i]) ; if( isNaN(charnumber)&& valuechar[i]!="." && valuechar[i]!="-") isnumber = true ;}
	if(isnumber) document.all(objectname).value = "" ;
}
function checknumber1(objectname)
{
	valuechar = objectname.value.split("") ;
	isnumber = false ;
	for(i=0 ; i<valuechar.length ; i++) { charnumber = parseInt(valuechar[i]) ; if( isNaN(charnumber)&& valuechar[i]!="." && valuechar[i]!="-") isnumber = true ;}
	if(isnumber) objectname.value = "" ;
}

//判断input框中是否输入的是数字,包括"-"
function checkphone(objectname)
{
	valuechar = document.all(objectname).value.split("") ;
	isnumber = false ;
	for(i=0 ; i<valuechar.length ; i++) { charnumber = parseInt(valuechar[i]) ; if( isNaN(charnumber)&& valuechar[i]!="-") isnumber = true ;}
	if(isnumber) document.all(objectname).value = "" ;
}
function checkphone1(objectname)
{
	valuechar = objectname.value.split("") ;
	isnumber = false ;
	for(i=0 ; i<valuechar.length ; i++) { charnumber = parseInt(valuechar[i]) ; if( isNaN(charnumber)&& valuechar[i]!="-") isnumber = true ;}
	if(isnumber) objectname.value = "" ;
}

function ItemTime_KeyPress()
{
 if(!((window.event.keyCode>=48) && (window.event.keyCode<=58)))
  {
     window.event.keyCode=0;
  }
}

function checktime(objectname)
{
	valuechar = document.all(objectname).value.split("") ;
	isnumber = false ;
	for(i=0 ; i<valuechar.length ; i++) { charnumber = parseInt(valuechar[i]) ; if( isNaN(charnumber)&& valuechar[i]!=":") isnumber = true ;}
	if(isnumber) document.all(objectname).value = "" ;
}

function checktime1(objectname)
{
	valuechar = objectname.value.split("") ;
	isnumber = false ;
	for(i=0 ; i<valuechar.length ; i++) { charnumber = parseInt(valuechar[i]) ; if( isNaN(charnumber)&& valuechar[i]!=":") isnumber = true ;}
	if(isnumber) objectname.value = "" ;
}


//判断input框中是否输入的是英文字母和数字，并且以字母开头
function checkinput_char_num(objectname)
{
	valuechar = document.all(objectname).value.split("") ;
	if(valuechar.length==0){
	    return ;
	}
	notcharnum = false ;
	notchar = false ;
	notnum = false ;
	for(i=0 ; i<valuechar.length ; i++) {
		notchar = false ;
		notnum = false ;
		charnumber = parseInt(valuechar[i]) ; if(isNaN(charnumber)) notnum = true ;
		if(valuechar[i].toLowerCase()<'a' || valuechar[i].toLowerCase()>'z') notchar = true ;
		if(notnum && notchar) notcharnum = true ;
	}
	if(valuechar[0].toLowerCase()<'a' || valuechar[0].toLowerCase()>'z') notcharnum = true ;
	if(notcharnum) document.all(objectname).value = "" ;
}

//检测input框中输入的小数中的整数部分是否超过限制的位数
function checkdecimal_length(elementname,maxlength)
{
	if(!isNaN(parseInt(document.all(elementname).value)) && (maxlength > 0)){
		inputTemp = document.all(elementname).value ;
		if (inputTemp.indexOf(".") !=-1)
		{
			inputTemp = inputTemp.substring(0,inputTemp.indexOf("."));
		}
		if (inputTemp.length > maxlength)
		{
			alert(document.all(elementname).value+"的整数部分超过"+maxlength+"位！");
			document.all(elementname).value = "" ;
		}
	}
}
