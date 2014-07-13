/*
*排序列表,可实现列表中选项的上移和下移
*作者:刘彦峰
*/
function SortedList(listId){
	
	var listAll=null;		//整个排序列表
	var list=null;			//列表框
	var upBtn=null;			//上移按钮
	var downBtn=null;		//下移按钮

	//初始化属性	
	this.init=init;
	function init(){
		if((listAll=document.all(listId)).tagName!="TABLE")
			return;
		if(listAll.cells(0).children[0].tagName=="SELECT"){
			list=listAll.cells(0).children[0];
			var btns=listAll.cells(1).children.tags("IMG");
			upBtn=btns[0];
			downBtn=btns[1];
		}else{
			list=listAll.cells(1).children[0];
			var btns=listAll.cells(0).children.tags("IMG");
			upBtn=btns[0];
			downBtn=btns[1];
		}
		upBtn.attachEvent("onmousedown",moveUp);
		downBtn.attachEvent("onmousedown",moveDown);
	}
	
	//选项上移
	this.moveUp=moveUp;
	function moveUp(){
		var srcOpi=getSelOpis();
		if(srcOpi.length>1){
			alert(sortedlist_msg_1);
			return;
		}
		else
			srcOpi=srcOpi[0];
		if(srcOpi!=null&&srcOpi.index>0){
				var tarOpi=list.options(srcOpi.index-1);
				var tVal=tarOpi.value;
				var tTit=tarOpi.innerText;
				tarOpi.value=srcOpi.value;
				tarOpi.innerText=srcOpi.innerText;
				srcOpi.value=tVal;
				srcOpi.innerText=tTit;
				srcOpi.selected=false;
				tarOpi.selected=true;
			}else
				return;	
	}
	
	//选项下移
	this.moveDown=moveDown;
	function moveDown(){
		var srcOpi=getSelOpis();
		if(srcOpi.length>1){
			alert(sortedlist_msg_1);
			return;
		}
		else
			srcOpi=srcOpi[0];
		if(srcOpi!=null&&srcOpi.index<list.options.length-1){
				var tarOpi=list.options(srcOpi.index+1);
				var tVal=tarOpi.value;
				var tTit=tarOpi.innerText;
				tarOpi.value=srcOpi.value;
				tarOpi.innerText=srcOpi.innerText;
				srcOpi.value=tVal;
				srcOpi.innerText=tTit;
				srcOpi.selected=false;
				tarOpi.selected=true;
			}else
				return;
	}
	
	//获得选中的选项
	this.getSelOpis=getSelOpis;
	function getSelOpis(){
		var len=list.options.length;
		var opis=new Array();
		var j=0;
		for(var i=0;i<len;i++){
			if(list.options[i].selected)
				opis[j++]=list.options[i];
		}
		return opis;
	}
	
	//获得选中的选项的值value，用逗号分割
	this.getSelValues=getSelValues;
	function getSelValues(){
		var opis=getSelOpis();
		var results="";
		var len=opis.length;
		if(len==0)
			return;
		for(var i=0;i<len;i++)
			results+=opis[i].value+",";
		return results.substring(0,results.length-1);
	}
	
	//获得选中的选项的标题title，用逗号分割
	this.getSelTitles=getSelTitles;
	function getSelTitles(){
		var opis=getSelOpis();
		var results="";
		var len=opis.length;
		if(len==0)
			return;
		for(var i=0;i<len;i++)
			results+=opis[i].innerText+",";
		return results.substring(0,results.length-1);
	}
	
	//添加选项
	this.addOptions=addOptions;
	function addOptions(opiVals,opiTits){
		if(opiVals!=""&&opiTits!=""){
			var vals=opiVals.split(",");
			var tits=opiTits.split(",");

			var len=vals.length>tits.length?tits.length:vals.length;
		
			for(var i=0;i<len;i++){
				var newOpi=document.createElement("<OPTION>");
				list.options.add(newOpi);
				newOpi.value=vals[i];
				newOpi.innerText=tits[i];
			}
		}	
	}
	
	//删除选项
	this.delOptions=delOptions;
	function delOptions(){
		var dels=getSelOpis();
		var len=dels.length;
		var i=0;
		for(var j=0;j<list.options.length;j++)
			if(list.options[j]==dels[i]){
				list.options.remove(j--);
				i++;
		}
	}
	
}