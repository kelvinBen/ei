	var templetType = 1;
	var checkRadioSplit = ",";
	var strSplitLength = 250;
	var webWord;
	var openObj;
	function textLoad(){
	}

	/**
	 * �����½��ĵ�
	 */
	function downLoadNewDoc(){
		//����
		data.decodeValue(document.all("newDocumentFileValue").value);
		//����
		data.changeFileName("doc");
		//ȡ���ļ���
		return data.decodefile;
	}
	/**
	 * �򿪻����½�һ���ĵ�
	 * @param obj ���İ�ť����
	 */
	function openFile(obj){
		if (document.all('isLocked').value == "true"){
			document.all('documentRight').value = "true";
		}
		var docRight = document.all('documentRight').value;
		var webOffice = document.all('webOffice');
		var data = document.all('data');
		webWord = new EBWebOffice(webOffice,data,document.all('documentContent'),downLoadNewDoc(),document.all("curUserName").value);
		if (docRight == "read" && document.all('documentContent').value==""){
			alert("û��Ҫ�鿴���������ݣ�");
			return;
		}
		if (docRight == "read"){
			webOfficeControlView.style.display = "";
		}else{
			webOfficeControl.style.display = "";
		}
		webWord.openDoc(true);
		editFile();
		openObj = obj;
		openObj.disabled = true;
	}
	/**
	 * �ĵ���״̬����
	 */
	function editFile(){
		//documentRight edit,read, emend
		//emendRight true false
		var docRight = document.all('documentRight').value;
		var emend = document.all('emendRight').value;
		if (docRight == "read"){
			webWord.displayRevie(false);
			if (emend == "true"){
				webWord.hiddenRevie(false);
			}else if(emend == "hidden"){
				webWord.hiddenRevie(true);
				//webWord.allChangeInDoc();
			}else{
				webWord.displayRevie(true);
			}
			webWord.setBrowse();
		}else if (docRight == "edit"){
			webWord.displayRevie(false);
			if (emend == "true"){
				webWord.hiddenRevie(false);
			}else if(emend == "hidden"){
				webWord.hiddenRevie(true);
				//webWord.allChangeInDoc();
			}else{
				webWord.displayRevie(true);
			}
			webWord.setEdit();
		}else if (docRight == "emend"){
			webWord.displayRevie(true);
			if (emend == "true"){
				webWord.setRevision(true);
			}else{
				webWord.setRevision(false);
			}
		}
	}
	/**
	 * �ر��ļ�������
	 */
	function closeFile(view){
		if ("view" == view){
			webOfficeControlView.style.display = "none";
		}else if ("edit" == view){
			webOfficeControl.style.display = "none";
		}
		var webOffice = document.all('webOffice');
		webOffice.style.width = "0";
		webOffice.style.height = "0";
		openObj.disabled = false;
	}
	/**
	 * �򿪱����ļ�
	 * @param obj ��ű����ļ�·��ֵ����
	 */
	function openLocalFile(obj){
		webWord.openLocalDoc(obj.value);
	}
	/**
	 * ��������ļ�����������
	 */
	function saveFile(){
		webWord.saveDoc();
		webOfficeControl.style.display = "none";
		openObj.disabled = false;
	}

