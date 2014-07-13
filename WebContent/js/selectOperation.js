jQuery.fn.size4select = function()   
{   
    return jQuery(this).get(0).options.length;   
};   
//获得选中项的索引   
jQuery.fn.getSelectedIndex4select = function()   
{   
    return jQuery(this).get(0).selectedIndex;   
};   
//获得当前选中项的文本   
jQuery.fn.getSelectedText4select = function()   
{   
    if(this.size4select() == 0)
    {   
    	var strReturn = "下拉框中无选项";
        return strReturn;   
    }   
    else  
    {   
        var index = this.getSelectedIndex4select();         
        return jQuery(this).get(0).options[index].text;   
    }   
};   
//获得当前选中项的值   
jQuery.fn.getSelectedValue4select = function()   
{       
    if(this.size4select() == 0)   
    {   
    	var strReturn = "下拉框中无选中值";
        return strReturn;   
    }   
    else  
    {   
        return jQuery(this).val();   
    }   
};   
//设置select中值为value的项为选中   
jQuery.fn.setSelectedValue4select = function(value)   
{   
    jQuery(this).get(0).value = value;   
};   
//设置select中文本为text的第一项被选中   
jQuery.fn.setSelectedText4select = function(text)   
{   
    var isExist = false;   
    var count = this.size4select();   
    for(var i=0;i<count;i++)   
    {   
        if(jQuery(this).get(0).options[i].text == text)   
        {   
            jQuery(this).get(0).options[i].selected = true;   
            isExist = true;   
            break;   
        }   
    }   
    if(!isExist)   
    {   
        alert("下拉框中不存在该项");   
    }   
};   
//设置选中指定索引项   
jQuery.fn.setSelectedIndex4select = function(index)   
{   
    var count = this.size4select();       
    if(index >= count || index < 0)   
    {   
        alert("选中项索引超出范围");   
    }   
    else  
    {   
        jQuery(this).get(0).selectedIndex = index;   
    }   
};   
//判断select项中是否存在值为value的项   
jQuery.fn.isExistItem4select = function(value)   
{   
    var isExist = false;   
    var count = this.size4select();   
    for(var i=0;i<count;i++)   
    {   
        if(jQuery(this).get(0).options[i].value == value)   
        {   
            isExist = true;   
            break;   
        }   
    }   
    return isExist;   
};   
//向select中添加一项，显示内容为text，值为value,如果该项值已存在，则提示   
jQuery.fn.addOption4select = function(text,value)   
{   
    if(this.isExistItem4select(value))   
    {   
        alert("待添加的项已经存在");   
    }   
    else  
    {   
        jQuery(this).get(0).options.add(new Option(text,value));   
    }   
};   
//删除select中值为value的项，如果该项不存在，则提示   
jQuery.fn.removeItem4select = function(value)   
{       
    if(this.isExistItem4select(value))   
    {   
        var count = this.size4select();           
        for(var i=0;i<count;i++)   
        {   
            if(jQuery(this).get(0).options[i].value == value)   
            {   
                jQuery(this).get(0).remove(i);   
                break;   
            }   
        }           
    }   
    else  
    {   
        alert("待删除的项不存在！");   
    }   
};   
//删除select中指定索引的项   
jQuery.fn.removeIndex4select = function(index)   
{   
    var count = this.size4select();   
    if(index >= count || index < 0)   
    {   
        alert("待删除项索引超出范围");   
    }   
    else  
    {   
        jQuery(this).get(0).remove(index);   
    }   
};   
//删除select中选定的项   
jQuery.fn.removeSelected4select = function()   
{   
    var index = this.getSelectedIndex4select();   
    this.removeIndex(index);   
};   
//清除select中的所有项   
jQuery.fn.clearAll4select = function()   
{   
    jQuery(this).get(0).options.length = 0;   
};