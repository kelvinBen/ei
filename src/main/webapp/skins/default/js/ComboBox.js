/*
 *	ComboBox
 *	By Jared Nuzzolillo
 *
 *	Updated by Erik Arvidsson
 *	http://webfx.eae.net/contact.html#erik
 *	2002-06-13	Fixed Mozilla support and improved build performance
 *
 */
Global_run_event_hook = true;
Global_combo_array    = new Array();
function ComboBox(objectName,inputName,asyn,cmd)
{
    if(arguments.length==0)
    {
        self.status="ComboBox invalid - no name arg"
    }

    this.name     = inputName;
   // this.view     = container;
    this.inputName = inputName;
    //this.view.style.position='absolute';
    this.options  = new Array();
    this.expops   = new Array();
    this.value    = ""

    this.build  = ComboBox_build;
    this.make   = ComboBox_make;
    this.choose = ComboBox_choose;
    this.add    = ComboBox_add;
    this.toggle = ComboBox_toggle;
    this.update = ComboBox_update;
    this.remove = ComboBox_remove;

	//新添加
	this.asyn=asyn;
	this.cmd = cmd;
	this.currentSelect=-1;
	this.select = ComboBox_Select;
	this.cancelSelect = ComboBox_CancelSelect;
	this.setValue = setValue;
	this.temp="";
	this.isShow=false;

	//over

    this.make();
    //this.txtview = this.view.childNodes[0].childNodes[0];
    this.txtview = document.all(inputName+"_txt");
   // this.valcon  = this.view.childNodes[0].childNodes[1];
    this.valcon  = document.all(inputName);
    this.txtview.attachEvent("onblur", function () { ComboBox_blur(window.event); } );
	this.txtview.attachEvent("onclick", function () { (event.target ? event.target : event.srcElement).select();} );
	//this.setDefaultValue(initValue);
    Global_combo_array[Global_combo_array.length]=this;
    if(Global_run_event_hook){ComboBox_init()}
}


Array.prototype.remove=function(dx)
{ 
    if(isNaN(dx)||dx>this.length){self.status='Array_remove:invalid request-'+dx;return false;}
    for(var i=0,n=0;i<this.length;i++)
    {  
        if(this[i]!=this[dx])
        {
            this[n++]=this[i];
        }
    }
    this.length-=1;
}

function ComboBox_make()
{
	document.write('<input type="text" name="'+this.inputName+'_txt" id="'+this.inputName+'_txt" class="combo-input">');
	document.write('<input type="hidden" name="'+this.inputName+'">');
	document.write('<BUTTON name="'+this.inputName+'_button" class="combo-button">6</button>');
	document.write('<div class="combo-list" style="display:none" id="'+this.inputName+'combo-list"></div>');
	var buttontmp = document.all(this.inputName+"_button");
	buttontmp.className = "combo-button";
	buttontmp.onfocus = function () { this.blur(); };
	buttontmp.onclick = new Function ("", this.name + ".toggle()");
	this.opslist = document.all(this.inputName+"combo-list");
    this.opslist.style.display='none';
    this.opslist.className = "combo-list";
    this.opslist.onselectstart=returnFalse;
}

function ComboBox_choose(realval,txtval,helpCode)
{
    this.value = realval;
    //var samstring = this.name+".txtview.value='"+txtval+"'";
    //window.setTimeout(samstring,1);
    this.txtview.value = txtval;
    this.valcon.value  = realval;
	this.temp=helpCode;
	this.isShow=false;
	//alert(this.valcon.value);
}

function ComboBox_mouseDown(e)
{
    var obj,len,el,i,strname;
    el = e.target ? e.target : e.srcElement;
    while (el.nodeType != 1) el = el.parentNode;
    var elcl = el.className;
    len=Global_combo_array.length;
    if(elcl.indexOf("combo-")!=0)
    {		
        for(i=0;i<len;i++)
        {
        
            curobj = Global_combo_array[i];
            
            if(curobj.opslist)
            {
                curobj.opslist.style.display='none';
            }
        }
    }else{
    	if(Global_combo_array.length>1){
    		if(el.tagName=="BUTTON"){
    			strname = el.name.split("_button")[0];
    		}else if(el.tagName=="INPUT"){
    			strname = el.id.split("_txt")[0];
    		}else{return;}
            obj = window[strname];
            for(i=0;i<len;i++)
        	{   
            curobj = Global_combo_array[i];            
            if(curobj!=obj&&curobj.opslist!=null)
            {
                curobj.opslist.style.display='none';
            }
        }
    	}
    }
}

