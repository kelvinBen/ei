//--------------------------------------��������---------------------------------------------------
var currFocus;
var ExistAttaInfo = new Array();
var oldDelAttas = new Array();
var attaIdx = 0;
var IsIE;
function fInitMSIE(){
	if (navigator.userAgent.indexOf("MSIE") != -1){
		IsIE = true;
	}else{
		IsIE = false;
	}
}
fInitMSIE();



function fTrim(str){
	str = str.replace(/(^\s*)/,"");
	str = str.replace(/(\s*$)/,"");
	return str;
}

//��js�ļ�����compose.htmͬʱ���Ͷ��������js������֧�� IE �� NNx ϵ�С�
//���еĺ����������� IE �� NNx ϵ�У�ֱ�ӵ��þͿ���
//����������������ж���������ͣ�Ȼ�����ݲ�ͬ��bowser��������Ԫ��
//��Ҫ�����Ƕ�̬���� ���ֱ�Ԫ�� �� ɾ����Ԫ��
//written by xpr

//    function list
//    -------------------------------------------------------------------------------------------------------------------
//    IsIEBrowser()  ����ֵ: true(IE) false(NNx)
//    exist(fileId)  �ж�fileId�Ƿ��Ѿ�����
//    addInputFile(spanId,fileId)  ����ΪspanId ��Ԫ�������������Ϊindex��input file
//    addbr(spanId,brId)  ����ΪspanId ��Ԫ����������idΪbrId�Ļ��з�
//    adddel(spanId,index) ����ΪspanId ��Ԫ�������������Ϊindex��"ɾ��"��ť��������ɾ����Ӧ��input file �� br
//    addhidden(spanId,hiddenId,value)  ����ΪspanId ��Ԫ����������idΪhiddenId��ֵΪvalue��input type=hidden
//    -------------------------------------------------------------------------------------------------------------------

var IsIE;
var attaIdx = 0;

//search,ȫ�ֱ���
//-----------------------------------------------------------------------------------------------------------
function IsIEBrowser() {
	if (navigator.userAgent.indexOf("MSIE") != -1) {
		return true;
		} else {
		return false;
		}
}

// ���Ӹ������� ()�����ӵ� idfilespan,����Ϊ attaIdx ��

function add() {

	addfile("idfilespan",attaIdx);
	attaIdx++;
	return false;
}

function addwithfilename(filename){
	addfilewithctx("idfilespan",filename,attaIdx);
	attaIdx++;
	return false;
}

//----------------------------------------fileexist()----------------------------------------------------------
//edited by alun
function exist(fileId) {
      var file = document.getElementById(fileId);
	  var result = false;
	  if ( file !=null ) {
			if ( file.value != null && file.value != "") {
				result = existFile( file);
				
			}//if
	  }
	  if( result)
	  {
		alert("����������Ѿ���ӹ���,����ӵĸ������ѱ�ɾ��");
		//document.sendmail."+fileId+".value=""";
		var attach_num = fileId.substring(10,12);
		
		delfile("idfilespan",attach_num);
		 
		//--attaIdx;
		//document.getElementById( "idAttachOper"+ attaIdx).click();
	  }
	add();
}//end of function
//added by alun
function getfilename( attaName ) {
	var s = attaName.lastIndexOf( '\\' );
	return attaName.substr(s+1, attaName.length - s -1);
}
//added by alun
function existFile( file)
{
	/*var form = document.sendmail;
	for ( var i= 0 ; i < form.elements.length ; i ++ ) {				    
		if ( form.elements[i].type == "file" && form.elements[i].name != file.name ) {
			if ( file.value == form.elements[i].value ) {
				//alert(form.elements[i].value=null);
				return true;
			}
		}
	}//for
	for (var i=0; i<ExistAttaInfo.length; i++) {
		var theName = ExistAttaInfo[i];
		if ( theName != null && theName != "" && theName == getfilename(file.name) ) {
			return true;
		}
	}*/
	return false;
}
//----------------------------------------addfile(spanId,index)----------------------------------------------
function addfile(spanId,index)
{
       var strIndex = "" + index;
	   var filename="attachfile";
	   var fileId = "attachfile"+ strIndex;
	   var brId = "idAttachBr" + strIndex;
	   //alert(filename);
	   addInputFile(spanId,fileId ,filename);

	   adddel(spanId,index);

	   addbr(spanId,brId);
	   //document.getElementById( "attachfile"+ strIndex).click();
	   return;
}