//*****************************************************************************************//
	var textMenuObj;
	var openObjNt;
	//ǧ���ĵ��ؼ��˵���ʾ����Ϊ<div id="textMenu"></div>,���еĲ˵�ʹ��js��̬����
	/**
	 * �򿪻����½�һ���ĵ�
	 * @param obj ���İ�ť����
	 */
	function openFileNtKo(obj){
		if (document.all('isLocked').value == "true"){
			document.all('documentRight').value = "true";
		}
		var docRight = document.all('documentRight').value;
		var webOfficeNt = document.all('webOfficeNt');
		var data = document.all('data');
		webWord = new NtkoOffice(webOfficeNt,data,document.all('documentContent'),"",document.all("curUserName").value);
		if (docRight == "read" && document.all('documentContent').value==""){
			webWord = null;
			alert("û��Ҫ�鿴���������ݣ�");
			return;
		}
		textMenuObj = document.getElementById("textMenu");
		textMenuObj.style.display = "";
		webWord.openDoc(true);
		editFileNtko();
		if(obj!=null){
		openObjNt = obj;
		openObjNt.disabled = true;
		}
	}
	/**
	 * �ĵ���״̬����
	 */
	function editFileNtko(tag){
		var textMenuObj = document.getElementById("textMenu");
		textMenuObj.innerHTML="";
		//[edit|read|emend][�ɱ༭|�����|���޶�]
		var documentRight;
		if(tag=="true") documentRight="read";
		else
		documentRight = document.all("documentRight").value;
		//�Ƿ��б����ļ������Ȩ��
		//[true|false][��|û��]
		var docLocalOpen = document.all("docLocalOpen").value;
		//�Ƿ������Ϊ�����ļ�
		// [true|false][��|����]
		var docLocalSave = document.all("docLocalSave").value;
		//���޶�״̬ʱ�Ƿ���ʾ�޶�״̬
		//[true|hidden|false][��ʾ�޶�|�����޶�|���ֲ���]
		//[true|false][���Խ����޶�|���ܽ����޶�]
		var emendRight = document.all("emendRight").value;
		//�Ƿ���Ը���
		//[true|false][��|��]
		var docSeal = document.all("docSeal").value;
		//�Ƿ񱣻�ӡ��
		//[true|false][����|������]
		var docProtectSeal = document.all("docProtectSeal").value;
		//�Ƿ�ȫ����ע
		//[true|false][��|��]
		var docSign = document.all("docSign").value;
		//ȫ����ע�Ƿ����
		//[true|false][��|��]
		var docSignClear = document.all("docSignClear").value;
		//�Ƿ��ӡ����
		//[true|peacefulPrint|false][��ӡ|��̨��ӡ|����ӡ]
		var docTextPrint = document.all("docTextPrint").value;
		//�Ƿ��ֹ����
		// [true|false][��|��]
		var docTextCopy = document.all("docTextCopy").value;
		creatMenu("closeButton","�ر�����","������ر�","closeFileNtko()");
		//�Ƿ�����׺�
		// [true|false][��|��]
		var taohong = document.all("taohong").value;
		//�Ƿ�����滻
		// [true|false][��|��]
		var tihuan = document.all("tihuan").value;
		
		if (documentRight == "edit" || documentRight == "emend"){//�༭���޶�״̬
		   if(tihuan=="true"){
			creatMenu("replaceButton", "�滻", "�滻����", "replaceContentNtko()");
			}
		   if(taohong=="true"){
			creatMenu("taohongButton", "�׺�", "ִ���׺�", "taohongContentNtko()");
			}			
			creatMenu("saveButton","����","����ر�","saveFileNtko()");
			if (docLocalOpen=="true"){ //�����ļ�����
				creatMenu("localOpenButton","�����ļ�����","���ѡ�񱾵��ļ�","webWord.openLocalDoc('aaa.doc')");
				//����ؼ���Ҫ���ã�����������÷���
			}
			if (docLocalSave == "true"){//����Ϊ�����ļ�
				creatMenu("localSaveButton","���Ϊ����","�����ı���������","webWord.saveLocalFile()");
			}

			//����
			if (docSeal == "true"){
				creatMenu("sealButton","����","����Ӹ�ͼ��","webWord.seal()");
			}

			//ȫ����ע
			if (docSign == "true"){
				creatMenu("signButton","��ע","�������ȫ����ע","webWord.sign()");
			}
			//��ӡ
			if (docTextPrint == "true" || docTextPrint == "peacefulPrint"){
				creatMenu("printButton","��ӡ","��ӡ����","webWord.print(document.all('docTextPrint').value)");
			}
			//�޶�״̬
			if (documentRight == "edit"){
				webWord.emendRight(emendRight);
				//creatMenu("backupButton","����","����","myBackup()");
			}else if (documentRight == "emend"){
				webWord.emend(emendRight);
				if (emendRight == "true") {
				//	creatMenu("backupButton","����","����","myBackup()");
				}
			}
			//���±���
			webWord.protectSeal(docProtectSeal);
			webWord.signState(docSignClear);
			//�Ƿ���Կ���
			webWord.allowCopy(docTextCopy);
		}else{ //���״̬
			if (docLocalSave == "true"){//����Ϊ�����ļ�
				creatMenu("localSaveButton","���Ϊ����","�����ı���������","webWord.saveLocalFile()");
			}
			//��ӡ
			if (docTextPrint == "true" || docTextPrint == "peacefulPrint"){
				creatMenu("printButton","��ӡ","��ӡ����","webWord.print(document.all('docTextPrint').value)");
			}
			//�޶�״̬
			webWord.emendRight(emendRight);
			//���±���
			webWord.protectSeal(docProtectSeal);
			webWord.signState(docSignClear);
			//�Ƿ���Կ���
			webWord.allowCopy(docTextCopy);
			//���
			webWord.setBrowse();
		}
	}
	/**
	 *	�����޶���Ҫ���ȱ���
	 */
	function myEmend(){
		if(myBackup()){
			var emendRight = document.all("emendRight").value;
			webWord.emend(emendRight);
		}else{
			alert("�����޶�ʧ��[ԭ�򣺱���ʧ��]��");
		}
	}
	function myBackup(){
		/*
		alert(escape("+"));
	 	var processId=document.all("processId").value;
 		var edocType=document.all("Ins_EXT_EDOC_TYPE").value;
 		var formId=document.all("curFormId").value;
 		var dataId=document.all("Ins_DATAID").value;
 		var content=document.all("documentContent").value.replace("+","$");
 		var datastr="method=backup&PROCESS_ID="+processId+"&FORM_ID="+formId+"&DATA_ID="+dataId+"&EDOC_TYPE="+edocType+"&CONTENT="+content;
	 	alert(datastr);
	 	var url="edoccontentbak.cmd";
		var conn = new ActiveXObject("Microsoft.XMLHTTP");
		conn.open("POST", url, false);
		conn.setRequestHeader("Content-Length",datastr.length); 
		conn.setRequestHeader("CONTENT-TYPE","application/x-www-form-urlencoded");
    	conn.send(datastr);
	    var status=conn.getResponseHeader("edoc_backup_header_status");
	    if(status!=null&&status=="1"){
	    	return true;
	    }else{
	    	return false;
	    }
	    */
	    var oldTarget=document.forms[0].target;
	    document.forms[0].action="edoccontentbak.cmd?method=backup";
	    document.forms[0].target="ContentBakFrm";
	    document.forms[0].submit();
	    document.forms[0].target=oldTarget;
	    return true;
	}
	/**
	 * �ر��ļ�������
	 */
	function closeFileNtko(){
		webWord = null;
		var textMenuObj = document.getElementById("textMenu");
		textMenuObj.style.display = "none";
		var webOfficeNt = document.all('webOfficeNt');
		webOfficeNt.style.display = "none";
		if(openObjNt!=null)
			openObjNt.disabled = false;
	}
	/**
	 * ���ü��е������滻������
	 */
	function replaceContentNtko() {
		if (webWord == null) {
			return;
		}
		webWord.replaceContent();
	}
	/**
	 * �����׺�
	 */	
	function taohongContentNtko() {
		if (webWord == null) {
			return;
		}    
		// ѡ��ģ��
		win = webWord.selectTemplet();
		this.unProtect();
		if (win) {
		webWord.office.activeDocument.TrackRevisions=false; //�ر��޶�
		var canSaveAs=webWord.office.FileSaveAs;//�����ΪȨ��
		webWord.office.FileSaveAs=true;
		
		var f1="c:\\temp_abc1.doc";
		
		var oldDoc=webWord.office.ActiveDocument;
		oldDoc.SaveAs(f1);
		
		var isnocopy=webWord.office.IsNoCopy;
		if(isnocopy==true){
			webWord.office.IsNoCopy=false;
		}
		//curSel.Cut();
		// ��ģ��
	   var URL = 'doccontent.cmd?method=detail&fileId=' + win[4];		   
       //webWord.office.AddTemplateFromURL(URL);
       webWord.office.OpenFromURL(URL);

       var pageSetup=webWord.office.ActiveDocument.Application.Selection.PageSetup;
       var leftmargin=pageSetup.LeftMargin;
       var rightmargin=pageSetup.RightMargin;
       
       webWord.office.OpenLocalFile(f1);
       
       //ѡ�����ǰ�ĵ�����������
		var curSel = webWord.office.ActiveDocument.Application.Selection;
        curSel.PageSetup.LeftMargin=leftmargin;
        curSel.PageSetup.RightMargin=rightmargin;
        curSel.WholeStory();//ȫѡ
		curSel.Cut();
		
       webWord.office.OpenFromURL(URL);
       
	   var BookMarkName = "����";
	   if(!webWord.office.ActiveDocument.BookMarks.Exists(BookMarkName))
	   {
			alert("ģ���в���������Ϊ��\""+BookMarkName+"\"����ǩ,�޷����Ѿ��༭���ݵ���ģ�壡ע��:�༭�����Ѿ����浽���а�.");          
        	return;      
       }
	   //ճ������,��¼��ǩ
	   var bkmkObj = webWord.office.ActiveDocument.BookMarks(BookMarkName);
	   var saverange = bkmkObj.Range;
	   saverange.Paste(); 
	   webWord.office.ActiveDocument.BookMarks.Add(BookMarkName,saverange);	
	   //�ָ�״̬ 
	   webWord.office.IsNoCopy=isnocopy;
	   webWord.office.FileSaveAs=canSaveAs;
	   //�滻������������
       webWord.replaceContent();
	   }
	}	
	/**
	 * ��������ļ�����������
	 */
	function saveFileNtko(){
		webWord.saveDoc();
		webWord = null;
		var textMenuObj = document.getElementById("textMenu");
		textMenuObj.style.display = "none";
		if(openObjNt!=null)
			openObjNt.disabled = false;
	}
	/**
	 * �Ƿ��Ѿ�����
	 * return [true|false][��|��]
	 */
	function isSavedNtko() {
		if (webWord == null) {
			return true;
		}
		return webWord.isSaved();
	}
	/**
	 * �ĵ����¼�
	 */
	function OnDocumentOpenedNtko(str, obj) {
		if (webWord == null) {
			return;
		}
		webWord.initObject(webWord.office.ActiveDocument);
		if (webWord.office.DocType != 1) {
			closeFileNtko();
			alert("�ݲ�֧�ָ����͵��ļ���");
			return;
		}
	}
	

	/**
	 * ����һ����ť
	 * @param name ��ť������
	 * @param title ��ť�ı���
	 * @param tooltip ��ť����ʾ��Ϣ
	 * @param clickFunc ��ť��onclick�¼�
	 */
	function creatMenu(name,title,tooltip,clickFunc){
		var menuCode = "<button name=\"" + name + "\" title=\"" + tooltip + "\" onclick=\"" + clickFunc + "\">"; 
		menuCode +=title + "</button>";
		var textMenuObj = document.getElementById("textMenu");
		textMenuObj.innerHTML =menuCode + textMenuObj.innerHTML;
	}
