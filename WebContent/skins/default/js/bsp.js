var MatrixCol = "σ";
var MatrixRow = "τ";
var menutype=null;
//获取main窗口，不同项目根据自己情况修改
function getMainFrame(){
//if(menutype==null)
//	menutype=getMenuType();
//if(menutype=="")	{
//  return parent.main;
//}else{
//  return top.main;
//  }
  if(parent.main)
  	return parent.main;
  	else
  	return top.main;
}
//获取tree窗口，不同项目根据自己情况修改
function getTreeFrame(){
//if(menutype==null)
//	menutype=getMenuType();
if(parent.tree)
	return parent.tree;
else{
  if(top._tree)		
  	   return top._tree;
}
	return top.contents.new_date;
//if(menutype=="")	
// return parent.tree;
// else
// return top.contents.new_date;
}
//是否特殊字符(不包含英文.号)
function isQuoteIn(s)
{
	var re = /\"|\'|\“|\”|\‘|\’|\%|\$|\￥|\……|\·|\—|\-|\——|\!|\！|\#|\@|\~|\^|\*|\,|\，|\。|\?|\？|\;|\；|\:|\：|\{|\}|\\|\/|\[|\]|\(|\)|\+|\-|\、|\||\<|\>/;
	return re.test(s);
}
function displayLoading(id){
  var loading=document.all(id);
  var loadtop=document.body.clientHeight/2-25;
  var loadleft=document.body.clientWidth/2-100;
  loading.style.left=loadleft;
  loading.style.top=loadtop;
  loading.style.display="block";
}
//是否有特殊符号(除了.)
function __isQuoteInMail(s)
{
	var re = /\"|\'|\“|\”|\‘|\’|\%|\$|\&|\￥|\……|\·|\—|\——|\!|\！|\#|\@|\~|\^|\*|\,|\，|\。|\?|\？|\;|\；|\:|\：|\{|\}|\\|\/|\[|\]|\(|\)|\+|\、|\||\<|\>/;
	return re.test(s);
}
// 本方法是判断字符是否符合域名的命名规则
// 域名只能包括字母、数字和英文连接符(-)
// 此处再加上英文冒号(:)斜杠(/)和点(.)
// 字符s只能包括以上六种符号，如 http://localhost:8080/dcwork
// 满足条件返回true，否则返回false
function checkDomainName(s){
	var re = /^([A-Za-z0-9\-\:\/\.]*)$/;
	return re.test(s);
}

function getHrefNoBlank(url,idnames){
	if (url==null){
		return "";
	}
	if ((idnames==null)||(idnames=="")){
		return "";
	}
	var idnamearr=idnames.split(MatrixRow);
	var ret = "";
	for (var i=0;i<idnamearr.length;i++){
		var idname = idnamearr[i].split(MatrixCol);
		if (ret=="")
			ret="<a href=\""+url+idname[0]+"&matrix=true"+"\">"+idname[1]+"</a>";
		else
			ret=ret+" "+"<a href=\""+url+idname[0]+"&matrix=true"+"\">"+idname[1]+"</a>";
	}
	return ret;
}

function transMatrix(ids,names){
	var idArray=ids.split(MatrixCol);
	var nameArray=names.split(MatrixCol);
	if (idArray.length!=nameArray.length){
		return;
	}
	var ret="";
	for(var i=0;i<idArray.length;i++){
		if (ret=="")
			ret=idArray[i]+MatrixCol+nameArray[i];
		else
			ret=ret+MatrixRow+idArray[i]+MatrixCol+nameArray[i];
	}
	return ret;
}

//校验附件不能重名,传入的参数是grid的名称grid，附件所在的列
function checkAttachSameName(grid,col){
	var rowcount=grid.returnRowCount(); 
	for(var i=1;i<rowcount;i++)
	{	var fileI=grid.getCellValue(i,col);
		var myfileI=fileI.split("\\");
		var fileNameI=myfileI[myfileI.length-1];
		for(var j=i+1;j<=rowcount;j++)
		{	
			var fileJ=grid.getCellValue(j,col);
			var myfileJ=fileJ.split("\\");
			var fileNameJ=myfileJ[myfileJ.length-1];
			if(fileNameI==fileNameJ){
			return false;
			}
		}
	}
	return true;
}