function addfilewithctx(spanId,filename,index)
{
       var strIndex = "" + index;
	   
	   var fileId = "nodeattachfile_"+filename+"_"+strIndex;
	   var brId = "idAttachBr" + strIndex;
	   addInputFile(spanId,fileId);

	   adddel_1(spanId,filename,index);

	   addbr(spanId,brId);
	   //document.getElementById( "attachfile"+ strIndex).click();
	   return;
}
//-------------------------------------------sub fuction addInputFile-----------------------------------------
function addInputFile(spanId,fileId,filename)
{
	  var span = document.getElementById(spanId);
	  if ( span !=null ) {
	                if ( !IsIE ) {
						var fileObj = document.createElement("input");
						if ( fileObj != null ) {
							fileObj.type="file";
							fileObj.name = filename;
							fileObj.id = fileId;
							fileObj.size="50";
							//var clickEvent = "exist('" + fileId + "')";
							//fileObj.setAttribute("onclick",clickEvent,0);  
							span.appendChild(fileObj);
						}//if fileObj
					}// !IsIE

					if ( IsIE ) {
						var fileTag = "<input type='file'  id ='" + fileId + "' style='BORDER-RIGHT: #000000 1px solid; background-color: #FFFFFF; BORDER-TOP: #000000 1px solid; OVERFLOW: no; vertical-align: top;  BORDER-LEFT: #000000 1px solid; WIDTH: 90%; BORDER-BOTTOM: #000000 1px solid; HEIGHT: 20' size=50 name='" + filename + "' size=50>";
						var fileObj = document.createElement(fileTag); 
						span.appendChild(fileObj);
					}//IsIE if
			
	  }//if span
}

function addbr(spanId,brId)
{
	  var span = document.getElementById(spanId);
	  if ( span !=null ) {
			var brObj = document.createElement("br");
			if ( brObj !=null ) {
				brObj.name = brId;
				brObj.id = brId;
				span.appendChild(brObj);
            }//i2f
     }//if
	 return;
}

function adddel(spanId,index)
{
      var strIndex = "" + index;
	  var delId = "idAttachOper" + strIndex;
	  var span = document.getElementById(spanId);
	  if ( span != null ) {
			var oTextNode = document.createElement("SPAN");
			oTextNode.style.width = "5px";
			span.appendChild(oTextNode);
		    if ( IsIE ) {
	        var tag = "<input type='submit' style='BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; OVERFLOW: no; BORDER-LEFT: #000000 1px solid;  BORDER-BOTTOM: #000000 1px solid; HEIGHT: 20' size=70 value='$subject'  id='" + delId + "' onclick=delfile('" + spanId + "',"+strIndex+")></input>";
			var delObj = document.createElement(tag);
			if ( delObj != null ) {
				span.appendChild(delObj);
			}//if

			}// Is IE
			
	        if ( !IsIE ) {
				var delObj = document.createElement("input");
				if ( delObj != null ) {
					delObj.name = delId;
					delObj.id = delId;
					delObj.type = "button";
					var clickEvent = "return delfile('" + spanId + "',"+strIndex+");";
					delObj.setAttribute("onclick",clickEvent);  
					span.appendChild(delObj);
				}//if
			}// !IsIE if
			if( delObj != null) delObj.value = "ɾ ��";
		}//main if
		return;
}