/**
 * ��word���в���,ǧ���ĵ��ؼ�
 * @param office ǧ���Ķ���
 * @param encode ����/����/�����ļ��Ķ��󣨿ؼ���
 * @param documentCode ��ű���������
 * @param fileName �½��ļ�ʹ�õĻ����ļ�
 * @param userName �û�����
 */
function NtkoOffice(office,encode,documentCode,fileName,userName){
	this.base = Word;
	this.base(encode,documentCode,fileName,userName);
	this.office = office;
	this.office.Titlebar = false;
	this.office.Menubar = false;
	this.office.Titlebar = false;
	this.office.Toolbars = true;
	this.office.Statusbar = false;
	this.office.FileNew = false;
	
	/**
	 * ���ĵ������û���ĵ����½�
	 * @param isNew ���û���ĵ��Ƿ񴴽����ĵ�
	 */
	this.openDoc = function(isNew){
		if (isNew == null){
			isNew = true;
		}
		//�õ���������
		var encodeData = this.docCode.value;
		//�����������Ϊ�գ����½�
		if (this.getDocName() == ""){
			if (isNew){
				//�������ĵ�
				this.createDoc();
			}else{
				alert("û��Ҫ�鿴���������ݣ�");
			}
		}else{
			//��ʾ�ؼ�
			displayMe(true);
			//�õ��ĵ�������
			this.office.OpenLocalFile(this.nowFileName);
			//��ʼ��word����
			this.initObject(this.office.ActiveDocument);
			//�����û���Ϣ
			this.setUser();
			
		}
	}
	/**
	 * �򿪱����ĵ�
	 * @param localFileName �����ļ�������·��
	 */
	this.openLocalDoc = function(){
		
		//��ʾ�ؼ�
		displayMe(true);
		//�õ��ĵ�������
		//this.office.OpenLocalFile(localFileName);
		this.office.ShowDialog(1);
		this.nowFileName = "";
		//��ʼ��word����
		this.initObject(this.office.ActiveDocument);
		//�����û���Ϣ
		this.setUser();
	}
	/**
	 * �ر��ĵ�
	 * 
	 */
	this.closeDoc = function(){
		//��ԭword�û���Ϣ
		this.resumeUser();
		//�رտؼ�
		this.office.Close();
		//���ؿؼ�
		displayMe(false);
	}
	/**
	 * �½��ĵ�
	 * 
	 */
	this.createDoc = function(){
		//��ʾ�ؼ�
		displayMe(true);
			//�򿪿ؼ����Ҵ����ļ�
			//this.office.OpenLocalFile(this.fileName);
			this.office.CreateNew("Word.Document");
		//��ʼ��word����
		this.initObject(this.office.ActiveDocument);
		//�����û���Ϣ
		this.setUser();
	}
	/**
	 * �����ĵ�
	 */
	this.saveDoc = function(){
		this.unProtect();

		//�ҵ�һ���µ��ļ���
		this.nowFileName = this.data.tempFileName;
		this.nowFileName = this.nowFileName.substring(0,this.nowFileName.length-3) + this.EXPAND;

		//���Ϊ�ļ�
		this.activeDocument.SaveAs(this.nowFileName,0);
		//�ر�ҳ��
		this.closeDoc();
		//ָ���ļ�����
		this.data.filename = this.nowFileName;
		//����
		this.data.encode();
		//�Żر�����ļ�
		this.docCode.value = this.data.encodeString;
	}
	/**
	 * �ؼ�����ʾ����
	 * @param isDis �Ƿ���ʾ�ؼ�
	 */
	function displayMe(isDis){
		if (isDis){
			office.style.display = "";
			office.style.width = "100%";
			office.style.height = "600";
		}else{
			office.style.display = "none";
			//office.style.width = "0";
			//office.style.height = "0";
		}
	}
	/************�������¼ӹ���****************/
	/**
	 * ���Ϊ�����ļ�
	 */
	this.saveLocalFile = function(){
		this.office.ShowDialog(3);
	}
	/**
	 * �༭��ֻ��ʱ���޶�״̬����
	 * @param state ״̬[true|hidden|false][��ʾ�޶�|�����޶�|���ֲ���]
	 */
	this.emendRight = function(state){
		this.activeDocument.TrackRevisions = false;	// ���޶�
		this.activeDocument.PrintRevisions = false;	// ����ӡ�޶�

		if (state == "true"){
			this.hiddenRevie(false);		// ��ʾ�޶�
			this.displayRevie(true);		// ��ʾ�޶��˵�
		}else if (state == "hidden"){
			this.hiddenRevie(true);			// �����޶�
			this.displayRevie(false);		// �����޶��˵�
		}else{
		
		}
	}
	/**
	 * �޶�ʱ״̬�Ŀ���
	 * @param state [true|false][���Խ����޶�|���ܽ����޶�]
	 */
	this.emend = function(state){
		this.unProtect();
		
		this.activeDocument.TrackRevisions = true;	// �޶�
		this.activeDocument.PrintRevisions = true;	// ��ӡ�޶�
		this.activeDocument.ShowRevisions = true;	// ��ʾ�޶�

		if (state == "true"){
			this.displayRevie(true);			// ��ʾ�޶��˵�
		}else{
			this.displayRevie(false);			// �����޶��˵�
		}
	}
	/**
	 * �Ƿ�������״̬��ʾ�޶�
	 * @param isHidd true �����޶� false ��ʾ�޶�
	 */
	this.hiddenRevie = function(isHidd){
		if (isHidd){
			this.activeDocument.ShowRevisions = false;
			this.activeDocument.PrintRevisions = false;
		}else{
			this.activeDocument.ShowRevisions = true;
			this.activeDocument.PrintRevisions = true;
		}
	}
	/**
	 * ����
	 */
	this.seal = function(){
		//var win = showModalDialog("jsp/help.jsp?edocsignselect.cmd", window, "scroll:yes;status:no;dialogWidth:750px;dialogHeight:400px"); 
		//if (win) {
			//var URL = 'doccontent.cmd?method=detail&fileId=' + win[4];
			alert("��ʾ��ӡ�µĿ���Ϊ123456");
			var URL = 'jsp/workflow/resource/seal/seal.esp'    //��url����ͨ����չ��ʵ�֣�������õı����ļ�����ӡ�µĿ���Ϊ123456
			this.office.AddSignFromURL
			(
				this.userName,	// user
				URL,   			// URL
				0,   			// left
				0,   			// Top
				"",   			// signKey
				1,   			// 1���;2ҳ�߾�;3ҳ�����;4Ĭ������,����
				100,   			// ����
				1   			// ͼƬ�����ֵ�λ��,0�·�;1�Ϸ�
			);
		//}		
	}
	/**
	 * �Ƿ񱣻�����
	 * @param state [true|false][����|������]
	 */
	this.protectSeal = function(state){
		if (state == "true"){
			this.office.SetReadOnly(true, '', 1);
		}else{
			this.office.SetReadOnly(false);
		}
	}
	/**
	 * ȫ����ע�Ƿ�����
	 * @param clear [true|false][���|�����]
	 */
	this.signState = function(clear){
		if (clear == "true"){
			this.office.SetSignsVisible("*", false, "", 1);
		}else{
			this.office.SetSignsVisible("*", true, "", 1);
		}
	}
	/**
	 * ȫ����ע
	 */
	this.sign = function(){
		this.office.DoHandSign2(this.userName, "");
	}
	/**
	 * ���Ĵ�ӡ
	 * @param state ״̬[true|peacefulPrint|false][��ӡ|��̨��ӡ|����ӡ]
	 */
	 this.print = function(state){
	 	if (state != "false") {
			try {
				var objOptions =  this.application.Options;
				var oldOption = objOptions.PrintBackground;
				if (state == "peacefulPrint") {
					objOptions.PrintBackground = true;
				} else {
					objOptions.PrintBackground = false;
				}
				
				this.office.printout(true);				
				
				objOptions.PrintBackground = oldOption;
			}
			catch(err){
				;
			}
	 	} else {
			;
	 	}
	 }
	/**
	 * ѡ��ģ��
	 * return ����ģ��[]
	 */	 
	this.selectTemplet = function() {
		try {
			// �������
			var edocTypeObj = document.all('Ins_EXT_EDOC_TYPE');
			var URL = 'jsp/help.jsp?edoctempletselect.cmd?type_idSearch=' + edocTypeObj.value;
			return showModalDialog(URL, window, "scroll:yes;status:no;dialogWidth:600px;dialogHeight:450px");
		} catch (err) {
			return null;
		}
	}
	/**
	 * ���������е������ǣ�������ǩ
	 */
	this.createBookmark = function() {
		try {
			with (this.office.ActiveDocument)
			{
				var rang = Content;
				do {
					var	WdFindWrap_wdFindStop = 0;
					var	WdReplace_wdReplaceNone = 0;
					rang.Find.Execute("[\\$�秨]*[\\$�秨]", false, false, true, false, false, true, WdFindWrap_wdFindStop, false, "", WdReplace_wdReplaceNone, false, false, false, false);
					if (rang.Find.Found) {
						var bookmarkName = rang.Text.replace(/[\\$�秨]/g, "");
						if (!Bookmarks.Exists(bookmarkName)) {
							rang.Bookmarks.Add(bookmarkName, rang);
						}
					}
				} while(rang.Find.Found)
			}
		} catch (err) {
			;
		}
	}
	/**
	 * ������
	 * @param state [true|false][����|������]
	 */
	this.allowCopy = function(state) {
		if (state == "true") {
			this.office.IsNoCopy = false;
		} else {
			this.office.IsNoCopy = true;
		}
	}
	/**
	 * �滻��ǩ
	 */	
	this.replaceContent = function() {
		this.unProtect();
		this.activeDocument.TrackRevisions=false; //�ر��޶�		
		//������form���������ȡֵ�滻��ǩ------��ʼ
		var forms = document.forms;
			for (var i=0; forms && i<forms.length; i++) {
				var elements = forms[i].elements;
				for (var j=0; elements && j<elements.length; j++) {
					var element = elements[j];
					if (element && element.formTitle && element.name) {
						if (!/^Special/.test(element.name)) {
						    //����Ԫ�ص�����
							var bookmarkName = element.formTitle;
							with (this.activeDocument)					
							{   
							    //��Ԫ�ص�ֵ
							   var elementValue;
							   if(Bookmarks.Exists(bookmarkName)){				    
							    //���ȹ���Ԫ�ص�ֵ
								        elementValue = element.value;
									if (element.type == "select-one") {
										elementValue = element.options[element.selectedIndex].text;
									} else if (/^Select/.test(element.name)) {
										var xmlDoc = new ActiveXObject("MSXML.DOMDocument");
										xmlDoc.loadXML(elementValue);
										
										var elementValue = "";
										var objNodeList = xmlDoc.getElementsByTagName("display-str");
										for (var i=0; objNodeList && i<objNodeList.length; i++) {
											if (i!=0) {
												elementValue += " ";
											}
											elementValue += objNodeList.item(i).text;
										}
									}
							    var eveBookmark=Bookmarks(bookmarkName);
							    var rang = eveBookmark.Range;
							    rang.Text = elementValue;
							    Bookmarks.add(bookmarkName, rang);	
							    }
							   }	
							}
						}
					}
				}
		//������form���������ȡֵ�滻��ǩ------����
		//�����б༭��ת���ɲ��ɱ༭��spanԪ�ؽ�����ȡֵ�滻��ǩ------��ʼ	
         var spans=document.getElementsByTagName("span");	
         for(var spanIndex=0;spanIndex<spans.length;spanIndex++){
         var span=spans[spanIndex];
         if(span.id&&span.title&&span.id!=""&&span.title!=""){
         var bookMarkN=span.title;
         with (this.activeDocument)					
		 { if(Bookmarks.Exists(bookMarkN)){	
		     var bm=Bookmarks(bookMarkN);
		     var bRang=bm.Range;
		     if(span.firstChild&&span.firstChild.nodeValue){
		     bRang.Text=span.firstChild.nodeValue;
		     Bookmarks.add(bookMarkN,bRang);
		                                                }
		     if(!span.firstChild){
		     bRang.Text=" ";
		     Bookmarks.add(bookMarkN,bRang);	
		     }                                            		                                                  
                                                   }   
                 }
                                                             }
        }	
		//�����б༭��ת���ɲ��ɱ༭��spanԪ�ؽ�����ȡֵ�滻��ǩ------����				
		
	}
	/**
	 * ����Ϊ���״̬
	 */
	this.setBrowse = function(){
		this.office.SetReadOnly(true);
	}
}
/**********************������word����************************************/

