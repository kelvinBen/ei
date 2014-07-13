//全局变量，分隔符
var MatrixCol = "σ";
var MatrixRow = "τ";
function parseMatrix(win){
	if(win==null)return;
	//返回值为空字符串的情况
	if (win.length==0){
		var ret = new Array();
		ret[0]="";
		ret[1]="";
		ret[2]="";
		return ret;
	}
	//返回值为数组的情况
	var ids="";
	var names="";
	var idnames="";
	for(var i=0;i<win.length;i++){
		var id=win[i][0];
		var name = win[i][1];
		if (ids=="")
			ids = id;
		else
			ids=ids+MatrixCol+id;
		if (names=="")
			names = name;
		else
			names=names+MatrixCol+name;
		if (idnames=="")
			idnames = id+MatrixCol+name;
		else
			idnames=idnames+MatrixRow+id+MatrixCol+name;
	}
	var ret = new Array();
	ret[0]=ids;
	ret[1]=names;
	ret[2]=idnames;
	return ret;
}

function parseTree(win){
	if(win==null)return;
	//返回值为空字符串的情况
	if (win.length==0){
		var result = new Array();
		result[0]="";
		result[1]="";
		result[2]="";
		return result;
	}
	//返回值为数组的情况
	var result = new Array();
  	result[0] = win[0];
  	result[1] = win[1];
  	var ids=win[0].split(MatrixCol);
  	var names=win[1].split(MatrixCol);
  	var idnames="";
  	for(var i=0;i<ids.length;i++){
  		if (idnames=="")
  			idnames=ids[i]+MatrixCol+names[i];
  		else
  		        idnames =idnames+MatrixRow+ ids[i]+MatrixCol+names[i];
  			}
  	result[2] = idnames;
	return result;
}

function parsePostTree(win){
	 if(win==null)return;
	 //返回值为空字符串的情况
	 if(win.length==0){
		 var result=new Array();
		 result[0]="";
		 result[1]="";
		 result[2]="";
		 return result;
	 }
//返回值为数组的情况
 var result = new Array();
  	result[0] = win[2];
  	result[1] = win[1];
  	var ids=win[2].split(MatrixCol);
  	var names=win[1].split(MatrixCol);
  	var idnames="";
  	for(var i=0;i<ids.length;i++){
  		if (idnames=="")
  			idnames=ids[i]+MatrixCol+names[i];
  		else
  		        idnames =idnames+MatrixRow+ ids[i]+MatrixCol+names[i];

  	}
  	result[2] = idnames;
	return result;
}
function transMatrix(ids,names){
	var idArray=ids.split(MatrixCol);
	var nameArray=names.split(MatrixCol);
	if (idArray.length!=nameArray.length){
		return;
	}
	var ret="";
	for(var i=0;i<idArray.length;i++){
		if (ret=="")
			ret=idArray[i]+MatrixCol+nameArray[i];
		else
			ret=ret+MatrixRow+idArray[i]+MatrixCol+nameArray[i];
	}
	return ret;
}

function getHref(url,idnames){
	if (url==null){
		return "";
	}
	if ((idnames==null)||(idnames=="")){
		return "";
	}
	var idnamearr=idnames.split(MatrixRow);
	var ret = "";
	for (var i=0;i<idnamearr.length;i++){
		var idname = idnamearr[i].split(MatrixCol);
		if (ret=="")
			ret="<a href=\""+url+idname[0]+"&matrix=true"+"\" target=\"main\">"+idname[1]+"</a>";
		else
			ret=ret+" "+"<a href=\""+url+idname[0]+"&matrix=true"+"\" target=\"main\">"+idname[1]+"</a>";
	}
	return "<span>"+ret+"</span>";
}

function getHrefNoBlank(url,idnames){
	if (url==null){
		return "";
	}
	if ((idnames==null)||(idnames=="")){
		return "";
	}
	var idnamearr=idnames.split(MatrixRow);
	var ret = "";
	for (var i=0;i<idnamearr.length;i++){
		var idname = idnamearr[i].split(MatrixCol);
		if (ret=="")
			ret="<a href=\""+url+idname[0]+"&matrix=true"+"\">"+idname[1]+"</a>";
		else
			ret=ret+" "+"<a href=\""+url+idname[0]+"&matrix=true"+"\">"+idname[1]+"</a>";
	}
	return ret;
}

function getDcWorkToday(){
  var date=new Date();
  var year=""+date.getFullYear();
  var month=date.getMonth()+1;
  if(month<10){month="0"+month;};
  var day=date.getDate();
  if(day<10){day="0"+day;};
  return year+"-"+month+"-"+day;
};

function getDcWorkCurrentTime(){
  var date=new Date();
  var year=""+date.getFullYear();
  var month=date.getMonth()+1;
  if(month<10){month="0"+month;};
  var day=date.getDate();
  if(day<10){day="0"+day;};
  var hour= date.getHours();
  if(hour<10){hour="0"+hour;};
  var min= date.getMinutes();
  if(min<10){min="0"+min;};
  return year+"-"+month+"-"+day+" "+hour+":"+min;
};

