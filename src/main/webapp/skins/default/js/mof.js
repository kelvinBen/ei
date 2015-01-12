/*****************************************************\
*                                  	                 *
*      元数据系统javascript函数   	                     *	
*                                                    *
*      主要功能:元数据定制页面公用的js函数                 *
*                                                    *
*      作   者:                                       *
*                                                    *
*      版  本:        2009-2-23               		 *
*                                                    *
\*****************************************************/

/*
 * ================术语列表：================
 * MofWindow		元数据窗口;该JS文件中特指元数据窗口在前台页面的展示实例
 * MofTab			元数据窗口包含的子对象，简称窗口Tab;该JS文件中特指元数据窗口Tab在前台页面的展示实例
 * MofField			元数据窗口Tab包含的子对象,简称窗口域;该JS文件中特指元数据窗口域在前台页面的展示实例
 * HtmlTab			指框架Web组件中的Tab标签
 * HtmlCard			指框架Web组件中的Tab标签子元素Card标签
 * WindowContainer	指页面中包含MofWindow页面展示实例的Html元素,一般是框架Web组件的Container标签
 * TabContainer		指页面中包含MofTab页面实例的Html元素,一般是框架Web组件的HtmlCard标签或者Html的FieldSet标签
 * FieldContainer	指页面中包含MofTab页面实例的Html元素,一般是Html的TD标签  
 * ========================================
 * 
 * ================函数列表：================ 
 * ----------------系统公用函数--------------
 * String.prototype.byteLength		计算包含双字节的字符串字节长度
 * String.prototype.exactByteLength 精确计算字符串字节长度
 * CNbyteLength(str)				计算包含汉字的字符串字节长度
 * joinForm()						将页面中所有输入域转换成URL,用GET方式提交
 * joinForm()	                    2007-08-27修改该方法，只将页面中的primaryKey输入域转换成URL,用GET方式提交 
 * openDialog(url,ls,features)		根据给定的url,弹出帮助窗口
 * openWindow(url,ls,name,features)	根据给定的url,弹出帮助窗口
 * forwardForm(url)					提交当前页面并导向到指定页面
 * disableButton(condition)			提交后按钮变灰，防止重复提交 
 * ----------------元数据页面对象操作函数--------------
 * displayMofTab(tab,cardName,MofTabContainerId,isDisplay)设置MofTab可视性
 * getTabContainer(form,tabName)					获取某MofTab所在Card对象或者legend对象
 * hiddenTabContainer(form,tabName,isHidden)	设置某Tab容器隐藏
 * disableTabContainer(form,Htmltab,tabName,isdisabled) 禁用某Tab容器
 * setWindowContainerTitle(value)				设置WindowContainer的标题
 * hiddenWindowContainerTitle(isHidden)			隐藏WindowContainer的标题栏
 * setHtmlCardTitle(htmlTab,tabName,value)		设置MofTab所在的HtmlCard的标题
 * showTab(htmlTab,tabName)						使包含某MofTab的HtmlCard为当前展示页
 * getFieldValue(form,tabName,fieldName)		获取某域的值	 
 * setFieldValue(form,tabName,fieldName,value)	设置某域的值
 * getFieldContainer(form,tabName,fieldName)	获取该域的表格TD
 * setFieldTitle(form,tabName,fieldName,value)	设置域标题
 * setFieldHidden(form,tabName,fieldName,isHidden) 设置某域所在TD的显示隐藏
 * setFieldRowHidden(form,tabName,fieldName,isHidden) 设置某域所在TR的显示隐藏
 * ==========================================
 */

/**
 * 计算包含双字节的字符串字节长度.
 * 计算规则：编码255之后按双字节字符来计算
 * @author lichd
 * @return 字符串实际字节长度 
 * @example "haha哈哈".byteLength()
 */
String.prototype.byteLength=function(){
	return this.replace(/[^\x00-\xff]/g,"aa").length;
} 

/**
 * 精确计算字符串字节度
 * 计算规则： 可以处理单字节,双字节,以及多字节和非法字节(2.5字节)
 * @author lichd
 * @return	字符串实际字节长度
 * @example "haha哈哈".exactByteLength()
 */
String.prototype.exactByteLength = function()
{
  var intCount = 0;
  for(var i = 0;i < this.length;i ++)
    {
      //将字符转换成16进制数
      var ascii = this.charCodeAt(i).toString(16);
      //判断16进制数位数，例如0xAD00表明是个双字节字符
      var byteNum = ascii.length / 2.0;
      intCount += (byteNum + (ascii.length % 2) / 2);
    }
  return intCount;
}

