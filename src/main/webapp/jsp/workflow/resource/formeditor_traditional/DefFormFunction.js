/******************************************************************************************
*  
*		 descript:			表单定制工具，生成HTML以后所用的js函数
*	
*******************************************************************************************/
var FIELD_NAM="";//主表单name的前缀"Ins_"
var Current_Tr=null;//当前行
//增加行
function addRow(tabid)
{
var tabTi=document.all(tabid);
if(tabTi==null) return;
var ntr=tabTi.insertRow(tabTi.rows.length-1);
for(var i=0;i<tabTi.rows[1].cells.length;i++)
				{
				var otd=ntr.insertCell();
				otd.innerHTML=tabTi.rows[1].cells[i].innerHTML;
				//otd.width=tabTi.rows[1].cells[i].width;
				//otd.index=tabTi.rows[1].cells[i].index;
				//otd.style.display=tabTi.rows[1].cells[i].style.display;
				}
				Current_Tr=ntr;
				rename(tabid);
countsum(tabid);
}
//删除行
function delRow(tabid)
{
var otab=document.all(tabid);
if(otab==null) return;
if(Current_Tr!=null && Current_Tr.tagName=="TR" && otab.contains(Current_Tr))
	Current_Tr.removeNode(true);
rename(tabid);
countsum(tabid);
}
//选中行
function doTabSelect(tabid)
{
var otab=document.all(tabid);
if(otab==null) return;

for(var i=2;i<otab.rows.length-1;i++)
				{
				var otr=otab.rows[i];
				//otr.className="notrSelected";
				otr.style.backgroundColor="#ffffff";
				}
			
var ntr=null;
var obj=window.event.srcElement;
while(obj.tagName!="BODY")
	{
	if(obj.parentElement.parentElement==otab)
		{
		ntr=obj;
		break;
		}
		obj=obj.parentElement;
	}
//if(obj.tagName=="INPUT" || obj.tagName=="SELECT")
	//ntr=obj.parentElement.parentElement;
//if(obj.tagName=="TD")
	//ntr=obj.parentElement;
if(ntr!=null && ntr.rowIndex>1 && ntr!=otab.rows[otab.rows.length-1])
	{
	Current_Tr=ntr;
	//ntr.className="trSelected";
	ntr.style.backgroundColor="#8989bc";
	}
}
//改名
function rename(tabid)
		{
		var tabTi=document.all(tabid);
		if(tabTi==null) return;
			for(var j=2;j<tabTi.rows.length-1;j++)
				{
				for(var i=0;i<tabTi.rows[j].cells.length;i++)
					{
					var otd=null;
					otd=tabTi.rows[j].cells[i];
					var ftd=tabTi.rows[1].cells[i];
					if(otd==null)
						continue;
					var objs=otd.getElementsByTagName("INPUT");
					var fobjs=ftd.getElementsByTagName("INPUT");
					for(var k=0;k<objs.length;k++)
						{
						var obj=objs[k];
						var fobj=fobjs[k];
						var code=fobj.name;
						if(code!=null && code!="")
						obj.name = code+"["+(j-2)+"]";

						}
					var textareas=otd.getElementsByTagName("TEXTAREA");
					var ftextareas=ftd.getElementsByTagName("TEXTAREA");
					for(var kk=0;kk<textareas.length;kk++)
						{
						var obj=textareas[kk];
						var fobj=ftextareas[kk];
						var code=fobj.name;
						if(code!=null && code!="")
						obj.name = code+"["+(j-2)+"]";

						}
					var sels=otd.getElementsByTagName("SELECT");
					var fsels=ftd.getElementsByTagName("SELECT");
					for(var kkk=0;kkk<sels.length;kkk++)
						{
						var obj=sels[kkk];
						var fobj=fsels[kkk];
						var code=fobj.name;
						if(code!=null && code!="")
						obj.name = code+"["+(j-2)+"]";
						}
					var imgs=otd.getElementsByTagName("IMG");
					var fimgs=ftd.getElementsByTagName("IMG");
					for(var kkkk=0;kkkk<imgs.length;kkkk++)
						{
						var obj=imgs[kkkk];
						var fobj=fimgs[kkkk];
						var code=fobj.name;
						if(code!=null && code!="")
						obj.name = code+"["+(j-2)+"]";
						}
					var ispans=otd.getElementsByTagName("SPAN");
					var fspans=ftd.getElementsByTagName("SPAN");
					for(var kkkkk=0;kkkkk<ispans.length;kkkkk++)
						{
						var obj=ispans[kkkkk];
						var fobj=fspans[kkkkk];
						var code=fobj.name;
						if(code!=null && code!="")
						obj.name = code+"["+(j-2)+"]";
						}
					var idivs=otd.getElementsByTagName("DIV");
					var fdivs=ftd.getElementsByTagName("DIV");
					for(var kkkkkk=0;kkkkkk<idivs.length;kkkkkk++)
						{
						var obj=idivs[kkkkkk];
						var fobj=fdivs[kkkkkk];
						var code=fobj.name;
						if(code!=null && code!="")
						obj.name = code+"["+(j-2)+"]";
						}
					}
			
				}
		var rowcount=document.all(tabid+"_count");
		if(rowcount!=null)
			rowcount.value=tabTi.rows.length-3;
		}
