/******************************************************************************************
*  
*		company:			
*		 author:			������
*		 descript:			�����ƹ��ߣ�����HTML�Ժ����õ�js����
*	
*******************************************************************************************/
var FIELD_NAM="";//����name��ǰ׺"Ins_"
var Current_Tr=null;//��ǰ��
var Date_Split_Flag="-";//������֮��ķָ���,Ĭ��Ϊ"-"
//������
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
//ɾ����
function delRow(tabid)
{
var otab=document.all(tabid);
if(otab==null) return;
if(Current_Tr!=null && Current_Tr.tagName=="TR" && otab.contains(Current_Tr))
	Current_Tr.removeNode(true);
rename(tabid);
countsum(tabid);
}
//ѡ����
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
	//ntr.style.backgroundColor="#8989bc";
	}
}
//����
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
//�ϼ�
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
					//�кϼ�
					var lasttd=tabTi.rows[tabTi.rows.length-1].cells[i];
					if(lasttd.children[0]!=null && lasttd.children[0].getAttribute("sumField")!=null)
					{
					var sumField=lasttd.children[0].getAttribute("sumField");
					
					var otr=tabTi.rows[j];
						var oval=countrow(otr,sumField);
						sum+=parseFloat(oval);
						arrcols[arrcols.length]=oval;
					CountVal=sum;
					//add by xuzhl  ����js��Ͳ���ȷ�����⣬����2.02+3.04�������������
					var floatlength = getMaxLengthScale(sum,parseFloat(oval));
					if(floatlength>10){
							CountVal = CountVal.toFixed(2);
						}
                    if(floatlength<10){
                        	CountVal = setScale(CountVal,floatlength);
                       }
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
							case "PERCENT":
							if(FUNARG==null)
							FUNARG=2;
							functionstr='FormatPercent('+sumfield+','+FUNARG+')';
							break;
							case "DATECOUNT":
							if(FUNARG==null)
							FUNARG=2;
							functionstr='FormatDateCount('+sumfield+','+FUNARG+')';
							break;
							}
						}
					if(CountVal===0) CountVal="";
					lasttd.children[0].value=CountVal;
					if(lasttd.children[0].getAttribute("parentField")!=null)
						{
						var restr=/%/g;
						var str=lasttd.children[0].getAttribute("parentField");
						str=str.replace(restr,'');
						var pobj=getObjBystrInname(FIELD_NAM+str);
						if(pobj!=null && pobj.tagName=="INPUT")
							{
							if(CountVal===0) CountVal="";
							pobj.value=CountVal;
							pobj.fireEvent("onchange");
							}
						}
					}
				}					
			}
			// sumcol(tabTi);
		}
//�ϼ���
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
			sum+=parseFloat(oval);
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
				case "PERCENT":
				if(FUNARG==null)
				FUNARG=2;
				functionstr='FormatPercent('+sumfield+','+FUNARG+')';
				break;

				}
			}
		if(CountVal===0) CountVal="";
		otd.children[0].value=CountVal;
		if(otd.children[0].getAttribute("parentField")!=null)
			{
			var restr=/%/g;
			var str=otd.children[0].getAttribute("parentField");
			str=str.replace(restr,'');
			var pobj=getObjBystrInname(FIELD_NAM+str);
			if(pobj!=null && pobj.tagName=="INPUT")
				{
				if(CountVal===0) CountVal="";
				pobj.value=CountVal;
				pobj.fireEvent("onchange");
				}
			}
		}
	}
}
//�ϼ���
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
//����str�õ�input,input���ư���str
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
//�����к͹�ʽ����
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
			return 0;//refval="";
		arrrows[arrrows.length]=refval;
		//�ж��Ƿ������ڸ�ʽ
		var re = new RegExp(Date_Split_Flag,'g');
		//alert(refval.search("+"));

		if(isNaN(refval) && new Date(refval.replace(re,"/")) && (refval.search("+")>-1 ||refval.search("-")>-1))
			sumfield=sumfield.replace("{"+of+"}","new Date("+refval)+")";
		else
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
					osum+=parseFloat(arrrows[ss]);
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
				if(FUNARG!=null && FUNARG!="" && sumfield!=null && sumfield!="")
				ocountval=CountSumInVbs(sumfield)%FUNARG;
				break;
				case "PERCENT":
				if(FUNARG==null)
				FUNARG=2;
				functionstr='FormatPercent('+sumfield+','+FUNARG+')';
				break;
				}
			return ocountval;
	}
	if(sumfield!=null && sumfield!="")
		return CountSumInVbs(sumfield);
	else
		return "";
}
//����һ�еõ�value
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
//			if(content.onchange==null)
//				content.onchange=fun;
//20070905  ��ֹ�붨�Ʊ���onchange�¼���ͻ��ʹ��onblur�¼�
				content.onblur=fun;
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
//���ϼ���ͬ
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