/**
 * 获得字符串的长度.
 * 规则:一个汉字占2个字节
 * @author lichd 
 * @param str	需要检查字节长度的字符串
 * @return      字符串实际字符长度
 * @example CNbyteLength("haha哈哈")
 */
function CNbyteLength(str)
{
	var re=/[\u4E00-\u9FA5]/g;
	if(re.test(str))
    return str.length+str.match(re).length;
	else return str.length;

}

/**
 * 将页面中所有输入域转换成URL,用GET方式提交
 * @author jiadx 
 * @return   页面输入域拼接成的字符串
 */
function joinForm(){
    var str = "";
    for(i = 0; i < document.forms[0].all.length; i++){
      var ele = document.forms[0].all(i);
      var type = ele.type;
      if(type=="checkbox"||type=="radio"){
      		if( ele.checked) str=str+ele.name + "="+ele.value+"&";
      }else if(type=="hidden" || type=="text" || ele.tagName=="SELECT"){
				str=str+ele.name + "="+ele.value+"&";
			}
	  }
//下面是对joinForm进行修改，只将页面中的primaryKey输入域转换成URL,用GET方式提交	  
var start= str.indexOf("primaryKey");
if(start>0){
var end=str.indexOf("&",start);
str=str.substring(start,end);
	  return str;
}else return "";
	 
}

/**
 * 根据给定的url,弹出帮助窗口
 * @author jiadx 
 * @param	url:需要弹出窗口的url地址
 * @param	ls :url分割符号,如果url包含?符号则使用&分割,如果不包含?分割符号,则使用?分割符号
 * @param	features:窗口定制参数
 * @example	openDialog("getWindow.cmd?method=getWinList","&","scroll:auto;status:no;dialogWidth:400px;dialogHeight:300px")	
 */
function openDialog(url,ls,features){
    url = url+ls+joinForm();
    //alert(url);
    showModalDialog(url,window,features);
}

/**
 * 根据给定的url,弹出帮助窗口
 * @author jiadx
 * @param	url:需要弹出窗口的url地址
 * @param	ls :url分割符号,如果url包含?符号则使用&分割,如果不包含?分割符号,则使用?分割符号
 * @param	name:指定窗口名
 * @param	features:窗口定制参数
 * @example	openWindow("getWindow.cmd?method=getWinList","&","WinHelp","scroll:auto;status:no;titlebar:no; menubar:no;location:nowidth:800px;height:600px")	
 */
function openWindow(url,ls,name,features){
    url = url+ls+joinForm();
    window.open(url,name,features);
}

/**
 * 提交当前页面并导向到指定页面
 * @author jiadx 
 * @param	url:要导向的页面
 * @return	
 * 
 * @example forwardForm("Custom.cmd?method=update&isInit=true")
 */
function forwardForm(url){
   document.forms[0].action=url;
   document.forms[0].target="_self";
   document.forms[0].submit();
}

/**
 * 提交后按钮变灰，防止重复提交 * 
 * @author lichd 
 * @param	condition:按钮变灰的条件
 * @return	设置成功与否
 * @example	diableButton(true)
 */
function disableButton(condition) {
   var canDisable = (window.event != null && window.event.srcElement != null && window.event.srcElement.tagName.toLowerCase() == "button");
   if (canDisable&&condition) {
    window.event.srcElement.disabled = true;
    return true;
   }
   return false;
   }
   
/**
 * 功能:设置MofTab可视性 *
 * @author lichd  
 * @param	tab					:MofTab所在的htmlTab对象
 * @param	cardName			:htmlCard对象的CardId
 * @param	MofTabContainerId	:MofTab的外部容器Id,比如fieldSet对象ID
 * @param	isDisplay			:是否显示
 * @return	成功与否 * 
 * @example displayMofTab(tab1,null,"fieldSet_address",true)
 */
function displayMofTab(tab,cardName,MofTabContainerId,isDisplay) {
	if(tab&&cardName){
		tab.doCardShow(cardName);
	}
    var container=document.getElementById(MofTabContainerId);
    if(container){
    	if(isDisplay)
     	 container.style.display="block";
     	else
     	 container.style.display="none";
     	 return true;
    }
    return false;
}
/**
 * 获取MofTab所在的容器，如果HtmlCard中只有一个MofTab则返回该Card对象，否则返回Card中包含该MofTab的fildSet 
 * @author lichd 
 * @param	form	:MofTab所在的form对象
 * @param	tabName		:MofTab名称
 * @return	MofTabContainer * 
 * @example getTabContainer(document.forms[0],"POrder").id
 */