function ComboBox_handleKey(e)
{
	var key,obj,eobj,el,strname;
    eobj = e;
    key  = eobj.keyCode;
    el = e.target ? e.target : e.srcElement;
    while (el.nodeType != 1) el = el.parentNode;
    elcl = el.className;
    if(elcl.indexOf("combo-")==0)
    {
        if(elcl.split("-")[1]=="input")
        {
			strname = el.id.split("_txt")[0];
            obj = window[strname];
			if(key==38||key==40){
				obj.select(key);
				return ;
			}
			if(key==13){obj.opslist.style.display='none';return;}
            obj.expops.length=0;
            obj.update(true);
            if(!obj.asyn){
            	obj.temp=obj.valcon.value;
            }
			//obj.temp=obj.valcon.value;
            obj.build(obj.expops);
            if(obj.expops.length==1&&(obj.expops[0].text=="(No matches)"||(obj.expops[0].helpCode!=null&&obj.expops[0].helpCode.toLowerCase()==obj.txtview.value.toLowerCase())||(obj.expops[0].text!=null&&obj.expops[0].text.toLowerCase()==obj.txtview.value.toLowerCase()))){
				if((obj.expops[0].helpCode!=null&&obj.expops[0].helpCode.toLowerCase())==obj.txtview.value.toLowerCase()||(obj.expops[0].text!=null&&obj.expops[0].text.toLowerCase()==obj.txtview.value.toLowerCase())){	
					obj.choose(obj.expops[0].value,obj.expops[0].text,obj.expops[0].helpCode);
				}else{
					obj.choose("",obj.txtview.value,obj.expops[0]);
				}
			}//empty
            else if(obj.expops.length>0){if(!obj.isShow){showList(obj);obj.isShow=true;}obj.opslist.style.display='block';}
            else{obj.opslist.style.display='none';};
            obj.value = el.value;
        }

     }
}

function ComboBox_update(flag)
{
	if(this.asyn){
		var value ="";
		if(flag)value = this.txtview.value;
		getArrayByXmlHttp(this,value);
	}else{
	    var opart,astr,alen,opln,i,boo;
	    boo=false;
	    opln = this.options.length;
	    astr = this.txtview.value.toLowerCase();
	    alen = astr.length;
		if(flag==false)alen=0;
		var index;
	    if(alen==0)
	    {
	        for(i=0;i<opln;i++)
	        {
	            this.expops[this.expops.length]=this.options[i];boo=true;
	        }
	    }
	    else
	    {
	    	//document.all.gao.value=document.all.gao.value+"\n";
	        for(i=0;i<opln;i++)
	        {
	        	//document.all.gao.value=document.all.gao.value+flag+" ";
	            opart=this.options[i].helpCode.toLowerCase().substring(0,alen);
				if(this.temp==this.options[i].helpCode.toLowerCase())index=i;
	            if(opart==astr)
	            {
	                this.expops[this.expops.length]=this.options[i];boo=true;
	            }
	        }
	        
	    }
	    if(!boo&&index==null){this.expops[0]=new ComboBoxItem("(No matches)","");}
	    else if(!boo&&index!=null){this.expops[this.expops.length]=this.options[index];}
	    //document.all.gao.value=document.all.gao.value+this.expops.length;
	}
}


function ComboBox_remove(index)
{
    this.options.remove(index);
}

function ComboBox_add()
{
    var i,arglen;
    arglen=arguments.length;
    for(i=0;i<arglen;i++)
    {
        this.options[this.options.length]=arguments[i];
    }
}

function ComboBox_build(arr)
{
    var str,arrlen;
    arrlen=arr.length;
	//str='<div style="position:absolute;z-index:100;width:100%;height:100;overflow-y:auto;background:white;border:1 solid dimgray;filter:progid:DXImageTransform.Microsoft.Shadow(color=#666666, Direction=135, Strength=3);"><iframe width="100%" scrolling=no frameborder="0" height="100%" style="top:-1;position:absolute;z-index:-1;"></iframe>';
    str = '<table class="combo-list-width" cellpadding=0 cellspacing=0>';
    var strs = new Array(arrlen);
    for(var i=0;i<arrlen;i++)
    {
        strs[i] = '<tr>' +
			'<td class="combo-item" onClick="window.'+this.name+'.choose(\''+arr[i].value+'\',\''+arr[i].text+'\');window.'+this.name+'.opslist.style.display=\'none\';"' +
			'onMouseOver="window.'+this.name+'.cancelSelect();this.className=\'combo-hilite\';" onMouseOut="this.className=\'combo-item\'" >&nbsp;'+arr[i].text+'&nbsp;</td>' +
			'</tr>';
    }
    str = str + strs.join("") + '</table>'
    
    if(this.opslist.innerHTML!=""){ this.currentSelect=-1}  
    this.opslist.innerHTML=str; 
    this.opslist.style.display='none';
}

