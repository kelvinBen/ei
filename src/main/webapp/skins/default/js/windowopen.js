/*
ģʽ�Ի���
url ·��URL
name ����
w ���
h �߶�
*/
function dialog(url,name,w,h)
{
	var lookups=window.showModalDialog(url, name, "dialogHeight:" + h + "px; dialogWidth:" + w + "px; center: Yes; help: No; resizable: No; status: No;");
	if(lookups!=null)
	{
		return lookups;
	}
	else
	{
		return null;
	}
}

function dialog_1(url,name,w,h)
{
	var lookups=window.showModalDialog(url, name, "dialogHeight:" + h + "px; dialogWidth:" + w + "px; center: Yes; help: No; resizable: No; status: No;scroll:No");

	if(lookups!=null)
	{
		return lookups;
	}
	else
	{
		return null;
	}
}
/*
�Զ���λ�ã���С
��window �Ի���
url ·��Url
name ����
w �Ի����
h �Ի����
letf ��λ��
top ��λ��
resizable �Ƿ�ɵ����Ի����С "yes" �ɵ��� "no" ���ɵ���
scrollbars �Ƿ���Ϲ�����      "yes" �й����� "no" û�й�����
*/
function opens(url,name,w,h,left,top,resizable,scrollbars)
{
	window.open(url,name,"resizable="+resizable+",scrollbars="+scrollbars+",status=no,toolbar=no,menubar=no,location=no,Height=" + h + "px,Width=" + w + "px,left="+left+"px,top="+top+"px").focus();
}
/*
���Ͻ�
��window �Ի���
url ·��Url
name ����
w �Ի����
h �Ի����
resizable �Ƿ�ɵ����Ի����С "yes" �ɵ��� "no" ���ɵ���
scrollbars �Ƿ���Ϲ�����      "yes" �й����� "no" û�й�����
*/
function opens_lt(url,name,w,h,resizable,scrollbars)
{
	window.open(url,name,"resizable="+resizable+",scrollbars="+scrollbars+",status=no,toolbar=no,menubar=no,location=no,Height=" + h + "px,Width=" + w + "px").focus();
}
/*
����
��window �Ի���
url ·��Url
name ����
w �Ի����
h �Ի����
resizable �Ƿ�ɵ����Ի����С "yes" �ɵ��� "no" ���ɵ���
scrollbars �Ƿ���Ϲ�����      "yes" �й����� "no" û�й�����
*/
function opens_center(url,name,w,h,resizable,scrollbars){
  var screenWidth = window.screen.width;
  var screenHeight = window.screen.height;
  var myw=w;
  if(myw>=screenWidth){
  	myw=screenWidth-10;
  }
  var myh=h;
  if(myh>=screenHeight){
  	myh=screenHeight-60;
  }
  var left = (screenWidth-myw-10)/2;
  var top = (screenHeight-myh-60)/2;
  if(left<0){
   left=0;
  }
  if(top<0){
   top=0;
  }
  var openwin=window.open(url,name,"resizable="+resizable+",scrollbars="+scrollbars+",status=no,toolbar=no,menubar=no,location=no,Height=" +myh + "px,Width=" + myw + "px,Left="+left+"px,top="+top+"px");
  if(openwin){
  	openwin.focus();
  }
}

function opens_fullcenter(url,name,resizable,scrollbars){
  var screenWidth = window.screen.width;
  var screenHeight = window.screen.height;
  var myw= screenWidth-10;
  var myh=screenHeight-60;
  var left=0;
  var top=0;
  var openwin=window.open(url,name,"resizable="+resizable+",scrollbars="+scrollbars+",status=no,toolbar=no,menubar=no,location=no,Height=" +myh + "px,Width=" + myw + "px,Left="+left+"px,top="+top+"px");
  if(openwin){
  	openwin.focus();
  }
}