//合计
function countsum(tabid)
		{
		var tabTi=document.all(tabid);
		if(tabTi==null) return;
		var sumtr=tabTi.rows[tabTi.rows.length-1];
		for(var i=0;i<tabTi.rows[0].cells.length;i++)
			{
			var sum=0;
			var arrcols=new Array();
			var CountVal=0;
			for(var j=2;j<tabTi.rows.length-1;j++)
				{
				tabTi.rows[j].style.display="block";
					var otd=tabTi.rows[j].cells[i].children[0];
					if(otd==null)
						continue;
					//var fun=new Function("countsum1('"+tabid+"');countsum('"+tabid+"');");
					//if(otd.onchange==null)
					//otd.onchange=fun;
						if(otd.getAttribute("sumField")!=null)
							sumrow(tabTi.rows[j],otd);
					//列合计
					var lasttd=tabTi.rows[tabTi.rows.length-1].cells[i];
					if(lasttd.children[0]!=null && lasttd.children[0].getAttribute("sumField")!=null)
					{
					var sumField=lasttd.children[0].getAttribute("sumField");
					
					var otr=tabTi.rows[j];
						var oval=countrow(otr,sumField);
						sum+=oval;
						arrcols[arrcols.length]=oval;
					CountVal=sum;
					var FUNC=lasttd.children[0].getAttribute("FUNC");
					if(FUNC!=null)
						{
						switch(FUNC)
							{
							case "AVE":
							CountVal=sum/arrcols.length;
							break;
							case "MAX":
							CountVal=eval("Math.max("+arrcols.toString()+")");
							break;
							case "MIN":
							CountVal=eval("Math.min("+arrcols.toString()+")");
							break;
							case "MOD":
							var FUNARG=lasttd.children[0].getAttribute("FUNARG");
							if(FUNARG!=null)
							CountVal=sum%FUNARG;
							break;

							}
						}
					lasttd.children[0].value=CountVal;
					if(lasttd.children[0].getAttribute("parentField")!=null)
						{
						var restr=/%/g;
						var str=lasttd.children[0].getAttribute("parentField");
						str=str.replace(restr,'');
						var pobj=getObjBystrInname(FIELD_NAM+str);
						if(pobj!=null && pobj.tagName=="INPUT")
							{
							pobj.value=CountVal;
							pobj.fireEvent("onchange");
							}
						}
					}
				}					
			}
			// sumcol(tabTi);
		}
