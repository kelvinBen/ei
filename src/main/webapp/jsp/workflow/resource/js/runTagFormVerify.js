/* runTagFormVerify在form进行提交的时候进行校验 */

var SUF_SUB = new RegExp("\\[\\d+\\]");
var REG_FIELD = new RegExp("^%(.+)%$");
var SUF_MSGDIV_ID = "_msgId";

var exp = window.onload;
window.onload=function(){
	for (var i = 0; i < document.forms.length; i++){
		var submit = document.forms(i).submit;
		document.forms(i).submit = function(verify) {
			
			if (verify == false || runFormVerify(this)) {
				submit();
				return true;
			}
			return false;
		};
	}
};

function runFormVerify(form) {
	var els = form.tags("input");
	
	for (var i = 0; i < els.length; i++) {
		
		var type=els[i].getAttribute("type");
	    
		if(type!=null && (type=="radio" || type=="checkbox")){
			var name=els[i].getAttribute("name");
		
		    var rc=els[i];
			if(typeof(rc.length)=="undefined"){
				var notNull = rc.getAttribute("notnull");
	
				if (notNull == null || notNull.trim() == "")
					continue;
			}else{
				var notNull = rc[0].getAttribute("notnull");
				
				if (notNull == null || notNull.trim() == "")
					continue;
			}
			if(typeof(rc.length)=="undefined"){
			   var isChecked=false;
			   for (var j = 0; j < els.length; j++)
				{   if(els[j].name==name&&els[j].checked) {
				    isChecked=true;
				    break;
			     	}   
			    } 
			   if(!isChecked)  
		       {
				alert("["+rc.title+"]没有选择，请检查！");
				return false;
			   }
			
			}else{
				var isChecked=false;
				for(var j=0;j<rc.length;j++)
				{
					
					if(rc[j].checked){
						isChecked=true;
						break;
					}
				}
				if(!isChecked){
					
					alert("["+rc[0].title+"]没有选择，请检查！");
					return false;;
				}
			}
			
				
		}else{
			if (!checkVerify(els[i])) {
				alert("["+els[i].title+"]填写的数据不符合约束，请检查！");
				return false;
			}
		}
	}
	
	var els = form.tags("textarea");
	for (var i = 0; i < els.length; i++) {
		
		if (!checkVerify(els[i])) {
			alert("["+els[i].title+"]填写的数据不符合约束，请检查！");
			return false;	
		}
	}
	var els = form.tags("select");
	for (var i = 0; i < els.length; i++) {
		if (!checkVerify(els[i])) {
			alert("["+els[i].title+"]填写的数据不符合约束，请检查！");
			return false;		
		}
	}
	
	return true;
}

function checkVerify(el) {
	
	var tagName = el.tagName.toLowerCase();
	//alert("域:  " + el.name);
	var notNull = el.getAttribute("notnull");
	//alert("notNull:  " + notNull);
	var type = el.getAttribute("type");
	if (notNull == "true") {
		
			if (el.value == null || el.value.trim() == "") {
				showCheckInfo(el, notNull);
				return false;
			}
		
		
	}
	
	if ((tagName == "input" && el.type == "text") || tagName == "textarea") {
		var len = el.getAttribute("maxlength");
		//alert("域输入最大长度：  " + len);
		if (len != null && !isNaN(parseInt(len)) && parseInt(len) > 0) {
			if (el.value.length > parseInt(len)) {
				showCheckInfo(el, "输入的内容过长！最大长度为：" + len + "字节");
				return false;
			}
		}
	}
	var verify = el.getAttribute("verifyFuncName");
	if (tagName == "select" 
		|| verify == null 
		|| verify.trim() == "" 
		|| el.value == null
		|| el.value.trim() == "") {
		hiddenCheckInfo(el);
		return true;
	}
	var paras = verify.split(",");
	var program = paras[0] + "(el";
	for (var i = 1; i < paras.length; i++) {
		var para = paras[i];
		if (REG_FIELD.test(para)) {
			para = para.replace(REG_FIELD, PRE_MAIN + "$1");
		}
		program += (", \"" + para + "\"");
	}
	program += ");";
	//alert("运行函数  " + program);
	var checkResult = eval(program);
	//alert("运行函数的结果" + checkResult);
	if (success == checkResult) {
		hiddenCheckInfo(el);
		return true;
	}
	showCheckInfo(el, checkResult);
	return false;
}

function showCheckInfo(el, msg) {
	var msgid = el.name + SUF_MSGDIV_ID;
	var msgDiv = document.getElementById(msgid);
	if (msgDiv == null) {
		msgDiv = document.createElement("SPAN");
		msgDiv.id = msgid;
		msgDiv.className = "xinghaoCss";
		msgDiv.innerHTML = "←【输入错误】";
		el.parentElement.appendChild(msgDiv);
	}
	msgDiv.title = msg;
	msgDiv.style.display = "";
}

function hiddenCheckInfo(el) {
	var msgid = el.name + SUF_MSGDIV_ID;
	var msgDiv = document.getElementById(msgid);
	if (msgDiv != null) {
		msgDiv.style.display = "none";
	}
}

function msgClick(msgdiv) {
	var msgname = msgdiv.id.replace(new RegExp("^(.*)" + SUF_MSGDIV_ID + "$"), "$1");
	var index = 0;
	if (msgname.startsWith(PRE_SUB)) {
		index = parseInt(msgname.replace(/^.*\[(\d+)\]$/, "$1")) + 1;
		msgname = msgname.replace(/^(.*)\[\d+\]$/, "$1");
	}
	msgdiv.style.display = "none";
	try {
		document.getElementsByName(msgname)[index].focus();
	}
	catch (e) {}
}

//获取某个Html元素在运行时的绝对位置信息
function GetAbsoluteLocationEx(element) 
{ 
	if ( arguments.length != 1 || element == null ) { 
		return null; 
	} 
	var elmt = element; 
	var offsetTop = elmt.offsetTop; 
	var offsetLeft = elmt.offsetLeft; 
	var offsetWidth = elmt.offsetWidth; 
	var offsetHeight = elmt.offsetHeight; 
	while( elmt = elmt.offsetParent ) { 
		// add this judge 
		if ( elmt.style.position == 'absolute' || elmt.style.position == 'relative'  
			|| ( elmt.style.overflow != 'visible' && elmt.style.overflow != '' ) ) { 
			break; 
		}  
		offsetTop += elmt.offsetTop; 
		offsetLeft += elmt.offsetLeft; 
	} 
	return { absoluteTop: offsetTop, absoluteLeft: offsetLeft, 
		offsetWidth: offsetWidth, offsetHeight: offsetHeight }; 
} 

