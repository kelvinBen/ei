	//����Ӧ�̵�����	
	function addrow()
	{
	try{	
    var userTable = document.getElementById('Supplier');
	var tabrow=userTable.rows.length;   //ȡ������
	var row=userTable.insertRow(userTable.rows.length);	
	var col = row.insertCell(0);
	col.innerHTML='<center><input name="listSupplier['+(tabrow-1)+'].fldSupplierName" id="fldSupplierName'+(tabrow-1)+'"  onKeyDown="enterCommit(0)"  type="text" cn_name="��Ӧ������"  datatype="text" maxsize="100" style=" width:30%; height:20px; font-size:14px; background-color:#FFFFFF" /></center>';
	var col = row.insertCell(1);
	col.innerHTML='<center><input name="listSupplier['+(tabrow-1)+'].fldLevel" id="fldLevel'+(tabrow-1)+'"  type="text" cn_name="��Ӧ�̿⼶" nullable="no" datatype="text" maxsize="100" style=" width:30%; height:20px;font-size:14px; background-color:#FFFFFF" /></center>';
	var col = row.insertCell(2);
	col.innerHTML='<center><input name="listSupplier['+(tabrow-1)+'].fldProperty" id="fldProperty'+(tabrow-1)+'"  type="text" cn_name="��Ӧ������" datatype="text" maxsize="100" style=" width:30%; height:20px;font-size:14px; background-color:#FFFFFF" /></center>';
	var col = row.insertCell(3);
	col.innerHTML='<center><input name="listSupplier['+(tabrow-1)+'].fldManufacturer" id="fldManufacturer'+(tabrow-1)+'" type="text" cn_name="������" datatype="text" maxsize="255" style=" width:30%; height:20px;font-size:14px; background-color:#FFFFFF" /></center>';
	var col = row.insertCell(4);
	col.innerHTML='<center><input name="listSupplier['+(tabrow-1)+'].fldIsbid" id="fldIsbid'+(tabrow-1)+'"  type="text" cn_name="Ͷ������" datatype="zipcode" maxsize="20"  style=" width:30%;height:20px; font-size:14px; background-color:#FFFFFF" /></center>';
	row.setAttribute("id","row"+(tabrow+1));
	var len= $('net.mast.web.taglib.util.GRIDLENGTH').value;
	len++;
	$('net.mast.web.taglib.util.GRIDLENGTH').value=len;
	}catch(e){
 	alert(e.description);
 	}	
	}
	
	//ɾ����
	function delrow()
	{
	try{	
	var userTable = document.getElementById('Supplier');
	var tabrow=userTable.rows.length;   //ȡ������
	if(userTable.rows("row"+tabrow)==null){
		alert("����ɾ�����У�");
		return false;
	}
	if(!confirm("ȷ��Ҫɾ��ίԱ�б�����һ����?")){
		return false;
	}
	var i = userTable.rows("row"+tabrow).rowIndex; //ȡ���б��(��0��ʼ��
	userTable.deleteRow(i);
	var len= $('net.mast.web.taglib.util.GRIDLENGTH').value;//��������
	len--;
	$('net.mast.web.taglib.util.GRIDLENGTH').value=len;
	}catch(e){
 	alert(e.description);
 	}
	}
	
	//��ݼ�����
	function keyDown(){
	if(event.keyCode==119){
		//doAddRow2();
	}else if(event.keyCode==118){
		//doDeleteRow2();
	}
	}
	
	//ѡ��Ӧ�� ���� ��������
    function selSupplier(){
    	var fldRecommendMode = document.getElementById("fldRecommendMode").value;
    	//alert(fldRecommendMode);
    	var countsum = grid2.returnRowCount();
    	for(var j=0;j<countsum;j++){
    		grid2.delLine();	
    	}
    	//���
    	if(fldRecommendMode=='3'){
    		for(var i=0;i<1;i++){
    		grid2.addRow();
    		}
    	}
    	//������̸��
    	if(fldRecommendMode=='2'){
    		for(var i=0;i<2;i++){
    		grid2.addRow();
    		}
    	}
    	//����
    	if(fldRecommendMode=='5'){
    		for(var i=0;i<1;i++){
    		grid2.addRow();
    		}
    	} 
    	    	//����
    	if(fldRecommendMode=='1'||fldRecommendMode=='4'||fldRecommendMode=='6'){
    		for(var i=0;i<6;i++){
    		grid2.addRow();
    		}
    	}   	
    }