//ѡ�����
function doTabpageClick()
{
var tabtab=event.srcElement.offsetParent;
var titletd=document.all("titledesign");
var subtitletd=document.all("subtitledesign");

for(var i=0;i<tabtab.rows[0].cells.length;i++)
{
var ootd=tabtab.rows[0].cells[i];
if(ootd.className=="taboncss")
	{
	ootd.className="taboffcss";
	var olddiv=document.all("tabpage").children[i+1];

	if(olddiv!=null)
	olddiv.style.display="none";
	}
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

var odiv=document.all("tabpage").children[cellindex+1];
if(odiv!=null)
odiv.style.display="block";

//ʹǩ����,�༭�����ڵĵ�Ԫ����Ӧ����table�ĸ߶�,���
var tabs=odiv.getElementsByTagName("TABLE");
//alert(tabs.length);
for(var i=0;i<tabs.length;i++)
{
	var otab=tabs[i];
for(var j=0;j<otab.rows.length;j++)
	for(var k=0;k<otab.rows[j].cells.length;k++)
	{
	var otd=otab.rows[j].cells[k];
	if(otd.children[0]!=null&&otd.children[0].tagName=="TABLE")
	{
	//alert(otd.children[0].offsetHeight+","+otd.children[0].offsetWidth);
	if(otd.children[0].offsetHeight!=null && otd.children[0].offsetHeight!=0)
	otd.style.height=parseInt(otd.children[0].offsetHeight)+3;
	//otd.style.width=parseInt(otd.children[0].offsetWidth)+100;//�ı���ֻ���޸ĵ�һ�е�����еĿ�Ȳ�������,Ŀǰ�Ȳ��޸�
	}
	}
}

//CurrentTabDiv=odiv;
}
//��ʼ���������㹫ʽ
function initMainForm()
{
var divall=document.all("tabpage");
//ʹǩ����,�༭�����ڵĵ�Ԫ����Ӧ����table�ĸ߶�,���
var tabs=divall.getElementsByTagName("TABLE");
//alert(tabs.length);
for(var i=0;i<tabs.length;i++)
{
	var otab=tabs[i];
for(var j=0;j<otab.rows.length;j++)
	for(var k=0;k<otab.rows[j].cells.length;k++)
	{
	var otd=otab.rows[j].cells[k];
	if(otd.children[0]!=null&&otd.children[0].tagName=="TABLE")
	{
	//alert(otd.children[0].offsetHeight+","+otd.children[0].offsetWidth);
	if(otd.children[0].offsetHeight!=null && otd.children[0].offsetHeight!=0)
	otd.style.height=parseInt(otd.children[0].offsetHeight)+3;
	//otd.style.width=parseInt(otd.children[0].offsetWidth)+100;//�ı���ֻ���޸ĵ�һ�е�����еĿ�Ȳ�������,Ŀǰ�Ȳ��޸�
	}
	}
}

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
//����������
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
		//of=of.toUpperCase();
		index1=-1;
		index2=-1;
		var refval='ParseStr(document.all("'+of+'").value)';
		var refval2='ParseStr(document.all("'+of+'").value,1)';
		inputArr[inputArr.length]=eval('document.all("'+of+'")');
		inputNameArr[inputNameArr.length]=refval;
		biaodaAvgstr+='ParseStr(document.all("'+of+'").value)'+'+';
		//if(refval==null || refval=="")
			//refval=0;
		//arrrows[arrrows.length]=refval;
		//�ж��Ƿ������ڸ�ʽ
		if(sumfield.indexOf('+')>-1 ||sumfield.indexOf('-')>-1)
			sumfield=sumfield.replace("{"+of+"}",refval2);
		else
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
				functionstr='"��"+FormatNumber('+sumfield+',2,"false","false","true")';
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
				case "DATEPARSE":
				functionstr='FormatDateParse('+sumfield+',"'+FUNARG+'")';
				break;
				}
	}
	else
	{			
		functionstr='('+functionstr+').toFixed(12)';		
		}

	//alert(functionstr);
	if(functionstr=="") return;
	for(var jj=0;jj<inputArr.length;jj++)
	{
	var fun=new Function('document.all("'+content.name+'").value='+functionstr+';');
	inputArr[jj].attachEvent("onchange",fun);
	}
	inputArr=null;
}



