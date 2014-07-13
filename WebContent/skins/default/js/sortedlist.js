/*
*�����б�,��ʵ���б���ѡ������ƺ�����
*����:�����
*/
function SortedList(listId){
	
	var listAll=null;		//���������б�
	var list=null;			//�б��
	var upBtn=null;			//���ư�ť
	var downBtn=null;		//���ư�ť

	//��ʼ������	
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
	
	//ѡ������
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
	
	//ѡ������
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
	
	//���ѡ�е�ѡ��
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
	
	//���ѡ�е�ѡ���ֵvalue���ö��ŷָ�
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
	
	//���ѡ�е�ѡ��ı���title���ö��ŷָ�
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
	
	//���ѡ��
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
	
	//ɾ��ѡ��
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