/**
 * ��word���в����Ķ���,EBWebOffice 2003 �ؼ�
 * @param office EBWebOffice�Ķ���
 * @param encode ����/����/�����ļ��Ķ��󣨿ؼ���
 * @param documentCode ��ű���������
 * @param fileName �½��ļ�ʹ�õĻ����ļ�
 * @param userName �û�����
 */
function EBWebOffice(office,encode,documentCode,fileName,userName){
	this.base = Word;
	this.base(encode,documentCode,fileName,userName);
	this.office = office;
	this.office.Titlebar = false;
	/**
	 * ���ĵ������û���ĵ����½�
	 * @param isNew ���û���ĵ��Ƿ񴴽����ĵ�
	 */
	this.openDoc = function(isNew){
		if (isNew == null){
			isNew = true;
		}
		//�õ���������
		var encodeData = this.docCode.value;
		//�����������Ϊ�գ����½�
		if (this.getDocName() == ""){
			if (isNew){
				//�������ĵ�
				this.createDoc();
			}else{
				alert("û��Ҫ�鿴���������ݣ�");
			}
		}else{
			//��ʾ�ؼ�
			displayMe(true);
			//�õ��ĵ�������
			this.office.Open(this.nowFileName);
			//��ʼ��word����
			this.initObject(this.office.ActiveDocument);
			//�����û���Ϣ
			this.setUser();
			
		}
	}
	/**
	 * �򿪱����ĵ�
	 * @param localFileName �����ļ�������·��
	 */
	this.openLocalDoc = function(localFileName){
		if (localFileName == null || localFileName == ""){
			alert("û��ָ�������ļ���!");
			return;
		}
		this.nowFileName = localFileName;
		//��ʾ�ؼ�
		displayMe(true);
		//�õ��ĵ�������
		this.office.Open(localFileName);
		//��ʼ��word����
		this.initObject(this.office.ActiveDocument);
		//�����û���Ϣ
		this.setUser();
	}
	/**
	 * �ر��ĵ�
	 * 
	 */
	this.closeDoc = function(){
		//��ԭword�û���Ϣ
		this.resumeUser();
		//�رտؼ�
		this.office.Close();
		//���ؿؼ�
		displayMe(false);
	}
	/**
	 * �½��ĵ�
	 * 
	 */
	this.createDoc = function(){
		//��ʾ�ؼ�
		displayMe(true);
		//�򿪿ؼ����Ҵ����ļ�
		this.office.Open(this.fileName);
		//��ʼ��word����
		this.initObject(this.office.ActiveDocument);
		//�����û���Ϣ
		this.setUser();
	}
	/**
	 * �ؼ�����ʾ����
	 * @param isDis �Ƿ���ʾ�ؼ�
	 */
	function displayMe(isDis){
		if (isDis){
			office.style.width = "100%";
			office.style.height = "600";
		}else{
			office.style.width = "0";
			office.style.height = "0";
		}
	}
}
/*****************************************************************/
/**
 * ��word���в����Ķ���
 * @param encode ����/����/�����ļ��Ķ��󣨿ؼ���
 * @param documentCode ��ű���������
 * @param fileName �½��ļ�ʹ�õĻ����ļ�
 * @param userName �û�����
 */

