/************************************************
** ??????:	dailt
** ?? ??:	2004.2.20
** ?? ??:	??????
**
** ?? ??:	1.0
************************************************/
function combo(comboname,width,height,obj,enable,originvalue,changestr)
{
	if(comboname)	{
			var s='window.'+comboname+'_=this';
			eval(s);
		}else	{
			return; 
		}
	var disb = "";
	if(!enable)
		disb = "disabled";
	this.conspan=obj;
	this.enable = enable;
	this.width = width;
	this.cname = comboname;
	this._combocur=null;
	this.originvalue=originvalue;
	var combodiv = '<div style="width:'+width+'px;" class="combobox"></div>';
	var onchangestr='';
	if(changestr!=null && changestr!="")
		onchangestr=' onchange="'+changestr+'" ';
	var comboinput = '<div style="height:17;border:1 solid steelblue;"><input style="border:0 solid;" '+disb+' type="text" name="s_'+this.cname+'" value="'+originvalue+'" onkeydown="'+this.cname+'_.dokeydown(this);" onclick="'+this.cname+'_.showdown(this);" '+onchangestr+'/><button '+disb+' tabindex="-1" style="" name="b_'+this.cname+'" hidefocus="true" onclick="'+this.cname+'_.showdown(this.previousSibling)">6</button><div>';
	var heistr='';
	if(height==null || height=="")
		heistr=' height:10; ';
	else
		heistr=' height:'+height+';overflow-y:auto;';
	var comboborder = '<div style="position:absolute;z-index:100;display:none;width:100%;'+heistr+';background:white;border:1 solid dimgray;filter:progid:DXImageTransform.Microsoft.Shadow(color=#666666, Direction=135, Strength=3);"><iframe width="100%" scrolling=no frameborder="0" height="100%" style="top:-1;position:absolute;z-index:-1;"></iframe></div>';
	var combotbl = '<TABLE border="0" width="100%" cellpadding="0" cellspacing="1" onclick="'+this.cname+'_.doclick(this);" onmouseover="'+this.cname+'_.domouseover();" onmouseout="'+this.cname+'_.domouseout();"></TABLE>';
	obj.insertAdjacentHTML("beforeEnd",combodiv);
	var ch = obj.childNodes(obj.childNodes.length-1);
	ch.insertAdjacentHTML("beforeEnd",comboinput);
	ch.insertAdjacentHTML("beforeEnd",comboborder);
	ch = ch.childNodes(ch.childNodes.length-1);
	this.dropdown = ch;
	ch.insertAdjacentHTML("beforeEnd",combotbl);
	ch = ch.childNodes(ch.childNodes.length-1);

	this.tbl = ch;//????
	var ff=new Function("",this.cname+"_.hiddropdown();");
	document.body.attachEvent("onclick",ff);
}
//????body????
combo.prototype.hiddropdown=function()
{
if(!this.conspan.contains(event.srcElement))
	this.dropdown.style.display = 'none';
var hasval=0;
var otext=document.getElementsByName("s_"+this.cname)[0].value;
for(var i=0;i<this.tbl.rows.length;i++)
		{
			if(this.tbl.rows[i].innerText == otext)
			{
				hasval=1;
				break;
			}

		}
		if(!hasval)
		{
			document.getElementsByName("s_"+this.cname)[0].value = "";
			document.getElementsByName(this.cname)[0].value="";
		}
}

