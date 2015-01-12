/**
* bodyonload用来设置页面需要在BODY的onload事件里执行的程序，
* 当页面引入此js文件时，要求页面的BODY标签中不能设置onload事件，
* 需要在此事件中执行的JS程序请设置到此变量中。程序将在页面的onload事件中执行这些代码。
* 例如：
* <script language="javascript" src="runFormVerify.js"></script>
* <script language="javascript">
* 	bodyonload = "alert('onload事件中运行的程序！')";
* </script>
*/
var bodyonload;

var PRE_SUB = "Sub_";
var PRE_MAIN = "Ins_";
var SUF_SUB = new RegExp("\\[\\d+\\]");
var REG_FIELD = new RegExp("^%(.+)%$");
var SUF_MSGDIV_ID = "_msgId";


var exp = window.onload;
window.onload = function() {
	for (var i = 0; i < document.forms.length; i++) {
		var submit = document.forms(i).submit;
		document.forms(i).submit = function(verify) {
			if (verify == false || runFormVerify(this)) {
				submit();
				return true;
			}
			return false;
		};
		var onsubmit = document.forms(i).onsubmit;
		document.forms(i).onsubmit = function() {
			if (runFormVerify(this)) {
				if (onsubmit == null) {
					return true;
				}
				return onsubmit();
			}
			return false;
		};
	}
	if (exp != null) {
		exp();
	}
	if (bodyonload != null && bodyonload.trim() != "") {
		eval(bodyonload);
	}
};

function runFormVerify(form) {
		
	var els = form.tags("input");
	
	for (var i = 0; i < els.length; i++) {
		if (els[i].name.startsWith(PRE_SUB) && !els[i].name.endsWith(SUF_SUB)) {
			continue;
		}
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
				alert("["+rc.formTitle+"]没有选择，请检查！");
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
					
					alert("["+rc[0].formTitle+"]没有选择，请检查！");
					return false;;
				}
			}
			
				
		}else{
			if (!checkVerify(els[i])) {//text
				if(document.all(els[i].name + SUF_MSGDIV_ID)!=null && document.all(els[i].name + SUF_MSGDIV_ID).title!=null){
					alert(document.all(els[i].name + SUF_MSGDIV_ID).title);
				}else{
					alert("["+els[i].formTitle+"]填写的数据不符合约束，请检查！");
				}
				return false;
			}
		}
	}
		var els = form.tags("textarea");
		for (var i = 0; i < els.length; i++) {
			if (els[i].name.startsWith(PRE_SUB) && !els[i].name.endsWith(SUF_SUB)) {
				continue;
			}
			if (!checkVerify(els[i])) {
				if(document.all(els[i].name + SUF_MSGDIV_ID)!=null && document.all(els[i].name + SUF_MSGDIV_ID).title!=null){
					alert(document.all(els[i].name + SUF_MSGDIV_ID).title);
				}else{
					alert("["+els[i].formTitle+"]填写的数据不符合约束，请检查！");
				}
				return false;	
			}
		}
		var els = form.tags("select");
		for (var i = 0; i < els.length; i++) {
			if (els[i].name.startsWith(PRE_SUB) && !els[i].name.endsWith(SUF_SUB)) {
				continue;
			}
			if (!checkVerify(els[i])) {
				alert("["+els[i].formTitle+"]填写的数据不符合约束，请检查！");
				return false;		
			}
		}
		
		/** 提交操作,把当前表单的所有按钮都禁用 **/
	//	var buttons = form.tags("button");
		//for(var b=0;b<buttons.length;b++){
	//		buttons[b].disabled=true;
	//	}
		
		return true;
	}


function checkVerify(el) {
	if (el.name.startsWith(PRE_SUB) && !el.name.endsWith(SUF_SUB)) {
		hiddenCheckInfo(el);
		return true;
	}
	var tagName = el.tagName.toLowerCase();
	var notNull = el.getAttribute("notnull");
	var type = el.getAttribute("type");
	if (notNull != null && notNull.trim() != "") {
		
			if (el.value == null || el.value.trim() == "") {
				showCheckInfo(el, "["+el.formTitle+"]不能为空！");
				return false;
			}
		
		
	}
	
	if ((tagName == "input" && el.type == "text") || tagName == "textarea") {
		var len = el.getAttribute("maxlength");
		if (len != null && !isNaN(parseInt(len)) && parseInt(len) > 0) {
			if (el.value.getByte() > parseInt(len)) {
				showCheckInfo(el, "["+el.formTitle+"]输入的内容过长！最大长度为：" + len + "字节");
				return false;
			}
		}
	}
	var verify = el.getAttribute("restriction");
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
	var checkResult = eval(program);
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
		msgDiv.innerHTML = "*";
//		msgDiv.onclick = function() {
//			eval("msgClick(this)");
//		};
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