function Word(encode,documentCode,fileName,userName){
	//ActiveDocument����
	this.activeDocument ;
	//Application����
	this.application ;
	//Documents����
	this.documents ;
	//�ļ��������
	this.data = encode;
	//�½��ļ�����
	this.fileName = fileName;
	//��������ʹ�õ��ļ�����
	this.nowFileName = fileName;
	//�û�����
	this.userName = userName;
	//��ű�����Ķ���
	this.docCode = documentCode;
	//��չ��
	this.EXPAND = "doc";
	//word��ԭʼ�û����
	this.userInitials;
	//word��ԭʼ�û�ȫ��
	this.wordUserName;

	/**
	 * ���ĵ������û���ĵ����½�
	 * (δʵ�ֵķ���,�̳���д)
	 */
	this.openDoc = function(){
		//�����û���Ϣ
		this.setUser();
	}
	/**
	 * �ر��ĵ�
	 * (δʵ�ֵķ���,�̳���д)
	 */
	this.closeDoc = function(){
		//��ԭword�û���Ϣ
		this.resumeUser();
	}
	/**
	 * �½��ĵ�
	 * (δʵ�ֵķ���,�̳���д)
	 */
	this.createDoc = function(){
		//�����û���Ϣ
		this.setUser();
	}
	/**
	 * ���³�ʼword����
	 * @param activeDocument word��ActiveDocument����
	 */
	this.initObject = function(activeDocument){
		this.activeDocument = activeDocument;
		this.application = this.activeDocument.Application;
		this.documents = this.application.Documents;
	}
	/**
	 * �õ�Ҫ�򿪵��ĵ�����
	 */
	this.getDocName = function(){
		if (this.docCode.value ==""){
			this.nowFileName = "";
			return "";
		}
		//����
		this.data.decodeValue(this.docCode.value);
		//����
		this.data.changeFileName(this.EXPAND);
		//ȡ���ļ���
		this.nowFileName = this.data.decodefile;
		//�����ļ�����
		return this.nowFileName;
	}
	/**
	 * �����ĵ�
	 */
	this.saveDoc = function(){
		this.unProtect();

		//�ҵ�һ���µ��ļ���
		this.nowFileName = this.data.tempFileName;
		this.nowFileName = this.nowFileName.substring(0,this.nowFileName.length-3) + this.EXPAND;
		
		//���Ϊ�ļ�
		this.activeDocument.SaveAs(this.nowFileName,0);
		//�ر�ҳ��
		this.closeDoc();
		//ָ���ļ�����
		this.data.filename = this.nowFileName;
		//����
		this.data.encode();
		//�Żر�����ļ�
		this.docCode.value = this.data.encodeString;
	}
	/**
	 * �����û���Ϣ
	 */
	this.setUser = function(){
		//����wordԭ���û���Ϣ
		this.wordUserName = this.application.UserName;
		this.userInitials = this.application.UserInitials;
		//���õ�ǰ�û���������
		this.application.UserName = this.userName;
		//���õ�ǰ�û����
		this.application.UserInitials = this.userName.substring(0,9);
	}
	/**
	 * ��ԭ�û���Ϣ
	 */
	this.resumeUser = function(){
		//�ж�Ϊ�յ����
		if (this.wordUserName == null){
			this.wordUserName = this.userInitials;
		}
		if (this.wordUserName != null){
			//�����û���������
			this.application.UserName = this.wordUserName;
			if (this.userInitials == null){
				//���õ�ǰ�û����
				this.application.UserInitials = this.wordUserName;
			}else{
				//���õ�ǰ�û����
				this.application.UserInitials = this.userInitials;
			}
		}
	}
	/**
	 * ����Ϊ���״̬
	 */
	this.setBrowse= function(){
		this.unProtect();
		this.activeDocument.Protect(3,false,this.password);
	}
	/**
	 * ����Ϊ�༭״̬
	 */
	this.setEdit= function(){
		this.unProtect();
		this.displayRevie(true);
	}
	/**
	 * ����Ϊ�޶�״̬
	 * @param isRev �Ƿ���޶�
	 */
	this.setRevision = function(isRev){
		this.unProtect();
		if (isRev){
			//�����޶������Խ���
			this.showRevision(true);
		}else{
			//�����޶������ܽ���
			this.activeDocument.Protect(0,false,this.password);
		}
	}
	/**
	 * �����Ƿ���ʾ�޶�
	 * @param rev �Ƿ���ʾ�޶�
	 */
	this.showRevision = function(rev){
		this.activeDocument.TrackRevisions = rev;  //����Ļ�ϲ���ʾ�޶�
		this.activeDocument.PrintRevisions = rev;  //�ڴ�ӡ�е��ĵ��в���ʾ�޶�
		this.activeDocument.ShowRevisions = rev;   //�༭ʱ������޶� 	
		this.displayRevie(rev);
		if (rev){
			this.activeDocument.ActiveWindow.View.ShowRevisionsAndComments = true;
			this.activeDocument.ActiveWindow.View.RevisionsView = 0;
		}
	}
	/**
	 * ����
	 */
	this.unProtect = function(){
		if (this.activeDocument.ProtectionType!=-1){
 				this.activeDocument.Unprotect(this.password);
		}
	}
	/**
	 * ��ʾ/�����޶����������Ҽ��˵�
	 */
	this.displayRevie = function(isDis){
		this.activeDocument.CommandBars("Reviewing").Enabled = isDis;
		this.activeDocument.CommandBars("Reviewing").Visible = isDis;
		this.activeDocument.CommandBars("Track Changes").Enabled = isDis;
	}
	/**
	 * ���������޶�
	 */
	this.allChangeInDoc = function(){
		this.application.WordBasic.AcceptAllChangesInDoc();
	}
	/**
	 * �Ƿ�������״̬��ʾ�޶�
	 * @param isHidd true �����޶� false ��ʾ�޶�
	 */
	this.hiddenRevie = function(isHidd){
		if (isHidd){
			this.activeDocument.ActiveWindow.View.ShowRevisionsAndComments = false;
			this.activeDocument.ActiveWindow.View.RevisionsView =0;
		}else{
			this.activeDocument.ActiveWindow.View.ShowRevisionsAndComments = true;
			this.activeDocument.ActiveWindow.View.RevisionsView =0;
		}
	}
	/**
	 *�������壬�������ܸ���
	 */
	this.protectForm = function(){
		this.unProtect();
		this.activeDocument.Protect(2,false,this.password);
	}
	/**
	 * �����������
	 * @param len ����ĳ���
	 */
	this.getPassWord = function(len){
		var passStr = "";
		for (var i=0;i<len;i++){
			var pass = Math.round(Math.random()*10);
			passStr +=pass;
		}
		return passStr;
	}
	this.password = this.getPassWord(10);
	/**
	 * ������
	 * @param state [true|false][����|������]
	 */
	this.allowCopy = function(state) {
		;
	}
	/**
	 * �Ƿ��Ѿ�����
	 * return [true|false][��|��]
	 */
	this.isSaved = function() {
		return this.activeDocument.Saved;
	}
}
//-----------------����Ϊ����ӡ��js-----------------------
	function printForm(){
		var formId = document.all("curFormId"); //��ID
		//TODO ����url��ַ
		var url = "jsp/help.jsp?url=formprinttemplethelp.cmd&formId=" + formId.value;
		var reValue = window.showModalDialog(url,"","status:no");
		if (reValue == null || reValue == ""){
			//alert("�Բ���,û���ҵ���ӡģ�壡");
			return;
		}
		printFormData(reValue);
	}
