/*****************************************************\
*                                  	                 *
*      Ԫ����ϵͳjavascript����   	                     *	
*                                                    *
*      ��Ҫ����:Ԫ���ݶ���ҳ�湫�õ�js����                 *
*                                                    *
*      ��   ��:                                       *
*                                                    *
*      ��  ��:        2009-2-23               		 *
*                                                    *
\*****************************************************/

/*
 * ================�����б�================
 * MofWindow		Ԫ���ݴ���;��JS�ļ�����ָԪ���ݴ�����ǰ̨ҳ���չʾʵ��
 * MofTab			Ԫ���ݴ��ڰ������Ӷ��󣬼�ƴ���Tab;��JS�ļ�����ָԪ���ݴ���Tab��ǰ̨ҳ���չʾʵ��
 * MofField			Ԫ���ݴ���Tab�������Ӷ���,��ƴ�����;��JS�ļ�����ָԪ���ݴ�������ǰ̨ҳ���չʾʵ��
 * HtmlTab			ָ���Web����е�Tab��ǩ
 * HtmlCard			ָ���Web����е�Tab��ǩ��Ԫ��Card��ǩ
 * WindowContainer	ָҳ���а���MofWindowҳ��չʾʵ����HtmlԪ��,һ���ǿ��Web�����Container��ǩ
 * TabContainer		ָҳ���а���MofTabҳ��ʵ����HtmlԪ��,һ���ǿ��Web�����HtmlCard��ǩ����Html��FieldSet��ǩ
 * FieldContainer	ָҳ���а���MofTabҳ��ʵ����HtmlԪ��,һ����Html��TD��ǩ  
 * ========================================
 * 
 * ================�����б�================ 
 * ----------------ϵͳ���ú���--------------
 * String.prototype.byteLength		�������˫�ֽڵ��ַ����ֽڳ���
 * String.prototype.exactByteLength ��ȷ�����ַ����ֽڳ���
 * CNbyteLength(str)				����������ֵ��ַ����ֽڳ���
 * joinForm()						��ҳ��������������ת����URL,��GET��ʽ�ύ
 * joinForm()	                    2007-08-27�޸ĸ÷�����ֻ��ҳ���е�primaryKey������ת����URL,��GET��ʽ�ύ 
 * openDialog(url,ls,features)		���ݸ�����url,������������
 * openWindow(url,ls,name,features)	���ݸ�����url,������������
 * forwardForm(url)					�ύ��ǰҳ�沢����ָ��ҳ��
 * disableButton(condition)			�ύ��ť��ң���ֹ�ظ��ύ 
 * ----------------Ԫ����ҳ������������--------------
 * displayMofTab(tab,cardName,MofTabContainerId,isDisplay)����MofTab������
 * getTabContainer(form,tabName)					��ȡĳMofTab����Card�������legend����
 * hiddenTabContainer(form,tabName,isHidden)	����ĳTab��������
 * disableTabContainer(form,Htmltab,tabName,isdisabled) ����ĳTab����
 * setWindowContainerTitle(value)				����WindowContainer�ı���
 * hiddenWindowContainerTitle(isHidden)			����WindowContainer�ı�����
 * setHtmlCardTitle(htmlTab,tabName,value)		����MofTab���ڵ�HtmlCard�ı���
 * showTab(htmlTab,tabName)						ʹ����ĳMofTab��HtmlCardΪ��ǰչʾҳ
 * getFieldValue(form,tabName,fieldName)		��ȡĳ���ֵ	 
 * setFieldValue(form,tabName,fieldName,value)	����ĳ���ֵ
 * getFieldContainer(form,tabName,fieldName)	��ȡ����ı��TD
 * setFieldTitle(form,tabName,fieldName,value)	���������
 * setFieldHidden(form,tabName,fieldName,isHidden) ����ĳ������TD����ʾ����
 * setFieldRowHidden(form,tabName,fieldName,isHidden) ����ĳ������TR����ʾ����
 * ==========================================
 */

/**
 * �������˫�ֽڵ��ַ����ֽڳ���.
 * ������򣺱���255֮��˫�ֽ��ַ�������
 * @author lichd
 * @return �ַ���ʵ���ֽڳ��� 
 * @example "haha����".byteLength()
 */
String.prototype.byteLength=function(){
	return this.replace(/[^\x00-\xff]/g,"aa").length;
} 

/**
 * ��ȷ�����ַ����ֽڶ�
 * ������� ���Դ����ֽ�,˫�ֽ�,�Լ����ֽںͷǷ��ֽ�(2.5�ֽ�)
 * @author lichd
 * @return	�ַ���ʵ���ֽڳ���
 * @example "haha����".exactByteLength()
 */
