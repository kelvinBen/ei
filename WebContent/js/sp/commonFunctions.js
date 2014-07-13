function setSelectOptionByText(sel,text){
    	var options = sel.options;
    	for(var i=0;i<options.length;i++){
    		if(options[i].text == text){
    			options[i].selected = true;
    			return;
    		}
    	}
    
    }


function isEmpty(obj){

	return obj==null||obj.toString()=="";
}


/*  
*     roundDight(Dight,How):数值格式化函数，Dight要  
*     格式化的   数字，How要保留的小数位数，默认为2。  
*/  
function   roundDight(Dight,how)  
{  
			if(how==null) how=2;
            Dight   =   Math.round   (Dight*Math.pow(10,how))/Math.pow(10,how);  
            return   Dight;  
}  

/*******************upperCase function********************/
function upperCase(_cell){
	_cell.value = _cell.value.toUpperCase();
}
/*******************initQueryForm function********************/

function initQueryForm(){
	var inputs = document.getElementsByTagName("input");
	for(var i=0;i<inputs.length;i++){
		inputs[i].onchange=function(){
			inputOnchange(inputs[i]);
		}
	}
}

function inputOnchange(input){
	validate(input.name,input.id);
			upperCase(input);
}

/*******************measure field length  function********************/
//
function measureLen(fieldValue,minLength,wildcard){
	
	fieldValue = fieldValue.trim().replaceAll(wildcard,"");
	if(fieldValue.length>=minLength){
		return true;
	}else{
		return false;
	};
	
	
	return false;
	
}

/********************************非空判断 依赖DH js**************/
function forQuery(){
if(!is_NonullPro_Vilidate()){return false;}
}



/**
 * 为input设置onchange事件
 */
function setCellOnchangeEvent(cell,func){
	cell.onchange =func;
}

/**
 * 为input List设置onchange事件
 */
function setCellsOnchangeEvent(cells,func){
	for(var i=0;i<cells.length;i++){
		setCellOnchangeEvent(cells[i],func);
	}

}


/**
 * 为input设置ondblclick事件
 */
function setCellOndblclickEvent(cell,func){
	cell.attachEvent("ondblclick",function(){
		func(cell);
	});
}


/**
 * 为input List设置onchange事件
 */
function setCellsOndblclickEvent(cells,func){
	for(var i=0;i<cells.length;i++){
		setCellOndblclickEvent(cells[i],func);
	}

}