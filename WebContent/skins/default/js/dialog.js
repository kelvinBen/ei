//��������,ͨ��XMLHTTPȡ����Ϣ,֧�ּ��̲���
//����:������
//2004-3-20
function HELPDIALOG(name)//��������
{
var name=name;		//�ܵ�DIV��ID
var divAll=null;	//�ܵ�DIV
var tabTou=null;	//���ͷ
var divTab=null;	//������ʾ���
var outObj=null;	//�ⲿ�ı������
var width="300";		//���
var height="200";		//�߶�
var headStr="";		//���ͷ�ַ���
var detailStr="";	//������ַ���
var errStr="";		//������Ϣ
var cmdUrl=null;  //CMD��URL
var curTr=null;   //ѡ�е���
var checkCol=0;		//ƥ�����
var doclick=null;

this.init=init;
function init(obj,url,wid,hei)//�ⲿ�ı������,���,�߶�
	{
	try
		{
		//������֤
		if(obj==null || url==null)
			{
			alert(dialog_msg_1);
			return;
			}
		if(wid!=null && wid!="")
		width=wid;
		if(hei!=null && hei!="")
		height=hei;
		cmdUrl=url;
		if(divAll==null)
			{
			XmlToHtml(createXmlhttp());
			document.body.insertAdjacentHTML("beforeEnd",outHTML());
			divAll=document.all(name);
			tabTou=divAll.children[0].children[0];
			divTab=divAll.children[1].children[0];
			divTab.attachEvent("onclick",this.doclickin);//����¼�
			document.attachEvent("onmousedown",this.doBodyKeyDown);
			}
		else
			{
			divAll.innerHTML="";
			headStr="";
			detailStr="";
			XmlToHtml(createXmlhttp());
			var htmstr="";
			htmstr+='<div style="overflow:hidden;position:absolute;z-index:1" class="dialogToucss"><table border=0 width="100%" height=20 cellspacing=0 cellpadding=0 >';
			htmstr+=headStr;
			htmstr+='</table></div>';
			htmstr+='<div style="overflow:visible;width:100%;height:100px;" class="dialogTi"><table border=0 width="100%" cellspacing=0 cellpadding=0 style="margin-top:20px;">';
			htmstr+=detailStr;
			htmstr+='</table></div><iframe frameborder=0 style="position:absolute;z-index:-1;width:100%;height:100%;top:0;"></iframe>';
			divAll.innerHTML=htmstr;
			tabTou=divAll.children[0].children[0];
			divTab=divAll.children[1].children[0];
			divTab.attachEvent("onclick",this.doclickin);//����¼�
			}
		outObj=obj;
		outObj.attachEvent("onkeydown",this.dokeydown);
		}catch(ex)
		{}
	}
this.outHTML=outHTML;
function outHTML()
	{
	if(headStr==null || headStr=="")
		return "";
	var html='<div id="'+name+'" style="overflow:auto;width:'+width+';height:'+height+';border:1 solid #eeeeee;position:absolute;display:none" class="dialogdiv" onscroll="this.children[0].style.top=this.scrollTop;">';
	html+='<div style="overflow:hidden;width:100%;height:20px;position:absolute;z-index:1" class="dialogToucss"><table border=0 width="100%" height=20 cellspacing=0 cellpadding=0 >';
	html+=headStr;
	html+='</table></div>';
	html+='<div style="overflow:visible;width:100%;height:100px;" class="dialogTi"><table border=0 width="100%" cellspacing=0 cellpadding=0 style="margin-top:20px;">';
	html+=detailStr;
	html+='</table></div><iframe frameborder=0 style="position:absolute;z-index:-1;width:100%;height:100%;top:0;"></iframe></div>';
	return(html);
	}
this.XmlToHtml=XmlToHtml;
function XmlToHtml(xmlobj)
	{
	if(xmlobj==null || xmlobj=="")
		return;
	try
		{
	var XmlDoc=new ActiveXObject("MSXML.DOMDocument");
	XmlDoc.loadXML(xmlobj);
	if(XmlDoc.documentElement.tagName!="table")
	{
		if(XmlDoc.documentElement.childNodes.length>0)
		{
		for(var tt=0;tt<XmlDoc.documentElement.childNodes.length;tt++)
			{
			var errnode=XmlDoc.documentElement.childNodes[tt];
			var des=errnode.getAttribute("desc");
			if(des!=null && des!="")
				{
				if(errStr!="" && errStr!=null)
				errStr+=","+des;
				else
				errStr+=des;
				}
			}
		}
		alert(dialog_msg_2+errStr);
		headStr="";
		detailStr="";
		return;
	}
	var headNode=XmlDoc.documentElement.childNodes[0];
	var detailNode=XmlDoc.documentElement.childNodes[1];
	if(headNode.childNodes.length>0)
			{
			headStr+="<td width=20><span>&nbsp;</span></td>";
			for(var i=0;i<headNode.childNodes.length;i++)
				{
				var onode=headNode.childNodes[i];
				var text=onode.text;
				if(text!=null && text!="")
					headStr+="<td><span>"+text+"</span></td>";
				}
			}

	if(detailNode.childNodes.length>0)
		{
		for(j=0;j<detailNode.childNodes.length;j++)
			{
			detailStr+="<tr>";
			detailStr+="<td width=20 id='titdleft'><span >"+(j+1)+"</span></td>";
			var otr=detailNode.childNodes[j];
			if(otr.childNodes.length>0)
				{
				for(var k=0;k<otr.childNodes.length;k++)
					{
					otd=otr.childNodes[k];
					var tdvalue=otd.text;
					if(tdvalue!=null && tdvalue!="")
						detailStr+="<td><span title='"+tdvalue+"'>"+tdvalue+"</span></td>";
					}
				}
			detailStr+="</tr>";
			}

		}
		}catch(ex)
		{
		alert(dialog_msg_3+ex.description);
		}

	}
//����XMLHTTP����
this.createXmlhttp=createXmlhttp;
function createXmlhttp()
	{
	try
		{
		var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		xmlhttp.open("POST",cmdUrl,false);
		xmlhttp.send();
		return xmlhttp.responseText;
		}catch(ex)
		{
		alert(dialog_msg_4+ex.description);
		return "";
		}
	}
//�趨��Ԫ����
this.setColwidth=setColwidth;
function setColwidth(index,width)
	{
	if(divTab==null ||tabTou==null)
		return;
	if(index==null || index==="" || width==null || width==="" || isNaN(index) || isNaN(width))
		return;
	if(tabTou.rows[0].cells[index]!=null)
		tabTou.rows[0].cells[index].width=width;
	for(var i=0;i<divTab.rows.length;i++)
		{
		if(divTab.rows[i].cells[index]!=null)
			divTab.rows[i].cells[index].width=width;
		}
	}
//�趨ƥ����
this.setCheckCol=setCheckCol;
function setCheckCol(index)
	{
	if(divTab==null ||tabTou==null)
		return;
	if(index==null || index==="" || isNaN(index))
		return;
	checkCol=index;
	}
//�趨������
this.hidCol=hidCol;
function hidCol(index)
	{
	if(divTab==null ||tabTou==null)
		return;
	if(index==null || index==="" || isNaN(index))
		return;
	if(tabTou.rows[0].cells[index]!=null)
		tabTou.rows[0].cells[index].style.display="none";
	for(var i=0;i<divTab.rows.length;i++)
		{
		if(divTab.rows[i].cells[index]!=null)
			divTab.rows[i].cells[index].style.display="none";
		}
	}
this.doBodyKeyDown=doBodyKeyDown;
function doBodyKeyDown()
	{
	//hidden();//���ذ�������
	}
//DIV��onclick�¼�
this.doclickin=doclickin;
function doclickin()
	{
	var obj=window.event.srcElement;
	var otr=null;
	if(curTr!=null)
		curTr.className="";
	switch(obj.tagName)
		{
		case "SPAN":
			otr=obj.parentElement.parentElement;
			break;
		case "TD":
			otr=obj.parentElement;
			break;
		case "TR":
			otr=obj;
			break;
		}
		otr.className="row_selected";
		curTr=otr;
		outObj.focus();
		//�ⲿ�ӿں���
		if(typeof(doclick)=="function")
			doclick();
		else
			eval(doclick);
	}
//////�ⲿ�ӿں���,setOnclick
this.setOnclick=setOnclick;
function setOnclick(newevent)
	{
	if(newevent!=null && newevent!="")
		doclick=newevent;
	}
//�ⲿ�ӿں���,��������д
//this.doclick=null;
//function doclick()
	//{}
//�����¼�
this.dokeydown=dokeydown;
function dokeydown()
{
var tmp = -1;
switch(event.keyCode)
	{
		case 38:
			for(var i=0;i<divTab.rows.length;i++)
			{	
				if(divTab.rows[i].className == "row_selected")
				{
					tmp = 1;
					if(i==0)
						return;
					else
					{
						divAll.scrollTop=divTab.rows[i-1].offsetTop;//Ϊ��������λ
						divTab.rows[i].className = "";
						divTab.rows[i-1].className = "row_selected";
						curTr=divTab.rows[i-1];
						break;
					}
				}
			}
			if(tmp==-1)
			{
				divTab.rows[divTab.rows.length-1].className = "row_selected";
				curTr=divTab.rows[divTab.rows.length-1];
			}
			break;
		case 40:
			for(var i=0;i<divTab.rows.length;i++)
			{
				if(divTab.rows[i].className == "row_selected")
				{
					tmp = 1;
					if(i==divTab.rows.length-1)
						return;
					else
					{	
						divAll.scrollTop=divTab.rows[i].offsetTop;//Ϊ��������λ
						divTab.rows[i].className = "";
						divTab.rows[i+1].className = "row_selected";
						curTr=divTab.rows[i+1];
						break;
					}
				}
			}
			if(tmp==-1)
			{
				divTab.rows[0].className = "row_selected";
				curTr=divTab.rows[0];
			}
			break;
/*
		case 13:
			for(var i=0;i<divTab.rows.length;i++)
				{
					if(divTab.rows[i].className == "row_selected")
					{
						outObj.value = divTab.rows[i].cells[1].innerText;
					}
				}
			divAll.style.display = "none";
			break;
*/
		default:
			window.setTimeout(showcur,100);
	}
}
this.showcur=showcur;
function showcur()//��ʾ��ǰ������
{
	var obv = outObj.value;
	for(var i=0;i<divTab.rows.length;i++)
	{	
		var l = obv.length;
		if(l==0) return;
		for(var m=0;m<divTab.rows.length;m++)
		{	
			divTab.rows[m].className = "";
		}
		if(divTab.rows[i].cells[checkCol].innerText.substr(0,l)==obv)
		{
			divAll.scrollTop=divTab.rows[i].offsetTop;//Ϊ��������λ
			divTab.rows[i].className = "row_selected";
			curTr=divTab.rows[i];
			cur = i;
			break;
		}
	}
}
//��λ
this.moveTo=moveTo;
function moveTo(oleft,otop)
	{
	if(outObj==null) return;
	var top=0;
	var left=0;
	if(oleft!=null && oleft!=="" && otop!=null && otop!=="")
		{
		top=otop;
		left=oleft;
		}
		else
		{
			var i=0;
			var obj=outObj;
			while(obj!=document.body)
			{
			if(i==50) break;
			top+=parseInt(obj.offsetTop);
			left+=parseInt(obj.offsetLeft);
			obj=obj.offsetParent;
			i++;
			}
		}
	//alert(top+","+left);
	if(divAll!=null)
		{
		if(top+parseInt(outObj.offsetHeight)+divAll.offsetHeight>document.body.clientHeight)
			divAll.style.top=top-parseInt(divAll.offsetHeight);
		else
			divAll.style.top=top+parseInt(outObj.offsetHeight);
		if(left+width>document.body.clientWidth)
			divAll.style.left=left-width;
		else
			divAll.style.left=left;
		}
	}
//�õ�ѡ���е�ֵ,��","�ָ�
this.getValue=getValue;
function getValue()
	{
	if(curTr==null)
		return null;
	if(curTr.tagName=="TR")
		{
		var restr="";
		for(var i=0;i<curTr.cells.length;i++)
			restr+=curTr.cells[i].innerText+",";
		return restr.substr(restr.length-1,1)==","?restr.substring(0,restr.length-1):restr;
		}
	return null;
	}
///�õ�ָ���е�ֵ,��","�ָ�
this.getRowValue=getRowValue;
function getRowValue(index)
	{
	if(divTab==null)
		return;
	if(index==null || index==="" || isNaN(index))
		return;
	if(index >= divTab.rows.length)
		return "";
	var restr="";
	for(var i=0;i<divTab.rows[index].cells.length;i++)
		{
		if(divTab.rows[index].cells[i]!=null)
			restr+=divTab.rows[index].cells[i].innerText+",";
		}
	return restr.substr(restr.length-1,1)==","?restr.substring(0,restr.length-1):restr;
		
	}
//����
this.hidden=hidden;
function hidden()
	{
	if(divAll!=null)
		divAll.style.display="none";
	curTr=null;
	}
//��ʾ
this.show=show;
function show()
	{
	if(divAll!=null)
		divAll.style.display="block";
	curTr=null;
	}


}
