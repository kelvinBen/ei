//多个下拉框联动
function MultiSelect(name)
{
//全局变量
this.name=name;
var SelectOne=null; //第一个下拉框
//初始化
this.init=init;
function init(ss1,ss2,cmdUrl)
{
var obj=document.all(ss1);
var nfun=this.fillData;
var str=this.name+".fillData('"+ss1+"','"+ss2+"','"+cmdUrl+"')";
var fun=new Function(str);
obj.attachEvent("onchange",fun);
//obj.onchange=fun;
//obj.onchange();
}
//
this.setSelectOne=setSelectOne;
function setSelectOne(obj)
{
SelectOne=obj;
}
//
this.getSelectOne=getSelectOne;
function getSelectOne(obj)
{
return SelectOne;
}
//返回第一个下拉框选中的key
this.getSelectedKey=getSelectedKey;
function getSelectedKey()
{
if(SelectOne!=null && SelectOne.tagName=="SELECT")
return SelectOne.options[sel1.selectedIndex].key;
}
//为第二个下拉框赋值
this.fillData=fillData;
function fillData(SelName1,SelName2,url)
{
var sel1=document.all(SelName1);
var sel2=document.all(SelName2);
if(sel1==null || sel2==null) return;
//初始化选中的值
var sel2oldkey="";
if (sel2.selectedIndex!=-1)
{
	seled2=sel2.options[sel2.selectedIndex];
	sel2oldkey=seled2.value;
}
sel2.innerHTML="";
var seled1="";
var oldkey="";

if (sel1.selectedIndex!=-1)
{
	seled1=sel1.options[sel1.selectedIndex];
	oldkey=seled1.value;
}



if(url!=null && url!="undefined")
{
	var instr=getValueByXmlhttp(url);
	if(instr!=null && instr!="")
	{
	var oldstr=sel2.outerHTML;
	var index=oldstr.indexOf("</SELECT>");
	oldstr=oldstr.substring(0,index);
	var odiv=sel2.parentElement;
	sel2.removeNode(true);
	odiv.insertAdjacentHTML("afterBegin",oldstr+instr+"</SELECT>");
	return;
	}
}
var hidtxt=sel2.nextSibling;
var strtxt=hidtxt.value;

var arr2=strtxt.split("@|@");
		for(var j=0;j<arr2.length;j++)
		{
			var arr3=arr2[j].split("@,@");
				if(arr3[0]==oldkey)
				{
					var opt=document.createElement("<OPTION>");
					opt.value=arr3[1];
					if(sel2oldkey&&sel2oldkey==arr3[1]){
						opt.selected=true;
					}
					opt.innerText=arr3[2];
					opt.key=arr3[0];
					sel2.appendChild(opt);
				}
		}
}
//通过xmlhttp取值，返回字符串“<option>aaaa</option>”
this.getValueByXmlhttp=getValueByXmlhttp;
function getValueByXmlhttp(url)
	{
	if(url==null)
	{
	alert(MultiSelect_msg_1);
	return;
	}
	try
		{
		var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		if(xmlhttp==null)
		{
		alert(MultiSelect_msg_2+ex.description);
		return ;
		}
		xmlhttp.open("POST",url,false);
		xmlhttp.send();
		return xmlhttp.responseText;
		}catch(ex)
		{
		alert(MultiSelect_msg_3+ex.description);
		return "";
		}
	}
//通过xmlhttp取值，返回字符串“<option>aaaa</option>”
this.sendValueByXmlhttp=sendValueByXmlhttp;
function sendValueByXmlhttp(url,xmlstr)
	{
	if(url==null)
	{
	alert(MultiSelect_msg_1);
	return;
	}
	try
		{
		var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		if(xmlhttp==null)
		{
		alert(MultiSelect_msg_2+ex.description);
		return;
		}
		xmlhttp.open("POST",url,false);
		xmlhttp.send(xmlstr);
		}catch(ex)
		{
		alert(MultiSelect_msg_4+ex.description);
		return "";
		}
	}


}
