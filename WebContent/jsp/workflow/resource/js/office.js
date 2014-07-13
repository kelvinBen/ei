	var templetType = 1;
	var checkRadioSplit = ",";
	var strSplitLength = 250;
	var webWord;
	var openObj;
	function textLoad(){
	}

	/**
	 * 下载新建文档
	 */
	function downLoadNewDoc(){
		//解码
		data.decodeValue(document.all("newDocumentFileValue").value);
		//改名
		data.changeFileName("doc");
		//取得文件名
		return data.decodefile;
	}
	/**
	 * 打开或者新建一个文档
	 * @param obj 正文按钮对象
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
			alert("没有要查看的正文内容！");
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
	 * 文档的状态处理
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
	 * 关闭文件不保存
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
	 * 打开本地文件
	 * @param obj 存放本地文件路径值的域
	 */
	function openLocalFile(obj){
		webWord.openLocalDoc(obj.value);
	}
	/**
	 * 将保存的文件放入隐藏域
	 */
	function saveFile(){
		webWord.saveDoc();
		webOfficeControl.style.display = "none";
		openObj.disabled = false;
	}

//*****************************************************************************************//
	var textMenuObj;
	var openObjNt;
	//千航文档控件菜单显示区域为<div id="textMenu"></div>,所有的菜单使用js动态生成
	/**
	 * 打开或者新建一个文档
	 * @param obj 正文按钮对象
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
			alert("没有要查看的正文内容！");
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
	 * 文档的状态处理
	 */
	function editFileNtko(tag){
		var textMenuObj = document.getElementById("textMenu");
		textMenuObj.innerHTML="";
		//[edit|read|emend][可编辑|可浏览|可修订]
		var documentRight;
		if(tag=="true") documentRight="read";
		else
		documentRight = document.all("documentRight").value;
		//是否有本地文件导入的权限
		//[true|false][有|没有]
		var docLocalOpen = document.all("docLocalOpen").value;
		//是否能另存为本地文件
		// [true|false][能|不能]
		var docLocalSave = document.all("docLocalSave").value;
		//非修订状态时是否显示修订状态
		//[true|hidden|false][显示修订|隐藏修订|保持不变]
		//[true|false][可以接受修订|不能接受修订]
		var emendRight = document.all("emendRight").value;
		//是否可以盖章
		//[true|false][是|否]
		var docSeal = document.all("docSeal").value;
		//是否保护印章
		//[true|false][保护|不保护]
		var docProtectSeal = document.all("docProtectSeal").value;
		//是否全文批注
		//[true|false][是|否]
		var docSign = document.all("docSign").value;
		//全文批注是否清稿
		//[true|false][是|否]
		var docSignClear = document.all("docSignClear").value;
		//是否打印正文
		//[true|peacefulPrint|false][打印|后台打印|不打印]
		var docTextPrint = document.all("docTextPrint").value;
		//是否防止拷贝
		// [true|false][是|否]
		var docTextCopy = document.all("docTextCopy").value;
		creatMenu("closeButton","关闭正文","不保存关闭","closeFileNtko()");
		//是否可以套红
		// [true|false][是|否]
		var taohong = document.all("taohong").value;
		//是否可以替换
		// [true|false][是|否]
		var tihuan = document.all("tihuan").value;
		
		if (documentRight == "edit" || documentRight == "emend"){//编辑或修订状态
		   if(tihuan=="true"){
			creatMenu("replaceButton", "替换", "替换正文", "replaceContentNtko()");
			}
		   if(taohong=="true"){
			creatMenu("taohongButton", "套红", "执行套红", "taohongContentNtko()");
			}			
			creatMenu("saveButton","保存","保存关闭","saveFileNtko()");
			if (docLocalOpen=="true"){ //本地文件导入
				creatMenu("localOpenButton","本地文件导入","点击选择本地文件","webWord.openLocalDoc('aaa.doc')");
				//如果控件需要设置，可在这里调用方法
			}
			if (docLocalSave == "true"){//保存为本地文件
				creatMenu("localSaveButton","另存为本地","将正文保存至本地","webWord.saveLocalFile()");
			}

			//盖章
			if (docSeal == "true"){
				creatMenu("sealButton","盖章","点击加盖图章","webWord.seal()");
			}

			//全文批注
			if (docSign == "true"){
				creatMenu("signButton","批注","点击进行全文批注","webWord.sign()");
			}
			//打印
			if (docTextPrint == "true" || docTextPrint == "peacefulPrint"){
				creatMenu("printButton","打印","打印正文","webWord.print(document.all('docTextPrint').value)");
			}
			//修订状态
			if (documentRight == "edit"){
				webWord.emendRight(emendRight);
				//creatMenu("backupButton","备份","备份","myBackup()");
			}else if (documentRight == "emend"){
				webWord.emend(emendRight);
				if (emendRight == "true") {
				//	creatMenu("backupButton","备份","备份","myBackup()");
				}
			}
			//公章保护
			webWord.protectSeal(docProtectSeal);
			webWord.signState(docSignClear);
			//是否可以拷贝
			webWord.allowCopy(docTextCopy);
		}else{ //浏览状态
			if (docLocalSave == "true"){//保存为本地文件
				creatMenu("localSaveButton","另存为本地","将正文保存至本地","webWord.saveLocalFile()");
			}
			//打印
			if (docTextPrint == "true" || docTextPrint == "peacefulPrint"){
				creatMenu("printButton","打印","打印正文","webWord.print(document.all('docTextPrint').value)");
			}
			//修订状态
			webWord.emendRight(emendRight);
			//公章保护
			webWord.protectSeal(docProtectSeal);
			webWord.signState(docSignClear);
			//是否可以拷贝
			webWord.allowCopy(docTextCopy);
			//浏览
			webWord.setBrowse();
		}
	}
	/**
	 *	接受修订，要求先备份
	 */
	function myEmend(){
		if(myBackup()){
			var emendRight = document.all("emendRight").value;
			webWord.emend(emendRight);
		}else{
			alert("接受修订失败[原因：备份失败]！");
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
	 * 关闭文件不保存
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
	 * 将用笺中的内容替换到正文
	 */
	function replaceContentNtko() {
		if (webWord == null) {
			return;
		}
		webWord.replaceContent();
	}
	/**
	 * 调用套红
	 */	
	function taohongContentNtko() {
		if (webWord == null) {
			return;
		}    
		// 选择模板
		win = webWord.selectTemplet();
		this.unProtect();
		if (win) {
		webWord.office.activeDocument.TrackRevisions=false; //关闭修订
		var canSaveAs=webWord.office.FileSaveAs;//打开另存为权限
		webWord.office.FileSaveAs=true;
		
		var f1="c:\\temp_abc1.doc";
		
		var oldDoc=webWord.office.ActiveDocument;
		oldDoc.SaveAs(f1);
		
		var isnocopy=webWord.office.IsNoCopy;
		if(isnocopy==true){
			webWord.office.IsNoCopy=false;
		}
		//curSel.Cut();
		// 打开模板
	   var URL = 'doccontent.cmd?method=detail&fileId=' + win[4];		   
       //webWord.office.AddTemplateFromURL(URL);
       webWord.office.OpenFromURL(URL);

       var pageSetup=webWord.office.ActiveDocument.Application.Selection.PageSetup;
       var leftmargin=pageSetup.LeftMargin;
       var rightmargin=pageSetup.RightMargin;
       
       webWord.office.OpenLocalFile(f1);
       
       //选择对象当前文档的所有内容
		var curSel = webWord.office.ActiveDocument.Application.Selection;
        curSel.PageSetup.LeftMargin=leftmargin;
        curSel.PageSetup.RightMargin=rightmargin;
        curSel.WholeStory();//全选
		curSel.Cut();
		
       webWord.office.OpenFromURL(URL);
       
	   var BookMarkName = "正文";
	   if(!webWord.office.ActiveDocument.BookMarks.Exists(BookMarkName))
	   {
			alert("模板中不存在名称为：\""+BookMarkName+"\"的书签,无法把已经编辑内容导入模板！注意:编辑内容已经保存到剪切板.");          
        	return;      
       }
	   //粘贴正文,记录书签
	   var bkmkObj = webWord.office.ActiveDocument.BookMarks(BookMarkName);
	   var saverange = bkmkObj.Range;
	   saverange.Paste(); 
	   webWord.office.ActiveDocument.BookMarks.Add(BookMarkName,saverange);	
	   //恢复状态 
	   webWord.office.IsNoCopy=isnocopy;
	   webWord.office.FileSaveAs=canSaveAs;
	   //替换所有其他内容
       webWord.replaceContent();
	   }
	}	
	/**
	 * 将保存的文件放入隐藏域
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
	 * 是否已经保存
	 * return [true|false][是|否]
	 */
	function isSavedNtko() {
		if (webWord == null) {
			return true;
		}
		return webWord.isSaved();
	}
	/**
	 * 文档打开事件
	 */
	function OnDocumentOpenedNtko(str, obj) {
		if (webWord == null) {
			return;
		}
		webWord.initObject(webWord.office.ActiveDocument);
		if (webWord.office.DocType != 1) {
			closeFileNtko();
			alert("暂不支持该类型的文件！");
			return;
		}
	}
	

	/**
	 * 创建一个按钮
	 * @param name 按钮的名称
	 * @param title 按钮的标题
	 * @param tooltip 按钮的提示信息
	 * @param clickFunc 按钮的onclick事件
	 */
	function creatMenu(name,title,tooltip,clickFunc){
		var menuCode = "<button name=\"" + name + "\" title=\"" + tooltip + "\" onclick=\"" + clickFunc + "\">"; 
		menuCode +=title + "</button>";
		var textMenuObj = document.getElementById("textMenu");
		textMenuObj.innerHTML =menuCode + textMenuObj.innerHTML;
	}
/**
 * 对word进行操作,千航文档控件
 * @param office 千航的对象
 * @param encode 编码/解码/处理文件的对象（控件）
 * @param documentCode 存放编码的域对象
 * @param fileName 新建文件使用的基础文件
 * @param userName 用户名称
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
	 * 打开文档，如果没有文档则新建
	 * @param isNew 如果没有文档是否创建新文档
	 */
	this.openDoc = function(isNew){
		if (isNew == null){
			isNew = true;
		}
		//得到编码数据
		var encodeData = this.docCode.value;
		//如果编码数据为空，则新建
		if (this.getDocName() == ""){
			if (isNew){
				//创建新文档
				this.createDoc();
			}else{
				alert("没有要查看的正文内容！");
			}
		}else{
			//显示控件
			displayMe(true);
			//得到文档的名字
			this.office.OpenLocalFile(this.nowFileName);
			//初始化word对象
			this.initObject(this.office.ActiveDocument);
			//设置用户信息
			this.setUser();
			
		}
	}
	/**
	 * 打开本地文档
	 * @param localFileName 本地文件的完整路径
	 */
	this.openLocalDoc = function(){
		
		//显示控件
		displayMe(true);
		//得到文档的名字
		//this.office.OpenLocalFile(localFileName);
		this.office.ShowDialog(1);
		this.nowFileName = "";
		//初始化word对象
		this.initObject(this.office.ActiveDocument);
		//设置用户信息
		this.setUser();
	}
	/**
	 * 关闭文档
	 * 
	 */
	this.closeDoc = function(){
		//还原word用户信息
		this.resumeUser();
		//关闭控件
		this.office.Close();
		//隐藏控件
		displayMe(false);
	}
	/**
	 * 新建文档
	 * 
	 */
	this.createDoc = function(){
		//显示控件
		displayMe(true);
			//打开控件，且打开新文件
			//this.office.OpenLocalFile(this.fileName);
			this.office.CreateNew("Word.Document");
		//初始化word对象
		this.initObject(this.office.ActiveDocument);
		//设置用户信息
		this.setUser();
	}
	/**
	 * 保存文档
	 */
	this.saveDoc = function(){
		this.unProtect();

		//找到一个新的文件名
		this.nowFileName = this.data.tempFileName;
		this.nowFileName = this.nowFileName.substring(0,this.nowFileName.length-3) + this.EXPAND;

		//另存为文件
		this.activeDocument.SaveAs(this.nowFileName,0);
		//关闭页面
		this.closeDoc();
		//指定文件名字
		this.data.filename = this.nowFileName;
		//编码
		this.data.encode();
		//放回编码的文件
		this.docCode.value = this.data.encodeString;
	}
	/**
	 * 控件的显示隐藏
	 * @param isDis 是否显示控件
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
	/************以下是新加功能****************/
	/**
	 * 另存为本地文件
	 */
	this.saveLocalFile = function(){
		this.office.ShowDialog(3);
	}
	/**
	 * 编辑和只读时，修订状态控制
	 * @param state 状态[true|hidden|false][显示修订|隐藏修订|保持不变]
	 */
	this.emendRight = function(state){
		this.activeDocument.TrackRevisions = false;	// 不修订
		this.activeDocument.PrintRevisions = false;	// 不打印修订

		if (state == "true"){
			this.hiddenRevie(false);		// 显示修订
			this.displayRevie(true);		// 显示修订菜单
		}else if (state == "hidden"){
			this.hiddenRevie(true);			// 隐藏修订
			this.displayRevie(false);		// 隐藏修订菜单
		}else{
		
		}
	}
	/**
	 * 修订时状态的控制
	 * @param state [true|false][可以接受修订|不能接受修订]
	 */
	this.emend = function(state){
		this.unProtect();
		
		this.activeDocument.TrackRevisions = true;	// 修订
		this.activeDocument.PrintRevisions = true;	// 打印修订
		this.activeDocument.ShowRevisions = true;	// 显示修订

		if (state == "true"){
			this.displayRevie(true);			// 显示修订菜单
		}else{
			this.displayRevie(false);			// 隐藏修订菜单
		}
	}
	/**
	 * 是否以最终状态显示修订
	 * @param isHidd true 隐藏修订 false 显示修订
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
	 * 盖章
	 */
	this.seal = function(){
		//var win = showModalDialog("jsp/help.jsp?edocsignselect.cmd", window, "scroll:yes;status:no;dialogWidth:750px;dialogHeight:400px"); 
		//if (win) {
			//var URL = 'doccontent.cmd?method=detail&fileId=' + win[4];
			alert("提示，印章的口令为123456");
			var URL = 'jsp/workflow/resource/seal/seal.esp'    //该url可以通过扩展来实现，这里调用的本地文件。该印章的口令为123456
			this.office.AddSignFromURL
			(
				this.userName,	// user
				URL,   			// URL
				0,   			// left
				0,   			// Top
				"",   			// signKey
				1,   			// 1光标;2页边距;3页面距离;4默认设置,段落
				100,   			// 缩放
				1   			// 图片与文字的位置,0下方;1上方
			);
		//}		
	}
	/**
	 * 是否保护盖章
	 * @param state [true|false][保护|不保护]
	 */
	this.protectSeal = function(state){
		if (state == "true"){
			this.office.SetReadOnly(true, '', 1);
		}else{
			this.office.SetReadOnly(false);
		}
	}
	/**
	 * 全文批注是否隐藏
	 * @param clear [true|false][清稿|不清稿]
	 */
	this.signState = function(clear){
		if (clear == "true"){
			this.office.SetSignsVisible("*", false, "", 1);
		}else{
			this.office.SetSignsVisible("*", true, "", 1);
		}
	}
	/**
	 * 全文批注
	 */
	this.sign = function(){
		this.office.DoHandSign2(this.userName, "");
	}
	/**
	 * 正文打印
	 * @param state 状态[true|peacefulPrint|false][打印|后台打印|不打印]
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
	 * 选择模板
	 * return 返回模板[]
	 */	 
	this.selectTemplet = function() {
		try {
			// 公文类别
			var edocTypeObj = document.all('Ins_EXT_EDOC_TYPE');
			var URL = 'jsp/help.jsp?edoctempletselect.cmd?type_idSearch=' + edocTypeObj.value;
			return showModalDialog(URL, window, "scroll:yes;status:no;dialogWidth:600px;dialogHeight:450px");
		} catch (err) {
			return null;
		}
	}
	/**
	 * 根据正文中的特殊标记，生成书签
	 */
	this.createBookmark = function() {
		try {
			with (this.office.ActiveDocument)
			{
				var rang = Content;
				do {
					var	WdFindWrap_wdFindStop = 0;
					var	WdReplace_wdReplaceNone = 0;
					rang.Find.Execute("[\\$＄Ж]*[\\$＄Ж]", false, false, true, false, false, true, WdFindWrap_wdFindStop, false, "", WdReplace_wdReplaceNone, false, false, false, false);
					if (rang.Find.Found) {
						var bookmarkName = rang.Text.replace(/[\\$＄Ж]/g, "");
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
	 * 允许拷贝
	 * @param state [true|false][允许|不允许]
	 */
	this.allowCopy = function(state) {
		if (state == "true") {
			this.office.IsNoCopy = false;
		} else {
			this.office.IsNoCopy = true;
		}
	}
	/**
	 * 替换书签
	 */	
	this.replaceContent = function() {
		this.unProtect();
		this.activeDocument.TrackRevisions=false; //关闭修订		
		//对所有form的域进行提取值替换书签------开始
		var forms = document.forms;
			for (var i=0; forms && i<forms.length; i++) {
				var elements = forms[i].elements;
				for (var j=0; elements && j<elements.length; j++) {
					var element = elements[j];
					if (element && element.formTitle && element.name) {
						if (!/^Special/.test(element.name)) {
						    //表单中元素的名称
							var bookmarkName = element.formTitle;
							with (this.activeDocument)					
							{   
							    //表单元素的值
							   var elementValue;
							   if(Bookmarks.Exists(bookmarkName)){				    
							    //首先估计元素的值
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
		//对所有form的域进行提取值替换书签------结束
		//对所有编辑域转换成不可编辑的span元素进行提取值替换书签------开始	
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
		//对所有编辑域转换成不可编辑的span元素进行提取值替换书签------结束				
		
	}
	/**
	 * 设置为浏览状态
	 */
	this.setBrowse = function(){
		this.office.SetReadOnly(true);
	}
}
/**********************以下是word对象************************************/

/**
 * 对word进行操作的对象,EBWebOffice 2003 控件
 * @param office EBWebOffice的对象
 * @param encode 编码/解码/处理文件的对象（控件）
 * @param documentCode 存放编码的域对象
 * @param fileName 新建文件使用的基础文件
 * @param userName 用户名称
 */
function EBWebOffice(office,encode,documentCode,fileName,userName){
	this.base = Word;
	this.base(encode,documentCode,fileName,userName);
	this.office = office;
	this.office.Titlebar = false;
	/**
	 * 打开文档，如果没有文档则新建
	 * @param isNew 如果没有文档是否创建新文档
	 */
	this.openDoc = function(isNew){
		if (isNew == null){
			isNew = true;
		}
		//得到编码数据
		var encodeData = this.docCode.value;
		//如果编码数据为空，则新建
		if (this.getDocName() == ""){
			if (isNew){
				//创建新文档
				this.createDoc();
			}else{
				alert("没有要查看的正文内容！");
			}
		}else{
			//显示控件
			displayMe(true);
			//得到文档的名字
			this.office.Open(this.nowFileName);
			//初始化word对象
			this.initObject(this.office.ActiveDocument);
			//设置用户信息
			this.setUser();
			
		}
	}
	/**
	 * 打开本地文档
	 * @param localFileName 本地文件的完整路径
	 */
	this.openLocalDoc = function(localFileName){
		if (localFileName == null || localFileName == ""){
			alert("没有指定本地文件名!");
			return;
		}
		this.nowFileName = localFileName;
		//显示控件
		displayMe(true);
		//得到文档的名字
		this.office.Open(localFileName);
		//初始化word对象
		this.initObject(this.office.ActiveDocument);
		//设置用户信息
		this.setUser();
	}
	/**
	 * 关闭文档
	 * 
	 */
	this.closeDoc = function(){
		//还原word用户信息
		this.resumeUser();
		//关闭控件
		this.office.Close();
		//隐藏控件
		displayMe(false);
	}
	/**
	 * 新建文档
	 * 
	 */
	this.createDoc = function(){
		//显示控件
		displayMe(true);
		//打开控件，且打开新文件
		this.office.Open(this.fileName);
		//初始化word对象
		this.initObject(this.office.ActiveDocument);
		//设置用户信息
		this.setUser();
	}
	/**
	 * 控件的显示隐藏
	 * @param isDis 是否显示控件
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
 * 对word进行操作的对象
 * @param encode 编码/解码/处理文件的对象（控件）
 * @param documentCode 存放编码的域对象
 * @param fileName 新建文件使用的基础文件
 * @param userName 用户名称
 */

function Word(encode,documentCode,fileName,userName){
	//ActiveDocument对象
	this.activeDocument ;
	//Application对象
	this.application ;
	//Documents对象
	this.documents ;
	//文件处理对象
	this.data = encode;
	//新建文件名字
	this.fileName = fileName;
	//现在正在使用的文件名字
	this.nowFileName = fileName;
	//用户名称
	this.userName = userName;
	//存放编码域的对象
	this.docCode = documentCode;
	//扩展名
	this.EXPAND = "doc";
	//word中原始用户简称
	this.userInitials;
	//word中原始用户全称
	this.wordUserName;

	/**
	 * 打开文档，如果没有文档则新建
	 * (未实现的方法,继承重写)
	 */
	this.openDoc = function(){
		//设置用户信息
		this.setUser();
	}
	/**
	 * 关闭文档
	 * (未实现的方法,继承重写)
	 */
	this.closeDoc = function(){
		//还原word用户信息
		this.resumeUser();
	}
	/**
	 * 新建文档
	 * (未实现的方法,继承重写)
	 */
	this.createDoc = function(){
		//设置用户信息
		this.setUser();
	}
	/**
	 * 重新初始word对象
	 * @param activeDocument word的ActiveDocument对象
	 */
	this.initObject = function(activeDocument){
		this.activeDocument = activeDocument;
		this.application = this.activeDocument.Application;
		this.documents = this.application.Documents;
	}
	/**
	 * 得到要打开的文档名字
	 */
	this.getDocName = function(){
		if (this.docCode.value ==""){
			this.nowFileName = "";
			return "";
		}
		//解码
		this.data.decodeValue(this.docCode.value);
		//改名
		this.data.changeFileName(this.EXPAND);
		//取得文件名
		this.nowFileName = this.data.decodefile;
		//返回文件名字
		return this.nowFileName;
	}
	/**
	 * 保存文档
	 */
	this.saveDoc = function(){
		this.unProtect();

		//找到一个新的文件名
		this.nowFileName = this.data.tempFileName;
		this.nowFileName = this.nowFileName.substring(0,this.nowFileName.length-3) + this.EXPAND;
		
		//另存为文件
		this.activeDocument.SaveAs(this.nowFileName,0);
		//关闭页面
		this.closeDoc();
		//指定文件名字
		this.data.filename = this.nowFileName;
		//编码
		this.data.encode();
		//放回编码的文件
		this.docCode.value = this.data.encodeString;
	}
	/**
	 * 设置用户信息
	 */
	this.setUser = function(){
		//保存word原来用户信息
		this.wordUserName = this.application.UserName;
		this.userInitials = this.application.UserInitials;
		//设置当前用户完整名称
		this.application.UserName = this.userName;
		//设置当前用户简称
		this.application.UserInitials = this.userName.substring(0,9);
	}
	/**
	 * 还原用户信息
	 */
	this.resumeUser = function(){
		//判断为空的情况
		if (this.wordUserName == null){
			this.wordUserName = this.userInitials;
		}
		if (this.wordUserName != null){
			//设置用户完整名称
			this.application.UserName = this.wordUserName;
			if (this.userInitials == null){
				//设置当前用户简称
				this.application.UserInitials = this.wordUserName;
			}else{
				//设置当前用户简称
				this.application.UserInitials = this.userInitials;
			}
		}
	}
	/**
	 * 设置为浏览状态
	 */
	this.setBrowse= function(){
		this.unProtect();
		this.activeDocument.Protect(3,false,this.password);
	}
	/**
	 * 设置为编辑状态
	 */
	this.setEdit= function(){
		this.unProtect();
		this.displayRevie(true);
	}
	/**
	 * 设置为修订状态
	 * @param isRev 是否可修订
	 */
	this.setRevision = function(isRev){
		this.unProtect();
		if (isRev){
			//可以修订，可以接受
			this.showRevision(true);
		}else{
			//必须修订，不能接受
			this.activeDocument.Protect(0,false,this.password);
		}
	}
	/**
	 * 设置是否显示修订
	 * @param rev 是否显示修订
	 */
	this.showRevision = function(rev){
		this.activeDocument.TrackRevisions = rev;  //在屏幕上不显示修订
		this.activeDocument.PrintRevisions = rev;  //在打印中的文档中不显示修订
		this.activeDocument.ShowRevisions = rev;   //编辑时不标记修订 	
		this.displayRevie(rev);
		if (rev){
			this.activeDocument.ActiveWindow.View.ShowRevisionsAndComments = true;
			this.activeDocument.ActiveWindow.View.RevisionsView = 0;
		}
	}
	/**
	 * 解锁
	 */
	this.unProtect = function(){
		if (this.activeDocument.ProtectionType!=-1){
 				this.activeDocument.Unprotect(this.password);
		}
	}
	/**
	 * 显示/隐藏修订工具栏和右键菜单
	 */
	this.displayRevie = function(isDis){
		this.activeDocument.CommandBars("Reviewing").Enabled = isDis;
		this.activeDocument.CommandBars("Reviewing").Visible = isDis;
		this.activeDocument.CommandBars("Track Changes").Enabled = isDis;
	}
	/**
	 * 接受所有修订
	 */
	this.allChangeInDoc = function(){
		this.application.WordBasic.AcceptAllChangesInDoc();
	}
	/**
	 * 是否已最终状态显示修订
	 * @param isHidd true 隐藏修订 false 显示修订
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
	 *保护窗体，包括不能复制
	 */
	this.protectForm = function(){
		this.unProtect();
		this.activeDocument.Protect(2,false,this.password);
	}
	/**
	 * 产生随机密码
	 * @param len 密码的长度
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
	 * 允许拷贝
	 * @param state [true|false][允许|不允许]
	 */
	this.allowCopy = function(state) {
		;
	}
	/**
	 * 是否已经保存
	 * return [true|false][是|否]
	 */
	this.isSaved = function() {
		return this.activeDocument.Saved;
	}
}
//-----------------以下为表单打印的js-----------------------
	function printForm(){
		var formId = document.all("curFormId"); //表单ID
		//TODO 输入url地址
		var url = "jsp/help.jsp?url=formprinttemplethelp.cmd&formId=" + formId.value;
		var reValue = window.showModalDialog(url,"","status:no");
		if (reValue == null || reValue == ""){
			//alert("对不起,没有找到打印模板！");
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
			return new ActiveXObject("Word.Application");    //启动word
		}
		catch (e) {
			alert("对不起，初始化Word对象失败！\n请确认您是否安装了Microsoft Word 97或更高版本；\n并且将本站点添加到可信站点列表。");
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
		//解码
			var data=document.all("data");
			data.decodeValue(templetData);
			//改名
			data.changeFileName("doc");
			//取得文件名
			offH.Documents.Open(data.decodefile);
			//offH.visible=true;
			activeDoc = offH.ActiveDocument;
			try{
				if (printData!=""){
					var arrayData = printData.split("Э");
					for (var i=0;i<arrayData.length;i++){

							var partData = arrayData[i].split("Я");
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
					offH.Selection.Find.Execute("Ж*Ж",false,false,true,false,false,true,1,false,"",2);
					//将光标移至第一页的页首
	    			offH.visible=true;
	    			activeDoc.PrintOut();

				}
			}catch(e){
				quitWord(offH);
				alert("出现错误，错误信息为：\n" + e.message);
			}
		}		
	}
	
	function getTempletTitle(templetTitle){
		return "Ж" + templetTitle + "Ж";
	}

	/**
	 * 对特殊编辑域的处理
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
		alert("出现错误，错误信息为：\n" + e.message);
		return;
	}
}
	
	function getUserName(){
		return document.all("curUserName").value;
	}
	function getNowDate(){
		var d = new Date();
		var s = "";
		s += d.getFullYear() + "年";
		s += (d.getMonth() + 1) + "月";
		s += d.getDate() + "日";
		s += " ";
		s += d.getHours() + "点";
		s += d.getMinutes() + "分";
		s += d.getSeconds() + "秒";
		//s += d.getMilliseconds() + "毫秒";
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
			throw("插入数据出现问题：\n" + e1.name + ":" + e1.message);
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
//------------------------------表单打印end-----------------------------