//����ת���Ҵ�д��js��
function ChangeToBig(value)
{
var intFen,i;
var strArr,strCheck,strFen,strDW,strNum,strBig,strNow;

//if(trim(value)=="")   //����Ϊ��ʱ����"��"
//return "��";
if (isNaN(value))   //���ݷǷ�ʱ��ʾ�������ؿմ�
{
strErr = "����"+value+"�Ƿ���"
alert(strErr);
return "";
}
strCheck = value+".";
strArr = strCheck.split(".");
strCheck = strArr[0];
if(strCheck.length>12)   //���ݴ��ڵ���һ����ʱ��ʾ�޷�����
{
strErr = "����"+value+"�����޷�����"
alert(strErr);
return "";
}
try
{
i = 0;
strBig = "";
//intFen = parseFloat(100)*parseFloat(value);          //ת��Ϊ�Է�Ϊ��λ����ֵ
var arr=value.toString().split(".");
intFen=arr[0];
if(typeof arr[1]=="undefined")
	arr[1]="00";
else if(typeof arr[1]=="string")
	arr[1]=(arr[1]+"00").substring(0,2);
intFen+=arr[1];

strFen = intFen.toString();

strArr = strFen.split(".");
strFen = strArr[0];
intFen = strFen.length;      //��ȡ����
strArr = strFen.split("");//��������ֵ�ֽ⵽������
while(intFen!=0)   //�ֽⲢת��
{
i = i+1;
switch(i)              //ѡ��λ
{
case 1:strDW = "��";break;
case 2:strDW = "��";break;
case 3:strDW = "Ԫ";break;
case 4:strDW = "ʰ";break;
case 5:strDW = "��";break;
case 6:strDW = "Ǫ";break;
case 7:strDW = "��";break;
case 8:strDW = "ʰ";break;
case 9:strDW = "��";break;
case 10:strDW = "Ǫ";break;
case 11:strDW = "��";break;
case 12:strDW = "ʰ";break;
case 13:strDW = "��";break;
case 14:strDW = "Ǫ";break;
}
switch (strArr[intFen-1])              //ѡ������
{
case "1":strNum = "Ҽ";break;
case "2":strNum = "��";break;
case "3":strNum = "��";break;
case "4":strNum = "��";break;
case "5":strNum = "��";break;
case "6":strNum = "½";break;
case "7":strNum = "��";break;
case "8":strNum = "��";break;
case "9":strNum = "��";break;
case "0":strNum = "��";break;
}

//�����������
strNow = strBig.split("");
//��Ϊ��ʱ�����
if((i==1)&&(strArr[intFen-1]=="0"))
strBig = "��";
//��Ϊ��ʱ�����
else if((i==2)&&(strArr[intFen-1]=="0"))
{    //�Ƿ�ͬʱΪ��ʱ�����
if(strBig!="��")
strBig = "��"+strBig;
}
//ԪΪ������
else if((i==3)&&(strArr[intFen-1]=="0"))
strBig = "Ԫ"+strBig;
//ʰ��Ǫ��һλΪ������ǰһλ��Ԫ���ϣ���Ϊ������ʱ����
else if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]!="��")&&(strNow[0]!="Ԫ"))
strBig = "��"+strBig;
//ʰ��Ǫ��һλΪ������ǰһλ��Ԫ���ϣ�ҲΪ������ʱ���
else if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]=="��"))
{} 
//ʰ��Ǫ��һλΪ������ǰһλ��Ԫ��Ϊ������ʱ���
else if((i<7)&&(i>3)&&(strArr[intFen-1]=="0")&&(strNow[0]=="Ԫ"))
{}
//����Ϊ��ʱ���벹������
else if((i==7)&&(strArr[intFen-1]=="0"))
strBig ="��"+strBig;
//ʰ��Ǫ����һλΪ������ǰһλ�������ϣ���Ϊ������ʱ����
else if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]!="��")&&(strNow[0]!="��"))
strBig = "��"+strBig;
//ʰ��Ǫ����һλΪ������ǰһλ�������ϣ�ҲΪ������ʱ���
else if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]=="��"))
{}
//ʰ��Ǫ����һλΪ������ǰһλΪ��λ��Ϊ������ʱ���
else if((i<11)&&(i>7)&&(strArr[intFen-1]=="0")&&(strNow[0]=="��"))
{}
//��λΪ���Ҵ���Ǫλ��ʮ������ʱ������Ǫ�䲹��
else if((i<11)&&(i>8)&&(strArr[intFen-1]!="0")&&(strNow[0]=="��")&&(strNow[2]=="Ǫ"))
strBig = strNum+strDW+"����"+strBig.substring(1,strBig.length);
//����������λ
else if(i==11)
{
//��λΪ������ȫΪ�����Ǫλʱ��ȥ����Ϊ��
if((strArr[intFen-1]=="0")&&(strNow[0]=="��")&&(strNow[2]=="Ǫ"))
strBig ="��"+"��"+strBig.substring(1,strBig.length);
//��λΪ������ȫΪ�㲻����Ǫλʱ��ȥ����
else if((strArr[intFen-1]=="0")&&(strNow[0]=="��")&&(strNow[2]!="Ǫ"))
strBig ="��"+strBig.substring(1,strBig.length);
//��λ��Ϊ������ȫΪ�����Ǫλʱ��ȥ����Ϊ��
else if((strNow[0]=="��")&&(strNow[2]=="Ǫ"))
strBig = strNum+strDW+"��"+strBig.substring(1,strBig.length);
//��λ��Ϊ������ȫΪ�㲻����Ǫλʱ��ȥ����
else if((strNow[0]=="��")&&(strNow[2]!="Ǫ"))
strBig = strNum+strDW+strBig.substring(1,strBig.length);
//�����������
else
strBig = strNum+strDW+strBig;
}
//ʰ�ڣ�Ǫ����һλΪ������ǰһλ�������ϣ���Ϊ������ʱ����
else if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]!="��")&&(strNow[0]!="��"))
strBig = "��"+strBig;
//ʰ�ڣ�Ǫ����һλΪ������ǰһλ�������ϣ�ҲΪ������ʱ���
else if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]=="��"))
{}
//ʰ�ڣ�Ǫ����һλΪ������ǰһλΪ��λ��Ϊ������ʱ���
else if((i<15)&&(i>11)&&(strArr[intFen-1]=="0")&&(strNow[0]=="��"))
{}
//��λΪ���Ҳ�����Ǫ��λ��ʮ������ʱȥ���ϴ�д�����
else if((i<15)&&(i>11)&&(strArr[intFen-1]!="0")&&(strNow[0]=="��")&&(strNow[1]=="��")&&(strNow[3]!="Ǫ"))
strBig = strNum+strDW+strBig.substring(1,strBig.length);
//��λΪ���Ҵ���Ǫ��λ��ʮ������ʱ������Ǫ��䲹��
else if((i<15)&&(i>11)&&(strArr[intFen-1]!="0")&&(strNow[0]=="��")&&(strNow[1]=="��")&&(strNow[3]=="Ǫ"))
strBig = strNum+strDW+"����"+strBig.substring(2,strBig.length);
else
strBig = strNum+strDW+strBig;
strFen = strFen.substring(0,intFen-1);
intFen = strFen.length;
strArr = strFen.split("");
}
return strBig;
}catch(err){
return "";      //��ʧ���򷵻�ԭֵ
}
}
//�ٷֱ�
function FormatPercent(num,decimalNum)
{
if(isNaN(parseFloat(num)))
	return num;
var nump= FormatNumber(num*100,decimalNum);
return nump+"%";
}
//���������ʽת��
function FormatDateParse(sourcestr,formatstr)
{
	if(sourcestr==null) return "";
	switch(formatstr)
	{
		case 'DATE':
		return sourcestr/(1000*60*60*24)+1;
		case 'DAY':
			return sourcestr/(1000*60*60*24);
		case 'HOUR':
			return sourcestr/(1000*60*60);
		case 'MIN':
			return sourcestr/(1000*60);
		case 'SEC':
			return sourcestr/(1000);

	}
}
//#######################################################################################
//                                                                 ���ָ�ʽ������ 
//  �÷���������������ʽ�����֡� 
//  ������num����ֵ�ͣ���Ҫ���и�ʽ������ֵ�ͱ����� 
// decimalNum�����ͣ� ��Ҫ������С��λ���� 
// bolLeadingZero �������ͣ�true�� false������-1<num<1֮������Ƿ�Ҫ���ǰ������0�� 
// bolParens �������ͣ�true�� false�����ڸ��ź��Ƿ�ʹ��С���ţ� 
// bolCommas �������ͣ�true�� false�����Ƿ��á�,����������λ�� 
//  ����ֵ��������ʽ���������ַ����� 
//#######################################################################################