String.prototype.exactByteLength = function()
{
  var intCount = 0;
  for(var i = 0;i < this.length;i ++)
    {
      //���ַ�ת����16������
      var ascii = this.charCodeAt(i).toString(16);
      //�ж�16������λ��������0xAD00�����Ǹ�˫�ֽ��ַ�
      var byteNum = ascii.length / 2.0;
      intCount += (byteNum + (ascii.length % 2) / 2);
    }
  return intCount;
}

/**
 * ����ַ����ĳ���.
 * ����:һ������ռ2���ֽ�
 * @author lichd 
 * @param str	��Ҫ����ֽڳ��ȵ��ַ���
 * @return      �ַ���ʵ���ַ�����
 * @example CNbyteLength("haha����")
 */
function CNbyteLength(str)
{
	var re=/[\u4E00-\u9FA5]/g;
	if(re.test(str))
    return str.length+str.match(re).length;
	else return str.length;

}

/**
 * ��ҳ��������������ת����URL,��GET��ʽ�ύ
 * @author jiadx 
 * @return   ҳ��������ƴ�ӳɵ��ַ���
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
//�����Ƕ�joinForm�����޸ģ�ֻ��ҳ���е�primaryKey������ת����URL,��GET��ʽ�ύ	  
var start= str.indexOf("primaryKey");
if(start>0){
var end=str.indexOf("&",start);
str=str.substring(start,end);
	  return str;
}else return "";
	 
}

/**
 * ���ݸ�����url,������������
 * @author jiadx 
 * @param	url:��Ҫ�������ڵ�url��ַ
 * @param	ls :url�ָ����,���url����?������ʹ��&�ָ�,���������?�ָ����,��ʹ��?�ָ����
 * @param	features:���ڶ��Ʋ���
 * @example	openDialog("getWindow.cmd?method=getWinList","&","scroll:auto;status:no;dialogWidth:400px;dialogHeight:300px")	
 */
function openDialog(url,ls,features){
    url = url+ls+joinForm();
    //alert(url);
    showModalDialog(url,window,features);
}

/**
 * ���ݸ�����url,������������
 * @author jiadx
 * @param	url:��Ҫ�������ڵ�url��ַ
 * @param	ls :url�ָ����,���url����?������ʹ��&�ָ�,���������?�ָ����,��ʹ��?�ָ����
 * @param	name:ָ��������
 * @param	features:���ڶ��Ʋ���
 * @example	openWindow("getWindow.cmd?method=getWinList","&","WinHelp","scroll:auto;status:no;titlebar:no; menubar:no;location:nowidth:800px;height:600px")	
 */
function openWindow(url,ls,name,features){
    url = url+ls+joinForm();
    window.open(url,name,features);
}