//合计列
function sumcol(tabTi)
{
if(tabTi==null)
	return;
	for(var i=0;i<tabTi.rows[tabTi.rows.length-1].cells.length;i++)
	{
	var otd=tabTi.rows[tabTi.rows.length-1].cells[i];
	if(otd.children[0]!=null && otd.children[0].getAttribute("sumField")!=null)
		{
		var sumField=otd.children[0].getAttribute("sumField");
		var CountVal=0;
		var sum=0;
		var arrcols=new Array();
		for(var j=2;j<tabTi.rows.length-1;j++)
			{
			var otr=tabTi.rows[j];
			var oval=countrow(otr,sumField);
			sum+=oval;
			arrcols[arrcols.length]=oval;
			}
		CountVal=sum;
		var FUNC=otd.children[0].getAttribute("FUNC");
		if(FUNC!=null)
			{
			switch(FUNC)
				{
				case "AVE":
				CountVal=sum/arrcols.length;
				break;
				case "MAX":
				CountVal=eval("Math.max("+arrcols.toString()+")");
				break;
				case "MIN":
				CountVal=eval("Math.min("+arrcols.toString()+")");
				break;
				case "MOD":
				var FUNARG=otd.children[0].getAttribute("FUNARG");
				if(FUNARG!=null)
				CountVal=sum%FUNARG;
				break;

				}
			}
		otd.children[0].value=CountVal;
		if(otd.children[0].getAttribute("parentField")!=null)
			{
			var restr=/%/g;
			var str=otd.children[0].getAttribute("parentField");
			str=str.replace(restr,'');
			var pobj=getObjBystrInname(FIELD_NAM+str);
			if(pobj!=null && pobj.tagName=="INPUT")
				{	
				pobj.value=CountVal;
				pobj.fireEvent("onchange");
				}
			}
		}
	}
}
//合计行
function sumrow(otr,odiv)
{
if(otr==null || odiv==null)
	return;
var sumfield=odiv.getAttribute("sumField");
var val=countrow(otr,sumfield,odiv.getAttribute("FUNC"),odiv.getAttribute("FUNARG"));
	odiv.value=val;
	//alert(countrow(otr,sumfield,odiv.getAttribute("FUNC"),odiv.getAttribute("FUNARG")));

	if(odiv.getAttribute("parentField")!=null)
			{
			var restr=/%/g;
			var str=odiv.getAttribute("parentField");
			str=str.replace(restr,'');
			var pobj=getObjBystrInname(FIELD_NAM+str);
			if(pobj!=null && pobj.tagName=="INPUT")
				{	
				pobj.value=val;
				pobj.fireEvent("onchange");
				}
			}
}
//根据str得到input,input名称包含str
function getObjBystrInname(str)
{
var arrinput=document.body.getElementsByTagName("INPUT");
for(var i=0;i<arrinput.length;i++)
	{
	var oinput=arrinput[i];
	if(oinput.name.toUpperCase().indexOf(str.toUpperCase())>=0)
		return oinput;
	}
var arrtext=document.body.getElementsByTagName("TEXTAREA");
for(var ii=0;ii<arrtext.length;ii++)
	{
	var otext=arrtext[ii];
	if(otext.name!=null && otext.name!="" && otext.name.toUpperCase().indexOf(str.toUpperCase())>=0)
		return otext;
	}
return null;
}
//根据行和公式计算
function countrow(otr,sumfield,FUNC,FUNARG)
{
	if(otr==null || sumfield==null)
	return;
	var index1=-1;
	var index2=-1;
var arrrows=new Array();
for(var i=0;i<sumfield.length;i++)
	{
	var ochar=sumfield.charAt(i);
	var of='';
	if(ochar=="{")
		index1=i+1;
	if(ochar=="}")
		index2=i;
	//alert(index1+","+index2);
	if(index1>-1 && index2>-1)
		{
		of=sumfield.substring(index1,index2);
		//alert(of);
		index1=-1;
		index2=-1;
		var refval=getValueByName(otr,of);
		if(refval==null || refval=="")
			refval=0;
		arrrows[arrrows.length]=refval;
		sumfield=sumfield.replace("{"+of+"}",refval);
		i=-1;
		}
		
	}
	if(FUNC!=null && FUNC!="")
	{
	var ocountval=0;
		var osum=0;
				for(var ss=0;ss<arrrows.length;ss++)
					{
					osum+=arrrows[ss];
					}
	switch(FUNC)
				{
				case "SUM":
					ocountval=osum;
					break;
				case "AVE":
				ocountval=osum/arrrows.length;
				break;
				case "MAX":
				ocountval=eval("Math.max("+arrrows.toString()+")");
				break;
				case "MIN":
				ocountval=eval("Math.min("+arrrows.toString()+")");
				break;
				case "MOD":
				if(FUNARG!=null)
				ocountval=eval(sumfield)%FUNARG;
				break;

				}
			return ocountval;
	}
	return eval(sumfield);
}
//遍历一行得到value
function getValueByName(otr,namestr)
{
if(otr==null || namestr==null)
	return;
//var fun=new Function("countsum1('"+otr.parentElement.parentElement.id+"');countsum('"+otr.parentElement.parentElement.id+"');");
var fun=new Function("countsum('"+otr.parentElement.parentElement.id+"');");

for(var i=0;i<otr.cells.length;i++)
	{
	var otd=otr.cells[i];
	var arrinput=otd.getElementsByTagName("INPUT");
	for(var j=0;j<arrinput.length;j++)
		{
		var content=arrinput[j];
		//alert(content.name+","+namestr);
		if(content!=null && content.name!=null &&content.name.toUpperCase().indexOf(namestr.toUpperCase())>-1)
			{
			//content.attachEvent("onchange",fun);
			if(content.onchange==null)
				content.onchange=fun;
			if(!isNaN(content.value))
			return content.value;
			else
			return 0;
			}
		}
	var arrtext=otd.getElementsByTagName("TEXTAREA");
	for(var jj=0;jj<arrtext.length;jj++)
		{
		var content=arrtext[jj];
		//alert(content.name+","+namestr);
		if(content!=null && content.name!=null &&content.name.toUpperCase().indexOf(namestr.toUpperCase())>-1)
			{
			content.attachEvent("onchange",fun);
			if(!isNaN(content.value))
			return content.value;
			else
			return 0;
			}
		}
	}
	return 0;
}
//跟合计相同
function countsum1(tabid)
		{
		var tabTi=document.all(tabid);
		if(tabTi==null) return;
		var sumtr=tabTi.rows[tabTi.rows.length-1];
		for(var i=0;i<tabTi.rows[0].cells.length;i++)
			{
			var sum=0;
			for(var j=2;j<tabTi.rows.length-1;j++)
				{
				tabTi.rows[j].style.display="block";
					 if(sumtr.cells[i].sumtype=="Float" || sumtr.cells[i].sumtype=="Long")
						{
					
					var otd=tabTi.rows[j].cells[i].children[0];
					if(otd==null)
						continue;
					var code=otd.value;
					if(code=="") code=0;
					if(!isNaN(code))
					sum+=parseFloat(code);
						}
				}
				if(sumtr.cells[i].sumtype=="Float" || sumtr.cells[i].sumtype=="Long")
				sumtr.cells[i].innerText=sum;
			}
		}

