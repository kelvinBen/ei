/************************************************
** ������:	������
** �� ��:	2004.2.20
** �� ��:	����΢��
**
** �� ��:	1.0
************************************************/
var _interv = null;
var _interv_ob = null;
var _currob = null;
function _inchingswitch(obj,flag)
{
	var o,ob,ar;
	if(_currob != null&&obj.parentElement.parentElement.contains(_currob))
	{
		o = _currob;
		ob = _currob.value;
		ar = _currob.conf.split(",");
	}
	else
	{
		o = obj.parentElement.nextSibling;//�����
		ob = obj.parentElement.nextSibling.value;//�����ֵ
		ar = obj.parentElement.nextSibling.conf.split(",");//�����ö��ŷָ�
	}

	var step = parseInt(ar[0]);
	var min = parseInt(ar[1]);
	var max = parseInt(ar[2]);
	var alph = ar[3];

	if(isNaN(min))
		min = 1;
	if(ob=="")
	ob=min;//���������Ϊ����Ĭ������Сֵ
	if(typeof(alph)!="undefined"&&alph!="")
	{
		if(alph==ob.substr(ob.length-2,ob.length-1))
			ob = ob.substr(0,ob.length-1);
	}
	var obvalue = parseInt(ob);
	if(isNaN(obvalue))
	{
//		alert("΢����ʼֵ�Ƿ����֣�");
		obvalue = min;
	}
	if(isNaN(step))
		step = 1;
	if(flag=="+")
	{
		obvalue = obvalue + step;
		if(obvalue>max)
			return;
	}
	if(flag=="-")
	{
		obvalue = obvalue - step;
		if(obvalue<min)
			return;
	}
	o.value = obvalue+alph;
	o.select();
}
function _uper(ob)
{
	//alert(event.fromElement);
	if(_interv_ob!=null)
		_inchingswitch(_interv_ob,"+");
	else
		_inchingswitch(ob,"+");
}

function _conti_uper(obb)
{
	if(_interv==null)
	{
		_interv_ob = obb;
		_interv=window.setInterval("_uper()", 200);
	}
}

function _stop_inch()
{
	if(_interv!=null)
	{
		clearInterval(_interv);
		_interv=null;
		_interv_ob = null;
	}
}

function _downer(ob)
{
	if(_interv_ob!=null)
		_inchingswitch(_interv_ob,"-");
	else
		_inchingswitch(ob,"-");
}

function _conti_downer(obb)
{
	if(_interv==null)
	{
		_interv_ob = obb;
		_interv=window.setInterval("_downer()", 200);
	}
}
function _selthis(ob)
{
	ob.select();//alert(ob.tagName);
	_currob = ob;
}