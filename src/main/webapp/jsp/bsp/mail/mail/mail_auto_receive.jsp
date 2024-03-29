<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<script language='javascript'>   
var rootUrl = '<%=SkinUtils.getRootUrl(request)%>';
//************************************************************************
//**************        Message类                      ********************
//************************************************************************
 //消息构造
function CLASS_MSN_MESSAGE(id,width,height,caption,title,message,target,action)  
{  
    this.id     = id;  
    this.title  = title;  
    this.caption= caption;  
    this.message= message;  
    this.target = target;  
    this.action = action;  
    this.width    = width?width:200;  
    this.height = height?height:120;  
    this.timeout= 1000;  
    this.speed    = 20; 
    this.step    = 1; 
    this.right    = screen.width -1;  
    this.bottom = screen.height; 
    this.left    = this.right - this.width; 
    this.top    = this.bottom - this.height; 
    this.timer    = 0; 
}  
//隐藏消息方法 
CLASS_MSN_MESSAGE.prototype.hide = function()  
{   if(!this.Pop.isOpen){
    return;
    }
    if(this.onunload())      
    {  
        var offset  = this.height>this.bottom-this.top?this.height:this.bottom-this.top; 
        var me  = this;  
 
        if(this.timer>0)  
        {   
            window.clearInterval(me.timer);  
        }  
 
        var fun = function()  
        {  
            var x  = me.left; 
            var y  = 0; 
            var width = me.width; 
            var height = 0; 
            if(me.offset>0) 
            { 
                height = me.offset; 
            } 
 
            y  = me.bottom - height; 
 
            if(y>=me.bottom) 
            { 
                window.clearInterval(me.timer);  
                me.Pop.hide();  
            } 
            else 
            { 
                me.offset = me.offset - me.step;  
            } 
            me.Pop.show(x,y,width,height);    
        }  
 
        this.timer = window.setInterval(fun,this.speed)      
    }  
}   
//消息卸载事件，可以重写
CLASS_MSN_MESSAGE.prototype.onunload = function()  
{  
    return true;  
}  
//消息命令事件，要实现自己的连接，请重写它 
CLASS_MSN_MESSAGE.prototype.oncommand = function()  
{  
	
	//从收件邮箱中接收邮件
	top.main.location.href = rootUrl + "inboxmailquery.cmd?mailType=0&receiveMail=1&mailStatus=0";
   this.hide();
}  
//消息显示方法 
CLASS_MSN_MESSAGE.prototype.show = function()  
{  
    var oPopup = window.createPopup(); //IE5.5+  
  
    this.Pop = oPopup;  
  
    var w = this.width;  
    var h = this.height;  
  
    var str = "<DIV style='BORDER-RIGHT: #455690 1px solid; BORDER-TOP: #a6b4cf 1px solid; Z-INDEX: 99999; LEFT: 0px; BORDER-LEFT: #a6b4cf 1px solid; WIDTH: " + w + "px; BORDER-BOTTOM: #455690 1px solid; POSITION: absolute; TOP: 0px; HEIGHT: " + h + "px; BACKGROUND-COLOR: #c9d3f3'>"  
        str += "<TABLE style='BORDER-TOP: #ffffff 1px solid; BORDER-LEFT: #ffffff 1px solid' cellSpacing=0 cellPadding=0 width='100%' bgColor=#cfdef4 border=0>"  
        str += "<TR>"  
        str += "<TD style='FONT-SIZE: 12px;COLOR: #0f2c8c' width=30 height=24></TD>"  
        str += "<TD style='PADDING-LEFT: 4px; FONT-WEIGHT: normal; FONT-SIZE: 12px; COLOR: #1f336b; PADDING-TOP: 4px' vAlign=center width='100%'>" + this.caption + "</TD>"  
        str += "<TD style='PADDING-RIGHT: 2px; PADDING-TOP: 2px' vAlign=center align=right width=19>"  
        str += "<SPAN title=关闭 style='FONT-WEIGHT: bold; FONT-SIZE: 12px; CURSOR: hand; COLOR: red; MARGIN-RIGHT: 4px' id='btSysClose' >×</SPAN></TD>"  
        str += "</TR>"  
        str += "<TR>"  
        str += "<TD style='PADDING-RIGHT: 1px;PADDING-BOTTOM: 1px' colSpan=3 height=" + (h-28) + ">"  
        str += "<DIV style='BORDER-RIGHT: #b9c9ef 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #728eb8 1px solid; PADDING-LEFT: 8px; FONT-SIZE: 12px; PADDING-BOTTOM: 8px; BORDER-LEFT: #728eb8 1px solid; WIDTH: 100%; COLOR: #1f336b; PADDING-TOP: 8px; BORDER-BOTTOM: #b9c9ef 1px solid; HEIGHT: 100%'>" + this.title + "<BR><BR>"  
        str += "<DIV style='WORD-BREAK: break-all' align=left><A href='javascript:void(0)' hidefocus=true id='btCommand'><FONT color=#ff0000>" + this.message + "</FONT></A></DIV>"  
        str += "</DIV>"  
        str += "</TD>"  
        str += "</TR>"  
        str += "</TABLE>"  
        str += "</DIV>"  
  
    oPopup.document.body.innerHTML = str;  
  
    this.offset  = 0; 
    var me  = this;  
    var fun = function()  
    {  
        var x  = me.left; 
        var y  = 0; 
        var width    = me.width; 
        var height    = me.height; 
 
            if(me.offset>me.height) 
            { 
                height = me.height; 
            } 
            else 
            { 
                height = me.offset; 
            } 
 
        y  = me.bottom - me.offset; 
        if(y<=me.top) 
        { 
            me.timeout--; 
            if(me.timeout==0) 
            { 
                window.clearInterval(me.timer);  
                me.hide(); 
            } 
        } 
        else 
        { 
            me.offset = me.offset + me.step; 
            me.Pop.show(x,y,width,height);
        } 
    }  
  
    this.timer = window.setInterval(fun,this.speed)      
  
    var btClose = oPopup.document.getElementById("btSysClose");  
  
    btClose.onclick = function()  
    {  
        me.hide();  
    }  
  
    var btCommand = oPopup.document.getElementById("btCommand");  
    btCommand.onclick = function()  
    {  
        me.oncommand();  
    }  

}  
//设置速度方法
CLASS_MSN_MESSAGE.prototype.speed = function(s) 
{ 
    var t = 20; 
    try 
    { 
        t = praseInt(s); 
    } 
    catch(e){} 
    this.speed = t; 
} 
//设置步长方法 
CLASS_MSN_MESSAGE.prototype.step = function(s) 
{ 
    var t = 1; 
    try 
    { 
        t = praseInt(s); 
    } 
    catch(e){} 
    this.step = t; 
} 
//设置区域范围方法  
CLASS_MSN_MESSAGE.prototype.rect = function(left,right,top,bottom) 
{ 
    try 
    { 
        this.left        = left    !=null?left:this.right-this.width; 
        this.right        = right    !=null?right:this.left +this.width; 
        this.bottom        = bottom!=null?(bottom>screen.height?screen.height:bottom):screen.height; 
        this.top        = top    !=null?top:this.bottom - this.height; 
 
    } 
    catch(e) 
    {} 
}
//--------------------------------------------------------------------------
<%
	//JSP部分：初始化数据。
	String isAuto = "" + request.getAttribute("isAuto");
	String interval = "" + request.getAttribute("interval");
	String serverType=""+request.getAttribute("serverType");
    String isCheckFirst = ""+request.getAttribute("isCheckFirst");
	if( isAuto == null || "".equals(isAuto) )
		isAuto = "0";
	if( interval == null || "".equals(interval) )
		interval = "0";
	if( ! "0".equals( isAuto ) && ! "0".equals( interval ) )
	{
%>
//---------------------------------------------------------------------------
//启动定时器
startClientTimer( '<%=interval%>' );
<%
	}

	if("1".equals(isCheckFirst)){
%>
//初次登陆就检查新邮件
doMessageAlter();
<%
	}