//选项卡操作
function doTabpageClick()
{
var tabtab=document.all("tabpage");
var titletd=document.all("titledesign");
var subtitletd=document.all("subtitledesign");

for(var i=0;i<tabtab.rows[0].cells.length;i++)
{
var ootd=tabtab.rows[0].cells[i];
ootd.className="taboffcss";
var olddiv=document.all("page"+(ootd.index));
if(olddiv!=null)
olddiv.style.display="none";
}
var otd=event.srcElement;
var cellindex=otd.cellIndex;
otd.className="taboncss";
if(otd.tabtitle!=null)
	titletd.innerHTML=otd.tabtitle;
else
	titletd.innerHTML="";
if(otd.subtabtitle!=null)
	subtitletd.innerHTML=otd.subtabtitle;
else
	subtitletd.innerHTML="";

var odiv=document.all("page"+(otd.index));
if(odiv!=null)
odiv.style.display="block";
//CurrentTabDiv=odiv;
}
//初始化主表单计算公式
function initMainForm()
{
var divall=document.all("pages");
if(divall==null) return;
var arrtab=divall.getElementsByTagName("TABLE");
for(var i=0;i<arrtab.length;i++)
	{
	var otab=arrtab[i];
	if(otab.type=="sub")
		continue;
	for(var j=0;j<otab.rows.length;j++)
		{
		for(var k=0;k<otab.rows[j].cells.length;k++)
			{
			var otd=otab.rows[j].cells[k];
			var content=otd.children[0];
			if(content!=null && (content.tagName=="INPUT" || content.tagName=="SELECT" || content.tagName=="TEXTAREA"))
				{
				if(content.sumField!=null && content.sumField!="")
					countMainForm(content);
				}
			}
		}
	}
}
//计算主表单域
function countMainForm(content)
{
if(content==null) return;
var sumfield=content.sumField;
if(sumfield==null) return;
var inputArr=new Array();
var inputNameArr=new Array();
var biaodaAvgstr='';
	var index1=-1;
	var index2=-1;

for(var i=0;i<sumfield.length;i++)
	{
	var ochar=sumfield.charAt(i);
	var of='';
	if(ochar=="{")
		index1=i+1;
	if(ochar=="}")
		index2=i;
	//alert(index1+","+index2);
	if(index1>-1 && index2>-1)
		{
		of=sumfield.substring(index1,index2);
		//alert(of);
		index1=-1;
		index2=-1;
		var refval='ParseStr(document.all("'+of+'").value)';
		inputArr[inputArr.length]=eval('document.all("'+of+'")');
		inputNameArr[inputNameArr.length]=refval;
		biaodaAvgstr+='ParseStr(document.all("'+of+'").value)'+'+';
		//if(refval==null || refval=="")
			//refval=0;
		//arrrows[arrrows.length]=refval;
		sumfield=sumfield.replace("{"+of+"}",refval);
		i=-1;
		}
		
	}
	biaodaAvgstr=biaodaAvgstr.substring(0,biaodaAvgstr.length-1);
	var FUNC=content.FUNC;
	var FUNARG=content.FUNARG;
	var functionstr=sumfield;
	if(FUNC!=null && FUNC!="")
	{
		switch(FUNC)
				{
				case "SUM":
					functionstr=biaodaAvgstr;
					break;
				case "AVE":
				functionstr='('+biaodaAvgstr+')/'+inputArr.length;
				break;
				case "MAX":
				functionstr="Math.max("+inputNameArr.toString()+")";
				break;
				case "MIN":
				functionstr="Math.min("+inputNameArr.toString()+")";
				break;
				case "MOD":
				if(FUNARG!=null)
				functionstr='('+biaodaAvgstr+')%'+FUNARG;
				break;
				case "CUR":
				functionstr='ChangeToBig('+sumfield+')';
				break;
				case "DATE":
				functionstr='changeDateChinese('+sumfield+')';
				break;
				case "CURNUM":
				functionstr='"￥"+FormatNumber('+sumfield+',2)';
				break;
				case "NUM":
				if(FUNARG==null)
				FUNARG=2;
				functionstr='FormatNumber('+sumfield+','+FUNARG+')';
				break;
				case "PERCENT":
				if(FUNARG==null)
				FUNARG=2;
				functionstr='FormatPercent('+sumfield+','+FUNARG+')';
				break;
				case "CHARUP":
				functionstr='('+sumfield+').toUpperCase()';
				break;
				case "CHARLOW":
				functionstr='('+sumfield+').toLowerCase()';
				break;
				}
	}
	if(functionstr=="") return;
	for(var jj=0;jj<inputArr.length;jj++)
	{
	var fun=new Function('document.all("'+content.name+'").value='+functionstr+';');
	inputArr[jj].attachEvent("onchange",fun);
	}
	inputArr=null;
}



