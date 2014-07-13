
/********************************loading********************************************/
function LoadTool(){
	var t_id=null;
	var pos=0;
	var dir=3;
	var len=0;
	this.animate = function (){
		var elem = document.getElementById('progress');
		if(elem != null) {
		if (pos==0) len += dir;
		if (len>32 || pos>180) pos += dir;
		if (pos>180) len -= dir;
		if (pos>180 && len==0) pos=0;
		elem.style.left = pos;
		elem.style.width = len;
		}
	}
	this.showLoading = function (){
		t_id = setInterval(this.animate,20);
		var targelem = document.getElementById('loader_container');
		targelem.style.visibility='visible';
	}
	this.removeLoading = function() {
		window.clearInterval(t_id);
		var targelem = document.getElementById('loader_container');
		// targelem.style.display='none';
		targelem.style.visibility='hidden';
	}
}




/**
 * 信息类
 */
function Msg(){
	this.errorMsg = "";
	this.infoMsg = "";
	this.errorDivId = "errorMessageDiv";
	this.infoDivId = "infoMessageDiv";
	
	this.setErrorDivId = function(_divId){
		this.errorDivId = _divId;
	};
	
	this.setInfoDivId = function(_divId){
		this.infoDivId = _divId;
	};
	
	this.setInfoMsg= function(msg){
		this.infoMsg = infoMsg;
	};
	
	this.getInfoMsg= function(){
		return this.infoMsg;
	};

	this.getErrorMsg = function(){
		return this.errorMsg;
	};
	
	
	this.addInfoMessage = function(_msg){
		this.infoMsg +=_msg;
	}
	
	this.addInfoMessageWithBr = function(_msg){
		this.infoMsg +=_msg+"</br>";
	}
	
	this.addErrorMessage = function(_msg){
		this.errorMsg +=_msg;
	}
	
	this.addErrorMessageWithBr = function(_msg){
		this.errorMsg +=_msg+"</br>";
	}
	
	
	this.checkCellEmpty = function (inputId){
		var ret = false;
		var cell = document.getElementById(inputId);
		if(cell==null||cell.value.trim()==""){
			ret = true;
			this.errorMsg += this.getCellEmptyStr(inputId);
		}else{
			ret = false;
		}
		
		return ret;
	};
	
	
	this.checkEmpty = function (cell){
		var ret = false;
		if(cell==null||cell.value.trim()==""){
			ret = true;
			this.errorMsg += this.getCellEmptyStr(cell);
		}else{
			ret = false;
		}
		
		return ret;
	};
	
	this.getCellEmptyStr = function (inputDesc){
		return "'"+inputDesc+ "'不能为空;<br>";
	};

	
	this.setInfoMessageInDiv=function (_msg,divId){
		if(_msg==null){
			_msg = this.infoMsg;
		}
		if(divId==null||divId.trim()==""){
			divId = this.infoDivId;
		}
		var div = document.getElementById(divId);
		div.innerHTML = _msg;
	}
	
	this.setErrorMessageInDiv=function (_msg,divId){
		if(_msg==null||_msg.trim()==""){
			_msg = this.errorMsg;
		}
		if(divId==null||divId.trim()==""){
			divId =  this.errorDivId;
		}
		
		var div = document.getElementById(divId);
		div.innerHTML = _msg;
	};
	
	
	this.isCheck = function (){
		if(this.errorMsg.trim()!=""){
		
			return false;
		}
		return true;
	};
	
	this.checkEmptyForJQuery = function (jObjs){
		var msg = this;
		$.each(jObjs,function(index){
			msg.checkEmpty(this);
		});
		
	}
	
	
}
/**
 * 表头信息类
 */
HeadMsg.prototype = new Msg();
function HeadMsg(){
	this.checkCellEmpty = function (inputId){
		var ret = false;
		var cell = document.getElementById(inputId);
		if(cell==null||cell.value.trim()==""){
			ret = true;
			if(cell.type=="hidden"){
				this.errorMsg += "'"+inputId+ "'不能为空;<br>";
			}else{
				var desc = cell.parentElement.previousSibling.innerText;
				
				this.errorMsg += this.getCellEmptyStr(desc);
			}
		}else{
			ret = false;
		}
		return ret;
	};
	
	this.getCellEmptyStr = function (inputDesc){
		return "'"+inputDesc+ "'不能为空;<br>";
	};
	
	
	/**
	 * @override
	 * @param {} cell
	 * @return {}
	 */
	
	this.checkEmpty = function (cell){
		var ret = false;
		if(cell==null||cell.value.trim()==""){
			ret = true;
			var desc = cell.parentElement.previousSibling.innerText;
			this.errorMsg += this.getCellEmptyStr(desc);
		}else{
			ret = false;
		}
		
		return ret;
	};
	

}

/***
 * grid 的msg类
 */
GridMsg.prototype = new Msg();
function GridMsg(gridName){
	if(gridName!=null){
		this.grid = eval(gridName);
	}
	
	
//	override
	this.grid.getTouText=function(col){
		var tou=document.getElementById(gridName).children[0].children[0].children[0].tBodies[0];
		if(col==null||col=="")return;if(typeof(col)=="string"){col=grid0.getIndexByName(col);if(col==-1)return;}
		if(tou==null)return;var otd=tou.rows[0].cells[col];var oText=otd.children[0].firstChild;
		return oText.nodeValue;
	}
	
	
	this.checkCellEmpty= function (row,colName){
		var ret = false;
		var cell = this.grid.getCellObject(row,colName);
		if(cell==null||cell.value.trim()==""){
			ret = true;
			var desc = this.grid.getTouText(colName);
			this.errorMsg += this.getCellEmptyStr(row, desc);
		}else{
			ret = false;
		}
		
		return ret;
	};
	
	this.getCellEmptyStr = function (row,col){
		return "第'"+row+"'行，'"+col+"'列不能为空;<br>";
	};
	
	
	this.getCellNoDbClickedStr = function (row,colDesc){
	
		return "第'"+row+"'行，批次列没有双击;<br>";
	};
	
	
	this.checkCellLe0 = function (row,colName){
		var ret = false;
		var cell = this.grid.getCellObject(row,colName);
		if(getFloat(cell.value)<=0){
			ret = true;
			var desc = this.grid.getTouText(colName);
			this.errorMsg += this.getCellLe0Str(row, desc);
		}else{
			ret = false;
		}
		return ret;
	};
	
	this.getCellLe0Str= function(row, desc){
			return "第'"+row+"'行，'"+desc+"'列小于等于0;<br>";
	};

}

