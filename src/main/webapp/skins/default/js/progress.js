function ProgressStrip(instNamePara){
	//id
	this.id="ProgressStrip";
	//x����
	this.posX=0;
	//y����
	this.posY=0;
	//��ǰ��
	this.index=0;
	//��ǰ��ɫ
	this.cIndex=0;
	//��ɫ����
	this.color=['#00FF00','#9966CC'];
	//����
	this.rate=100;
	//���ȣ��ָ�����
	this.length=40;
	//��px
	this.height=40;
	//��ʱ��
	this.timer;
	//��ҳʵ��
	this.instance;
	//ʵ������
	this.instName=instNamePara;
	//��������
	this.grids;
	//ѭ������
	this.cycleTime=0;
	//��ʾ��Ϣ
	this.mesg="&nbsp;&nbsp;���ڴ������Ժ�...";
	//���б�־
	this.isStop=false;
	//���б�־
	this.isRunning=false;
	//����
	this.mwidth=9;
	//����
	this.mheight=18;
	//-------functions--------
	//����
	this.start=startProgress;
	//ֹͣ
	this.stop=stopProgress;
	//��ʾ
	this.show=progressShow;
		//��ʾ
	this.hide=progressHide;
	//��ʾ
	this.write=progressWrite;
	//�ı䵱ǰ����ɫ
	this.chgColor=chgColor;
	//ѭ������
	this.progressCycle=progressCycle;
	//��ʾ��Ϣ����
	this.setMsg=setProgressMesg;
	//��������
	this.setRate=setProgressRate;
	//���ó���
	this.setLength=setProgressLength;
	//����λ��
	this.setPos=setProgressPos;
	//�ŵ���Ļ����λ��
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
