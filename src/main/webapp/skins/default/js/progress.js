function ProgressStrip(instNamePara){
	//id
	this.id="ProgressStrip";
	//x坐标
	this.posX=0;
	//y坐标
	this.posY=0;
	//当前格
	this.index=0;
	//当前颜色
	this.cIndex=0;
	//颜色数组
	this.color=['#00FF00','#9966CC'];
	//速率
	this.rate=100;
	//长度（分格数）
	this.length=40;
	//高px
	this.height=40;
	//计时器
	this.timer;
	//网页实例
	this.instance;
	//实例名称
	this.instName=instNamePara;
	//网格数组
	this.grids;
	//循环次数
	this.cycleTime=0;
	//提示消息
	this.mesg="&nbsp;&nbsp;正在处理，请稍候...";
	//运行标志
	this.isStop=false;
	//运行标志
	this.isRunning=false;
	//鼠标宽
	this.mwidth=9;
	//鼠标高
	this.mheight=18;
	//-------functions--------
	//启动
	this.start=startProgress;
	//停止
	this.stop=stopProgress;
	//显示
	this.show=progressShow;
		//显示
	this.hide=progressHide;
	//显示
	this.write=progressWrite;
	//改变当前格颜色
	this.chgColor=chgColor;
	//循环次数
	this.progressCycle=progressCycle;
	//提示消息设置
	this.setMsg=setProgressMesg;
	//设置速率
	this.setRate=setProgressRate;
	//设置长度
	this.setLength=setProgressLength;
	//设置位置
	this.setPos=setProgressPos;
	//放到屏幕中心位置
	this.goCenter = progressGoCenter;
}
function setProgressPos(x,y){
	pw = document.body.clientWidth;
	ph = document.body.clientHeight;
	if(x>pw)x=pw;
	if(y>ph)y=ph;
	this.posX=x;
	this.posY=y;
	if(this.instance!=undefined){
		width = this.length*4+2;
		height = this.height;
		if((width+x)<pw)
			this.instance.style.left=x;
		else
			this.instance.style.left=x-width;
		if((height+y)<ph)
			this.instance.style.top=y;
		else
			this.instance.style.top=y-height;
	}
}
function progressGoCenter(){
	pw = document.body.clientWidth;
	ph = document.body.clientHeight;
	if(this.instance!=undefined){
		width = this.length*4+2;
		height = this.height;
		this.instance.style.left=(pw-width)/2;
		this.instance.style.top=(ph-height)/2;
	}
}
function startProgress(){
	this.isRunning=true;
	this.isStop=false;
	this.timer=setTimeout(this.instName+".progressCycle()",this.rate);
}
function stopProgress(){
	this.isStop=true;
	this.isRunning=false;
	if(this.timer!=undefined)
		clearTimeout(this.timer);
}
function progressCycle(){
	this.chgColor();
	clearTimeout(this.timer);
	if(this.isStop)return;
	setTimeout(this.instName+".progressCycle()",this.rate);
}
function setProgressRate(rate){
	if(rate<1)rate=1;
	if(rate>100)rate=100;
	this.rate=1000/rate;
	this.stop();
	this.start();
}
function setProgressLength(length){
	this.length=length;
}
function chgColor(){
	var grids = this.grids;
	var curtd = grids[this.index];
	curtd.style.background=this.color[this.cIndex];
	this.index++;
	if(this.index==this.length){
		this.index=0;
		this.cIndex=(this.cIndex+1)%2;
		this.cycleTime++;
	}
}
function setProgressMesg(mesg){
	this.mesg="&nbsp;&nbsp;"+mesg;
	var span = document.getElementById(this.id+"MsgSpan");
	if(span==null||span==undefined)return;
	span.innerHTML=this.mesg;
}
function progressShow(){
	if(event==undefined&&event==null){	
	    this.instance.style.display="block";
	    if(!this.isRunning)this.start();
		this.goCenter();
		return;
	}
	x=event.clientX;
	y=event.clientY;	
	if(x!=undefined&&y!=undefined&x!=null&y!=null)
		this.setPos(x+9,y+18);
	
	this.instance.style.display="block";
	if(!this.isRunning)this.start();
}
function progressHide(){
	if(event==undefined&&event==null){	
	    this.instance.style.display="none";
	    if(this.isRunning)this.stop();
		return;
	}
	this.instance.style.display="none";
	if(this.isRunning)this.stop();
}
function progressWrite(){
	var progressHTML =
	 "<div id=\""+this.id+"\""
	 +"style=\""
	 +"display:none;"
	 +"width:"+(this.length*4+2)+"px;"
	 +"height:40px;"
	 +"cursor:arrow;"
	 +"z-index:2000000000;"
	 +"position:absolute;"
	 +"top:"+this.posY+";"
	 +"left:"+this.posX+";"
	 +"background-color:#99CCCC;"
	 +"border:1px solid blue;"
	 +"\">"
	 +"<table  style=\""
	 +"padding:0px;"
	 +"margin:0px; "
	 +"border-collapse:Collapse;"
	 +"\""
	 +">"
	 +" <tr>"
	;
	for(i=0;i<this.length;i++){
		progressHTML+=
		"<td style=\""
		+"background-color:"+this.color[1]+";"
		+"width:2px; "
		+"height:3px;"
		+"border:0px;"
		+"\" id=\""
		+this.id
		+"td\"></td>";
	}
	progressHTML+=
	 " </tr><tr "
	 +"style=\""
	 +"height:33px;"
	 +"\">"
	 +"<td colspan="+this.length
	 +" id=\""+this.id+"MsgSpan\" "
	 +"style=\""
	 +"font-size:9pt;"
	 +"color:blue;"
	 +"text-align:left;"
	 +"text-overflow:ellipsis;"
	 +"vertical-align:bottom;"
	 +"padding-top:2px;"
	 +"padding-bottom:0px;"
	 +"border-top:1px solid blue;"
	 +"\">"
	 +this.mesg;
	 +"</td></tr>"
	 +"</table></div>"
	;
	document.write(progressHTML);
	this.instance=document.all(this.id);
	this.grids=document.all(this.id+"td");;
	//this.show();
}

var strip = new ProgressStrip('strip');
