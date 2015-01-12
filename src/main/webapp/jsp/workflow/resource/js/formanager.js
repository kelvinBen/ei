function initFormEditor(type) {
	document.formEditor.setUrl(document.getElementsByName("FormConfigUrls")[0].value);
	var formhtml = document.getElementsByName("Ins_html-code")[0].value;
	if(formhtml!="" && formhtml!= null){
		document.formEditor.setFormHtml(formhtml);
	}
	document.formEditor.setFormPrintTemplate(document.getElementsByName("print-template")[0].value);
	document.formEditor.setFormTextTemplate(document.getElementsByName("text-template")[0].value);
	document.formEditor.setCharType(1);	
	document.formEditor.setReadonlyType(0);	
	document.formEditor.setFormType(type);		
}
function selectNewDeptIdTree(rootId){
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId="+rootId+"&showOrganType=1,2";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("Ins_organize-id").value="";
	  document.all("Ins_organize-name").value="";
  }else{
	  document.all("Ins_organize-id").value=win[0];
	  document.all("Ins_organize-name").value=win[1];
  }
}
function forSave(url){
	if (!document.formEditor.hasFormName()) {
		alert("表单名称不可为空，请在表单属性中填写表单名称！");
		return;
	}
	var organId=document.all("Ins_organize-id").value;
	if(organId==""){
		alert("请选择所属组织机构！");
		return;
	}
	document.getElementsByName("Ins_html-code")[0].value = document.formEditor.getFormHtml();
	document.getElementsByName("Ins_template")[0].value = document.formEditor.getFormTemplate();
	//document.getElementsByName("Ins_formXml")[0].value = document.formEditor.getFormXml();
	
		var fxml= document.formEditor.getFormXml();	
		if (""==fxml)
		{
		alert("表单中必须有一个域");
		return false;		
		}
		//alert(fxml);
	SAVEFLAGINFORMEDITOR=1;
	document.getElementsByName("Ins_formXml")[0].value =fxml;	
    document.forms[0].action =url;
    document.forms[0].submit();	
}
function forSaveOther(url){
	if (!document.formEditor.hasFormName()) {
		alert("表单名称不可为空，请在表单属性中填写表单名称！");
		return;
	}
	var organId=document.all("Ins_organize-id").value;
	if(organId==""){
		alert("请选择所属组织机构！");
		return;
	}
	//为了产生新的子表单名字
	document.formEditor.reSetFormName();
	SAVEFLAGINFORMEDITOR=1;
	if(confirm("是否采用系统默认的数据表名？"))
	{	
		//采用系统默认表名
		document.formEditor.reSetFormName();
		document.getElementsByName("Ins_html-code")[0].value = document.formEditor.getFormHtml();
		document.getElementsByName("Ins_template")[0].value = document.formEditor.getFormTemplate();
		document.getElementsByName("Ins_formXml")[0].value = document.formEditor.getFormXml();
  		document.forms[0].action =url;
   		document.forms[0].submit();	
	}
	else{
		if(document.formEditor.showsaveas()=="true")
		{	
			document.getElementsByName("Ins_html-code")[0].value = document.formEditor.getFormHtml();
			document.getElementsByName("Ins_template")[0].value = document.formEditor.getFormTemplate();
			document.getElementsByName("Ins_formXml")[0].value = document.formEditor.getFormXml();
  			document.forms[0].action =url;
   			document.forms[0].submit();	
   		}
   	 	else
  		return;
   }
}
function forCreateTable(url){
	if (!document.formEditor.hasFormName()) {
		alert("表单名称不可为空，请在表单属性中填写表单名称！");
		return;
	}
	var organId=document.all("Ins_organize-id").value;
	if(organId==""){
		alert("请选择所属组织机构！");
		return;
	}

	
	document.getElementsByName("Ins_html-code")[0].value = document.formEditor.getFormHtml();
	document.getElementsByName("Ins_template")[0].value = document.formEditor.getFormTemplate();
	document.getElementsByName("Ins_formXml")[0].value = document.formEditor.getFormXml();
	//alert(document.getElementsByName("Ins_formXml")[0].value);
    url=url+"&isCreateTable=1";
    SAVEFLAGINFORMEDITOR=1;
    document.forms[0].action =url;
    document.forms[0].submit();		
}
function forReturn(){
	SAVEFLAGINFORMEDITOR=1;
  document.forms[0].action ="workformmanagerquery.cmd?clear=true";
  document.forms[0].submit();	
}