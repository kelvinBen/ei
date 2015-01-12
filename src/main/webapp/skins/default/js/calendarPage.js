/*******************************************************************
/*日历页面
/*作者：戴林涛
/*功能描述：在一个单独页面显示日历,没有输入框
/*******************************************************************/
//************************************
//
//************************************
Date.prototype.format=function(fomatstr)
{
if(fomatstr==null || fomatstr=="")
	return ;
var nowYear=this.getFullYear();
var nowMonth=this.getMonth()+1;
var nowDay=this.getDate();
var nowHour=this.getHours();
var nowMinute=this.getMinutes();
if(nowYear!=null && nowYear!="")
	{
	fomatstr=fomatstr.replace("yyyy",nowYear);
	}
if(nowMonth!=null && nowMonth!="")
	{
nowMonth=this.numUtil(nowMonth);
	fomatstr=fomatstr.replace("MM",nowMonth);
	}
if(nowDay!=null && nowDay!="")
	{
	nowDay=this.numUtil(nowDay);
	fomatstr=fomatstr.replace("dd",nowDay);
	}
if(nowHour!=null && nowHour!="")
	{
	nowHour=this.numUtil(nowHour);
	var restr=/HH/i;
	fomatstr=fomatstr.replace(restr,nowHour);
	}
else
	{
	var restr=/hh[\S ]*mm/i;
	fomatstr=fomatstr.replace(restr,"");	
	}
if(nowMinute!=null && nowMinute!="")
	{
	nowMinute=this.numUtil(nowMinute);
	fomatstr=fomatstr.replace("mm",nowMinute);
	}
return fomatstr.replace(/\s*$/g,"");
}
Date.prototype.numUtil=function(num)
{
	if(parseInt(num,10)<10)
		return "0"+num;
	else
		return num;

}
function CalendarPage(name)
{
//共有变量
var name=name;
//*******************************
//通用变量
//*******************************
var dDate = new Date();
var month= dDate.getMonth()+1;
var year= dDate.getFullYear();
var day=dDate.getDate();
var hour=dDate.getHours();
var minute=dDate.getMinutes();
var second=dDate.getSeconds();
var inputtextid=null;
var inputtext=null;
var innerhtml="";
var middle="-";
var align="left";
var divAll=null; //外面总的DIV
var divDate=null;//显示日期的DIV
var divTime=null;//显示时间的DIV
var curTd=null;// 上次点击的TD
var newtdstr="";//取开始默认的TD
var targetFormat="yyyy-MM-dd HH:mm";//转换的日期格式
var hasTime=false;//默认不显示时间
//微调
var _interv = null;
var _interv_ob = null;
var _currob = null;
this._inchingswitch=_inchingswitch;
function _inchingswitch(obj,flag)
{
	var o,ob,ar;
	if(_currob != null&&obj.parentElement.parentElement.contains(_currob))
	{
		o = _currob;
		ob = _currob.value;
		ar = _currob.conf.split(",");
	}
	else
	{
		o = obj.parentElement.nextSibling;//输入筐
		ob = obj.parentElement.nextSibling.value;//输入筐值
		ar = obj.parentElement.nextSibling.conf.split(",");//参数用逗号分割
	}

	var step = parseInt(ar[0]);
	var min = parseInt(ar[1]);
	var max = parseInt(ar[2]);
	var alph = ar[3];

	if(ob=="")
	ob=ar[1];//如果输入域为空则默认是最小值
	if(typeof(alph)!="undefined"&&alph!="")
	{
		if(alph==ob.substr(ob.length-2,ob.length-1))
			ob = ob.substr(0,ob.length-1);
	}
	var obvalue = parseInt(ob);
	if(isNaN(obvalue))
	{
//		alert("微调初始值是非数字！");
		obvalue = min;
	}
	if(isNaN(step))
		step = 1;
	if(flag=="+")
	{
		obvalue = obvalue + step;
		if(obvalue>max)
			return;
	}
	if(flag=="-")
	{
		obvalue = obvalue - step;
		if(obvalue<min)
			return;
	}
	o.value = obvalue+alph;
	o.select();
}
this._uper=_uper;
function _uper(ob)
{
	//alert(event.fromElement);
	if(_interv_ob!=null)
		_inchingswitch(_interv_ob,"+");
	else
		_inchingswitch(ob,"+");
	
}
this._conti_uper=_conti_uper;
function _conti_uper(obb)
{
	if(_interv==null)
	{
		_interv_ob = obb;
		_interv=window.setInterval(this._uper, 200);
	}
}
this._stop_inch=_stop_inch;
function _stop_inch()
{
	if(_interv!=null)
	{
		clearInterval(_interv);
		_interv=null;
		_interv_ob = null;
	}
}
this._downer=_downer;
function _downer(ob)
{
	if(_interv_ob!=null)
		_inchingswitch(_interv_ob,"-");
	else
		_inchingswitch(ob,"-");

}
this._conti_downer=_conti_downer;
function _conti_downer(obb)
{
	if(_interv==null)
	{
		_interv_ob = obb;
		_interv=window.setInterval(this._downer, 200);
	}
}
this._selthis=_selthis;
function _selthis(ob)
{
	ob.select();//alert(ob.tagName);
	_currob = ob;
}
//微调结束
this.fGetDaysInMonth=fGetDaysInMonth;
function fGetDaysInMonth(iMonth, iYear) {
var dPrevDate = new Date(iYear, iMonth, 0);
return dPrevDate.getDate();
}
this.fBuildCal=fBuildCal;
function fBuildCal(iYear, iMonth, iDayStyle) {
var aMonth = new Array();
aMonth[0] = new Array(7);
aMonth[1] = new Array(7);
aMonth[2] = new Array(7);
aMonth[3] = new Array(7);
aMonth[4] = new Array(7);
aMonth[5] = new Array(7);
aMonth[6] = new Array(7);
var dCalDate = new Date(iYear, iMonth-1, 1);
var iDayOfFirst = dCalDate.getDay();
var iDaysInMonth = fGetDaysInMonth(iMonth, iYear);
var iVarDate = 1;
var i, d, w;
if (iDayStyle == 2) {
aMonth[0][0] = "Sunday";
aMonth[0][1] = "Monday";
aMonth[0][2] = "Tuesday";
aMonth[0][3] = "Wednesday";
aMonth[0][4] = "Thursday";
aMonth[0][5] = "Friday";
aMonth[0][6] = "Saturday";
} else if (iDayStyle == 1) {
aMonth[0][0] = "日";
aMonth[0][1] = "一";
aMonth[0][2] = "二";
aMonth[0][3] = "三";
aMonth[0][4] = "四";
aMonth[0][5] = "五";
aMonth[0][6] = "六";
} else {
aMonth[0][0] = "Su";
aMonth[0][1] = "Mo";
aMonth[0][2] = "Tu";
aMonth[0][3] = "We";
aMonth[0][4] = "Th";
aMonth[0][5] = "Fr";
aMonth[0][6] = "Sa";
}
for (d = iDayOfFirst; d < 7; d++) {
aMonth[1][d] = iVarDate;
iVarDate++;
}
for (w = 2; w < 7; w++) {
for (d = 0; d < 7; d++) {
if (iVarDate <= iDaysInMonth) {
aMonth[w][d] = iVarDate;
iVarDate++;
      }
   }
}
return aMonth;
}
this.fDrawCal=fDrawCal;
function fDrawCal(iYear, iMonth,iDayStyle) {
var myMonth;
myMonth = fBuildCal(iYear, iMonth, iDayStyle);

innerhtml+="<table border='0' width='100%'  class='date_body' cellspacing='0' cellpadding='0' ><tr class='date_title'>";
innerhtml+="<td width='10%' unselectable='on'>" + myMonth[0][0] + "</td>";
innerhtml+="<td width='10%' unselectable='on'>" + myMonth[0][1] + "</td>";
innerhtml+="<td width='10%' unselectable='on'>" + myMonth[0][2] + "</td>";
innerhtml+="<td width='10%' unselectable='on'>" + myMonth[0][3] + "</td>";
innerhtml+="<td width='10%' unselectable='on'>" + myMonth[0][4] + "</td>";
innerhtml+="<td width='10%' unselectable='on'>" + myMonth[0][5] + "</td>";
innerhtml+="<td width='10%' unselectable='on'>" + myMonth[0][6] + "</td>";
innerhtml+="</tr>";
for (w = 1; w < 6; w++) {
      innerhtml+="<tr class='date_row_odd'>"
      for (d = 0; d < 7; d++) {
            //innerhtml+="<td align='center' valign='top' width='" + iCellWidth + "' height='" + iCellHeight + "' id=calCell style='CURSOR:Hand' onclick=fSetSelectedDay(this)>");
            
            if(myMonth[w][d]==day && year==dDate.getFullYear() && month==dDate.getMonth()+1)
                innerhtml+="<td   width='10%'  class='date_today' unselectable='on'>"+ myMonth[w][d];
            else if(day!=null && day!=dDate.getDate()&& day==myMonth[w][d])
			 {
				innerhtml+="<td   width='10%'  class='date_select' unselectable='on'>"+ myMonth[w][d];
				newtdstr="divDate.children[0].rows["+w+"].cells["+d+"];";
			}
            else
		  {
				
				if (!isNaN(myMonth[w][d])) {
					   innerhtml+="<td   width='10%' class='date_td' unselectable='on'>" + myMonth[w][d];
				} else {
					  innerhtml+="<td   width='10%' class='date_blank_td' unselectable='on'>";
				}
		  }
           innerhtml+="</td>"
       }
      innerhtml+="</tr>";
 }
innerhtml+="<tr  class='date_row_odd'>"
for (d = 0; d < 7; d++) {
  // innerhtml+="<td  width='10%' unselectable='on'>";
if (!isNaN(myMonth[6][d])) {        
     innerhtml+="<td   width='10%' class='date_td' unselectable='on'>" + myMonth[6][d];
   
} else {
	 innerhtml+="<td   width='10%' class='date_blank_td' unselectable='on'>";
}
innerhtml+="</td>"
}
innerhtml+="</tr>";
innerhtml+="</table>";
if(hasTime)
innerhtml+='<table  border="0"   cellpadding="0" cellspacing="0" class="date_table"><tr><td > <table border="0" cellpadding="0" cellspacing="0"  class="date_time"> <tr> <td style="padding-left:3">时间:</td> <td> <div class="adjust"> <div style="position:relative;left:46;top:2;"> <button style="left:0;top:0;"  conf="1,1,100," onclick="'+name+'._uper(this);'+name+'.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value);"  onmousedown="'+name+'._conti_uper(this);'+name+'.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value);" onmouseout="'+name+'._stop_inch();" onmouseup="'+name+'._stop_inch();">5</button> <button style="left:0;top:9;"  onclick="'+name+'._downer(this);'+name+'.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value);"  onmousedown="'+name+'._conti_downer(this);'+name+'.changeHourAndMinute(this.parentElement.nextSibling.value,this.parentElement.nextSibling.nextSibling.nextSibling.value);" onmouseout="'+name+'._stop_inch();" onmouseup="'+name+'._stop_inch();">6</button> </div> <input type="text" maxlength=2 style="border-right:0px;width:23;padding-right:6" onclick="'+name+'._selthis(this);" onchange="'+name+'.doHourBlur(this);"  conf="1,0,23," value="'+hour+'"><INPUT TYPE="text"  value=":" readonly style="width:4;border-right:0px;border-left:0px;" unselectable="on"><input type="text" onchange="'+name+'.doMiniteBlur(this);" maxlength=2  value="'+minute+'" style="border-left:0px;width:36;" onclick="'+name+'._selthis(this);" conf="1,0,59,"> </div> </td></tr></table> </td> <td><span class="buttonskin"><button  class="advbutton" onclick="'+name+'.saveValue();" >确定</button></td> </tr> </table>';
}

//*******************************
//
//*******************************
this.showSelectTable=showSelectTable;
function showSelectTable(flag){
   var obj=document.all("objcalendar");
   if(obj.style.display=="block")
        obj.style.display="none";
	else
	obj.style.position="absolute";
   
           	
}

this.parseInputTextValue=parseInputTextValue;
function parseInputTextValue(val){
  var value=checkinputtextvalue(val);
  var b=new Array();
  for(var i=0;i<2;i++){
   var a=value.indexOf(middle);
   if(value.substring(0,a)=="08"){
      b[i]=8;	
   }else{
   if(value.substring(0,a)=="09"){
      b[i]=9;	
   }else{
      b[i]=parseInt(value.substring(0,a));
   }
   }
   
   value=value.substring(a+1);
   }
   if(value.charAt(0)=='0'){
       value=value.substring(1);
    }
  b[2]=parseInt(value);
  year=b[0];
  month=b[1];
  day=b[2];
 changeYearAndMonth(3);    	
}

this.checkinputtextvalue=checkinputtextvalue;
function checkinputtextvalue(val){
   var flag=false;
   var i,j;
   var value,val1,val2;
   if(val.length!=10){
      flag=true;
   }
   if(flag){
      value=year+middle;
      if(month<10)
          value+="0"+month+middle;
       else
          value+=month+middle;
      if(day<10)
          value+="0"+day;
       else
          value+=day;
       if(hasform){
	  var obj1=eval(tableformname);
	  input=eval(obj1.name+"."+inputtextid);
       }
       else
	  input=document.all(inputtextid);
   }
   else
       value=val;

   return value;
}


this.OnMouseOver=OnMouseOver;
function OnMouseOver(){
  var obj=event.srcElement;
  if(obj!=curTd)
  obj.className="date_mouseover";
}

this.OnMouseOut=OnMouseOut;
function OnMouseOut(){
  var obj=event.srcElement;
  if(obj!=curTd)
	obj.className="date_td";
}

this.OnMouseDown=OnMouseDown;
function OnMouseDown(){
  var obj=event.srcElement;
  if(curTd!=null)
	  curTd.className="date_td";
	curTd=obj;
  day=obj.innerText;
  obj.className="date_select";
}
this.OnDbClick=OnDbClick;
function OnDbClick(){ 
  var obj=event.srcElement; 
  if(curTd!=null)
	  curTd.className="date_td";
	curTd=obj;
  day=obj.innerText;
  obj.className="date_select";
//saveValue();
DoClick();
}

this.changeYearAndMonth=changeYearAndMonth;
function changeYearAndMonth(oyear,omonth){
	if(oyear!=null)
		year=oyear;
if(omonth!=null)
	month=omonth;
  innerhtml="";
  setJavaScript();
}
this.changeHourAndMinute=changeHourAndMinute;
function changeHourAndMinute(ohour,ominute){
	if(ohour!=null)
		hour=ohour;
if(ominute!=null)
	minute=ominute;
}

this.setJavaScript=setJavaScript;
function setJavaScript(){
  fDrawCal(year,month,1);
  var obj=divDate;
  obj.innerHTML=innerhtml;
  if(newtdstr!="")
	  curTd=eval(newtdstr);
  var tabDate=divDate.children[0];
  if(tabDate!=null)
	{
	for(var i=1;i<tabDate.rows.length;i++)
		{
		for(var j=0;j<tabDate.rows[i].cells.length;j++)
			{
			var otd=tabDate.rows[i].cells[j];
			if(otd.innerText=="") continue;
				otd.onmouseover=OnMouseOver;
				otd.onmouseout=OnMouseOut;
				otd.onmousedown=OnMouseDown;
				if(hasTime)
				otd.ondblclick=OnDbClick;
				else
				otd.onclick=OnDbClick;			
			}
		}
	}
}

this.set=set;
function set(objid,splitStr){
if(objid!=null && objid!="")
   inputtextid=objid;
   if(splitStr!=null && splitStr!="")
   middle=splitStr;
   innerhtml="";
   setJavaScript(); 
}
//年输入框失去焦点
this.doYearBlur=doYearBlur;
function doYearBlur(obj)
{
if(obj==null) return;
var arr=obj.conf.split(",");
var objvalue=obj.value;
var minyear=arr[1];
var maxyear=arr[2];
if(isNaN(objvalue) || objvalue=="")
objvalue=year;
if(parseInt(objvalue)<parseInt(minyear))
objvalue=minyear;
if(parseInt(objvalue)>parseInt(maxyear))
objvalue=maxyear;
obj.value=objvalue;
changeYearAndMonth(objvalue);
}

//小时输入框失去焦点
this.doHourBlur=doHourBlur;
function doHourBlur(obj)
{
if(obj==null) return;
var arr=obj.conf.split(",");
var objvalue=obj.value;
var minyear=arr[1];
var maxyear=arr[2];
if(isNaN(objvalue) || objvalue=="")
objvalue=0;
if(parseInt(objvalue,10)<0)
objvalue="0";
if(parseInt(objvalue)>23)
objvalue=23;
obj.value=objvalue;
hour=obj.value;
}
//分钟输入框失去焦点
this.doMiniteBlur=doMiniteBlur;
function doMiniteBlur(obj)
{
if(obj==null) return;
var arr=obj.conf.split(",");
var objvalue=obj.value;
var minyear=arr[1];
var maxyear=arr[2];
if(isNaN(objvalue) || objvalue=="")
objvalue=0;
if(parseInt(objvalue,10)<0)
objvalue="0";
if(parseInt(objvalue)>59)
objvalue=59;
obj.value=objvalue;
minute=obj.value;
}

//初始化
this.init=init;
function init(divid,datestr,splitstr,ishastime)
	{
	if(splitstr!=null)
		middle=splitstr
	if(ishastime!=null)
	hasTime=ishastime;
	var restr=eval('/'+splitstr+'/g');
	datestr=datestr.replace(restr,'/');
	document.all(divid).innerHTML='<div id="calendarInpage" align="left" >'+outHtml()+'</div>';
			divAll=document.all('calendarInpage');
			if(divAll!=null && divAll.tagName=="DIV")
			{
			divDate=divAll.children[0].children[1];
			//divTime=divAll.children[1].children[2].children[0];
			//inputtext=divAll.children[0].children[0];
			}
		//var nfun=new Function("var oodiv=document.all('"+divid+"');var obj=window.event.srcElement;if(!oodiv.contains(obj)) oodiv.children[1].style.display='none';");
		//document.body.attachEvent("onmousedown",nfun);
var odate;
if(datestr!=null && datestr!="" )
	odate=new Date(datestr);
else
	odate=new Date();
var iniyear=odate.getYear();
var inimonth=odate.getMonth()+1;
var iniday=odate.getDate();
var inihour=odate.getHours();
var iniminute=odate.getMinutes();
var inisec=odate.getSeconds();
	if(iniyear!="") year=iniyear;
	if(inimonth!="") month=inimonth;
	if(iniday!="") day=iniday;
	if(inihour!="") hour=inihour;
	if(iniminute!="") minute=iniminute;
	if(inisec!="") second=inisec;
	//if(formatstr!=null && formatstr!="") targetFormat=formatstr;
	initInputDate(datestr);
	set("",'-');

	}
//输出html
this.outHtml=outHtml;
function outHtml()
	{
	var htmlstr='';
	htmlstr+='<div  class="date" ><div class="datebackground">';
	htmlstr+='<table border="0" cellpadding="0" cellspacing="0" class="date_table"><tr><td>';
	htmlstr+='<div class="adjust" style="width:80px;"><div style="position:relative;left:47;top:2;">';
	htmlstr+='<button style="left:16;top:0;"   onclick="'+name+'._uper(this);'+name+'.changeYearAndMonth(this.parentElement.nextSibling.value);"  onmousedown="'+name+'._conti_uper(this);'+name+'.changeYearAndMonth(this.parentElement.nextSibling.value);" onmouseout="'+name+'._stop_inch();" onmouseup="'+name+'._stop_inch();">5</button>';
	htmlstr+='<button style="left:16;top:9;"  onclick="'+name+'._downer(this);'+name+'.changeYearAndMonth(this.parentElement.nextSibling.value);"  onmousedown="'+name+'._conti_downer(this);" onmouseout="'+name+'._stop_inch();" onmouseup="'+name+'._stop_inch();">6</button>';
	htmlstr+='</div><input type="text"  onblur="'+name+'.doYearBlur(this);" conf="1,1900,2100,"></div></td>';
	htmlstr+='<td><select  size="1" onchange="'+name+'.changeYearAndMonth(null,this.options[this.selectedIndex].value)"> <option value="1" >一月</option> <option value="2" >二月</option> <option value="3" >三月</option> <option value="4" >四月</option> <option value="5" >五月</option> <option value="6" >六月</option> <option value="7" >七月</option> <option value="8" >八月</option> <option value="9" >九月</option> <option value="10" >十月</option> <option value="11" >十一月</option> <option value="12" >十二月</option> </select> </td></tr></table> </div>';
	htmlstr+='<div align=center class="datebackground"></div>';
	htmlstr+='<iframe frameborder=0 style="width:100%;height:100%;top:0;position:absolute;z-index:-1;"></iframe></div>';
	htmlstr+='';
	htmlstr+='';
	return htmlstr;
	}
//返回最后的值
this.saveValue=saveValue;
function saveValue()
	{
	var timestr="";
	if(!hasTime)
		{//timestr=hour+":"+minute;
		hour="";
		minute="";
		}
	var mstr,dstr,hstr,minstr,secstr;
	if(parseInt(month,10)<10)
		mstr="0"+month;
	else
		mstr=month;
	if(parseInt(day,10)<10)
		dstr="0"+day;
	else
		dstr=day;
	if(parseInt(hour,10)<10)
		hstr="0"+hour;
	else
		hstr=hour;
	if(parseInt(minute,10)<10)
		minstr="0"+minute;
	else
		minstr=minute;
	if(parseInt(second,10)<10)
		secstr="0"+second;
	else
		secstr=second;	
		var ndate=new Date(year,month-1,day,hour,minute,second);
		//alert(ndate.format(targetFormat));
	window.returnValue=(ndate.format(targetFormat));

	//window.returnValue= year+middle+mstr+middle+dstr+" "+hstr+":"+minstr+":"+secstr;
	window.close();

	}
//显示/隐藏
this.showDate=showDate;
function showDate()
	{
	if(divAll==null) return;
	var odiv=divAll.children[1];
	if(odiv==null) return;
	if(odiv.style.display=="none")
		{
		odiv.style.display="block";
		var str=inputtext.value;
		if(str!="")
		initInputDate(str);
		set("",'-');
		}
	else
			odiv.style.display="none";
	}


//SET方法
this.setDay=setDay;
function setDay(oday)
	{
	if(oday!=null && oday!="")
	day=oday;
	}
this.setTargetFormat=setTargetFormat;
function setTargetFormat(str)
	{
	if(str!=null && str!="")
		targetFormat=str;
	}
//GETDATE
this.getDate=getDate;
function getDate(splitstr)
	{
		var mstr,dstr,hstr,minstr;
		if(parseInt(month)<10)
		mstr="0"+month;
	else
		mstr=month;
	if(parseInt(day)<10)
		dstr="0"+day;
	else
		dstr=day;
var ndate=new Date(year,month-1,day);
//alert(ndate.format(targetFormat));
return(ndate.format(targetFormat));
	//alert(year+middle+month+middle+day+" "+hour+":"+minute);
///	return year+middle+mstr+middle+dstr;
	}
//初始化输入的日期
this.initInputDate=initInputDate;
function initInputDate(str)
	{
var objtab=divAll.children[0].children[0];
var objyear=objtab.getElementsByTagName("INPUT")[0];
var objmonth=objtab.getElementsByTagName("SELECT")[0];
objyear.value=year;
for(var i=0;i<objmonth.options.length;i++)
		{
		var opt=objmonth.options[i];
		if(month==opt.value)
			opt.selected=true;
		}
	}
//把输入的日期转换成yyyy/MM/dd hh:mm
this.parseIntputDate=parseIntputDate;
function parseIntputDate(str)
	{
var sparr=str.split(" ");
var pararr=targetFormat.split(" ");
var len=sparr.length;
var datestr,timestr;
var pardate,partime;
if(len>1)
{
datestr=sparr[0];
timestr=sparr[1];
pardate=pararr[0];
partime=pararr[1];
}
else
{
datestr=str;
timestr="";
pardate=targetFormat;
partime="";
}
var regstr=/[^yyyyMMdd]/g;
var arr=pardate.match(regstr);
if(arr==null)
{
datestr=datestr.slice(0,4)+"/"+datestr.slice(4,6)+"/"+datestr.slice(6);
}
else
{
	for(var i=0;i<arr.length;i++)
	{
	datestr=datestr.replace(arr[i],"/");
	}
	var ldate=datestr.substr(datestr.length-1,1);
	if(isNaN(ldate))
	{
	datestr=datestr.substr(0,datestr.length-1);
	}
}
if(timestr!="")
{
	var regtime=/[^hhmm]/g;
	var arrt=partime.match(regtime);
	if(arrt==null)
	{
	timestr=timestr.slice(0,2)+":"+timestr.slice(2);
	}
	else
	{
		for(var i=0;i<arrt.length;i++)
		{
		timestr=timestr.replace(arrt[i],":");
		}
		var ltime=timestr.substr(timestr.length-1,1);
		if(isNaN(ltime))
		{
		timestr=timestr.substr(0,timestr.length-1);
		}
	}

}
return (datestr+" "+timestr);

}



}