function getTabContainer(form,tabName) {
	var fieldset=document.getElementById("fieldset_"+tabName);
	if(fieldset){
		return fieldset;
	}else{
		return document.getElementById(tabName);
	}
}

/**
 * 设置某Tab容器隐藏
 * @author lichd  
 * @param	form	:MofTab所在的form对象
 * @param	Htmltab	:MofTab所在的HtmlTab对象
 * @param	tab		:MofTab名称
 * @param	isHidden:是否隐藏
 * @return	成功与否 
 * @example hiddenTabContainer(document.forms[0],tab1,"Order",true)
 */
 function hiddenTabContainer(form,Htmltab,tabName,isHidden){
 	var container=document.getElementById("fieldset_"+tabName);
	if(container){
     	if(isHidden){
     		container.style.display="none";
     		if(Htmltab)
     	 	  Htmltab.doCardShow(Htmltab.getCurrentCardId());
     	}
     	else{
     		container.style.display="block";
     		}
     	return true;
	}else{
		container=document.getElementById(tabName);
		if(Htmltab){
 			if(isHidden){
     	 		Htmltab.hideCard(container.id);
 			}else{
 		 		Htmltab.showCard(container.id);
 			}
		return true;
		}
	}
	return false;
 }
 /**
 * 设置某Tab容器禁用,防止其中内容提交 
 * @author lichd 
 * @param	form	:MofTab所在的form对象
 * @param	Htmltab	:MofTab所在的HtmlTab对象
 * @param	tab		:MofTab名称
 * @param	isdisabled:是否禁用
 * @return	成功与否 
 * @example disableTabContainer(document.forms[0],tab1,"Order",true);
 */
 function disableTabContainer(form,Htmltab,tabName,isdisabled){
 	var container=document.getElementById("fieldset_"+tabName);
	if(container){
     	if(isdisabled){
     		container.disabled=true;
     	}
     	else{
       		container.disabled=false;
     	}
		return true;
	}else{
		container=document.getElementById(tabName);
		if(Htmltab){
 			if(isdisabled){
     	 		Htmltab.disableCard(container.id);
 			}
 		return true;
		}
	}
	return false;
 }
 

  /**
  *	设置WindowContainer的标题
  * @author lichd 
  * @param	value	:要设置的Container标题
  * @return	设置成功与否 
  * @example setWindowContainerTitle("测试标题")
  */
 function setWindowContainerTitle(value){
 	var winContainerText=document.getElementById("tdHeadlineText");
 	if(winContainerText){
 		winContainerText.innerText=value;
 		return true;
 	}
 	return false;
 }	
 
 /**
  *	隐藏WindowContainer的标题栏
  * @author lichd 
  * @param	isHidden	:是否要隐藏
  * @return	设置成功与否 
  * @example hiddenWindowContainerTitle(true)
  */
 function hiddenWindowContainerTitle(isHidden){
 	var winContainerTitle=document.getElementById("tblHead");
 	if(winContainerTitle){
 		if(isHidden)
 			winContainerTitle.style.display='none';
 		else{
 			winContainerTitle.style.display="block";
 		}
 		return true;
 	}
 	return false;
 }	
 
  /**
  *	设置MofTab所在的HtmlCard的标题 
  * @author lichd 
  * @param	htmltab	:MofTab所在的HtmlTab对象
  * @param	tabName	:MofTab名称
  * @param	value	:要设置的Container标题
  * @return	设置成功与否 
  * @example setHtmlCardTitle(tab1,"Order","测试改名")
  */
 function setHtmlCardTitle(htmlTab,tabName,value){
 	var tabHead=htmlTab.getCardHeadObj();
 	var carId=tabName;
 	var container=document.getElementById("fieldset_"+tabName);
	if(container){
     	carId=container.parentElement.id;
	}
 	var index=htmlTab.getCardIndex(carId);
 	if(tabHead&&parseInt(index)!=NaN){
 		tabHead.cells[index].innerText=value;
 		return true;
 	}
 	return false;
 }	
 
 /**
  * 使包含某MofTab的HtmlCard为当前展示页	 
  * @author lichd 
  * @param	htmltab	:MofTab所在的HtmlTab对象
  * @param	tabName	:MofTab名称
  * @return	设置成功与否 
  * @example showTab(tab1,"ext")
  */
 function showTab(htmlTab,tabName)	{
 	var carId=tabName;
 	var container=document.getElementById("fieldset_"+tabName);
	if(container){
     	carId=container.parentElement.id;
	}
 	if(htmlTab){
 		htmlTab.doCardShow(carId);
 		return true;
 	}
 	return false;
 }
 
  /**
  * 获取某域的值	
  * @author lichd  
  * @param	form	:MofTab所在的form对象
  * @param	tabName	:MofTab名称
  * @param	filedName:窗口域名称
  * @return	改窗口域的值 
  * @example getFieldValue(document.forms[0],"Order","address")
  */
 function getFieldValue(form,tabName,fieldName)	{
 	if(form[tabName+"_"+fieldName])
 		return form[tabName+"_"+fieldName].value;
 }
 
  /**
  * 设置某域的值
  * @author lichd 	 
  * @param	form	:MofTab所在的form对象
  * @param	tabName	:MofTab名称
  * @param	filedName:窗口域名称
  * @param	value:要设置的窗口域的值
  * @return	设置成功与否 
  * @example setFieldValue(document.forms[0],"Order","address","山大路224号")
  */
 function setFieldValue(form,tabName,fieldName,value)	{
 	if(form[tabName+"_"+fieldName]){
 		form[tabName+"_"+fieldName].value=value;
 		return true;
 	}
	return false;
 }
  /**
  * 获取该域的表格TD 
  * @author lichd 
  * @param	form	:MofTab所在的form对象
  * @param	tabName	:MofTab名称
  * @param	filedName:窗口域名称
  * @param	value:要设置的窗口域的值
  * @return	设置成功与否 
  * @example getFieldContainer(document.forms[0],"Order","address").tagName
  */
 function getFieldContainer(form,tabName,fieldName)	{
 	if(form[tabName+"_"+fieldName])
 		return form[tabName+"_"+fieldName].parentElement;
 }
 /**
  * 设置域标题	
  * @author lichd  
  * @param	form	:MofTab所在的form对象
  * @param	tabName	:MofTab名称
  * @param	filedName:窗口域名称
  * @param	value:要设置的窗口域标题的值
  * @return	设置成功与否 
  * @example setFieldTitle(document.forms[0],"Order","address","地址 :")
  */
 function setFieldTitle(form,tabName,fieldName,value){
 	if(form[tabName+"_"+fieldName]){
 		var titleObj=form[tabName+"_"+fieldName].parentElement.previousSibling;
 		if(titleObj){
 			titleObj.innerText=value;
 			return true;
 		}
	 }
	 return false;
 }
 /**
  * 设置某域所在TD的显示隐藏	
  * @author lichd 
  * @param	form	:MofTab所在的form对象
  * @param	tabName	:MofTab名称
  * @param	filedName:窗口域名称
  * @param	isHidden:是否隐藏
  * @return	设置成功与否 
  * @example setFieldHidden(document.forms[0],"Order","address",true)
  */
 function setFieldHidden(form,tabName,fieldName,isHidden){
 	if(form[tabName+"_"+fieldName]){
 		var containerObj=form[tabName+"_"+fieldName].parentElement;
 		var titleObj=null;
 		if(containerObj){
 			titleObj=containerObj.previousSibling;
 			if(isHidden){
 				containerObj.style.display='none'; 
 				if(titleObj)
 					titleObj.style.display='none'; 		
 			}else{
 				containerObj.style.display='block';
 				if(titleObj)
 					titleObj.style.display='block'; 
 			}
 			return true;
	 	}
 	}
	 return false;
 }
 /**
  * 设置某域所在TR的显示隐藏	
  * @author lichd 
  * @param	form	:MofTab所在的form对象
  * @param	tabName	:MofTab名称
  * @param	filedName:窗口域名称
  * @param	isHidden:是否隐藏
  * @return	设置成功与否 
  * @example setFieldRowHidden(document.forms[0],"Order","address",true)
  */
 function setFieldRowHidden(form,tabName,fieldName,isHidden){
 	if(form[tabName+"_"+fieldName]){
 		var containerObj=form[tabName+"_"+fieldName].parentElement;
 		if(containerObj){
 			var parentObj=containerObj.parentElement;
 			if(parentObj&&isHidden){
 				parentObj.style.display='none'; 
 				return true;		
 			}else if(parentObj&&!isHidden){
 				parentObj.style.display='block';
 				return true;
 			}
	 	}
 	}
	 return false;
 }	

 /**
  * 功能:在grid里如果有图片列,图片显示成小图片,先按住Alt键,软后把鼠标放到图片上,图片就会显示原图.
  * @author gaofeng 
  */