combo.prototype.dokeydown=function(ob)//????????????????
{
	this.dropdown.style.display = "block";
	var tmp = -1;
	var tbl = this.tbl;
	var obv = ob.value;
	

	switch(event.keyCode)
	{
		case 38:
			for(var i=0;i<tbl.rows.length;i++)
			{	
				if(tbl.rows[i].className == "selected")
				{
					tmp = 1;
					if(i==0)
						return;
					else
					{
						tbl.rows[i].className = "";
						tbl.rows[i-1].className = "selected";
						break;
					}
				}
			}
			if(tmp==-1)
				tbl.rows[tbl.rows.length-1].className = "selected";
			break;
		case 40:
			for(var i=0;i<tbl.rows.length;i++)
			{
				if(tbl.rows[i].className == "selected")
				{
					tmp = 1;
					if(i==tbl.rows.length-1)
						return;
					else
					{
						tbl.rows[i].className = "";
						tbl.rows[i+1].className = "selected";
						break;
					}
				}
			}
			if(tmp==-1)
				tbl.rows[0].className = "selected";
			break;
		default:
			window.setTimeout(this.cname+"_.showcur()",100);
			this._combocur = ob;
	}


	if(event.keyCode == 13)
	{
		var hasval=0;
		var hasTxt=0;
		for(var i=0;i<tbl.rows.length;i++)
		{
			if(tbl.rows[i].className == "selected")
			{
				ob.value = tbl.rows[i].cells[0].innerText;
				document.getElementsByName(this.cname)[0].value=tbl.rows[i].cells[0].val;
				//if(ob.onchange!=null)
					//ob.onchange();
				document.getElementsByName(this.cname)[0].fireEvent("onchange");
				ob.fireEvent("onchange");
				hasval=1;
				break;
			}
			if(ob.value == tbl.rows[i].cells[0].innerText){
				hasTxt=1;
			}
		}
		this.dropdown.style.display = "none";
		if(!hasval&&!hasTxt)
		{
			ob.value = "";
			//document.getElementsByName(this.cname)[0].value="";
		}
	}
}
combo.prototype.showcur=function()//??????????????
{
	var obv = this._combocur.value;
	var tbl = this.tbl;
	for(var i=0;i<tbl.rows.length;i++)
	{	
		var l = obv.length;
		if(l==0) return;
		for(var m=0;m<tbl.rows.length;m++)
		{	
			tbl.rows[m].className = "";
		}
		//alert(tbl.rows[i].cells[0].val.substr(0,l));
		if(tbl.rows[i].cells[0].val.substr(0,l).toLowerCase()==obv.toLowerCase())
		{
			tbl.rows[i].className = "selected";
			cur = i;
			tbl.parentElement.scrollTop=tbl.rows[i].offsetTop;
			break;
		}
	}
}
combo.prototype.domouseover=function()
{
	window.event.cancelBubble = true;
	var ob = event.srcElement;
	if(ob.tagName=="TD")
	{
		//ob.parentElement.parentElement.className = "selected";
		ob.style.border="1 solid #FF9933";
	}
}
combo.prototype.domouseout=function()
{
	window.event.cancelBubble = true;
	var ob = event.srcElement;
	if(ob.tagName=="TD")
	{
		//ob.parentElement.parentElement.className = "none";
		ob.style.border="1 solid #ffffff";
	}
}
combo.prototype.doclick=function(obclik)//??????????????
{
	var ob = event.srcElement;
	if(ob.tagName=="TD")
	{
		this.dropdown.style.display = "none";
		obclik.parentElement.previousSibling.children[0].value = ob.innerText;
		document.getElementsByName(this.cname)[0].value=ob.val;
		this.comboclick(ob.innerText,ob.parentElement.getAttribute("val"));
		//if(obclik.parentElement.previousSibling.children[0].onchange!=null)
			//obclik.parentElement.previousSibling.children[0].onchange();
			obclik.parentElement.previousSibling.children[0].fireEvent("onchange");
			document.getElementsByName(this.cname)[0].fireEvent("onchange");
	}
}
//??????????????
combo.prototype.setSelect=function(value,enableEvent)
{
	var tbl = this.tbl;
	var hasval=0;
	var ob=document.getElementsByName("s_"+this.cname)[0];
		for(var i=0;i<tbl.rows.length;i++)
		{
			if(tbl.rows[i].cells[0].val == value)
			{
				ob.value = tbl.rows[i].cells[0].innerText;
				document.getElementsByName(this.cname)[0].value=tbl.rows[i].cells[0].val;
				if(enableEvent){
					document.getElementsByName(this.cname)[0].fireEvent("onchange");
					ob.fireEvent("onchange");
				}
				hasval=1;
				break;
			}

		}
		this.dropdown.style.display = "none";
		if(!hasval)
		{
			ob.value = "";
			document.getElementsByName(this.cname)[0].value="";
		}
}

combo.prototype.showdown=function(ob)
{
	ob.select();
	this.dropdown.style.display = (this.dropdown.style.display=="block")?"none":"block";
}
combo.prototype.addline=function(str,val)//??????
{
	var ob = this.tbl;
	var row = ob.insertRow();
	var cell = row.insertCell();
	cell.style.border="1 solid #ffffff";
	cell.noWrap=true;
	//cell.innerHTML = '<label style="width:'+(this.width-20)+';overflow:hidden;white-space:nowrap;text-overflow:ellipsis" title="'+str+'">'+str+'</label>';
	
	if(strTrim(str)==""){
		cell.innerHTML ='<br>';
	}else{
		cell.innerHTML = str;
	}
	cell.setAttribute("val",val);
	if(this.originvalue==val)
	ob.parentElement.previousSibling.children[0].value =str;
}
combo.prototype.delline=function(val)//É¾³ýÐÐ
{
	var ob = this.tbl;
	var row;
	for(var i=0;i<ob.rows.length;i++){
		row = ob.rows[i];
		if(row.cells[0].getAttribute("val")==val){
			ob.deleteRow(row.rowIndex);
			break;
		} 
	}
}
 function strTrim(){
	if(arguments.length<1)
		return null;
	if(typeof(arguments[0])=="string")
		return arguments[0].replace(/(^\s*)|(\s*$)/g, "");
	else
		return "";
}	
combo.prototype.comboclick=function(str,val)
{}
combo.prototype.getList=function()//????????????????????????
{
	var arr=new Array();
	for(var i=0;i<this.tbl.rows.length;i++)
		{
		var otd=this.tbl.rows[i].cells[0];
		arr.push({"value":otd.val,"text":otd.innerText});
		}
	var sel={"options":arr};
	return sel;
}
combo.prototype.delAllLine=function()//??????????
{
	var ob = this.tbl;
	var oChild=ob.children(0);	
    ob.removeChild(oChild);
}
combo.prototype.disable=function(val)//????????????
{
	document.getElementsByName("s_"+this.cname)[0].disabled=val;
	document.getElementsByName("b_"+this.cname)[0].disabled=val;
}
combo.prototype.getValue=function()//????comb????????
{
	return document.getElementsByName(this.cname)[0].value;
}
combo.prototype.getText=function()//????comb????????
{
	return 	document.getElementsByName("s_"+this.cname)[0].value;
}
combo.prototype.setHidden=function(value)//????????????
{
	if(value){
		document.getElementById("_"+this.cname+"_").style.display="none";
	}else{
		document.getElementById("_"+this.cname+"_").style.display="inline";
	}
}
combo.prototype.getDivAll=function()//??????????div
{
	return document.getElementById("_"+this.cname+"_");
}
combo.prototype.combWidth=function()//????????
{
	var tbl = this.tbl;
	var len=120;
	for(var i=0;i<tbl.rows.length;i++)
		{
			if(tbl.rows[i].cells[0].innerText.length>len)
			{
				len=tbl.rows[i].cells[0].innerText.length;
			}
		}
	document.getElementsByName("s_"+this.cname)[0].size=len;
	return len;
}