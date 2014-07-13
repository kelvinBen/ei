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
*     roundDight(Dight,How):��ֵ��ʽ��������DightҪ  
*     ��ʽ����   ���֣�HowҪ������С��λ����Ĭ��Ϊ2��  
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

/********************************�ǿ��ж� ����DH js**************/
function forQuery(){
if(!is_NonullPro_Vilidate()){return false;}
}



/**
 * Ϊinput����onchange�¼�
 */
function setCellOnchangeEvent(cell,func){
	cell.onchange =func;
}

/**
 * Ϊinput List����onchange�¼�
 */
function setCellsOnchangeEvent(cells,func){
	for(var i=0;i<cells.length;i++){
		setCellOnchangeEvent(cells[i],func);
	}

}


/**
 * Ϊinput����ondblclick�¼�
 */
function setCellOndblclickEvent(cell,func){
	cell.attachEvent("ondblclick",function(){
		func(cell);
	});
}


/**
 * Ϊinput List����onchange�¼�
 */
function setCellsOndblclickEvent(cells,func){
	for(var i=0;i<cells.length;i++){
		setCellOndblclickEvent(cells[i],func);
	}

}