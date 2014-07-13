/******************************************************************************************
*                      xml menu 1.61
*      ocean(ocean@garden.net.cn)
*******************************************************************************************/
function menuItem(){
this.id="";
this.text="menuItem";
this.url="http://www.microsoft.com";
this.target="";
this.selected="";
this.type="";
this.radiogroup=""
this.icon ="";
this.title ="";
this.marker =false;
this.disable =false;
this.subMenu=null;
this.root=null;
}
function menuBar(){
this.backgroundColor ="";
this.backgroundImage ="";
this.overImage ="";
this.overColor ="";
this.textColor ="";
this.textOverColor ="";
this.width="";
this.borderColor ="";
this.arrow ="";
this.fontSize ="";
this.cursor ="";
this.height="";
this.padding="";
this.style ="vertical";
this.zIndex=1;
this.rightMode =false;

this.menuNode =new Array();
this.root=null;
}
menuBar.prototype.addMenuItem=function (id,text,url,icon,title,target,selected,type,radiogroup){
this.menuNode[this.menuNode.length]=new menuItem();
this.menuNode[this.menuNode.length-1].id=(id==null)?"":id;
this.menuNode[this.menuNode.length-1].text=(text==null)?"":text;
this.menuNode[this.menuNode.length-1].url=(url==null)?"":url;
this.menuNode[this.menuNode.length-1].icon =(icon ==null)?"":icon;
this.menuNode[this.menuNode.length-1].title =(title ==null)?"":title;
this.menuNode[this.menuNode.length-1].target =(target ==null)?"":target;
this.menuNode[this.menuNode.length-1].selected =(selected ==null)?"":selected;
this.menuNode[this.menuNode.length-1].type =(type ==null)?"":type;
this.menuNode[this.menuNode.length-1].radiogroup =(radiogroup ==null)?"":radiogroup;
this.menuNode[this.menuNode.length-1].root=this;
}
menuBar.prototype.addSeparator =function (id){
this.addMenuItem(id,"","","","","","","","");//lyn add 5
}
menuBar.prototype.getMenuItem=function (id){
for (var i=0;i<this.menuNode.length;i++){
if(this.menuNode[i].id==id)
return this.menuNode[i];
else {
if(this.menuNode[i].subMenu!=null){var result=this.menuNode[i].subMenu.getMenuItem(id);if(result!=null)return result;
}
}
}
return null;
}
function XMLMenu(menuName){
this.xmlDoc=null;
this.subMenu=null;
this.menuName =menuName;
this.root=null;
this.container ="";
this.backgroundColor ="#f1f1f1";
this.backgroundImage ="";
this.overImage ="";
this.overColor ="#cccccc";
this.textColor ="#000000";
this.textOverColor ="#000000"
this.width="150";
this.borderColor ="#999999";
this.fontSize ="12px";
this.arrow ="";
this.cursor ="default";
this.height="22px";
this.padding="2px";
this.noBgColor =false;
this.noBorderColor =false;
this.zIndex=1;
}
XMLMenu.prototype.loadData=function (url,type){
var xmlDoc=new ActiveXObject("Msxml.DOMDocument");
xmlDoc.async=false;
if(type=="1")
xmlDoc.loadXML(url);
else
xmlDoc.load(url);

var err =xmlDoc.parseError;
if(err.errorCode !=0)
return false;
this.xmlDoc=xmlDoc.childNodes[1];
this.initMenu(this.xmlDoc,this,100);
this.attachSubMenu(this.subMenu);
return true;
}
XMLMenu.prototype.loadDataIsland=function (XMLID,win){
if(win ==null)win =window;
this.xmlDoc=win.document.all(XMLID).XMLDocument.childNodes[0];

this.initMenu(this.xmlDoc,this,100);
this.attachSubMenu(this.subMenu);
}
XMLMenu.prototype.initMenu=function (xmlDoc,root,zIndex){
var oMenuBar =null;
if(xmlDoc.childNodes.length>0){
oMenuBar =new menuBar();
oMenuBar.root=root;
}
if(root==this){if(xmlDoc.getAttribute("background-color")!=null)
this.backgroundColor =xmlDoc.getAttribute("background-color");
if(xmlDoc.getAttribute("background-image")!=null)
this.backgroundImage =xmlDoc.getAttribute("background-image");
if(xmlDoc.getAttribute("over-image")!=null)
this.overImage =xmlDoc.getAttribute("over-image");
if(xmlDoc.getAttribute("over-color")!=null)
this.overColor =xmlDoc.getAttribute("over-color");
if(xmlDoc.getAttribute("color")!=null)
this.textColor =xmlDoc.getAttribute("color");
if(xmlDoc.getAttribute("text-overcolor")!=null)
this.textOverColor =xmlDoc.getAttribute("text-overcolor");
if(xmlDoc.getAttribute("width")!=null)
this.width=xmlDoc.getAttribute("width");
if(xmlDoc.getAttribute("cursor")!=null)
this.cursor =xmlDoc.getAttribute("cursor");
if(xmlDoc.getAttribute("font-size")!=null)
this.fontSize =xmlDoc.getAttribute("font-size");
if(xmlDoc.getAttribute("height")!=null)
this.height=xmlDoc.getAttribute("height");
if(xmlDoc.getAttribute("border-color")!=null)
this.borderColor =xmlDoc.getAttribute("border-color");
if(xmlDoc.getAttribute("padding")!=null)
this.padding=xmlDoc.getAttribute("padding");
this.zIndex=(zIndex==null)?1:zIndex;
this.arrow =(xmlDoc.getAttribute("arrow")==null)?"":xmlDoc.getAttribute("arrow");
this.style =(xmlDoc.getAttribute("style")==null)?"vertical":xmlDoc.getAttribute("style");
this.noBgColor =(xmlDoc.getAttribute("noBgColor")=="true")?true :false;
this.noBorderColor =(xmlDoc.getAttribute("noBorderColor")=="true")?true :false;
}
if(oMenuBar !=null){
oMenuBar.backgroundColor =(xmlDoc.getAttribute("background-color")==null)?this.backgroundColor :xmlDoc.getAttribute("background-color");
oMenuBar.backgroundImage =(xmlDoc.getAttribute("background-image")==null)?this.backgroundImage :xmlDoc.getAttribute("background-image");
oMenuBar.overImage =(xmlDoc.getAttribute("over-image")==null)?this.overImage :xmlDoc.getAttribute("over-image");
oMenuBar.overColor =(xmlDoc.getAttribute("over-color")==null)?this.overColor :xmlDoc.getAttribute("over-color");
oMenuBar.textColor =(xmlDoc.getAttribute("color")==null)?this.textColor :xmlDoc.getAttribute("color");
oMenuBar.textOverColor =(xmlDoc.getAttribute("text-overcolor")==null)?this.textOverColor :xmlDoc.getAttribute("text-overcolor");
oMenuBar.width=(xmlDoc.getAttribute("width")==null)?this.width:xmlDoc.getAttribute("width");
oMenuBar.arrow =(xmlDoc.getAttribute("arrow")==null)?this.arrow :xmlDoc.getAttribute("arrow");
oMenuBar.borderColor =(xmlDoc.getAttribute("border-color")==null)?this.borderColor :xmlDoc.getAttribute("border-color");
oMenuBar.fontSize =(xmlDoc.getAttribute("font-size")==null)?this.fontSize :xmlDoc.getAttribute("font-size");
oMenuBar.cursor =(xmlDoc.getAttribute("cursor")==null)?this.cursor :xmlDoc.getAttribute("cursor");
oMenuBar.height=(xmlDoc.getAttribute("height")==null)?this.height:xmlDoc.getAttribute("height");
oMenuBar.padding=(xmlDoc.getAttribute("padding")==null)?this.padding:xmlDoc.getAttribute("padding");
oMenuBar.zIndex=(zIndex==null)?1:zIndex;
}
root.subMenu=oMenuBar;
for (var i=0;i<xmlDoc.childNodes.length;i++){
if(xmlDoc.childNodes[i].nodeName =="menu")
//1
oMenuBar.addMenuItem(xmlDoc.childNodes[i].getAttribute("id"),xmlDoc.childNodes[i].getAttribute("text"),xmlDoc.childNodes[i].getAttribute("url"),xmlDoc.childNodes[i].getAttribute("icon"),xmlDoc.childNodes[i].getAttribute("title"),xmlDoc.childNodes[i].getAttribute("target"),xmlDoc.childNodes[i].getAttribute("selected"),xmlDoc.childNodes[i].getAttribute("type"),xmlDoc.childNodes[i].getAttribute("radiogroup"));
else if(xmlDoc.childNodes[i].nodeName =="separator")
oMenuBar.addSeparator(xmlDoc.childNodes[i].getAttribute("id"));
this.initMenu(xmlDoc.childNodes[i],oMenuBar.menuNode[i],zIndex+1);}
return;
}
XMLMenu.prototype.show =function (container){
var html="";
//alert("beg"+this.style)
//if(this.style!="vertical")
html=this.horizontalOuterHTML();
//else
//html=this.verticalOuterHTML();


//alert("html--"+html)
var oContainer =null
if(container !=null)
oContainer =document.all(container);
if(oContainer !=null)
{
oContainer.innerHTML=html;
//alert("888--"+html)
}
else
document.write (html);
var f=new Function("event",this.menuName+".doDocumentClick()");
document.attachEvent("onclick",f);
}
/*XMLMenu.prototype.verticalOuterHTML=function (){
var html='<div id="'+this.menuName+'" align="left" menuType="mainMenu" style="display:block;';
if(!this.noBgColor)
html+='background-color:'+this.subMenu.backgroundColor;
if(this.backgroundImage !="")
html+=';background-image:url('+this.backgroundImage +')';

html+=';color:'+this.subMenu.textColor+';width:'+this.subMenu.width+';border:1px solid '+this.borderColor+';font-size:'+this.fontSize
html+=';cursor:'+this.cursor+';padding:'+this.padding+';" onclick="'+this.menuName+'.doClick(this)" onmouseover="';
html+=this.menuName+'.doMouseOver(this)" onmouseout="'+this.menuName+'.doMouseOut(this)">';
html+=this.verticalInnerHTML();
html+="</div>";

return html;
}
XMLMenu.prototype.verticalInnerHTML=function (){
var html="";
for (var i=0;i<this.subMenu.menuNode.length;i++){
if(this.subMenu.menuNode[i].text!=""){html+='<div style="';
html+=(this.noBgColor ||this.backgroundImage !="")?'border:none':('border:1px solid '+this.backgroundColor);
html+=';height:'+this.subMenu.height+';padding:3px" id="'+this.menuName+'menuItem'+this.subMenu.menuNode[i].id+'" title="'+this.subMenu.menuNode[i].title+'" menuType="menuItem">';
html+='<span style="width:95%">';
if(this.subMenu.menuNode[i].icon !="")
html+='<img src="'+this.subMenu.menuNode[i].icon+'" align="absmiddle"> ';
html+=this.subMenu.menuNode[i].text+"</span>";
if(this.subMenu.menuNode[i].subMenu!=null&&this.subMenu.arrow !="")
html+="<div style='display:inline' align=right><img src='"+this.subMenu.arrow +"'></div>"
html+="</div>";
}
else {
html+='<div id="'+this.subMenu.menuNode[i].id+'" style="padding:1px;margin-bottom:3px;border-bottom:1px solid '+this.borderColor+'" menuType="separator"></div>';
}
}
return html;
}
XMLMenu.prototype.verticalSmallHTML=function (){
var html="";
for (var i=0;i<this.subMenu.menuNode.length;i++){
if(this.subMenu.menuNode[i].text!=""){html+='<div style="border:1px solid '+this.backgroundColor+';height:'+this.subMenu.height+';padding:3px" id="'+this.menuName+'menuItem'+this.subMenu.menuNode[i].id+'" title="'+this.subMenu.menuNode[i].title+'" menuType="menuItem">';
if(this.subMenu.menuNode[i].icon !="")
html+='<img src="'+this.subMenu.menuNode[i].icon+'" align="absmiddle"> ';
html+="</div>";
}
}
return html;
}*/
XMLMenu.prototype.horizontalOuterHTML=function (){
var html='<div nowrap id="'+this.menuName+'" align="left" menuType="mainMenu" style="display:block;margin:0';
if(!this.noBgColor)
html+=';background-color:'+this.subMenu.backgroundColor;
if(this.backgroundImage !="")
html+=';background-image:url('+this.backgroundImage +')';
html+=';color:'+this.subMenu.textColor+';padding:'+this.padding+';';
html+=((!this.noBorderColor)?'border:none':('border:1px solid '+this.borderColor))+';font-size:'+this.fontSize
html+=';cursor:'+this.cursor+';height:"'+parseInt(this.subMenu.height)+parseInt(this.padding)+1+'; onclick="'+this.menuName+'.doClick(this)" onmouseover="';
html+=this.menuName+'.doMouseOver(this)" onmouseout="'+this.menuName+'.doMouseOut(this)">';
html+=this.horizontalInnerHTML();
tempdiv='';//'<div style="position:absolute;top:0;left:0;width:1000;height:700"></div>';
html+="</div>"+tempdiv;
return html;
}
XMLMenu.prototype.horizontalInnerHTML=function (){
var html="";
for (var i=0;i<this.subMenu.menuNode.length;i++){
if(this.subMenu.menuNode[i].text!=""){html+='<div style="display:inline;';
html+=((this.noBorderColor ||this.backgroundImage !="")?'border:none':('border:1px solid '+this.backgroundColor))+';height:'+this.subMenu.height+';padding:3px" id="'+this.menuName+'menuItem'+this.subMenu.menuNode[i].id+'" title="'+this.subMenu.menuNode[i].title+'" menuType="menuItem">';
html+='<span>'+this.subMenu.menuNode[i].text+'</span></div>';
html+='<span style="display:inline;margin-left:3px;padding:3px;height:'+this.subMenu.height+';width:6px;';
if(this.noBorderColor)
html+='border-left:1px solid '+this.borderColor+';'
html+='"></span>';
}
}
return html;
}
XMLMenu.prototype.horizontalSmallHTML=function (){
var html="";
for (var i=0;i<this.subMenu.menuNode.length;i++){
if(this.subMenu.menuNode[i].text!=""){html+='<div style="display:inline;border:1px solid '+this.backgroundColor+';height:'+this.subMenu.height+';padding:3px" id="'+this.menuName+'menuItem'+this.subMenu.menuNode[i].id+'" title="'+this.subMenu.menuNode[i].title+'" menuType="menuItem">';
html+='<img src="'+this.subMenu.menuNode[i].icon+'" align="absmiddle"></div>';
}
}
return html;
}
XMLMenu.prototype.attachSubMenu=function (subMenu){
if(subMenu==null)return;
var oDiv=document.createElement("DIV");
with(oDiv.style){
display="none";
backgroundColor =subMenu.backgroundColor;
if(subMenu.backgroundImage !="")
backgroundImage ='url('+subMenu.backgroundImage +')';
color =subMenu.textColor;
width=subMenu.width;
position ="absolute";
filter ="progid:DXImageTransform.Microsoft.Shadow(color='#777777', Direction=135, Strength=4)";
borderLeft ="1px solid white";
borderRight ="1px solid dimgray";
borderBottom ="1px solid dimgray";
borderTop ="1px solid white";
fontSize=subMenu.fontSize;
cursor=subMenu.cursor;
padding=subMenu.padding;
zIndex=subMenu.zIndex;
}
oDiv.id=this.menuName +"subMenu"+subMenu.root.id;
oDiv.setAttribute("menuType","subMenu");

var f=new Function ("event",this.menuName+".doClick(this)");
oDiv.onclick=f;
f=new Function ("event",this.menuName+".doMouseOut(this)");
oDiv.onmouseout=f;
f=new Function ("event",this.menuName+".doMouseOver(this)");
oDiv.onmouseover =f;
var html="";
for (var i=0;i<subMenu.menuNode.length;i++){
	//alert("leng0-"+subMenu.menuNode.length)
if(subMenu.menuNode[i].text!=""){html+='<div style="border:';
html+=(subMenu.backgroundImage !="")?"none":'1px solid '+subMenu.backgroundColor;
html+=';height:'+subMenu.height+';padding:3px" id="'+this.menuName+'menuItem'+subMenu.menuNode[i].id+'" title="'+subMenu.menuNode[i].title+'" menuType="menuItem"><span style="width:90%">';
if(subMenu.menuNode[i].icon !="")
html+='<img src="'+subMenu.menuNode[i].icon+'" align="absmiddle"> ';
//alert("select--"+subMenu.menuNode[i].selected+"__"+subMenu.menuNode[i].target)
if(subMenu.menuNode[i].selected=="true")//lyn beg 3
{
	if(subMenu.menuNode[i].type=="radio")
	{
		html+='<span style="font-family:webdings;font-size:9pt" align="absmiddle">=</span>'
	}
	else if(subMenu.menuNode[i].type=="checkbox")
	{
		html+='<span style="font-family:webdings;font-size:9pt" align="absmiddle">a</span>'
	}
}
else if(subMenu.menuNode[i].type=="radio" || subMenu.menuNode[i].type=="checkbox")
{
	html+='<span align="absmiddle">&nbsp;&nbsp;</span>'
}

//lyn end 3
html+=subMenu.menuNode[i].text+"</span>";
if(subMenu.menuNode[i].subMenu!=null&&subMenu.arrow !="")
html+="<div style='display:inline' align=right><img src='"+subMenu.arrow +"'></div>";
html+="</div>";
this.attachSubMenu(subMenu.menuNode[i].subMenu);}
else {
html+='<div id="'+subMenu.menuNode[i].id+'" style="padding:1px;margin-bottom:3px;border-bottom:1px solid '+subMenu.borderColor+'" menuType="separator"></div>';
}
}
if(subMenu.root.root!=null){
oDiv.innerHTML=html;
document.body.insertAdjacentElement("AfterBegin",oDiv);
//alert("html22--"+html)
}
}
XMLMenu.prototype.doDocumentClick=function (oThis){
if(this.rightMode)this.hideMenu(this);
else
this.hideMenu(this.subMenu);
}
XMLMenu.prototype.doOutClk=function()
{
if(this.subMenu!=null)
this.hideMenu(this.subMenu);
}
XMLMenu.prototype.doClick=function (oThis){
window.event.cancelBubble =true;
window.event.returnValue =false;
var oE=this.getElement(window.event.srcElement,"menuType","menuItem");
if(oE==null)return;
var menu=this.subMenu.getMenuItem(oE.id.replace(this.menuName+"menuItem",""));
if(menu==null)return;
if(menu.disable)return;
if(menu.subMenu==null){
	//2begin
	if(menu.type=="radio" || menu.type=="checkbox")
	{
		this.findId(this.subMenu,menu.id)
		menu.selected="true"
		this.reShowMenu();
	}
	if(menu.target=="main")
	{
		//top.d1.main.frmfrmmain.location.href=menu.url;
		top.main.location.href=menu.url;
	}
	else if(menu.target=="blank")
	{
		window.open(menu.url)
	}
	else if(menu.target=="top")
	{
		top.location.href=menu.url;
	}
	else if(menu.target=="tree")
	{
		if(top.d1.contents.frmtree==null)
		{
			alert("此菜单导航栏未打开,请先打开导航栏!")
		}
		else
		{
			top.d1.contents.frmtree.location.href=menu.url
		}
	}
	//end
if(this.rightMode)this.hideMenu(this);else
this.hideMenu(this.subMenu);
}
else
if(!this.rightMode &&menu.root==this.subMenu)this.showSubMenu(menu,oE);
}
XMLMenu.prototype.doMouseOver =function (oThis){
var oE=this.getElement(window.event.srcElement,"menuType","menuItem");
if(oE==null)return;
var menu=this.subMenu.getMenuItem(oE.id.replace(this.menuName+"menuItem",""));
if(menu==null)return;
if(menu.root==null)return;
var flag=this.hideMenu(menu.root);
if(!menu.marker)with(oE.style){
backgroundColor =menu.root.overColor;
if(menu.root.overImage !="")
backgroundImage ="url("+menu.root.overImage +")";
if(border !=""&&border !="none")
border ="1px solid "+menu.root.borderColor;
}
oE.style.color =menu.root.textOverColor;
if(menu.subMenu!=null&&(this.rightMode ||menu.root!=this.subMenu||menu.root==this.subMenu&&flag))this.showSubMenu(menu,oE);
}
XMLMenu.prototype.doMouseOut=function (oThis){
var oE=this.getElement(window.event.srcElement,"menuType","menuItem");
if(oE==null)return;
var menu=this.subMenu.getMenuItem(oE.id.replace(this.menuName+"menuItem",""));
if(menu==null)return;
var toSubMenu=document.all(this.menuName +"subMenu"+menu.id);
if(menu.subMenu!=null&&toSubMenu.style.display!="none"){
var oToE=this.getElement(window.event.toElement,"menuType","subMenu");
if(oToE==null)return;
if(toSubMenu==oToE)return;}
if(!menu.marker)with(oE.style){
backgroundColor ="";backgroundImage ="";
oE.style.color ="";
if(border !=""&&border !="none")
border ="1px solid "+menu.root.backgroundColor;
}
}
XMLMenu.prototype.smallMode =function (mode){
var mainMenu=document.all(this.menuName);
if(mainMenu==null)return;
mainMenu.innerHTML=(mode)?((this.style =="vertical")?this.verticalSmallHTML():this.horizontalSmallHTML()):((this.style =="vertical")?this.verticalInnerHTML():this.horizontalInnerHTML());
mainMenu.style.width=(this.style =="vertical")?((mode)?"0px":this.width):"";
}
XMLMenu.prototype.markerMenu=function (id,isMarker){
if(isMarker ==null)isMarker =true;
var menu=this.subMenu.getMenuItem(id);
if(menu==null)return;
menu.marker =isMarker;
var temp=document.all(this.menuName+"menuItem"+menu.id);
if(temp==null)return;
if(isMarker){
temp.style.backgroundColor =menu.root.overColor;
if(menu.root.overImage !="")
temp.style.backgroundImage ="url("+menu.root.overImage +")";
temp.style.color =menu.root.textOverColor;
}
else {
temp.style.backgroundColor ="";
temp.style.backgroundImage ="";
temp.style.color ="";
}
}
XMLMenu.prototype.isMarker =function (id){
var temp=this.subMenu.getMenuItem(id);
if(temp==null)
return null;
else
return temp.marker;
}
XMLMenu.prototype.hideMenu=function (subMenu){
var flag=false;
if(this.rightMode &&(subMenu==this)){
var mainMenu=document.all(this.menuName);
mainMenu.style.display="none";subMenu=subMenu.subMenu;}

if(subMenu==null)return;
var highMenu=(subMenu.root==this)?document.all(this.menuName):document.all(this.menuName +"subMenu"+subMenu.root.id);
if(highMenu==null)return;
var k=0;




if(highMenu==null)return;



if(highMenu.children==null)return;





{
for (j=0;j<highMenu.children.length;j++){
if(highMenu.children[j].menuType =="menuItem"){
if(subMenu!=this.subMenu||!this.noBgColor){
highMenu.children[j].style.backgroundColor =(subMenu.menuNode[k].marker)?subMenu.overColor :"";
if(subMenu.overImage !="")
highMenu.children[j].style.backgroundImage =(subMenu.menuNode[k].marker)?"url("+subMenu.overImage +")":"";
}
else {
highMenu.children[j].style.backgroundColor =(subMenu.menuNode[k].marker)?subMenu.overColor :"";
if(subMenu.overImage !="")
highMenu.children[j].style.backgroundImage =(subMenu.menuNode[k].marker)?"url("+subMenu.overImage +")":"";
}
highMenu.children[j].style.color =(subMenu.menuNode[k].marker)?subMenu.textOverColor :subMenu.textColor;
if(highMenu.children[j].style.border !=""&&highMenu.children[j].style.border !="none")
highMenu.children[j].style.border ="1px solid "+subMenu.backgroundColor;
}
if(highMenu.children[j].tagName =="DIV")k++;
}
}
for (var i=0;i<subMenu.menuNode.length;i++){
if(subMenu.menuNode[i].subMenu!=null){
var temp=document.getElementById(this.menuName+"subMenu"+subMenu.menuNode[i].id);
//alert(this.menuName+"subMenu"+subMenu.menuNode[i].id+"--"+document.getElementById("bbbsubMenu8").id+"--"+document.body.innerHTML)
if(temp!=null)
if(temp.style.display!="none"){
temp.style.display="none";
flag=true;
this.hideMenu(subMenu.menuNode[i].subMenu);
}
}
}
return flag;
}
XMLMenu.prototype.getElement=function (oE,typeName,value){
if(oE==null)return null;
while (oE!=null&&oE.tagName !="BODY")
{
eval('var flag = (oE.'+typeName+'=="'+value+'");');
if(flag)
return oE;
else
oE=oE.parentElement;
}
return null;
}
XMLMenu.prototype.getLeft=function (obj){
var left=obj.offsetLeft;
while (obj.tagName !="BODY"){
obj=obj.offsetParent;
left+=obj.offsetLeft;
}
return left;
}
XMLMenu.prototype.getTop=function (obj){
var top=obj.offsetTop;
while (obj.tagName !="BODY"){
obj=obj.offsetParent;
top+=obj.offsetTop;
}
return top;
}
/*XMLMenu.prototype.rightMenu=function (){
this.rightMode =true;
var oDiv=document.createElement("DIV");
with(oDiv.style){
display="none";
backgroundColor =this.subMenu.backgroundColor;
color =this.subMenu.textColor;
width=this.subMenu.width;
height=0;
position ="absolute";
filter ="progid:DXImageTransform.Microsoft.Shadow(color='#777777', Direction=135, Strength=4)";
border ="1px solid "+this.borderColor;
fontSize=this.fontSize;
cursor=this.cursor;
padding=this.padding;
zIndex=80;
}
oDiv.id=this.menuName;
oDiv.align ="left";
oDiv.setAttribute("menuType","mainMenu");

var f=new Function ("event",this.menuName+".doClick(this)");
oDiv.onclick=f;
f=new Function ("event",this.menuName+".doMouseOut(this)");
oDiv.onmouseout=f;
f=new Function ("event",this.menuName+".doMouseOver(this)");
oDiv.onmouseover =f;
oDiv.innerHTML=this.verticalInnerHTML();
document.body.insertAdjacentElement("AfterBegin",oDiv);
f=new Function ("event",this.menuName+".doContextMenu()");
document.attachEvent("oncontextmenu",f);
var f=new Function("event",this.menuName+".doDocumentClick()");
document.attachEvent("onclick",f);
}*/
XMLMenu.prototype.doContextMenu=function (){
this.doDocumentClick();
window.event.returnValue =false;
window.event.cancelBubble =true;
var rMenu=document.all(this.menuName);
rMenu.style.display="block";
rMenu.style.left=this.getX(rMenu.offsetWidth,window.event.clientX,0);
rMenu.style.top=this.getY(rMenu.offsetHeight,window.event.clientY,0);
}
XMLMenu.prototype.getX=function (width,mouseX,left){
return ((mouseX+width<=document.body.clientWidth)?mouseX:mouseX-width-left)+document.body.scrollLeft;
}
XMLMenu.prototype.getY=function (height,mouseY,top){
return ((mouseY+height<=document.body.clientHeight)?mouseY:mouseY-height+top)+document.body.scrollTop;
}
XMLMenu.prototype.showSubMenu=function (menu,oE){
if(menu.disable)return;
var subMenu=document.all(this.menuName+"subMenu"+menu.id);
if(subMenu==null)return;
subMenu.style.display="block";
if(this.style =="horizontal"&&menu.root==this.subMenu){
subMenu.style.left=this.getLeft(oE);
subMenu.style.top=this.getTop(oE)+oE.offsetHeight;
}
else {
subMenu.style.left=this.getX(subMenu.offsetWidth,this.getLeft(oE)+oE.offsetWidth-document.body.scrollLeft,oE.offsetWidth);
subMenu.style.top=this.getY(subMenu.offsetHeight,this.getTop(oE)-document.body.scrollTop,oE.offsetHeight);
}
}
XMLMenu.prototype.disableMenu=function (id,isDisable){

if(isDisable ==null)isDisable =true;
var menu=this.subMenu.getMenuItem(id);
if(menu==null)return;
menu.disable =isDisable;
var temp=document.all(this.menuName+"menuItem"+menu.id);
if(temp==null)return;
if(isDisable){
temp.disabled=true;
temp.style.filter ="gray";
}
else {
temp.disabled=false;
temp.style.filter ="";
}
}
XMLMenu.prototype.isDisable =function (id){
var temp=this.subMenu.getMenuItem(id);
if(temp==null)
return null;
else
return temp.disable;
}
XMLMenu.prototype.loadMenu=function (url,container){
this.container =container;
this.xmlDoc=new ActiveXObject("Msxml.DOMDocument");
var f=new Function("event",this.menuName+".showMenu()");
this.xmlDoc.onreadystatechange =f;
this.xmlDoc.load(url);
}
XMLMenu.prototype.showMenu=function (){
//alert("1"+this.xmlDoc.xml)
var state =this.xmlDoc.readyState;
if(state ==4)
{

var err =this.xmlDoc.parseError;
if(err.errorCode !=0)
alert("菜单加载失败");
else {
this.xmlDoc=this.xmlDoc.childNodes[1];
this.initMenu(this.xmlDoc,this,100);
this.attachSubMenu(this.subMenu);
this.show(this.container);
}
}
}
//lyn add 4
XMLMenu.prototype.reShowMenu=function(){
	//alert("2")
	//this.xmlDoc=this.xmlDoc.childNodes[1];
	//this.initMenu(this.xmlDoc,this,100);
	this.attachSubMenu(this.subMenu);
	this.show("showtd");
}
XMLMenu.prototype.findId=function(subMenu,id){
	//for (var i=0;i<subMenu.menuNode.length;i++){
		//alert("ok-"+subMenu.menuNode.length)
	for (var i=0;i<parseInt(subMenu.menuNode.length);i++){
		//alert(subMenu.menuNode.length)
			if(subMenu.menuNode[i].id==id)
			{
				subMenu.menuNode[i].selected="true"
				break;
			}
			if(subMenu.menuNode[i].subMenu!=null)
			{
				this.findId(subMenu.menuNode[i].subMenu,id);
			}
	}
}