function ComboBox_toggle()
{
    if(this.opslist)
    {
        if(this.opslist.style.display=="block")
        {
            this.opslist.style.display="none";
        }
        else
        {
            if(this.asyn){
            	this.expops.length=0;
            	this.update(false);
            	this.build(this.expops);
            }else{
            	this.update(false);
            	this.build(this.options);
            }
            //this.view.style.zIndex = ++ComboBox.prototype.COMBOBOXZINDEX;
          	if(this.expops.length>0){
	            showList(this);
	            this.opslist.style.display="block";
          	}
        }
    }
    else
    {
        this.update(false);
        this.build(this.options);
        //this.view.style.zIndex = ++ComboBox.prototype.COMBOBOXZINDEX;
        this.opslist.style.display="block";
    }
}

function ComboBox_CancelSelect(){
	if(this.currentSelect>=0&&this.opslist!=null&&this.currentSelect<(this.opslist.childNodes[0].rows.length-1)){
		this.opslist.childNodes[0].rows[this.currentSelect].childNodes[0].className="combo-item";
	}	
}

function ComboBox_Select(code){
	if(this.opslist==null)return;
	var length = this.opslist.childNodes[0].rows.length-1;
	if(code==38){
		if(this.currentSelect<0){
			this.currentSelect =length;
			this.opslist.childNodes[0].rows[this.currentSelect].childNodes[0].className="combo-hilite";
			this.choose(this.expops[this.currentSelect].value,this.expops[this.currentSelect].text,this.expops[this.currentSelect].helpCode);
		}else{
			if(this.currentSelect<=length){
			this.opslist.childNodes[0].rows[this.currentSelect].childNodes[0].className="combo-item";
			}
			this.currentSelect = this.currentSelect-1;
			if(this.currentSelect>=0){
			this.opslist.childNodes[0].rows[this.currentSelect].childNodes[0].className="combo-hilite";
			this.choose(this.expops[this.currentSelect].value,this.expops[this.currentSelect].text,this.expops[this.currentSelect].helpCode);
			}
		}
	}else if(code==40){
		if(this.currentSelect>length){
			this.currentSelect =0;
			this.opslist.childNodes[0].rows[this.currentSelect].childNodes[0].className="combo-hilite";
			this.choose(this.expops[this.currentSelect].value,this.expops[this.currentSelect].text,this.expops[this.currentSelect].helpCode);
		}else{
			if(this.currentSelect>=0){
			this.opslist.childNodes[0].rows[this.currentSelect].childNodes[0].className="combo-item";
			}
			this.currentSelect = this.currentSelect+1;
			if(this.currentSelect<=length){
			this.opslist.childNodes[0].rows[this.currentSelect].childNodes[0].className="combo-hilite";
			this.choose(this.expops[this.currentSelect].value,this.expops[this.currentSelect].text,this.expops[this.currentSelect].helpCode);
			}
		}
	}else{}
}


ComboBox.prototype.COMBOBOXZINDEX = 1000 //change this if you must

function ComboBox_init() 
{
	if (document.addEventListener) {
		document.addEventListener("keyup", ComboBox_handleKey, false );
		document.addEventListener("mousedown", ComboBox_mouseDown, false );
	}
	else if (document.attachEvent) {
		document.attachEvent("onkeyup", function () { ComboBox_handleKey(window.event); } );
		document.attachEvent("onmousedown", function () { ComboBox_mouseDown(window.event); } );
	}
	
    Global_run_event_hook = false;
}

function ComboBox_blur(e){
	var el = e.target ? e.target : e.srcElement;
	var elValue = el.value;
	var value = el.nextSibling.value;
	if(value!=null&&value!=""&&elValue!=null&&elValue!=""){
		var boo = true;
		var strname = el.id.split("_txt")[0];
		var obj = window[strname];
		var opln = obj.options.length;
		if(obj.asyn){
			getArrayByXmlHttp(obj,obj.temp);
			opln = obj.expops.length;
			for(i=0;i<opln;i++)
	        {
	            if(elValue==obj.expops[i].text&&value==obj.expops[i].value)
	            {
					boo=false;
					break;
	            }
	        }
		}else{
			for(i=0;i<opln;i++)
	        {
	            if(elValue==obj.options[i].text&&value==obj.options[i].value)
	            {
					boo=false;
					break;
	            }
	        }
		}
		if(boo){
			el.value="";
			el.nextSibling.value="";
		}

	}else{
		el.value="";
		el.nextSibling.value="";
	}
}
function returnFalse(){return false;}