//数字转货币大写（js）
function ChangeToBig(value)
{
var intFen,i;
var strArr,strCheck,strFen,strDW,strNum,strBig,strNow;

//if(trim(value)=="")   //数据为空时返回"零"
//return "零";
if (isNaN(value))   //数据非法时提示，并返回空串
{
strErr = "数据"+value+"非法！"
alert(strErr);
return "";
}
strCheck = value+".";
strArr = strCheck.split(".");
strCheck = strArr[0];
if(strCheck.length>12)   //数据大于等于一万亿时提示无法处理
{
strErr = "数据"+value+"过大，无法处理！"
alert(strErr);
return "";
}
try
{
i = 0;
strBig = "";
intFen = value*100;          //转换为以分为单位的数值
strFen = intFen.toString();
strArr = strFen.split(".");
strFen = strArr[0];
intFen = strFen.length;      //获取长度
strArr = strFen.split("");//将各个数值分解到数组内
while(intFen!=0)   //分解并转换
{
i = i+1;
switch(i)              //选择单位
{
case 1:strDW = "分";break;
case 2:strDW = "角";break;
case 3:strDW = "元";break;
case 4:strDW = "拾";break;
case 5:strDW = "佰";break;
case 6:strDW = "仟";break;
case 7:strDW = "万";break;
case 8:strDW = "拾";break;
case 9:strDW = "佰";break;
case 10:strDW = "仟";break;
case 11:strDW = "亿";break;
case 12:strDW = "拾";break;
case 13:strDW = "佰";break;
case 14:strDW = "仟";break;
}
switch (strArr[intFen-1])              //选择数字
{
case "1":strNum = "壹";break;
case "2":strNum = "贰";break;
case "3":strNum = "叁";break;
case "4":strNum = "肆";break;
case "5":strNum = "伍";break;
case "6":strNum = "陆";break;
case "7":strNum = "柒";break;
case "8":strNum = "捌";break;
case "9":strNum = "玖";break;
case "0":strNum = "零";break;
}

//处理特殊情况
strNow = strBig.split("");
//分为零时的情况
if((i==1)&&(strArr[intFen-1]=="0"))
strBig = "整";
//角为零时的情况
else if((i==2)&&(strArr[intFen-1]=="0"))
{    //角分同时为零时的情况
if(strBig!="整")
strBig = "零"+strBig;
}
//元为零的情况
else if((i==3)&&(strArr[intFen-1]=="0"))
strBig = "元"+strBig;
//拾－仟中一位为零且其前一位（元以上）不为零的情况时补零
else if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]!="零")&&(strNow[0]!="元"))
strBig = "零"+strBig;
//拾－仟中一位为零且其前一位（元以上）也为零的情况时跨过
else if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]=="零"))
{} 
//拾－仟中一位为零且其前一位是元且为零的情况时跨过
else if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]=="元"))
{}
//当万为零时必须补上万字
else if((i==7)&&(strArr[intFen-1]=="0"))
strBig ="万"+strBig;
//拾万－仟万中一位为零且其前一位（万以上）不为零的情况时补零
else if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]!="零")&&(strNow[0]!="万"))
strBig = "零"+strBig;
//拾万－仟万中一位为零且其前一位（万以上）也为零的情况时跨过
else if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]=="万"))
{}
//拾万－仟万中一位为零且其前一位为万位且为零的情况时跨过
else if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]=="零"))
{}
//万位为零且存在仟位和十万以上时，在万仟间补零
else if((i<11)&&(i>8)&&(strArr[intFen-1]!="0")&&(strNow[0]=="万")&&(strNow[2]=="仟"))
strBig = strNum+strDW+"万零"+strBig.substring(1,strBig.length);
//单独处理亿位
else if(i==11)
{
//亿位为零且万全为零存在仟位时，去掉万补为零
if((strArr[intFen-1]=="0")&&(strNow[0]=="万")&&(strNow[2]=="仟"))
strBig ="亿"+"零"+strBig.substring(1,strBig.length);
//亿位为零且万全为零不存在仟位时，去掉万
else if((strArr[intFen-1]=="0")&&(strNow[0]=="万")&&(strNow[2]!="仟"))
strBig ="亿"+strBig.substring(1,strBig.length);
//亿位不为零且万全为零存在仟位时，去掉万补为零
else if((strNow[0]=="万")&&(strNow[2]=="仟"))
strBig = strNum+strDW+"零"+strBig.substring(1,strBig.length);
//亿位不为零且万全为零不存在仟位时，去掉万
else if((strNow[0]=="万")&&(strNow[2]!="仟"))
strBig = strNum+strDW+strBig.substring(1,strBig.length);
//其他正常情况
else
strBig = strNum+strDW+strBig;
}
//拾亿－仟亿中一位为零且其前一位（亿以上）不为零的情况时补零
else if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]!="零")&&(strNow[0]!="亿"))
strBig = "零"+strBig;
//拾亿－仟亿中一位为零且其前一位（亿以上）也为零的情况时跨过
else if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]=="亿"))
{}
//拾亿－仟亿中一位为零且其前一位为亿位且为零的情况时跨过
else if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]=="零"))
{}
//亿位为零且不存在仟万位和十亿以上时去掉上次写入的零
else if((i<15)&&(i>11)&&(strArr[intFen-1]!="0")&&(strNow[0]=="零")&&(strNow[1]=="亿")&&(strNow[3]!="仟"))
strBig = strNum+strDW+strBig.substring(1,strBig.length);
//亿位为零且存在仟万位和十亿以上时，在亿仟万间补零
else if((i<15)&&(i>11)&&(strArr[intFen-1]!="0")&&(strNow[0]=="零")&&(strNow[1]=="亿")&&(strNow[3]=="仟"))
strBig = strNum+strDW+"亿零"+strBig.substring(2,strBig.length);
else
strBig = strNum+strDW+strBig;
strFen = strFen.substring(0,intFen-1);
intFen = strFen.length;
strArr = strFen.split("");
}
return strBig;
}catch(err){
return "";      //若失败则返回原值
}
}
//百分比
function FormatPercent(num,decimalNum)
{
if(isNaN(parseFloat(num)))
	return num;
var nump= FormatNumber(num*100,decimalNum);
return nump+"%";
}
//#######################################################################################
//                                                                 数字格式化函数 
//  用法：本函数用来格式化数字。 
//  参数：num（数值型）：要进行格式化的数值型变量； 
// decimalNum（整型） ：要保留的小数位数； 
// bolLeadingZero （布尔型：true或 false）：对-1<num<1之间的数是否要添加前导数字0； 
// bolParens （布尔型：true或 false）：在负号后是否使用小括号； 
// bolCommas （布尔型：true或 false）：是否用“,”隔开数字位。 
//  返回值：经过格式化的数字字符串。 
//#######################################################################################

