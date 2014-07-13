function checkemail(email){
	var pattern = /[a-za-z0-9_.]{1,}@[a-za-z0-9_]{1,}.[a-za-z0-9_]{1,}/;
	if (email.length==0)
		return false;
	if(email.match(pattern)==null){
		return false;
	}else{
		return true;
	}
}

function saveState(element,stateContainer){					//保存FORM元素的值到指定数组中，用于校验表单数据是否被更改过
	if (element.type == 'radio' || element.type == 'checkbox'){
		stateContainer.push(element.checked);
	}
	else{
		stateContainer.push(element.value);
	}
}


function printURL(sHref) { 
	if(document.getElementById && document.all && sHref){
		if(!self.oPrintElm){
			var aHeads = document.getElementsByTagName('HEAD');
		    if(!aHeads || !aHeads.length)
		        return false;
		    if(!self.oPrintElm)
		        self.oPrintElm = document.createElement('LINK');
		    self.oPrintElm.rel = 'alternate';
		    self.oPrintElm.media = 'print';
		    aHeads[0].appendChild(self.oPrintElm);
		}
		self.oPrintElm.href = sHref;
		self.focus();    
		self.print();
		return true;
	}else 
		return false;
}

$(document).ready(function(){
	$("#topmenu ul li:first").addClass("current");  		//设置默认菜单
	$("#panel ul:not(:first)").hide();  					//ul 不是第一个时隐藏
	$("#topmenu ul li").mouseover(function(){  				//鼠标移到 li 上时触发函数
//		var thisId = $(this).attr("id");
//		if (thisId == "menu_home"){							//如果菜单项为“主页”则不显示子菜单区域
//			$("#top-panel").hide();
//		}
//		else{
//			$("#top-panel").show();
//		}
		$("#topmenu ul li").removeClass("current"); 		//为第一个 li 移除 .current 样式
		$(this).addClass("current");  						//为触发的 li 添加样式
		$("#panel ul").hide();  							//隐藏 ul
		$("."+$(this).attr("id")).show();  					//显示 li 的ID 一致的 UL
	});
});

/*去除字符串前后端的空格*/
String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g,"");
};

/*获取字符串对应的字节数*/
String.prototype.length2 = function() {
    var len = 0;
    for(var i = 0; i < this.length; i++){
        if(this.charCodeAt(i) > 128){
            len = len + 2;
        }else{
            len = len + 1;
        }
    }
    return len;
};

/*字符转码*/
var unicodeChange = {
    on: function(str) {
        var a = [],
        i = 0;
        for (; i < str.length;) a[i] = str.charCodeAt(i++);
        return "&#" + a.join(";&#") + ";";
    },
    un: function(str) {
        return str.replace(/&#(x)?([^&]{1,5});?/g,function(a, b, c) {return String.fromCharCode(parseInt(c, b ? 16 : 10));});
    }
};

/*邮件地址校验*/
function checkEmail(strUrl){ 
	var patrn=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;   
	if(!patrn.exec($.trim(strUrl))) 
		return false; 
	else
		return true;
}