function ComboBoxItem(text,value,helpCode)
{
    this.text  = text;
    this.value = value;
	this.helpCode = helpCode
}
function setValue(initvalue){
	if(this.asyn){
		this.valcon.value = initvalue;
		//this.txtview.value = initvalue;
		var values=getHtmlStringByXmlhttp(this.cmd+initvalue+"&type=id");
	 	if(values=="")return;
	 	if(values.indexOf("@,@")<0)return ;
    	if(values.indexOf("没有记录")>-1){
       		return -1;
     	}
	 	var obs=values.split("@|@");
	 	var obsv = obs[0].split("@,@");	;	
	 	this.temp =  obsv[2];
	 	this.txtview.value=obsv[0];
	 	this.expops[this.expops.length]=new ComboBoxItem(obsv[0],obsv[1],obsv[2]);
	 			 	
	}
	else{
		this.valcon.value = initvalue;
		var opln = this.options.length;
		for(i=0;i<opln;i++)
	    {
	        if(initvalue==this.options[i].value)
	        {
				this.txtview.value = this.options[i].text; 
				break;
	        }
	    }
	}
}
function showList(cobject)
	{
	var odiv=cobject.opslist;
	if(odiv==null) return;
	var obj=cobject.txtview;
	var otop=20;
	var oleft=0;
	var alph=0;
	while(obj!=null&&obj!=odiv.offsetParent){
		otop+=obj.offsetTop;
		oleft+=obj.offsetLeft;
		obj=obj.offsetParent;
		if(obj!=null&&obj.tagName=="TD")
			alph=1;
		}
	odiv.style.top=otop+alph;
	odiv.style.left=oleft+alph;
	odiv.style.display="block";
	/*
	var scr
	if(obj==document.body){
		scr=(odiv.offsetTop+odiv.offsetHeight)-(document.body.scrollTop+document.body.clientHeight);
		if(scr>0)			
			window.scrollBy(0,scr);
	}else{
		if(obj.scrollHeight>obj.clientHeight){
			obj.scrollTop=odiv.offsetTop+odiv.offsetHeight;
		}else{
			scr=(odiv.offsetTop+odiv.offsetHeight)-(document.body.scrollTop+document.body.clientHeight);
			var temp = obj;
			var size =0;
			while(temp!=null&&temp!=document.body){
				size += temp.offsetTop;
				temp = temp.offsetParent;
			}
			scr +=size;
			if(scr>0){
				window.scrollBy(0,scr);
			}
		}
	}
	*/
}
//document.write('<link rel="STYLESHEET" type="text/css" href="ComboBox.css">')

function getArrayByXmlHttp(obj,value){
	 var values=getHtmlStringByXmlhttp(obj.cmd+value);
	 if(values=="")return;
	 if(values.indexOf("@,@")<0)return ;
     if(values.indexOf("没有记录")>-1){
       return -1;
     }
	 var obs=values.split("@|@");	 
	 for(var i=0;i<obs.length;i++){	 
	 	 obsv=obs[i].split("@,@");	
	 	 obj.expops[obj.expops.length]=new ComboBoxItem(obsv[0],obsv[1],obsv[2]);		 	
	 } 
	 return obj.expops;
}


/**
* XMLHTTP 提交
**/
//通过xmlhttp取值，返回字符串
function getHtmlStringByXmlhttp(url)
	{
	if(url==null)
	{
	alert("传递的URL不能为空！");
	return;
	}
	try
		{
		var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		if(xmlhttp==null)
		{
		alert("创建XMLHTTP对象失败!"+ex.description);
		return ;
		}
		xmlhttp.open("POST",url,false);
		xmlhttp.send();
		return xmlhttp.responseText;
		}catch(ex)
		{
		alert("XMLHTTP对象传递数据失败!"+ex.description);
		return "";
		}
	}
	
function test(obj) { 
    // 用来保存所有的属性名称和值 
    var props = ""; 
    // 开始遍历 
    for(var p in obj){  
            props+= p + "=" + obj[p] + "\t";   
    }  
    // 最后显示所有的属性 
    alert(props); 
}
	