$.fn.getInputByName = function (name){
	var str = "input[name='"+name+"']";
	return this.filter(str);
}

/**
 * 
 * @param {} eventName jquery event name
 * @return {} jquery set
 */
$.fn.unbindEx = function (eventName){
	// this referred to jquery set
	return this.each(function(){
			this["on"+eventName] = null;	
		}
	);
}




$.fn.parseInputsToJson= function (){
	var json = {};
	this.filter("input").each(function(){
		var name = $(this).attr("name");
		if(name.length>0){
			var value = $(this).val();
			if(value.length>0)
				json[name]= value;
		}
	});
	return json;
}

$.fn.parseTextToJson= function (){
	var json = {};
	this.each(function(){
		var name = $(this).attr("name");
		if(name.length>0){
			var value = $(this).text();
				json[name]= value;
				
		}
	});
	return json;
}

$.fn.vals = function (){
	var vals = [];
	this.each(function(){
			vals.push($(this).val());	
		}
	);
	return vals;
}


$.fn.texts = function (){
	var texts = [];
	this.each(function(){
			texts.push($(this).text());	
		}
	);
	return texts;
}