//-----------------------------------------------------------
/*
function printForm(){
	//TEST
	printFormData(document.all("printTempletValue").value);
}*/
function getWord() {
		try{
			return new ActiveXObject("Word.Application");    //����word
		}
		catch (e) {
			alert("�Բ��𣬳�ʼ��Word����ʧ�ܣ�\n��ȷ�����Ƿ�װ��Microsoft Word 97����߰汾��\n���ҽ���վ����ӵ�����վ���б�");
			return null;
		}
	}
	function printFormData(templetData){
		
		var printData = document.all("formPrintData").value;
		var offH=getWord();
		if(offH == null){
			return;
		}
		var activeDoc;
		if (templetData!=""){
		//����
			var data=document.all("data");
			data.decodeValue(templetData);
			//����
			data.changeFileName("doc");
			//ȡ���ļ���
			offH.Documents.Open(data.decodefile);
			//offH.visible=true;
			activeDoc = offH.ActiveDocument;
			try{
				if (printData!=""){
					var arrayData = printData.split("��");
					for (var i=0;i<arrayData.length;i++){

							var partData = arrayData[i].split("��");
							if ("hidden"!=partData[3]){
								var textValue = "";
								var templetTitle = "";
								switch (partData[2]){
									case "text":
										templetTitle = partData[templetType];
										if ("common"==partData[3]){
											textValue = document.getElementsByName("Ins_" + partData[0])[0].value;
										}else{
											textValue = document.getElementById("Ins_" + partData[0]).innerText;
										}
										findExecute(templetTitle,textValue,offH);
										break;
									case "textarea":
										templetTitle = partData[templetType];
										if ("common"==partData[3]){
											textValue = document.getElementsByName("Ins_" + partData[0])[0].value;
										}else{
											textValue = document.getElementById("Ins_" + partData[0]).innerText;
										}
										findExecute(templetTitle,textValue,offH);
										break;
									case "drop-down":
										templetTitle = partData[templetType];
										var selObj = document.getElementsByName("Ins_" + partData[0])[0];
										var tempTextValue = selObj.value;
										if ("common"==partData[3]){
											for (var k = 0;k<selObj.options.length;k++){
												if (selObj.options[k].value==tempTextValue)
													textValue = selObj.options[k].innerText;
											}
										}else{
											textValue = document.getElementById("Ins_" + partData[0]).innerText;
										}
										
										findExecute(templetTitle,textValue,offH);
										break;
									case "date-time":
										templetTitle = partData[templetType];
										if ("common"==partData[3]){
											textValue = document.getElementsByName("Ins_" + partData[0])[0].value;
										}else{
											textValue = document.getElementById("Ins_" + partData[0]).innerText;
										}
										findExecute(templetTitle,textValue,offH);
										break;
									case "special-edit":
										templetTitle = partData[templetType];
										var arrValue = new Array();
										
										arrValue["old"] = document.getElementById("display_Special_" + partData[0]);
										
										if ("common"==partData[3]){
											arrValue["edit"] = decodeHtml(document.getElementsByName("Special_" + partData[0])[0].value);
										}else{
											arrValue["edit"] = "";
										}
										if(arrValue["edit"]==null) arrValue["edit"]="";
										
										specialEditPrint(partData[0],templetTitle,arrValue,offH);
										break;
									case "select-field":
										templetTitle = partData[templetType];
										textValue = document.getElementById("display_Select_" + partData[0]).innerText;
										
										findExecute(templetTitle,textValue,offH);
										break;
									case "radio":
										templetTitle = partData[templetType];
										if ("common"==partData[3]){
											var temRadio = document.getElementsByName("Ins_" + partData[0]);
											for (var k=0;k<temRadio.length;k++){
												if (temRadio[k].checked){
													if (textValue ==""){
														textValue = temRadio[k].getAttribute("description");
													}else{
														textValue +=checkRadioSplit + temRadio[k].getAttribute("description"); 
													}
												}
											}
										}else{
											textValue = document.getElementById("Ins_" + partData[0]).innerText;
										}
										findExecute(templetTitle,textValue,offH);
										break;
									case "check":
										templetTitle = partData[templetType];
										if ("common"==partData[3]){
											temCheck = document.getElementsByName("Ins_" + partData[0]);
											var temCheck = document.getElementsByName("Ins_" + partData[0]);
											for (var k=0;k<temCheck.length;k++){
												if (temCheck[k].checked){
													if (textValue ==""){
														textValue = temCheck[k].getAttribute("description");
													}else{
														textValue +=checkRadioSplit + temCheck[k].getAttribute("description"); 
													}
												}
											}
										}else{
											textValue = document.getElementById("Ins_" + partData[0]).innerText;
										}
										findExecute(templetTitle,textValue,offH);
										break;
									case "hyperlink":
										templetTitle = partData[templetType];
										var hypObj = document.getElementById("Ins_" + partData[0]);
										textValue = hypObj.innerText;
										if ("common"==partData[3]){
											if (offH.Selection.Find.Execute(getTempletTitle(templetTitle))){
												activeDoc.Hyperlinks.Add(offH.Selection.Range,hypObj.href,"",hypObj.href,textValue,"_blank");
												goBack(offH);
											}
										}else{
											findExecute(templetTitle,textValue,offH);	
										}
										break;
									case "edit-field":
										templetTitle = partData[templetType];
										textValue = decodeHtml(document.getElementsByName("Edit_" + partData[0])[0].value);
										findExecute(templetTitle,textValue,offH);
										break;
									case "file":
										templetTitle = partData[templetType];
										if ("common"==partData[3]){
											textValue = document.getElementsByName("Ins_" + partData[0])[0].value;
										}else{
											textValue = document.getElementById("Ins_" + partData[0]).innerText;
										}
										findExecute(templetTitle,textValue,offH);
										break;
									case "hidden":
										break;
									case "display":
										templetTitle = partData[templetType];
										textValue = document.getElementById("Ins_" + partData[0]).innerText;
										findExecute(templetTitle,textValue,offH);
										break;
									case "image":
										templetTitle = partData[templetType];
										textValue = document.getElementById("Ins_" + partData[0]).src;
										
										if (offH.Selection.Find.Execute(getTempletTitle(templetTitle))){
											offH.Selection.Delete(1,1);
											offH.Selection.InlineShapes.AddPicture(textValue,false,true);
											goBack(offH);
										}
										break;
									case "calculate":
										templetTitle = partData[templetType];
										if ("common"==partData[3]){
											textValue = document.getElementsByName("Ins_" + partData[0])[0].value;
										}else{
											textValue = document.getElementById("Ins_" + partData[0]).innerText;
										}
										findExecute(templetTitle,textValue,offH);
										break;
									case "SugGest":
										templetTitle = partData[templetType];
										var sugObj = document.getElementById("suggestContentHistory").getElementsByTagName("pre");
										if (offH.Selection.Find.Execute(getTempletTitle(templetTitle))){
											offH.Selection.Delete(1,1);
											for (var k=0;k<sugObj.length;k++){
												if (k>0){
													offH.Selection.TypeParagraph();
												}
												var subTime = sugObj[k].getAttribute("subTime");
												var username = sugObj[k].getAttribute("userName");
												textValue = sugObj[k].innerText;
												if (subTime==null)
													subTime = "";
												if (username==null)
													username = "";
												offH.Selection.TypeText(textValue);
												offH.Selection.TypeParagraph();
												offH.Selection.TypeText(username + "  " + subTime);
											}
											goBack(offH);
										}
										break;
								}
							}
					}
					offH.Selection.Find.Execute("��*��",false,false,true,false,false,true,1,false,"",2);
					//�����������һҳ��ҳ��
	    			offH.visible=true;
	    			activeDoc.PrintOut();

				}
			}catch(e){
				quitWord(offH);
				alert("���ִ��󣬴�����ϢΪ��\n" + e.message);
			}
		}		
	}
	
	function getTempletTitle(templetTitle){
		return "��" + templetTitle + "��";
	}

	/**
	 * ������༭��Ĵ���
	 */