/**
 * �ύ��ǰҳ�沢����ָ��ҳ��
 * @author jiadx 
 * @param	url:Ҫ�����ҳ��
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
 * �ύ��ť��ң���ֹ�ظ��ύ * 
 * @author lichd 
 * @param	condition:��ť��ҵ�����
 * @return	���óɹ����
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
 * ����:����MofTab������ *
 * @author lichd  
 * @param	tab					:MofTab���ڵ�htmlTab����
 * @param	cardName			:htmlCard�����CardId
 * @param	MofTabContainerId	:MofTab���ⲿ����Id,����fieldSet����ID
 * @param	isDisplay			:�Ƿ���ʾ
 * @return	�ɹ���� * 
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
 * ��ȡMofTab���ڵ����������HtmlCard��ֻ��һ��MofTab�򷵻ظ�Card���󣬷��򷵻�Card�а�����MofTab��fildSet 
 * @author lichd 
 * @param	form	:MofTab���ڵ�form����
 * @param	tabName		:MofTab����
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
 * ����ĳTab��������
 * @author lichd  
 * @param	form	:MofTab���ڵ�form����
 * @param	Htmltab	:MofTab���ڵ�HtmlTab����
 * @param	tab		:MofTab����
 * @param	isHidden:�Ƿ�����
 * @return	�ɹ���� 
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
 * ����ĳTab��������,��ֹ���������ύ 
 * @author lichd 
 * @param	form	:MofTab���ڵ�form����
 * @param	Htmltab	:MofTab���ڵ�HtmlTab����
 * @param	tab		:MofTab����
 * @param	isdisabled:�Ƿ����
 * @return	�ɹ���� 
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
  *	����WindowContainer�ı���
  * @author lichd 
  * @param	value	:Ҫ���õ�Container����
  * @return	���óɹ���� 
  * @example setWindowContainerTitle("���Ա���")
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
  *	����WindowContainer�ı�����
  * @author lichd 
  * @param	isHidden	:�Ƿ�Ҫ����
  * @return	���óɹ���� 
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
  *	����MofTab���ڵ�HtmlCard�ı��� 
  * @author lichd 
  * @param	htmltab	:MofTab���ڵ�HtmlTab����
  * @param	tabName	:MofTab����
  * @param	value	:Ҫ���õ�Container����
  * @return	���óɹ���� 
  * @example setHtmlCardTitle(tab1,"Order","���Ը���")
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
  * ʹ����ĳMofTab��HtmlCardΪ��ǰչʾҳ	 
  * @author lichd 
  * @param	htmltab	:MofTab���ڵ�HtmlTab����
  * @param	tabName	:MofTab����
  * @return	���óɹ���� 
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
  * ��ȡĳ���ֵ	
  * @author lichd  
  * @param	form	:MofTab���ڵ�form����
  * @param	tabName	:MofTab����
  * @param	filedName:����������
  * @return	�Ĵ������ֵ 
  * @example getFieldValue(document.forms[0],"Order","address")
  */
 function getFieldValue(form,tabName,fieldName)	{
 	if(form[tabName+"_"+fieldName])
 		return form[tabName+"_"+fieldName].value;
 }
 
  /**
  * ����ĳ���ֵ
  * @author lichd 	 
  * @param	form	:MofTab���ڵ�form����
  * @param	tabName	:MofTab����
  * @param	filedName:����������
  * @param	value:Ҫ���õĴ������ֵ
  * @return	���óɹ���� 
  * @example setFieldValue(document.forms[0],"Order","address","ɽ��·224��")
  */
 function setFieldValue(form,tabName,fieldName,value)	{
 	if(form[tabName+"_"+fieldName]){
 		form[tabName+"_"+fieldName].value=value;
 		return true;
 	}
	return false;
 }
  /**
  * ��ȡ����ı��TD 
  * @author lichd 
  * @param	form	:MofTab���ڵ�form����
  * @param	tabName	:MofTab����
  * @param	filedName:����������
  * @param	value:Ҫ���õĴ������ֵ
  * @return	���óɹ���� 
  * @example getFieldContainer(document.forms[0],"Order","address").tagName
  */
 function getFieldContainer(form,tabName,fieldName)	{
 	if(form[tabName+"_"+fieldName])
 		return form[tabName+"_"+fieldName].parentElement;
 }
 /**
  * ���������	
  * @author lichd  
  * @param	form	:MofTab���ڵ�form����
  * @param	tabName	:MofTab����
  * @param	filedName:����������
  * @param	value:Ҫ���õĴ���������ֵ
  * @return	���óɹ���� 
  * @example setFieldTitle(document.forms[0],"Order","address","��ַ :")
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
  * ����ĳ������TD����ʾ����	
  * @author lichd 
  * @param	form	:MofTab���ڵ�form����
  * @param	tabName	:MofTab����
  * @param	filedName:����������
  * @param	isHidden:�Ƿ�����
  * @return	���óɹ���� 
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
  * ����ĳ������TR����ʾ����	
  * @author lichd 
  * @param	form	:MofTab���ڵ�form����
  * @param	tabName	:MofTab����
  * @param	filedName:����������
  * @param	isHidden:�Ƿ�����
  * @return	���óɹ���� 
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
  * ����:��grid�������ͼƬ��,ͼƬ��ʾ��СͼƬ,�Ȱ�סAlt��,�������ŵ�ͼƬ��,ͼƬ�ͻ���ʾԭͼ.
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
 * ����:��showImage(obj)���,����հ״�,ͼƬ����.
 * @author gaofeng 
 */
function hidImage(){
	document.getElementById("imgPosition").style.display = "none";
} 
 /**
  * ������ѡ����
  * @author lichd
  * @param	action	:Ҫִ�е�Ԫ���ݶ���:mofprocess.cmd?method=send
  * @param	actionTitle	:��ʾ����
  * @return	
  * @example selectAndSend("mofprocess.cmd?method=send","ѡ����")
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
  * ����organId��ȡorganName	
  * @author lichd
  * @param	organId	:��֯��������
  * @param	cus_method	:ҳ����䷽��
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
 * ʹ��xmlhttp�Ӻ�̨��ȡ��ֵ
 */
function mofGetValueByXmlhttp(url)
{
  if(url==null)
   {
    alert("���ݵ�URL����Ϊ�գ�");
    return;
   }
  try
    {
    var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    if(xmlhttp==null)
    {
    alert("����XMLHTTP����ʧ��!"+ex.description);
    return ;
    }
    xmlhttp.open("POST",url,false);
    xmlhttp.send();
    return xmlhttp.responseText;
    }catch(ex)
    {
    alert("XMLHTTP���󴫵�����ʧ��!"+ex.description);
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