function adddel_1(spanId,filename,index)
{
      var strIndex = "" + index;
	  var delId = "idAttachOper" + strIndex;
	  var span = document.getElementById(spanId);
	  if ( span != null ) {
			var oTextNode = document.createElement("SPAN");
			oTextNode.style.width = "5px";
			span.appendChild(oTextNode);
		    if ( IsIE ) {
	        var tag = "<input type='submit' style='BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; OVERFLOW: no; BORDER-LEFT: #000000 1px solid;  BORDER-BOTTOM: #000000 1px solid; HEIGHT: 20' size=70 value='$subject'  id='" + delId + "' onclick=delfile_1('" + spanId + "','"+filename+"',"+strIndex+")></input>";
			var delObj = document.createElement(tag);
			if ( delObj != null ) {
				span.appendChild(delObj);
			}//if

			}// Is IE
			
	        if ( !IsIE ) {
				var delObj = document.createElement("input");
				if ( delObj != null ) {
					delObj.name = delId;
					delObj.id = delId;
					delObj.type = "button";
					var clickEvent = "return delfile_1('" + spanId + "','"+filename+"',"+strIndex+");";
					delObj.setAttribute("onclick",clickEvent);  
					span.appendChild(delObj);
				}//if
			}// !IsIE if
			if( delObj != null) delObj.value = "ɾ ��";
		}//main if
		return;
}

//-------------------------------------------------------------------------------------------------------------


//---------------------------------------------delete input file-----------------------------------------------
function delfile(spanId,index)
{
	   var strIndex = "" + index;
	   var fileId = "attachfile"+ strIndex;
	   var brId = "idAttachBr" + strIndex;
	   var delId = "idAttachOper" + strIndex;
	   //first,get the element
       var span = document.getElementById(spanId);
	   //alert(  "del span: " + span  );
	   if ( span == null ) return false;

	   var fileObj = document.getElementById(fileId);
	   if ( fileObj == null ) return false;

	   var brObj = document.getElementById(brId);
	   if ( brObj ==null ) return false;

	   var delObj = document.getElementById(delId );
	   //alert(  "del delId: " + delObj  );
	   if ( delObj == null ) return false;

       //second,create the replace element
	   var temp= document.createElement("SPAN");
	   //third,replace it
	    span.replaceChild(temp,fileObj);
		span.replaceChild(temp,brObj);
		// Added by Harry, Repair Remove attached bug 2005/04/04
		span.removeChild(delObj.previousSibling);
		var attach = document.getElementById("attach");
		if(span.getElementsByTagName("INPUT").length == 1) attach.childNodes[0].nodeValue='��Ӹ���';
		// End
		span.replaceChild(temp,delObj);	
		
		return false;
}

function delfile_1(spanId,filename,index)
{
	   var strIndex = "" + index;
	   var fileId = "nodeattachfile_"+filename+"_"+strIndex;
	   var brId = "idAttachBr" + strIndex;
	   var delId = "idAttachOper" + strIndex;
	   //first,get the element
       var span = document.getElementById(spanId);
	   //alert(  "del span: " + span  );
	   if ( span == null ) return false;

	   var fileObj = document.getElementById(fileId);
	   if ( fileObj == null ) return false;

	   var brObj = document.getElementById(brId);
	   if ( brObj ==null ) return false;

	   var delObj = document.getElementById(delId );
	   //alert(  "del delId: " + delObj  );
	   if ( delObj == null ) return false;

       //second,create the replace element
	   var temp= document.createElement("SPAN");
	   //third,replace it
	    span.replaceChild(temp,fileObj);
		span.replaceChild(temp,brObj);
		// Added by Harry, Repair Remove attached bug 2005/04/04
		span.removeChild(delObj.previousSibling);
		var attach = document.getElementById("attach");
		if(span.getElementsByTagName("INPUT").length == 1) attach.childNodes[0].nodeValue='��Ӹ���';
		// End
		span.replaceChild(temp,delObj);	
		
		return false;
}