%>
//--------------------------------------------------------------------------

//************************************************************************
//**************        客户端定时器          ********************
//************************************************************************
//客户端Timer对象
var intervalObj = null;
//最小刷新间隔为 1 (min)
var minInterval = 1 ;
var MSG1=null;
//从邮件服务器中获取新邮件个数。
function doMessageAlter()
{
	var xmlObj = new ActiveXObject("Microsoft.XMLHTTP"); 
	var url = rootUrl + "mailfolder.cmd?method=getNewMessageCount";
	var post="";
	xmlObj.open("POST",url,false);
	xmlObj.setrequestheader("content-length",post.length); 
	xmlObj.setrequestheader("content-type","application/x-www-form-urlencoded"); 
	xmlObj.send(post);
	var msgCount = xmlObj.responseText;
	if( msgCount * 1 > 0 )
	{
		//新建一个消息框，并提示。
		if("<%=serverType%>"=="1"){
		MSG1 = new CLASS_MSN_MESSAGE("mailMessage",200,120,"邮件提示：","","你有" + msgCount + "封新邮件，请接收。"); 
		} else {
		MSG1 = new CLASS_MSN_MESSAGE("mailMessage",200,120,"邮件提示：","","你有" + msgCount + "封未读邮件，请接收。"); 
		}
		 
		MSG1.rect(null,null,null,screen.height-50); 
		MSG1.speed = 10; 
		MSG1.step = 5; 
		MSG1.show();  
	}
}

//启动定时器 
function startClientTimer( interval )
{
	//限制定时的最小间隔。
	if( interval * 1 <= minInterval * 1 )
		interval = 1;
	intervalObj = window.setInterval("doMessageAlter()",interval * 60 * 1000 );
}
//关闭定时器(每次设置完邮箱设置后，检测是否需要自动刷新功能，调用此方法可以停止刷新。)
function stopClientTimer()
{
	if( intervalObj == null || intervalObj == "" )
		return;
	window.clearInterval( intervalObj );
}

</script>