function showImage(obj){
 	 
	if(!event.altKey){
		return;
	}
	var imgPosition = document.getElementById("imgPosition");
	
	
 	var last = obj.src.lastIndexOf("/");
	var imageName= obj.src.substring(last+1,obj.src.length);
	if(imageName=="default.jpg")
	{
		return;
	}
 
	imgPosition.style.top = event.clientY+20;
	imgPosition.style.left = event.clientX+30;
	imgPosition.innerHTML = "<img src=" + obj.src + ">"; 
	imgPosition.style.display = "block";
}
/**
 * 功能:和showImage(obj)相对,点击空白处,图片隐藏.
 * @author gaofeng 
 */
function hidImage(){
	document.getElementById("imgPosition").style.display = "none";
} 
 /**
  * 工作流选择发送
  * @author lichd
  * @param	action	:要执行的元数据动作:mofprocess.cmd?method=send
  * @param	actionTitle	:显示名称
  * @return	
  * @example selectAndSend("mofprocess.cmd?method=send","选择发送")
  */
function selectAndSend(action,actionTitle){
	var queueId=document.all("queueId").value;
	var url="moftaskinfo.cmd?method=getnextactivities&queueId="+queueId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:300px;status:no;scroll:no');
	if(obj==null)return;
	var sendAction=action;
	sendAction+="&operateType="+actionTitle;;
	sendAction+="&nextActivityName="+obj[0];
	sendAction+="&nextActivityDisName="+obj[1];
	sendAction+="&nextActivityPartyName="+obj[2];
	sendAction+="&nextActivityPartyDisName="+obj[3];
	

	window.event.srcElement.disabled = true;
	document.forms.item(0).action = sendAction;
	if(!document.forms.item(0).submit(true)){
		window.event.srcElement.disabled = false;
	}
		
	
} 
 /**
  * 根据organId获取organName	
  * @author lichd
  * @param	organId	:组织机构名称
  * @param	cus_method	:页面填充方法
  * @return	 
  * @example 
  */
 function getOragnNameHelp(d_form,form_name,organId,cus_method){
	var url = "multiselect.cmd?method=getOrganNameByOrganId&organId="+organId;
	d_form[form_name].value=organId;
	var organName=mofGetValueByXmlhttp(url);
	d_form[form_name+"_TEXT"].value=mofTrim(organName);
	eval(cus_method);
}
/**
 * 使用xmlhttp从后台获取数值
 */