function FormatNumber(num,decimalNum,bolLeadingZero,bolParens,bolCommas) 
{ 
  if (isNaN(parseInt(num))) return "NaN"; 

  var tmpNum = num; 
  var iSign = num < 0 ? -1 : 1; // �õ����ַ��� 

  // ����С����λ�������������֡� 
  tmpNum *= Math.pow(10,decimalNum); 
  tmpNum = Math.round(Math.abs(tmpNum)) 
  tmpNum /= Math.pow(10,decimalNum); 
  tmpNum *= iSign; // ���µ������� 

  // ����ֵ��ת�����ַ����� 
  var tmpNumStr = new String(tmpNum); 

  // �����Ƿ���ǰ��0 
  if (!bolLeadingZero && num < 1 && num > -1 && num != 0) 
  if (num > 0) 
    tmpNumStr = tmpNumStr.substring(1,tmpNumStr.length); 
  else 
    tmpNumStr = "-" + tmpNumStr.substring(2,tmpNumStr.length); 

  //�����Ƿ��ж��� 
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

  // �����Ƿ������� 
  if (bolParens && num < 0) 
    tmpNumStr = "(" + tmpNumStr.substring(1,tmpNumStr.length) + ")"; 

  return tmpNumStr; // ���ظ�ʽ�����ַ��� 
} 
//�����־ͷ������ָ�ʽ,���򷵻��ַ�����ʽ,datecount=1ʱִ��dateת��
function ParseStr(str,datecount)
{
if(str==null || str=="")
	return 0;
	//�ж��Ƿ������ڸ�ʽ

var re = new RegExp(Date_Split_Flag,'g');
	//alert(new Date(str.replace(re,"/")));
if(!isNaN(str))
	return parseFloat(str,10);
else if(new Date(str.replace(re,"/")) && datecount)
	{
	return new Date(str.replace(re,"/"));
	}
else
	return str;
}

  /*
  ����:YYYY-MM-DD ��������ת��Ϊ����
  ��:1984-3-7 -> һ�Ű�������������
  ����:baodate2chinese("1984-3-7")

case "1":strNum = "Ҽ";break;
case "2":strNum = "��";break;
case "3":strNum = "��";break;
case "4":strNum = "��";break;
case "5":strNum = "��";break;
case "6":strNum = "½";break;
case "7":strNum = "��";break;
case "8":strNum = "��";break;
case "9":strNum = "��";break;

*/
  function num2chineseInDefForm(s)
  {
  var chinese = ['��','Ҽ','��','��','��','��','½','��','��','��'];
   //����������ת������.
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
	    var chinese = ['��','Ҽ','��','��','��','��','½','��','��','��'];
	  var len = ['ʰ'];
    //������������д���.
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
	    var ydm =['��','��','��'];
     //��֤��������ڸ�ʽ.����ȡ�������.
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

//add by xuzhl 2007-02-08�����ж��������е�С��λ�����Ǹ�
function getMaxLengthScale(a,b){
   var sa=new String(a);
   var sb=new String(b);
   var aindex=sa.indexOf(".");
   var bindex=sb.indexOf(".");
   var aLength=0;
   var bLength=0;
   if(aindex>0){
   	aLength=sa.substring(aindex).length-1;
   }
   if(bindex>0){
   	bLength=sb.substring(bindex).length-1;
   }  
   return aLength>bLength?aLength:bLength;
}

//add by xuzhl 2007-02-08���������ִ�о�ȷ���������
//��ѧ���� ��ʽ������   ���� ����ֵvalue��С��λ
function setScale( value , scale )
{
	if( isNaN( value ) || isNaN( scale ) || parseInt( scale ) < 0 )
		return new String( value ) ;

	var strValue = new String( value ) ;
	var fValue = parseFloat( value ) ;
	var iScale = parseInt( scale ) ;
	
	if( iScale == 0 )
		return new String( ( fValue < 0.0 ? "-" : "" ) + Math.round( Math.abs( fValue ) ) ) ;
		
	if( fValue == parseInt( strValue ) )  //����Ĳ���û��С������
	{	
		strValue = new String( parseInt( strValue ) ) + "." ;

		for( var i = 0 ; i < iScale ; i ++ )
			strValue += "0" ;
	}
	else 
	{
		var fDecimal = Math.abs( fValue - parseInt( strValue ) ) ;
		fDecimal = Math.round( fDecimal * Math.pow( 10 , iScale ) ) ;
		var strDecimal = new String( fDecimal ) ;
		//������ new String( Math.round( 0.07 * Math.pow( 10 , 2 ) ) ) == "7" but not "07" �����������Ҫ�����²��㴦��
		if( strDecimal.length < iScale ) 
		{
			var iDecimalLength = strDecimal.length ;
			
			for( var i = 0 ; i < iScale - iDecimalLength ; i ++ )
				strDecimal = "0" + strDecimal ;
	
			strValue = new String( parseInt( strValue ) ) + "." + strDecimal ;
		}
		//������ new String( Math.round( 0.995 * Math.pow( 10 , 2 ) ) ) == "100" �����������Ҫ�����²��㴦��
		else if( strDecimal.length > iScale ) 
		{
			strValue = new String( parseInt( strValue ) + 1 ) ;			
			
			strValue += "." ;
			for( var i = 0 ; i < iScale ; i ++ )
				strValue += "0" ;
		}
		else
			strValue = new String( parseInt( strValue ) ) + "." + strDecimal ;
	}
	
	return strValue ;
}


	Number.prototype.toFixed=function(len)
{
    var add = 0;
    var s,temp;
    var s1 =  "" + this;
    var start = s1.indexOf(".");
    if(s1.substr(start+len+1,1)>=5)add=1;
    var temp = Math.pow(10,len);
    s = Math.floor(this * temp) + add;
    return s/temp;
}