function FormatNumber(num,decimalNum,bolLeadingZero,bolParens,bolCommas) 
{ 
  if (isNaN(parseInt(num))) return "NaN"; 

  var tmpNum = num; 
  var iSign = num < 0 ? -1 : 1; // 得到数字符号 

  // 调整小数点位数到给定的数字。 
  tmpNum *= Math.pow(10,decimalNum); 
  tmpNum = Math.round(Math.abs(tmpNum)) 
  tmpNum /= Math.pow(10,decimalNum); 
  tmpNum *= iSign; // 重新调整符号 

  // 把数值型转换成字符对象 
  var tmpNumStr = new String(tmpNum); 

  // 处理是否有前导0 
  if (!bolLeadingZero && num < 1 && num > -1 && num != 0) 
  if (num > 0) 
    tmpNumStr = tmpNumStr.substring(1,tmpNumStr.length); 
  else 
    tmpNumStr = "-" + tmpNumStr.substring(2,tmpNumStr.length); 

  //处理是否有逗号 
  if (bolCommas && (num >= 1000 || num <= -1000)) { 
    var iStart = tmpNumStr.indexOf("."); 
    if (iStart < 0) 
      iStart = tmpNumStr.length; 

    iStart -= 3; 
    while (iStart >= 1) { 
      tmpNumStr = tmpNumStr.substring(0,iStart) + "," + tmpNumStr.substring(iStart,tmpNumStr.length) 
      iStart -= 3; 
    } 
  } 

  // 处理是否有括号 
  if (bolParens && num < 0) 
    tmpNumStr = "(" + tmpNumStr.substring(1,tmpNumStr.length) + ")"; 

  return tmpNumStr; // 返回格式化后字符串 
} 
//是数字就返回数字格式,否则返回字符串格式
function ParseStr(str)
{
if(str==null || str=="")
	return 0;
if(!isNaN(str))
	return parseFloat(str,10);
else
	return str;
}

  /*
  功能:YYYY-MM-DD 数字日期转化为汉字
  例:1984-3-7 -> 一九八四年三月七日
  调用:baodate2chinese("1984-3-7")

case "1":strNum = "壹";break;
case "2":strNum = "贰";break;
case "3":strNum = "叁";break;
case "4":strNum = "肆";break;
case "5":strNum = "伍";break;
case "6":strNum = "陆";break;
case "7":strNum = "柒";break;
case "8":strNum = "捌";break;
case "9":strNum = "玖";break;

*/
  function num2chineseInDefForm(s)
  {
  var chinese = ['零','壹','贰','叁','肆','伍','陆','柒','捌','玖'];
   //将单个数字转成中文.
    s=""+s;
    slen = s.length;
    var result="";
    for(var i=0;i<slen;i++)
    {
        result+=chinese[s.charAt(i)];
    }
     return result;
  }

  function n2cInDefForm(s)
  {   
	    var chinese = ['零','壹','贰','叁','肆','伍','陆','柒','捌','玖'];
	  var len = ['拾'];
    //对特殊情况进行处理.
    s=""+s;
    var result="";
    if(s.length==2)
    {
         if(s.charAt(0)=="1")
         {
            if(s.charAt(1)=="0")return len[0];
            return len[0]+chinese[s.charAt(1)];
          }
     if(s.charAt(1)=="0")return chinese[s.charAt(0)]+len[0];
        return chinese[s.charAt(0)]+len[0]+chinese[s.charAt(1)];
     }
     return num2chineseInDefForm(s)
  }
  function changeDateChinese(s)
  {
	    var ydm =['年','月','日'];
     //验证输入的日期格式.并提取相关数字.
     var datePat = /^(\d{2}|\d{4})(\/|-)(\d{1,2})(\2)(\d{1,2})$/; 
     var matchArray = s.match(datePat); 
     var ok="";
     if (matchArray == null) return '';
     for(var i=1;i<matchArray.length;i=i+2)
     {
         ok+=n2cInDefForm(matchArray[i]-0)+ydm[(i-1)/2];
     }
   return ok;
  }