function mofGetValueByXmlhttp(url)
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
 function mofTrim(){
	if(arguments.length<1)
		return null;
	if(typeof(arguments[0])=="string")
		return arguments[0].replace(/(^\s*)|(\s*$)/g, "");
	else
		return "";
}	
function searchCol_ShowHtml(otd){
	var tabtidivstr="";
	tabtidivstr+='<td nowrap width="'+otd.width+'" index="'+otd.index+'"><input type="hidden" id="'+otd.id+'" name="'+otd.name+'" value="'+otd.value+'">';
	tabtidivstr+='<input type="text"  style="width:70%;'+(otd.style=="undefined"?'':otd.style)+'" id="'+otd.id+'_TEXT" name="'+otd.name+'_TEXT" ';
	tabtidivstr+=' value="'+otd.labelValue+'" ';
	tabtidivstr+=prepareEventString(otd);
	tabtidivstr+='><img src="'+otd.imageurl+'" style="cursor:hand;" border="0"';
	if(typeof otd.imageclick!="undefined")
		tabtidivstr+=' onclick="'+otd.imageclick+'"';
	if(typeof otd.imagedbclick!="undefined")
		tabtidivstr+=' ondbclick="'+otd.imagedbclick+'"';
	tabtidivstr+='>';
	return tabtidivstr;
}
function fileCol_ShowHtml(otd){
	var tabtidivstr="";
	tabtidivstr+='<td nowrap width="'+otd.width+'" index="'+otd.index+'">';
	if(otd.fileHtml){
		tabtidivstr+=otd.fileHtml;
	}else{
		tabtidivstr+='<input type="file" id="'+otd.id+'" name="'+otd.name+'"';
		tabtidivstr+=' value="'+otd.value+'" ';
		if(otd.fileOnchange){
			tabtidivstr+=otd.fileOnchange;
		}
		tabtidivstr+=prepareEventString(otd);
			if(otd.style!="undefined")
		tabtidivstr+=' style="'+otd.style+'" ';
		tabtidivstr+='>';
	}
//	alert(tabtidivstr);
	return tabtidivstr;
}	
function doDesign(){
var sel=grid.getCheckLineNo();var pk = grid.getCellValue(sel,1);
 location.href ="mofXml.cmd?method=design&mofWindowId=" + pk;
 }				