function specialEditPrint(baseName,templetTitle,arrValue,offH){
	try{
		while(offH.Selection.Find.Execute(getTempletTitle(templetTitle))){
		var arrayTemp = new Array();
		arrayTemp[0] = new Array();
		if (arrValue["edit"]!=""){
			var valueType = "";
			var root = getRoot(arrValue["edit"]);
			var tempStr = arrValue["edit"];
			if (root!=null){
				tempStr = root.text;
				var valueTypeObj = root.attributes.getNamedItem("type");
			
				if (valueTypeObj!= null){
					valueType = valueTypeObj.nodeValue;
				}
			}
			if (valueType=="1"){
				up.printSign.InkStr = tempStr;
				up.printSign.Zoom = 0.3;
				up.printSign.ReadOnly=true;
				var tempFile = data.tempFileName;
				tempFile = tempFile.substring(0,tempFile.length-4) + ".jpg";
				try{
					if (signInkColor!=""){
						up.printSign.InkColor = signInkColor;
					}
				}catch(e){
				}
				up.printSign.SaveJpgFile(tempFile);
				arrayTemp[0]["type"]="jpg";
				arrayTemp[0]["value"]=tempFile;
				arrayTemp[0]["userName"]="";
				arrayTemp[0]["subTime"]="";
			}else{
				arrayTemp[0]["type"]="txt";
				arrayTemp[0]["value"]=tempStr;
				arrayTemp[0]["userName"]=getUserName();
				arrayTemp[0]["subTime"]=getNowDate();
			}
			
		}else{
			arrayTemp[0]["type"]="";
			arrayTemp[0]["value"]="";
			arrayTemp[0]["userName"]="";
			arrayTemp[0]["subTime"]="";
		}
		var preObjs = arrValue["old"].getElementsByTagName("pre");
		for (var k = 0;k<preObjs.length;k++){
			var sType = preObjs[k].getAttribute("sType");
			arrayTemp[k+1] = new Array();
			if (sType == "signSign"){
				var tempFile = data.tempFileName;
				tempFile = tempFile.substring(0,tempFile.length-4) + ".jpg";
				preObjs[k].getElementsByTagName("OBJECT")[0].SaveJpgFile(tempFile);
				arrayTemp[k+1]["type"]="jpg";
				arrayTemp[k+1]["value"]=tempFile;
				arrayTemp[k+1]["userName"]="";
				arrayTemp[k+1]["subTime"]="";
			}else{
				arrayTemp[k+1]["type"]="txt";
				arrayTemp[k+1]["value"]=preObjs[k].innerHTML;
				arrayTemp[k+1]["userName"]=preObjs[k].getAttribute("userName");
				arrayTemp[k+1]["subTime"]=preObjs[k].getAttribute("subTime");
			}
			
		}
		
		offH.Selection.Delete(1,1);
		for(var kk=1;kk<arrayTemp.length;kk++){
			if (kk>1){
				offH.Selection.TypeParagraph();
			}
			if (arrayTemp[kk]["type"]=="jpg"){
				offH.Selection.InlineShapes.AddPicture(arrayTemp[kk]["value"],false,true);
				offH.Selection.TypeParagraph();
				offH.Selection.TypeText(arrayTemp[kk]["userName"] + "  " + arrayTemp[kk]["subTime"]);
			}else{
				inEditValue(offH,arrayTemp[kk]["value"]);
				offH.Selection.TypeParagraph();
				offH.Selection.TypeText(arrayTemp[kk]["userName"] + "  " + arrayTemp[kk]["subTime"]);
			}
		}
		if (arrayTemp[0]["type"]!=""){
			offH.Selection.TypeParagraph();
			if (arrayTemp[0]["type"]=="jpg"){
				offH.Selection.InlineShapes.AddPicture(arrayTemp[0]["value"],false,true);
				offH.Selection.TypeParagraph();
				offH.Selection.TypeText(arrayTemp[0]["userName"] + "  " + arrayTemp[0]["subTime"]);
			}else{
				inEditValue(offH,arrayTemp[0]["value"]);
				offH.Selection.TypeParagraph();
				offH.Selection.TypeText(arrayTemp[0]["userName"] + "  " + arrayTemp[0]["subTime"]);
			}
		}
		goBack(offH);
		}
    }catch(e0){
    	quitWord(offH);
		alert("���ִ��󣬴�����ϢΪ��\n" + e.message);
		return;
	}
}
	
	function getUserName(){
		return document.all("curUserName").value;
	}
	function getNowDate(){
		var d = new Date();
		var s = "";
		s += d.getFullYear() + "��";
		s += (d.getMonth() + 1) + "��";
		s += d.getDate() + "��";
		s += " ";
		s += d.getHours() + "��";
		s += d.getMinutes() + "��";
		s += d.getSeconds() + "��";
		//s += d.getMilliseconds() + "����";
		return s;
	}
	function inEditValue(offH,textValue){
		try{
			if(textValue==null) return;
			var len = textValue.length;
			if (len<strSplitLength){
				offH.Selection.TypeText(textValue);
			}else{
				var mm = len%strSplitLength;
				var ii = parseInt(len/strSplitLength);
				if (mm>0)
					ii++;
				for (var i=0;i<ii;i++){
					var ll = (i+1)*strSplitLength;
					if (ll>len)
						ll=len;
					var temptextValue = textValue.substring(i*strSplitLength,ll);
					offH.Selection.TypeText(temptextValue);
				}
			}
		}catch(e1){
			throw("�������ݳ������⣺\n" + e1.name + ":" + e1.message);
		}
	}
	function findExecute(templetTitle,textValue,offH){
		while (offH.Selection.Find.Execute(getTempletTitle(templetTitle))){
			offH.Selection.Delete(1,1);
			inEditValue(offH,textValue);
			goBack(offH);
		}
	}

	function quitWord(offH){
		offH.Quit(0);
	}
	function goBack(offH){
		offH.Selection.GoTo (1,2,1,"1");
    	offH.Selection.GoTo (3,1,1,"");
	}
//------------------------------����ӡend-----------------------------