function getDcWorkAppointTime(){
  var date=new Date();
  var milliseconds=date.getMilliseconds();
  date.setMilliseconds(milliseconds+30*60*1000);
  var year=""+date.getFullYear();
  var month=date.getMonth()+1;
  if(month<10){month="0"+month;};
  var day=date.getDate();
  if(day<10){day="0"+day;};
  var hour= date.getHours();
  if(hour<10){hour="0"+hour;};
  var min= date.getMinutes();
  if(min<10){min="0"+min;};
  return year+"-"+month+"-"+day+" "+hour+":"+min;
};

function getDcWorkTaskTime(){
  var date=new Date();
  var milliseconds=date.getMilliseconds();
  date.setMilliseconds(milliseconds+60*60*1000);
  var year=""+date.getFullYear();
  var month=date.getMonth()+1;
  if(month<10){month="0"+month;};
  var day=date.getDate();
  if(day<10){day="0"+day;};
  var hour= date.getHours();
  if(hour<10){hour="0"+hour;};
  var min= date.getMinutes();
  if(min<10){min="0"+min;};
  return year+"-"+month+"-"+day+" "+hour+":"+min;
};

//取消输入框后面跟随的红色*
function checkinputNullInDcWork(elementname,spanid){
	tmpvalue = document.all(elementname).value;

	while(tmpvalue.indexOf(" ") == 0)
		tmpvalue = tmpvalue.substring(1,tmpvalue.length);
	if(tmpvalue!=""){
		 document.all(spanid).innerHTML='';
	}
	else{
	 document.all(spanid).innerHTML="*";
	 document.all(elementname).value = "";
	}
}
//改变标题栏文字
//改变标题栏文字
function setTitleInTreeBar(str)
{
if(top.fraConTop!=null && typeof(top.fraConTop.changeTitleInTreeBar)=="function")
	top.fraConTop.changeTitleInTreeBar(str);
}
//得到main窗口
function getMainFrame()
{
return top.content.main;
}
//得到tree窗口
function getTreeFrame()
{
return top.content.tree;
}
//得到menu窗口
function getMenuFrame()
{
return top.list;
}
//是否有特殊符号(除了.)
function __isQuoteInMail(s)
{
	var re = /\"|\'|\“|\”|\‘|\’|\%|\$|\&|\￥|\……|\·|\—|\-|\——|\!|\！|\#|\@|\~|\^|\*|\,|\，|\。|\?|\？|\;|\；|\:|\：|\{|\}|\\|\/|\[|\]|\(|\)|\+|\-|\、|\||\<|\>/;
	return re.test(s);
}
//目录检查的特殊字符没有包含`=_三个，另外感觉对全角和中文符号不应该包含在内
//是否有特殊符号
function __isQuoteInCheck(s)
{
	var re = /\"|\'|\“|\”|\‘|\’|\%|\$|\&|\￥|\……|\·|\—|\-|\——|\!|\！|\#|\@|\~|\^|\*|\,|\.|\，|\。|\?|\？|\;|\；|\:|\：|\{|\}|\\|\/|\[|\]|\(|\)|\+|\-|\、|\||\<|\>/;
	return re.test(s);
}
//使GRID自适应分辨率,参数为grid的name
function setGridHeight(str,oldhei)
{
if(oldhei==null || oldhei=="")
	oldhei=0.5;
var obj=eval(str);
if(typeof(obj)=="undefined")
	return;
var hei=screen.height;
//if(hei==768)
	//return;
var newhei=oldhei*hei;
if(isNaN(newhei))
	return;
document.all(str).style.height=parseInt(newhei);
//obj.show();
}
//后退
function addHistory(str,url)
{
var win=top.topwin;
if(win.oHistoryPopup==null)
	return;
delHistory(url);//删除相同的
var oPopupBody = win.oHistoryPopup.document.body;
var otab=(oPopupBody.children[0].children[0]);
var otr=otab.insertRow();
var otd=otr.insertCell();
otd.innerText=str;
otd.href=url;
otd.style.fontSize="9pt";
otd.style.backgroundColor="#DFEDFD";
otd.align="center";
otd.style.cursor="hand";
win.oHistoryPopup.show(20, 100, 200, 200, win.document.body);
}
//后退
function delHistory(url)
{
var win=top.topwin;
if(win.oHistoryPopup==null)
	return;
var oPopupBody = win.oHistoryPopup.document.body;
var otab=(oPopupBody.children[0].children[0]);
if(otab==null)
	return;
for(var i=0;i<otab.rows.length;i++)
	{
	var otd=otab.rows[i].cells[0];
	if(otd.href==url)
		{
		otab.rows[i].removeNode(true);
		return;
		}
	}
//win.oHistoryPopup.show(20, 100, 200, 200, win.document.body);
}
//
function displayLoading(id){
  var loading=document.all(id);
  var loadtop=document.body.clientHeight/2-25;
  var loadleft=document.body.clientWidth/2-100;
  loading.style.left=loadleft;
  loading.style.top=loadtop;
  loading.style.display="block";
}