	//处理供应商的数据	
	function addrow()
	{
	try{	
    var userTable = document.getElementById('Supplier');
	var tabrow=userTable.rows.length;   //取得行数
	var row=userTable.insertRow(userTable.rows.length);	
	var col = row.insertCell(0);
	col.innerHTML='<center><input name="listSupplier['+(tabrow-1)+'].fldSupplierName" id="fldSupplierName'+(tabrow-1)+'"  onKeyDown="enterCommit(0)"  type="text" cn_name="供应商名称"  datatype="text" maxsize="100" style=" width:30%; height:20px; font-size:14px; background-color:#FFFFFF" /></center>';
	var col = row.insertCell(1);
	col.innerHTML='<center><input name="listSupplier['+(tabrow-1)+'].fldLevel" id="fldLevel'+(tabrow-1)+'"  type="text" cn_name="供应商库级" nullable="no" datatype="text" maxsize="100" style=" width:30%; height:20px;font-size:14px; background-color:#FFFFFF" /></center>';
	var col = row.insertCell(2);
	col.innerHTML='<center><input name="listSupplier['+(tabrow-1)+'].fldProperty" id="fldProperty'+(tabrow-1)+'"  type="text" cn_name="供应商性质" datatype="text" maxsize="100" style=" width:30%; height:20px;font-size:14px; background-color:#FFFFFF" /></center>';
	var col = row.insertCell(3);
	col.innerHTML='<center><input name="listSupplier['+(tabrow-1)+'].fldManufacturer" id="fldManufacturer'+(tabrow-1)+'" type="text" cn_name="制造商" datatype="text" maxsize="255" style=" width:30%; height:20px;font-size:14px; background-color:#FFFFFF" /></center>';
	var col = row.insertCell(4);
	col.innerHTML='<center><input name="listSupplier['+(tabrow-1)+'].fldIsbid" id="fldIsbid'+(tabrow-1)+'"  type="text" cn_name="投标意向" datatype="zipcode" maxsize="20"  style=" width:30%;height:20px; font-size:14px; background-color:#FFFFFF" /></center>';
	row.setAttribute("id","row"+(tabrow+1));
	var len= $('net.mast.web.taglib.util.GRIDLENGTH').value;
	len++;
	$('net.mast.web.taglib.util.GRIDLENGTH').value=len;
	}catch(e){
 	alert(e.description);
 	}	
	}
	
	//删除行
	function delrow()
	{
	try{	
	var userTable = document.getElementById('Supplier');
	var tabrow=userTable.rows.length;   //取得行数
	if(userTable.rows("row"+tabrow)==null){
		alert("不能删除该行！");
		return false;
	}
	if(!confirm("确定要删除委员列表的最后一行吗?")){
		return false;
	}
	var i = userTable.rows("row"+tabrow).rowIndex; //取得行编号(从0开始）
	userTable.deleteRow(i);
	var len= $('net.mast.web.taglib.util.GRIDLENGTH').value;//设置行数
	len--;
	$('net.mast.web.taglib.util.GRIDLENGTH').value=len;
	}catch(e){
 	alert(e.description);
 	}
	}
	
	//快捷键操作
	function keyDown(){
	if(event.keyCode==119){
		//doAddRow2();
	}else if(event.keyCode==118){
		//doDeleteRow2();
	}
	}
	
	//选择供应商 作废 因都用中文
    function selSupplier(){
    	var fldRecommendMode = document.getElementById("fldRecommendMode").value;
    	//alert(fldRecommendMode);
    	var countsum = grid2.returnRowCount();
    	for(var j=0;j<countsum;j++){
    		grid2.delLine();	
    	}
    	//议标
    	if(fldRecommendMode=='3'){
    		for(var i=0;i<1;i++){
    		grid2.addRow();
    		}
    	}
    	//竞争性谈判
    	if(fldRecommendMode=='2'){
    		for(var i=0;i<2;i++){
    		grid2.addRow();
    		}
    	}
    	//定单
    	if(fldRecommendMode=='5'){
    		for(var i=0;i<1;i++){
    		grid2.addRow();
    		}
    	} 
    	    	//定单
    	if(fldRecommendMode=='1'||fldRecommendMode=='4'||fldRecommendMode=='6'){
    		for(var i=0;i<6;i++){
    		grid2.addRow();
    		}
    	}   	
    }
